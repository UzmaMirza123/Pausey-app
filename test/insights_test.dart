import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pausey/data/app_repo.dart';
import 'package:pausey/data/models.dart';
import 'package:pausey/l10n/app_localizations.dart';
import 'package:pausey/screens/insights/insights_data.dart';
import 'package:pausey/screens/insights/insights_screen.dart';
import 'package:pausey/services/local_store.dart';
import 'package:pausey/utils/app_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  final today = DateTime(2026, 10, 14, 12); // a Wednesday

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    await LocalStore.init();
    final r = AppRepo.instance;
    r.now = () => today;
    r.sessions = [];
    r.goals = [Goal(id: 'g', title: '', type: GoalType.focusMinutes, category: GoalCategory.focus, target: 60, createdAt: today.subtract(const Duration(days: 60)))];
  });

  FocusSession s(int daysAgo, int min) => FocusSession(
      start: today.subtract(Duration(days: daysAgo)), plannedMinutes: min, focusedSeconds: min * 60, mode: FocusMode.pomodoro, completed: true);

  test('week and month periods give different numbers', () {
    final r = AppRepo.instance;
    r.sessions = [s(0, 60), s(1, 30), s(20, 120)];
    final w = AnalyticsData(r, InsightsPeriod.week);
    final m = AnalyticsData(r, InsightsPeriod.month);
    expect(w.total, 90);
    expect(m.total, 210);
    expect(w.goalDays['g'], 1);
    expect(m.goalDays['g'], 2);
    expect(m.chart.length, 30);
  });

  Widget app() => MaterialApp(
        theme: AppTheme.dark,
        localizationsDelegates: const [AppLocalizations.delegate, GlobalMaterialLocalizations.delegate, GlobalWidgetsLocalizations.delegate, GlobalCupertinoLocalizations.delegate],
        supportedLocales: AppLocalizations.supportedLocales,
        home: const Scaffold(body: InsightsScreen()),
      );

  testWidgets('empty state for new users, data after a session, period chips switch', (t) async {
    t.view.physicalSize = const Size(412 * 3, 2400 * 3);
    t.view.devicePixelRatio = 3;
    addTearDown(t.view.reset);
    await t.pumpWidget(app());
    await t.pumpAndSettle();
    expect(find.text('Start a focus session'), findsOneWidget);

    await AppRepo.instance.addSession(s(0, 60));
    await t.pumpAndSettle();
    expect(find.text('Start a focus session'), findsNothing);
    expect(find.text('Weekly focus hours'), findsOneWidget);

    await t.tap(find.byKey(const ValueKey('period_month')));
    await t.pumpAndSettle();
    expect(find.text('Daily focus, last 30 days'), findsOneWidget);

    // Analytics only: no Analytics / Screen Time tabs at the top.
    expect(find.text('Screen Time'), findsNothing);
  });
}
