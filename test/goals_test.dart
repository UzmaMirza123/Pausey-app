import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:pausey/data/app_repo.dart';
import 'package:pausey/data/models.dart';
import 'package:pausey/screens/goals/goals_screen.dart';
import 'package:pausey/services/local_store.dart';
import 'package:pausey/utils/app_theme.dart';
import 'package:pausey/utils/l10n.dart';

Widget _app(Widget home) => MaterialApp(
      theme: AppTheme.dark,
      localizationsDelegates: const [AppLocalizations.delegate, GlobalMaterialLocalizations.delegate, GlobalWidgetsLocalizations.delegate, GlobalCupertinoLocalizations.delegate],
      supportedLocales: AppLocalizations.supportedLocales,
      home: home,
    );

void main() {
  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    await LocalStore.init();
    AppRepo.instance.load();
    await AppRepo.instance.setPremium(false);
  });

  testWidgets('Goals list shows translated default titles and checks in a manual goal', (tester) async {
    final r = AppRepo.instance;
    r.goals.removeWhere((g) => g.type == GoalType.phoneFree);
    await r.addGoal(Goal(id: 'g_pf', title: '', type: GoalType.phoneFree, category: GoalCategory.wellness, target: 3));
    while (r.goals.length > 3) {
      await r.deleteGoal(r.goals.first.id);
    }
    await tester.pumpWidget(_app(const GoalsScreen()));
    await tester.pumpAndSettle();
    expect(find.text('Phone-free time'), findsOneWidget);
    final g = r.goals.firstWhere((x) => x.id == 'g_pf');
    expect(r.goalMetOn(g, dateOnly(r.now())), isFalse);
    await tester.ensureVisible(find.text('Mark today done'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Mark today done'));
    await tester.pumpAndSettle();
    expect(r.goalMetOn(g, dateOnly(r.now())), isTrue);
    expect(find.text('Done today'), findsOneWidget);
  });

  testWidgets('Add goal sheet creates a goal when under the free limit', (tester) async {
    final r = AppRepo.instance;
    while (r.goals.isNotEmpty) {
      await r.deleteGoal(r.goals.first.id);
    }
    await tester.pumpWidget(_app(const GoalsScreen()));
    await tester.pumpAndSettle();
    expect(find.text('No goals yet'), findsOneWidget);
    await tester.tap(find.text('Add Goal'));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('goalSheetSave')));
    await tester.pumpAndSettle();
    expect(r.goals.length, 1);
    expect(r.goals.single.type, GoalType.focusMinutes);
    expect(find.text('Daily Focus: 2 Hours'), findsOneWidget);
  });
}
