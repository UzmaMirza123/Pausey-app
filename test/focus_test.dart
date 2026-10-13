import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:pausey/data/app_repo.dart';
import 'package:pausey/data/models.dart';
import 'package:pausey/l10n/app_localizations.dart';
import 'package:pausey/screens/focus/focus_timer.dart';
import 'package:pausey/screens/focus/session_complete_screen.dart';
import 'package:pausey/services/local_store.dart';
import 'package:pausey/utils/app_theme.dart';

void main() {
  late DateTime clock;
  final repo = AppRepo.instance;
  final t = FocusTimer.instance;

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    await LocalStore.init();
    FocusTimer.soundEnabled = false;
    clock = DateTime(2026, 10, 13, 9);
    repo.now = () => clock;
    repo.seedFromOnboarding();
    repo.sessions = [];
    if (!t.isIdle) await t.stop();
  });

  test('wall-clock timer: pause excludes time, finishing records a session and starts the break', () async {
    t.selectMode(FocusMode.pomodoro);
    t.start();
    expect(t.remainingSeconds, 25 * 60);
    clock = clock.add(const Duration(minutes: 10));
    expect(t.remainingSeconds, 15 * 60);
    t.pause();
    clock = clock.add(const Duration(minutes: 30)); // paused: no progress
    expect(t.remainingSeconds, 15 * 60);
    t.resume();
    final ended = t.ended.first;
    clock = clock.add(const Duration(minutes: 16));
    t.onResumed(); // app returns from background
    final s = await ended;
    expect(s.completed, isTrue);
    expect(s.focusedSeconds, 25 * 60);
    expect(repo.completedSessions, 1);
    expect(t.onBreak, isTrue);
    expect(t.remainingSeconds, repo.settings.breakMinutes * 60);
    t.skipBreak();
    expect(t.isIdle, isTrue);
  });

  test('early stop saves partial focus; under a minute is not saved', () async {
    t.start(FocusMode.deep);
    clock = clock.add(const Duration(seconds: 30));
    expect(await t.stop(), isNull);
    t.start(FocusMode.deep);
    clock = clock.add(const Duration(minutes: 12));
    final s = await t.stop();
    expect(s!.completed, isFalse);
    expect(s.focusedMinutes, 12);
    expect(repo.sessions.length, 1);
  });

  testWidgets('Session Complete shows the session and pops with "start"', (tester) async {
    final s = FocusSession(start: clock, plannedMinutes: 25, focusedSeconds: 1500, mode: FocusMode.pomodoro, completed: true);
    String? result;
    await tester.pumpWidget(MaterialApp(
      theme: AppTheme.dark,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: Builder(
        builder: (ctx) => TextButton(
          onPressed: () async => result = await Navigator.of(ctx).push<String>(MaterialPageRoute(builder: (_) => SessionCompleteScreen(session: s))),
          child: const Text('open'),
        ),
      ),
    ));
    await tester.tap(find.text('open'));
    await tester.pumpAndSettle();
    expect(find.text('25:00'), findsOneWidget);
    await tester.scrollUntilVisible(find.text('Start Next Session'), 200);
    await tester.tap(find.text('Start Next Session'));
    await tester.pumpAndSettle();
    expect(result, SessionCompleteScreen.startAnother);
  });
}
