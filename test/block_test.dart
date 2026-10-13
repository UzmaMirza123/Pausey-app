import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pausey/data/app_repo.dart';
import 'package:pausey/l10n/app_localizations.dart';
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
  });

  testWidgets('lock toggle, lock all, day chip and emergency override update AppRepo', (tester) async {
    final repo = AppRepo.instance;
    await tester.binding.setSurfaceSize(const Size(412, 2000));
    await tester.pumpWidget(_wrap(const BlockScreen()));
    await tester.pumpAndSettle();
    expect(find.text('Instagram'), findsOneWidget);

    await tester.tap(find.byKey(const Key('lock_Instagram')));
    await tester.pumpAndSettle();
    expect(repo.apps.firstWhere((a) => a.id == 'Instagram').locked, isFalse);

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
}
