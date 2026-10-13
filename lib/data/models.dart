import 'package:flutter/material.dart';

/// An app the user can lock (Block tab / Select Apps sheet).
class ManagedApp {
  ManagedApp({required this.id, required this.name, required this.category, this.locked = true, this.scheduled = false});

  /// Stable English id, e.g. "Instagram".
  final String id;
  final String name;

  /// social | video | games | shopping | community | other
  final String category;
  bool locked;

  /// Locked only during the lock schedule (not all day).
  bool scheduled;

  Map<String, dynamic> toJson() => {'id': id, 'name': name, 'category': category, 'locked': locked, 'scheduled': scheduled};
  factory ManagedApp.fromJson(Map<String, dynamic> j) => ManagedApp(
        id: j['id'] as String,
        name: j['name'] as String? ?? j['id'] as String,
        category: j['category'] as String? ?? 'other',
        locked: j['locked'] as bool? ?? true,
        scheduled: j['scheduled'] as bool? ?? false,
      );
}

/// Daily lock window, e.g. 10:00 PM → 7:00 AM on weekdays.
class LockSchedule {
  LockSchedule({this.enabled = true, this.startMinutes = 22 * 60, this.endMinutes = 7 * 60, Set<int>? days})
      : days = days ?? {1, 2, 3, 4, 5};

  bool enabled;

  /// Minutes after midnight.
  int startMinutes;
  int endMinutes;

  /// 1 = Monday … 7 = Sunday.
  Set<int> days;

  TimeOfDay get start => TimeOfDay(hour: startMinutes ~/ 60, minute: startMinutes % 60);
  TimeOfDay get end => TimeOfDay(hour: endMinutes ~/ 60, minute: endMinutes % 60);

  /// Is the schedule active at [t]? Handles overnight windows.
  bool activeAt(DateTime t) {
    if (!enabled) return false;
    final m = t.hour * 60 + t.minute;
    if (startMinutes <= endMinutes) return days.contains(t.weekday) && m >= startMinutes && m < endMinutes;
    // overnight: started yesterday or starts today
    if (m >= startMinutes) return days.contains(t.weekday);
    final yesterday = t.weekday == 1 ? 7 : t.weekday - 1;
    return m < endMinutes && days.contains(yesterday);
  }

  Map<String, dynamic> toJson() => {'enabled': enabled, 'start': startMinutes, 'end': endMinutes, 'days': days.toList()};
  factory LockSchedule.fromJson(Map<String, dynamic> j) => LockSchedule(
        enabled: j['enabled'] as bool? ?? true,
        startMinutes: j['start'] as int? ?? 22 * 60,
        endMinutes: j['end'] as int? ?? 7 * 60,
        days: ((j['days'] as List?) ?? const [1, 2, 3, 4, 5]).map((e) => e as int).toSet(),
      );
}

enum FocusMode { pomodoro, deep, custom }

/// One focus session (finished or stopped early).
class FocusSession {
  FocusSession({required this.start, required this.plannedMinutes, required this.focusedSeconds, required this.mode, required this.completed});

  final DateTime start;
  final int plannedMinutes;

  /// Seconds actually focused (pauses excluded).
  final int focusedSeconds;
  final FocusMode mode;

  /// Ran to the end (not stopped early).
  final bool completed;

  int get focusedMinutes => (focusedSeconds / 60).round();

  Map<String, dynamic> toJson() => {
        'start': start.toIso8601String(),
        'planned': plannedMinutes,
        'secs': focusedSeconds,
        'mode': mode.name,
        'done': completed,
      };
  factory FocusSession.fromJson(Map<String, dynamic> j) => FocusSession(
        start: DateTime.parse(j['start'] as String),
        plannedMinutes: j['planned'] as int,
        focusedSeconds: j['secs'] as int,
        mode: FocusMode.values.firstWhere((m) => m.name == j['mode'], orElse: () => FocusMode.custom),
        completed: j['done'] as bool? ?? false,
      );
}

/// What a goal measures. Progress is computed from real data in AppRepo.
enum GoalType {
  /// target = minutes of focus per day
  focusMinutes,

  /// target = completed sessions per day
  sessions,

  /// target = number of days per week the locked apps stayed locked (lock schedule on)
  blockApps,

  /// target = number of phone-free days per week in the window (user ticks the day)
  phoneFree,

  /// target = max screen-time minutes per day (user ticks the day)
  screenLimit,
}

