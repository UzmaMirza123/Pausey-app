import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:pausey/data/app_repo.dart';
import 'package:pausey/data/restrictions/restriction_repo.dart';
import 'package:pausey/main.dart';
import 'package:pausey/screens/onboarding/onboarding_flow.dart';
import 'package:pausey/screens/onboarding/onboarding_state.dart';
import 'package:pausey/services/auth_service.dart';
import 'package:pausey/services/local_store.dart';
import 'package:pausey/widgets/onboarding_nav.dart';

Future<void> _tap(WidgetTester t, String text) async {
  final f = find.text(text).last;
  await t.ensureVisible(f);
  await t.pump(const Duration(milliseconds: 600));
  await t.tap(f);
  // A few frames, not pumpAndSettle: the pause preview breathes in a loop.
  for (var i = 0; i < 6; i++) {
    await t.pump(const Duration(milliseconds: 200));
  }
}

void main() {
  // Not an Android device in tests: no native bridge (the honest "unsupported" path).
  final notAndroid = TargetPlatformVariant.only(TargetPlatform.iOS);

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    await LocalStore.init();
    await LocalStore.instance.removeRaw('onboarding_v2');
    await LocalStore.instance.removeRaw('restrictions_v1');
    await LocalStore.instance.removeRaw('app_state');
    await LocalStore.instance.clearGuest();
    await AuthService.instance.signOut().catchError((_) {});
    AppRepo.instance.load();
    RestrictionRepo.instance.load();
    await OnboardingState.instance.reset();
  });

  testWidgets('answers carry through the conversation and the plan is applied at the end', (t) async {
    t.view.physicalSize = const Size(412 * 3, 915 * 3);
    t.view.devicePixelRatio = 3;
    addTearDown(t.view.reset);
    ObFirstAction? result;
    await t.pumpWidget(PauseyApp(home: OnboardingFlow(onFinished: (a) => result = a)));
    await t.pumpAndSettle();

    // No welcome screen any more: the first question comes straight away.
    expect(find.text('Your time is yours.'), findsNothing);
    await _tap(t, 'All the time');
    expect(find.text("You're not alone. Phones are designed to keep us there."), findsOneWidget);
    await _tap(t, "That's me");

    await _tap(t, 'Better sleep');
    expect(find.textContaining('evenings wind down'), findsOneWidget);
    await _tap(t, 'Next');

    await _tap(t, 'Instagram');
    await _tap(t, 'TikTok');
    expect(find.text("Noted: Instagram and TikTok. We'll start with these."), findsOneWidget);
    await _tap(t, 'Next');

    await _tap(t, 'More than 6 hours');
    await _tap(t, 'Next');

    // Reflection uses the real answers.
    expect(find.text('You want better sleep, but Instagram and TikTok keep pulling you in.'), findsOneWidget);
    expect(find.text('About More than 6 hours a day (your estimate)'), findsOneWidget);
    await _tap(t, 'Show me how');

    // "How it works" story: 4 beats, the user's first app in the headline.
    expect(find.text('Without noticing, you open Instagram.'), findsOneWidget);
    await _tap(t, 'Next');
    // Back steps to the previous beat first, not the previous stage.
    await t.tap(find.byType(BackCircleButton));
    await t.pump(const Duration(milliseconds: 600));
    expect(OnboardingState.instance.stage, 6);
    await _tap(t, 'Next');
    await _tap(t, 'Next');
    expect(find.text('Almost at your Instagram limit'), findsOneWidget);
    expect(find.text('55m of 1h used today'), findsOneWidget); // the plan's real limit (6h+ → 1h)
    await _tap(t, 'Next');
    await _tap(t, 'Build my plan');

    // "Set your daily screen-time goal" now replaces the starter-plan screen.
    expect(find.text('Set your daily screen-time goal'), findsOneWidget);
    expect(RestrictionRepo.instance.hasOwnRules('com.instagram.android'), isFalse); // nothing applied yet
    await _tap(t, '3h');
    expect(LocalStore.instance.answers['dailyGoalHours'], 3);
    await _tap(t, 'Continue');

    await _tap(t, 'Continue'); // permissions (not Android in tests)

    // Log-in screen: email, sign up link, Google/Apple circles, then guest.
    expect(find.text("Don't have an account?"), findsOneWidget);
    expect(find.bySemanticsLabel('Continue with Google'), findsOneWidget);
    expect(find.bySemanticsLabel('Continue with Apple'), findsOneWidget);
    await _tap(t, 'Continue as guest');
    // Guest is asked what to call them ("Your name" field, no "optional").
    expect(find.text('What should we call you?'), findsWidgets);
    expect(find.text('Your name'), findsOneWidget);
    await t.enterText(find.byType(TextField).last, 'Uzma');
    await _tap(t, 'Continue');
    expect(AuthService.instance.value, isA<GuestSession>());
    expect(AuthService.instance.value.displayName, 'Uzma');

    await _tap(t, 'Start my first focus session');
    expect(result, ObFirstAction.focus);
    expect(AppRepo.instance.apps.map((a) => a.id), ['Instagram', 'TikTok']);
    expect(AppRepo.instance.apps.every((a) => a.locked && a.scheduled), isTrue);
    expect(AppRepo.instance.schedule.startMinutes, 22 * 60);
    final cfg = RestrictionRepo.instance.configFor('com.instagram.android');
    expect(cfg.dailyLimitEnabled, isTrue);
    expect(cfg.dailyLimitMinutes, 60);
    expect(RestrictionRepo.instance.hasOwnRules('com.zhiliaoapp.musically'), isFalse);
  }, variant: notAndroid);

  testWidgets('progress resumes on the saved stage and back goes one step', (t) async {
    OnboardingState.instance.update((s) {
      s.stage = 4;
      s.goal = ObGoal.focus;
    });
    await t.pumpWidget(PauseyApp(home: OnboardingFlow(onFinished: (_) {})));
    await t.pumpAndSettle();
    expect(find.text('Roughly how long are you on your phone each day?'), findsOneWidget);
    await t.tap(find.byType(BackCircleButton));
    await t.pumpAndSettle();
    expect(OnboardingState.instance.stage, 3);
  }, variant: notAndroid);

  testWidgets('back on the first question returns to the intro screens', (t) async {
    var back = false;
    await t.pumpWidget(PauseyApp(home: OnboardingFlow(onFinished: (_) {}, onBackFromStart: () => back = true)));
    await t.pump(const Duration(seconds: 1));
    expect(find.text('Ever picked up your phone for a minute and stayed much longer?'), findsOneWidget);
    await t.tap(find.byType(BackCircleButton));
    await t.pump(const Duration(milliseconds: 500));
    expect(back, isTrue);
  }, variant: notAndroid);
}
