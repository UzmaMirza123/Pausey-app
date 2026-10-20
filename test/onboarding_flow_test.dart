import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:pausey/data/app_repo.dart';
import 'package:pausey/data/restrictions/restriction_repo.dart';
import 'package:pausey/main.dart';
import 'package:pausey/screens/onboarding/onboarding_2_screen.dart';
import 'package:pausey/screens/onboarding/onboarding_flow.dart';
import 'package:pausey/screens/onboarding/onboarding_state.dart';
import 'package:pausey/services/auth_service.dart';
import 'package:pausey/services/local_store.dart';
import 'package:pausey/widgets/common.dart';
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
    var finished = false;
    // Start at the first question (the 4 intro screens have their own test).
    OnboardingState.instance.update((s) => s.stage = ObStep.relate.index);
    await t.pumpWidget(PauseyApp(home: OnboardingFlow(onFinished: (a) {
      result = a;
      finished = true;
    })));
    for (var i = 0; i < 10; i++) {
      await t.pump(const Duration(milliseconds: 200));
    }

    // No welcome screen any more: the first question comes straight away,
    // with its first answer already selected.
    expect(find.text('Your time is yours.'), findsNothing);
    expect(OnboardingState.instance.relate, ObRelate.sometimes);
    await _tap(t, 'All the time');
    expect(OnboardingState.instance.relate, ObRelate.often);
    expect(find.text("You're not alone. Phones are designed to keep us there."), findsOneWidget);
    await _tap(t, "That's me");

    await _tap(t, 'Better sleep');
    expect(find.textContaining('evenings wind down'), findsOneWidget);
    await _tap(t, 'Next');


    await _tap(t, 'More than 6 hours');
    expect(OnboardingState.instance.screenTime, ObScreenTime.over6);
    await _tap(t, 'Next');

    await _tap(t, 'Continue'); // permissions (not Android in tests)

    // The apps to pause are listed already; ✕ leaves one out.
    expect(OnboardingState.instance.apps.map((a) => a.id), ['Instagram', 'TikTok', 'YouTube', 'Facebook', 'Snapchat']);
    expect(find.text('5 apps selected'), findsOneWidget);
    for (final name in ['YouTube', 'Facebook', 'Snapchat']) {
      final x = find.bySemanticsLabel('Remove $name');
      await t.ensureVisible(x);
      await t.tap(x);
      for (var i = 0; i < 3; i++) {
        await t.pump(const Duration(milliseconds: 200));
      }
    }
    expect(OnboardingState.instance.apps.map((a) => a.id), ['Instagram', 'TikTok']);
    expect(find.text('2 apps selected'), findsOneWidget);
    await _tap(t, 'Next');

    // Reflection uses the real answers.
    expect(find.bySemanticsLabel('You want better sleep, but Instagram and TikTok keep pulling you in.'), findsOneWidget);
    expect(find.text('About More than 6 hours a day (your estimate)'), findsOneWidget);
    await _tap(t, 'Show me how');

    // "How it works" story: 4 beats, always shown with Instagram.
    expect(find.bySemanticsLabel('You open Instagram again'), findsOneWidget);
    await _tap(t, 'Next');
    // Back steps to the previous beat first, not the previous stage.
    await t.tap(find.byType(BackCircleButton));
    await t.pump(const Duration(milliseconds: 600));
    expect(OnboardingState.instance.stage, ObStep.story.index);
    // Tap Next by hand (few frames) to watch the half-second countdown.
    await t.tap(find.text('Next').last);
    await t.pump(const Duration(milliseconds: 200));
    // Scrolling: the time-left badge counts down from 30:00 for half a second, then the nudge comes in by itself.
    expect(find.textContaining(RegExp(r'^(30|2\d):\d\d$')), findsOneWidget); // ticking down
    PrimaryButton next() => t.widget<PrimaryButton>(find.byType(PrimaryButton).last);
    expect(next().onPressed, isNull); // Next waits while the badge counts down
    await t.pump(const Duration(milliseconds: 400));
    await t.pump(const Duration(milliseconds: 100));
    expect(find.text('25:00'), findsOneWidget);
    expect(find.bySemanticsLabel("Nudges before time's up"), findsOneWidget);
    expect(next().onPressed, isNull); // …and until the nudge card is in
    for (var i = 0; i < 4; i++) {
      await t.pump(const Duration(milliseconds: 200));
    }
    expect(next().onPressed, isNotNull);
    expect(find.text('Almost at your Instagram limit'), findsOneWidget);
    expect(find.text('35m of 1h used today'), findsOneWidget); // the plan's real limit (6h+ → 1h), 25m left
    await _tap(t, 'Next');
    // Then Pausey blocks it.
    expect(find.text('Instagram is blocked'), findsOneWidget);
    await _tap(t, 'Build my plan');

    // "Set your daily screen-time goal" now replaces the starter-plan screen.
    expect(find.bySemanticsLabel('Your daily screen goal'), findsOneWidget);
    expect(RestrictionRepo.instance.hasOwnRules('com.instagram.android'), isFalse); // nothing applied yet
    await _tap(t, '3h');
    expect(LocalStore.instance.answers['dailyGoalHours'], 3);
    await _tap(t, 'Continue');

    // "One last thing": accessibility, with what Pausey reads and never reads.
    expect(find.bySemanticsLabel('One last thing'), findsOneWidget);
    expect(find.text('App names'), findsOneWidget);
    await _tap(t, 'Continue');

    // The account step is the log-in screen: email, round Google / Apple, Sign up, guest.
    expect(find.text('Log into your account'), findsOneWidget);
    expect(find.bySemanticsLabel('Continue with Google'), findsOneWidget);
    expect(find.bySemanticsLabel('Continue with Apple'), findsOneWidget);
    // No back arrow at the bottom of this screen.
    expect(find.byType(BackCircleButton), findsNothing);
    // Sign up → Log in still offers "Continue as guest".
    await _tap(t, 'Sign up');
    await _tap(t, 'Log in');
    expect(find.text('Log into your account'), findsOneWidget);
    // Guest from the log-in screen closes it and asks for a name.
    await _tap(t, 'Continue as guest');
    // Guest is asked what to call them ("Your name" field, no "optional").
    expect(find.text('What should we call you?'), findsWidgets);
    expect(find.text('Your name'), findsOneWidget);
    await t.enterText(find.byType(TextField).last, 'Uzma');
    await _tap(t, 'Continue');
    expect(AuthService.instance.value, isA<GuestSession>());
    expect(AuthService.instance.value.displayName, 'Uzma');

    // "You're all set!" with the user's real goal (3h) and app count (2).
    expect(find.bySemanticsLabel("You're all set!"), findsOneWidget);
    expect(find.text('3h'), findsOneWidget);
    expect(find.text('2'), findsOneWidget);
    await _tap(t, 'Enter Pausey');
    expect(finished, isTrue);
    expect(result, isNull); // opens Home
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
      s.stage = ObStep.screenTime.index;
      s.goal = ObGoal.focus;
    });
    await t.pumpWidget(PauseyApp(home: OnboardingFlow(onFinished: (_) {})));
    for (var i = 0; i < 10; i++) {
      await t.pump(const Duration(milliseconds: 200));
    }
    expect(find.bySemanticsLabel('Your daily screen time'), findsWidgets);
    await t.tap(find.byType(BackCircleButton));
    for (var i = 0; i < 10; i++) {
      await t.pump(const Duration(milliseconds: 200));
    }
    expect(OnboardingState.instance.stage, ObStep.goal.index);
  }, variant: notAndroid);

  testWidgets('back on the first question returns to the last intro screen (one flow)', (t) async {
    OnboardingState.instance.update((s) => s.stage = ObStep.relate.index);
    await t.pumpWidget(PauseyApp(home: OnboardingFlow(onFinished: (_) {})));
    await t.pump(const Duration(seconds: 1));
    expect(find.bySemanticsLabel('Lose track of time?'), findsOneWidget);
    await t.tap(find.byType(BackCircleButton));
    for (var i = 0; i < 6; i++) {
      await t.pump(const Duration(milliseconds: 200));
    }
    expect(OnboardingState.instance.stage, ObStep.trackProgress.index);
    expect(find.bySemanticsLabel('Track Your Progress'), findsOneWidget);
  }, variant: notAndroid);

  testWidgets('Skip on an intro screen skips only that screen', (t) async {
    await t.pumpWidget(PauseyApp(home: OnboardingFlow(onFinished: (_) {})));
    await t.pump(const Duration(seconds: 1));
    await t.tap(find.text('Skip'));
    for (var i = 0; i < 6; i++) {
      await t.pump(const Duration(milliseconds: 200));
    }
    expect(OnboardingState.instance.stage, ObStep.lockApps.index);
    expect(find.byType(Onboarding2Screen), findsOneWidget);
  }, variant: notAndroid);

  testWidgets('Continue as guest stays on Log in, also after going to Sign up and back', (t) async {
    t.view.physicalSize = const Size(412 * 3, 915 * 3);
    t.view.devicePixelRatio = 3;
    addTearDown(t.view.reset);
    OnboardingState.instance.update((s) => s.stage = ObStep.account.index);
    await t.pumpWidget(PauseyApp(home: OnboardingFlow(onFinished: (_) {})));
    for (var i = 0; i < 10; i++) {
      await t.pump(const Duration(milliseconds: 200));
    }
    // The account step is the log-in screen itself.
    expect(find.text('Log into your account'), findsOneWidget);
    expect(find.text('Continue as guest'), findsOneWidget);
    await _tap(t, 'Sign up');
    await _tap(t, 'Log in');
    expect(find.text('Log into your account'), findsOneWidget);
    expect(find.text('Continue as guest'), findsOneWidget);
  }, variant: notAndroid);

  testWidgets('swiping left / right moves through the onboarding like the buttons', (t) async {
    t.view.physicalSize = const Size(412 * 3, 915 * 3);
    t.view.devicePixelRatio = 3;
    addTearDown(t.view.reset);
    await t.pumpWidget(PauseyApp(home: OnboardingFlow(onFinished: (_) {})));
    await t.pump(const Duration(seconds: 1));
    // Intro screens swipe the same way as the questions.
    await t.flingFrom(const Offset(380, 500), const Offset(-300, 0), 1200);
    for (var i = 0; i < 10; i++) {
      await t.pump(const Duration(milliseconds: 200));
    }
    expect(find.byType(Onboarding2Screen), findsOneWidget);

    // Questions: swipe left = Next, swipe right = back.
    OnboardingState.instance.update((s) => s.stage = ObStep.relate.index);
    await t.pumpWidget(PauseyApp(home: OnboardingFlow(key: UniqueKey(), onFinished: (_) {})));
    for (var i = 0; i < 10; i++) {
      await t.pump(const Duration(milliseconds: 200));
    }
    expect(find.bySemanticsLabel('Lose track of time?'), findsOneWidget);
    await t.flingFrom(const Offset(380, 500), const Offset(-300, 0), 1200);
    for (var i = 0; i < 10; i++) {
      await t.pump(const Duration(milliseconds: 200));
    }
    expect(OnboardingState.instance.stage, ObStep.goal.index);
    await t.flingFrom(const Offset(30, 500), const Offset(300, 0), 1200);
    for (var i = 0; i < 10; i++) {
      await t.pump(const Duration(milliseconds: 200));
    }
    expect(OnboardingState.instance.stage, ObStep.relate.index);

    // The account (log-in) step has no Continue: a left swipe does nothing there.
    OnboardingState.instance.update((s) => s.stage = ObStep.account.index);
    await t.pumpWidget(PauseyApp(home: OnboardingFlow(key: UniqueKey(), onFinished: (_) {})));
    for (var i = 0; i < 10; i++) {
      await t.pump(const Duration(milliseconds: 200));
    }
    await t.flingFrom(const Offset(380, 300), const Offset(-300, 0), 1200);
    for (var i = 0; i < 10; i++) {
      await t.pump(const Duration(milliseconds: 200));
    }
    expect(OnboardingState.instance.stage, ObStep.account.index);
  }, variant: notAndroid);
}