enum GoalCategory { focus, discipline, wellness }

class Goal {
  Goal({
    required this.id,
    required this.title,
    required this.type,
    required this.category,
    required this.target,
    DateTime? createdAt,
    Set<String>? checkedDays,
  })  : createdAt = createdAt ?? DateTime.now(),
        checkedDays = checkedDays ?? {};

  final String id;
  String title;
  GoalType type;
  GoalCategory category;

  /// Meaning depends on [type] (see GoalType docs).
  int target;
  final DateTime createdAt;

  /// Days the user marked as done ("2026-10-13"), for goals the app can't measure itself.
  final Set<String> checkedDays;

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'type': type.name,
        'category': category.name,
        'target': target,
        'created': createdAt.toIso8601String(),
        'checked': checkedDays.toList(),
      };
  factory Goal.fromJson(Map<String, dynamic> j) => Goal(
        id: j['id'] as String,
        title: j['title'] as String,
        type: GoalType.values.firstWhere((t) => t.name == j['type'], orElse: () => GoalType.focusMinutes),
        category: GoalCategory.values.firstWhere((c) => c.name == j['category'], orElse: () => GoalCategory.focus),
        target: j['target'] as int,
        createdAt: DateTime.tryParse(j['created'] as String? ?? ''),
        checkedDays: ((j['checked'] as List?) ?? const []).map((e) => e as String).toSet(),
      );
}

/// App settings (Settings screen).
class AppSettings {
  AppSettings({
    this.push = true,
    this.focusReminder = true,
    this.reminderMinutes = 9 * 60,
    this.streakAlerts = true,
    this.goalMilestones = false,
    this.emergencyBypass = true,
    this.bypassPerDay = 3,
    this.biometricLock = false,
    this.hideUsage = false,
    this.textScale = 1.0,
    this.ambientSound = 'rain',
    this.ambientVolume = 0.6,
    this.pomodoroMinutes = 25,
    this.deepMinutes = 90,
    this.customMinutes = 45,
    this.breakMinutes = 5,
  });

  bool push, focusReminder, streakAlerts, goalMilestones, emergencyBypass, biometricLock, hideUsage;
  int reminderMinutes, bypassPerDay, pomodoroMinutes, deepMinutes, customMinutes, breakMinutes;
  double textScale, ambientVolume;

  /// off | rain | forest | waves | white
  String ambientSound;

  Map<String, dynamic> toJson() => {
        'push': push,
        'focusReminder': focusReminder,
        'reminderMinutes': reminderMinutes,
        'streakAlerts': streakAlerts,
        'goalMilestones': goalMilestones,
        'emergencyBypass': emergencyBypass,
        'bypassPerDay': bypassPerDay,
        'biometricLock': biometricLock,
        'hideUsage': hideUsage,
        'textScale': textScale,
        'ambientSound': ambientSound,
        'ambientVolume': ambientVolume,
        'pomodoro': pomodoroMinutes,
        'deep': deepMinutes,
        'custom': customMinutes,
        'break': breakMinutes,
      };
  factory AppSettings.fromJson(Map<String, dynamic> j) => AppSettings(
        push: j['push'] as bool? ?? true,
        focusReminder: j['focusReminder'] as bool? ?? true,
        reminderMinutes: j['reminderMinutes'] as int? ?? 540,
        streakAlerts: j['streakAlerts'] as bool? ?? true,
        goalMilestones: j['goalMilestones'] as bool? ?? false,
        emergencyBypass: j['emergencyBypass'] as bool? ?? true,
        bypassPerDay: j['bypassPerDay'] as int? ?? 3,
        biometricLock: j['biometricLock'] as bool? ?? false,
        hideUsage: j['hideUsage'] as bool? ?? false,
        textScale: (j['textScale'] as num?)?.toDouble() ?? 1.0,
        ambientSound: j['ambientSound'] as String? ?? 'rain',
        ambientVolume: (j['ambientVolume'] as num?)?.toDouble() ?? 0.6,
        pomodoroMinutes: j['pomodoro'] as int? ?? 25,
        deepMinutes: j['deep'] as int? ?? 90,
        customMinutes: j['custom'] as int? ?? 45,
        breakMinutes: j['break'] as int? ?? 5,
      );
}

/// Usage of one app on one day (Screen Time screen).
class AppUsage {
  const AppUsage(this.appId, this.category, this.minutes);
  final String appId;
  final String category;
  final int minutes;
}
