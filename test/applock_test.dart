import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pausey/data/app_repo.dart';
import 'package:pausey/data/restrictions/restriction_models.dart';
import 'package:pausey/data/restrictions/restriction_repo.dart';
import 'package:pausey/l10n/app_localizations.dart';
import 'package:pausey/screens/block/app_limit_details_screen.dart';
import 'package:pausey/services/local_store.dart';
import 'package:pausey/utils/app_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _insta = 'com.instagram.android';
const _yt = 'com.google.android.youtube';

Widget _wrap(Widget home) => MaterialApp(
      theme: AppTheme.dark,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: home,
    );

Future<void> _pumpDetails(WidgetTester tester, String id) async {
  await tester.binding.setSurfaceSize(const Size(412, 2600));
  await tester.pumpWidget(_wrap(AppLimitDetailsScreen(appId: id)));
  await tester.pumpAndSettle();
  // Let RestrictionRepo's native-sync debounce fire.
  await tester.pump(const Duration(seconds: 1));
}

void main() {
  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    await LocalStore.init();
    await LocalStore.instance.saveAnswer('lockedApps', ['Instagram', 'YouTube', 'Gaming Apps']);
    AppRepo.instance.load();
    AppRepo.instance.seedFromOnboarding();
    // Wednesday noon.
    AppRepo.instance.now = () => DateTime(2026, 10, 14, 12, 0);
    await LocalStore.instance.removeRaw('restrictions_v1');
    RestrictionRepo.instance.load();
  });

  tearDown(() => AppRepo.instance.now = DateTime.now);

  testWidgets("changing Instagram's limit leaves YouTube's config alone", (tester) async {
    final rr = RestrictionRepo.instance;
    await rr.updateConfig(_yt, (c) => c
      ..dailyLimitEnabled = true
      ..dailyLimitMinutes = 60);
    await _pumpDetails(tester, 'Instagram');

    await tester.tap(find.byKey(const Key('limitSwitch')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('limit_45')));
    await tester.pumpAndSettle();

    expect(rr.configFor(_insta).dailyLimitEnabled, isTrue);
    expect(rr.configFor(_insta).dailyLimitMinutes, 45);
    expect(rr.configFor(_yt).dailyLimitEnabled, isTrue);
    expect(rr.configFor(_yt).dailyLimitMinutes, 60);
    // Not on Android: honest "usage unavailable" state.
    expect(find.byKey(const Key('usageUnavailable')), findsOneWidget);
    expect(find.text('Saved'), findsOneWidget);
    await tester.binding.setSurfaceSize(null);
  });

  testWidgets('a schedule added through the repo shows in the details screen', (tester) async {
    final ok = await RestrictionRepo.instance.saveSchedule(
      _insta,
      AppLockSchedule(id: 's1', title: 'Sleep', startMinuteOfDay: 22 * 60, endMinuteOfDay: 7 * 60, repeatWeekdays: {1, 2, 3, 4, 5}),
    );
    expect(ok, isTrue);
    await _pumpDetails(tester, 'Instagram');
    expect(find.text('Sleep'), findsOneWidget);
    // intl puts a narrow no-break space before "PM".
    expect(find.text('10:00\u202fPM – 7:00\u202fAM · Ends next day'), findsOneWidget);
    expect(find.text('Next lock: 10:00\u202fPM'), findsOneWidget);
    // YouTube has no schedules of its own.
    expect(RestrictionRepo.instance.configFor(_yt).schedules, isEmpty);
    await tester.binding.setSurfaceSize(null);
  });

  testWidgets('master switch toggles AppRepo locked', (tester) async {
    await _pumpDetails(tester, 'Instagram');
    expect(AppRepo.instance.apps.firstWhere((a) => a.id == 'Instagram').locked, isTrue);
    await tester.tap(find.byKey(const Key('masterSwitch')));
    await tester.pumpAndSettle();
    expect(AppRepo.instance.apps.firstWhere((a) => a.id == 'Instagram').locked, isFalse);
    expect(AppRepo.instance.apps.firstWhere((a) => a.id == 'YouTube').locked, isTrue);
    await tester.binding.setSurfaceSize(null);
  });

  testWidgets('zero-length or no-day schedules are rejected with a message', (tester) async {
    await tester.binding.setSurfaceSize(const Size(412, 2600));
    await tester.pumpWidget(_wrap(Builder(
      builder: (context) => Scaffold(
        body: Center(
          child: TextButton(
            onPressed: () => showScheduleEditor(context,
                pkg: _insta, schedule: AppLockSchedule(id: 'bad', startMinuteOfDay: 600, endMinuteOfDay: 600, repeatWeekdays: {1})),
            child: const Text('open'),
          ),
        ),
      ),
    )));
    await tester.tap(find.text('open'));
    await tester.pumpAndSettle();
    expect(find.text("Start and end can't be the same"), findsNothing);
    await tester.tap(find.byKey(const Key('saveSchedule')));
    await tester.pumpAndSettle();
    expect(find.text("Start and end can't be the same"), findsOneWidget);
    expect(RestrictionRepo.instance.configFor(_insta).schedules, isEmpty);
    await tester.binding.setSurfaceSize(null);
  });

  testWidgets('adding a schedule from the details screen saves it; no days is rejected', (tester) async {
    await _pumpDetails(tester, 'Instagram');
    await tester.tap(find.byKey(const Key('addSchedule')));
    await tester.pumpAndSettle();
    for (var d = 1; d <= 5; d++) {
      await tester.tap(find.byKey(Key('sday_$d')));
    }
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('saveSchedule')));
    await tester.pumpAndSettle();
    expect(find.text('Pick at least one day'), findsOneWidget);
    expect(RestrictionRepo.instance.configFor(_insta).schedules, isEmpty);

    await tester.tap(find.byKey(const Key('sday_6')));
    await tester.tap(find.text('Study'));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('saveSchedule')));
    await tester.pumpAndSettle();
    final s = RestrictionRepo.instance.configFor(_insta).schedules.single;
    expect(s.title, 'Study');
    expect(s.repeatWeekdays, {6});
    expect(find.text('Study'), findsOneWidget);
    await tester.binding.setSurfaceSize(null);
  });

  testWidgets('apps without a package only offer master and remove', (tester) async {
    await _pumpDetails(tester, 'Gaming Apps');
    expect(find.byKey(const Key('noPackageNote')), findsOneWidget);
    expect(find.byKey(const Key('limitCard')), findsNothing);
    expect(find.byKey(const Key('schedulesCard')), findsNothing);
    await tester.tap(find.byKey(const Key('removeApp')));
    await tester.pumpAndSettle();
    await tester.tap(find.widgetWithText(FilledButton, 'Remove'));
    await tester.pumpAndSettle();
    expect(AppRepo.instance.apps.any((a) => a.id == 'Gaming Apps'), isFalse);
    await tester.binding.setSurfaceSize(null);
  });
}
