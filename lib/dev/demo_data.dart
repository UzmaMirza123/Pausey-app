import 'dart:math';

import '../data/app_repo.dart';
import '../data/models.dart';
import '../data/restrictions/restriction_models.dart';
import '../data/restrictions/restriction_repo.dart';

/// Fills AppRepo with ~4 weeks of realistic sessions (previews / screenshots only).
void seedDemoData({int streakDays = 13}) {
  final repo = AppRepo.instance;
  final r = Random(7);
  final today = DateTime.now();
  repo.sessions = [];
  for (var i = 27; i >= 0; i--) {
    final day = DateTime(today.year, today.month, today.day).subtract(Duration(days: i));
    final inStreak = i < streakDays;
    if (!inStreak && r.nextDouble() < 0.35) continue;
    final n = 1 + r.nextInt(i == 0 ? 2 : 5);
    for (var k = 0; k < n; k++) {
      final mode = k % 3 == 2 ? FocusMode.deep : FocusMode.pomodoro;
      final planned = mode == FocusMode.deep ? 90 : 25;
      final done = r.nextDouble() > 0.12;
      repo.sessions.add(FocusSession(
        start: day.add(Duration(hours: 8 + k * 2, minutes: r.nextInt(50))),
        plannedMinutes: planned,
        focusedSeconds: (done ? planned : planned * (0.3 + r.nextDouble() * 0.5)).round() * 60,
        mode: mode,
        completed: done,
      ));
    }
  }
  repo.apps = [
    ManagedApp(id: 'Instagram', name: 'Instagram', category: 'social', scheduled: true),
    ManagedApp(id: 'YouTube', name: 'YouTube', category: 'video'),
    ManagedApp(id: 'Twitter / X', name: 'Twitter / X', category: 'social', scheduled: true),
    ManagedApp(id: 'Gaming Apps', name: 'Gaming Apps', category: 'games', locked: false),
    ManagedApp(id: 'Shopping', name: 'Shopping', category: 'shopping'),
    ManagedApp(id: 'Reddit', name: 'Reddit', category: 'community', locked: false, scheduled: true),
  ];
  repo.goals = [
    Goal(id: 'g_focus', title: '', type: GoalType.focusMinutes, category: GoalCategory.focus, target: 240, createdAt: today.subtract(const Duration(days: 30))),
    Goal(id: 'g_block', title: '', type: GoalType.blockApps, category: GoalCategory.discipline, target: 7, createdAt: today.subtract(const Duration(days: 30))),
    Goal(
      id: 'g_phone',
      title: 'Phone-free 9–11 PM',
      type: GoalType.phoneFree,
      category: GoalCategory.wellness,
      target: 7,
      createdAt: today.subtract(const Duration(days: 30)),
      checkedDays: {for (var i = 1; i <= 4; i++) dayKey(today.subtract(Duration(days: i)))},
    ),
    Goal(id: 'g_pomo', title: '', type: GoalType.sessions, category: GoalCategory.focus, target: 3, createdAt: today.subtract(const Duration(days: 30))),
  ];
  repo.refresh();
  _seedRestrictions();
}

/// Per-app rules for previews: Instagram 30m + Sleep 22:00–07:00, YouTube 60m + 09:00–17:00 (Mon–Fri).
void _seedRestrictions() {
  final rr = RestrictionRepo.instance;
  const weekdays = {1, 2, 3, 4, 5};
  rr.updateConfig('com.instagram.android', (c) {
    c
      ..dailyLimitEnabled = true
      ..dailyLimitMinutes = 30
      ..schedulesEnabled = true
      ..schedules = [AppLockSchedule(id: 'demo_sleep', title: 'Sleep', startMinuteOfDay: 22 * 60, endMinuteOfDay: 7 * 60, repeatWeekdays: weekdays)];
  });
  rr.updateConfig('com.google.android.youtube', (c) {
    c
      ..dailyLimitEnabled = true
      ..dailyLimitMinutes = 60
      ..schedulesEnabled = true
      ..schedules = [AppLockSchedule(id: 'demo_day', startMinuteOfDay: 9 * 60, endMinuteOfDay: 17 * 60, repeatWeekdays: weekdays)];
  });
}
