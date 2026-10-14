import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pausey/data/app_repo.dart';
import 'package:pausey/data/restrictions/restriction_repo.dart';
import 'package:pausey/l10n/app_localizations.dart';
import 'package:pausey/screens/block/app_limit_details_screen.dart';
import 'package:pausey/screens/block/block_screen.dart';
import 'package:pausey/services/local_store.dart';
import 'package:pausey/utils/app_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

Widget _wrap(Widget child) => MaterialApp(
      theme: AppTheme.dark,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: Scaffold(body: child),
    );

void main() {
  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    await LocalStore.init();
    await LocalStore.instance.saveAnswer('lockedApps', ['Instagram', 'YouTube']);
    AppRepo.instance.load();
    AppRepo.instance.seedFromOnboarding();
    await LocalStore.instance.removeRaw('restrictions_v1');
    RestrictionRepo.instance.load();
  });

  testWidgets('lock toggle, lock all, day chip and emergency override update AppRepo', (tester) async {
    final repo = AppRepo.instance;
    await tester.binding.setSurfaceSize(const Size(412, 2000));
    await tester.pumpWidget(_wrap(const BlockScreen()));
    await tester.pumpAndSettle();
    expect(find.text('Instagram'), findsOneWidget);
    // Not on Android: honest note instead of pretending apps are blocked.
    expect(find.byKey(const Key('androidOnlyNote')), findsOneWidget);
    expect(find.text('Locked'), findsNothing);
    expect(find.text('Will lock'), findsNWidgets(2));

    await tester.tap(find.byKey(const Key('lock_Instagram')));
    await tester.pumpAndSettle();
    expect(repo.apps.firstWhere((a) => a.id == 'Instagram').locked, isFalse);
    expect(find.text('Restrictions off'), findsOneWidget);

    await tester.tap(find.text('Lock All'));
    await tester.pumpAndSettle();
    expect(repo.lockedCount, repo.apps.length);

    final hadSat = repo.schedule.days.contains(6);
    await tester.tap(find.byKey(const Key('day_6')));
    await tester.pumpAndSettle();
    expect(repo.schedule.days.contains(6), !hadSat);

    final left = repo.bypassLeftToday;
    await tester.tap(find.byKey(const Key('emergencyCard')));
    await tester.pumpAndSettle();
    await tester.tap(find.widgetWithText(FilledButton, 'Use'));
    await tester.pumpAndSettle();
    expect(repo.bypassLeftToday, left - 1);
    await tester.binding.setSurfaceSize(null);
  });

  testWidgets('search, filter chips and row tap open the details screen', (tester) async {
    final repo = AppRepo.instance;
    await repo.setAppLocked('YouTube', false);
    await tester.binding.setSurfaceSize(const Size(412, 2000));
    await tester.pumpWidget(_wrap(const BlockScreen()));
    await tester.pumpAndSettle();

    await tester.enterText(find.byKey(const Key('appSearch')), 'insta');
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('row_Instagram')), findsOneWidget);
    expect(find.byKey(const Key('row_YouTube')), findsNothing);
    await tester.enterText(find.byKey(const Key('appSearch')), '');
    await tester.pumpAndSettle();

    await tester.ensureVisible(find.byKey(const Key('filter_available')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('filter_available')));
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('row_YouTube')), findsOneWidget);
    expect(find.byKey(const Key('row_Instagram')), findsNothing);
    await tester.ensureVisible(find.byKey(const Key('filter_locked')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('filter_locked')));
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('row_Instagram')), findsOneWidget);
    expect(find.byKey(const Key('row_YouTube')), findsNothing);

    await tester.tap(find.byKey(const Key('row_Instagram')));
    await tester.pumpAndSettle();
    expect(find.byType(AppLimitDetailsScreen), findsOneWidget);
    expect(find.text('com.instagram.android'), findsOneWidget);
    await tester.binding.setSurfaceSize(null);
  });
}
