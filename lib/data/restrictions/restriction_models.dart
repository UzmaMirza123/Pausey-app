/// Per-app restriction policy (keyed by Android package name).
///
/// Stored separately from usage statistics and derived lock state:
/// - policy  → [AppRestrictionConfig] / [TemporaryUnlock] (RestrictionRepo, prefs key `restrictions_v1`)
/// - usage   → read live from Android (NativeBridge.usageToday), never stored as policy
/// - derived → [RestrictionState] (computed by RestrictionEvaluator, never persisted)
library;

/// Why an app is restricted right now. Several can apply at once.
enum RestrictionReason {
  /// The app's own daily allowance is used up.
  dailyLimit,

  /// One of the app's own lock schedules is active.
  schedule,

  /// Existing global rule: app is "locked" in the Block tab (always, or during the global schedule).
  global,

  /// A Focus session is running.
  focus,
}

/// One lock window. Half-open interval [start, end) in local minutes of day.
/// If end <= start the window crosses midnight (e.g. 23:00 → 07:00).
/// Weekdays refer to the day the window STARTS (1 = Monday … 7 = Sunday).
class AppLockSchedule {
  AppLockSchedule({
    required this.id,
    this.title = '',
    this.enabled = true,
    required this.startMinuteOfDay,
    required this.endMinuteOfDay,
    Set<int>? repeatWeekdays,
  }) : repeatWeekdays = repeatWeekdays ?? {1, 2, 3, 4, 5, 6, 7};

  final String id;
  String title;
  bool enabled;
  int startMinuteOfDay;
  int endMinuteOfDay;
  Set<int> repeatWeekdays;

  bool get overnight => endMinuteOfDay <= startMinuteOfDay;

  /// Length in minutes (zero-length windows are invalid).
  int get lengthMinutes => overnight ? 1440 - startMinuteOfDay + endMinuteOfDay : endMinuteOfDay - startMinuteOfDay;

  bool get isValid =>
      startMinuteOfDay != endMinuteOfDay &&
      startMinuteOfDay >= 0 &&
      startMinuteOfDay < 1440 &&
      endMinuteOfDay >= 0 &&
      endMinuteOfDay < 1440 &&
      repeatWeekdays.isNotEmpty;

  AppLockSchedule copy() => AppLockSchedule(
        id: id,
        title: title,
        enabled: enabled,
        startMinuteOfDay: startMinuteOfDay,
        endMinuteOfDay: endMinuteOfDay,
        repeatWeekdays: Set.of(repeatWeekdays),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'enabled': enabled,
        'start': startMinuteOfDay,
        'end': endMinuteOfDay,
        'days': (repeatWeekdays.toList()..sort()),
      };

  factory AppLockSchedule.fromJson(Map<String, dynamic> j) => AppLockSchedule(
        id: j['id'] as String,
        title: j['title'] as String? ?? '',
        enabled: j['enabled'] as bool? ?? true,
        startMinuteOfDay: (j['start'] as num).toInt(),
        endMinuteOfDay: (j['end'] as num).toInt(),
        repeatWeekdays: ((j['days'] as List?) ?? const [1, 2, 3, 4, 5, 6, 7]).map((e) => (e as num).toInt()).toSet(),
      );
}

/// Everything Pausey enforces for one app.
class AppRestrictionConfig {
  AppRestrictionConfig({
    required this.packageName,
    this.enabled = true,
    this.dailyLimitEnabled = false,
    this.dailyLimitMinutes = 30,
    this.schedulesEnabled = true,
    List<AppLockSchedule>? schedules,
    DateTime? updatedAt,
  })  : schedules = schedules ?? [],
        updatedAt = updatedAt ?? DateTime.now();

  final String packageName;

  /// Master switch for this app's own rules (limit + schedules).
  /// Global and Focus restrictions are separate and still apply when this is off.
  bool enabled;
  bool dailyLimitEnabled;
  int dailyLimitMinutes;
  bool schedulesEnabled;
  List<AppLockSchedule> schedules;
  DateTime updatedAt;

  AppRestrictionConfig copy() => AppRestrictionConfig(
        packageName: packageName,
        enabled: enabled,
        dailyLimitEnabled: dailyLimitEnabled,
        dailyLimitMinutes: dailyLimitMinutes,
        schedulesEnabled: schedulesEnabled,
        schedules: [for (final s in schedules) s.copy()],
        updatedAt: updatedAt,
      );

  Map<String, dynamic> toJson() => {
        'pkg': packageName,
        'enabled': enabled,
        'limitOn': dailyLimitEnabled,
        'limitMin': dailyLimitMinutes,
        'schedOn': schedulesEnabled,
        'schedules': [for (final s in schedules) s.toJson()],
        'updated': updatedAt.toIso8601String(),
      };

  factory AppRestrictionConfig.fromJson(Map<String, dynamic> j) => AppRestrictionConfig(
        packageName: j['pkg'] as String,
        enabled: j['enabled'] as bool? ?? true,
        dailyLimitEnabled: j['limitOn'] as bool? ?? false,
        dailyLimitMinutes: (j['limitMin'] as num?)?.toInt() ?? 30,
        schedulesEnabled: j['schedOn'] as bool? ?? true,
        schedules: [for (final s in (j['schedules'] as List? ?? const [])) AppLockSchedule.fromJson(Map<String, dynamic>.from(s as Map))],
        updatedAt: DateTime.tryParse(j['updated'] as String? ?? ''),
      );
}

/// A short unlock granted by the user (uses one Emergency Override).
/// Only lifts the reasons listed in [permittedReasons]; Focus is never lifted.
class TemporaryUnlock {
  TemporaryUnlock({required this.packageName, required this.expiry, Set<RestrictionReason>? permittedReasons})
      : permittedReasons = permittedReasons ?? {RestrictionReason.dailyLimit, RestrictionReason.schedule, RestrictionReason.global};

  final String packageName;

  /// Absolute moment (UTC-safe: compared with DateTime.now()).
  final DateTime expiry;
  final Set<RestrictionReason> permittedReasons;

  bool activeAt(DateTime t) => t.isBefore(expiry);

  Map<String, dynamic> toJson() => {
        'pkg': packageName,
        'expiryMs': expiry.millisecondsSinceEpoch,
        'reasons': [for (final r in permittedReasons) r.name],
      };

  factory TemporaryUnlock.fromJson(Map<String, dynamic> j) => TemporaryUnlock(
        packageName: j['pkg'] as String,
        expiry: DateTime.fromMillisecondsSinceEpoch((j['expiryMs'] as num).toInt()),
        permittedReasons: {
          for (final n in (j['reasons'] as List? ?? const []))
            ...RestrictionReason.values.where((r) => r.name == n),
        },
      );
}

/// Derived, never stored.
class RestrictionState {
  const RestrictionState({
    required this.reasons,
    required this.liftedByUnlock,
    this.usedMinutes,
    this.limitMinutes,
    this.activeScheduleIds = const {},
    this.nextLockStart,
    this.unlockExpiry,
  });

  /// Reasons that currently restrict the app (after a temporary unlock is applied).
  final Set<RestrictionReason> reasons;

  /// Reasons that would apply but are lifted by an active temporary unlock.
  final Set<RestrictionReason> liftedByUnlock;

  /// Today's real usage, or null when unavailable (no permission / not Android).
  final int? usedMinutes;
  final int? limitMinutes;
  final Set<String> activeScheduleIds;
  final DateTime? nextLockStart;
  final DateTime? unlockExpiry;

  bool get locked => reasons.isNotEmpty;
  bool get scheduledLater => !locked && nextLockStart != null;
  int? get remainingMinutes => (limitMinutes == null || usedMinutes == null) ? null : (limitMinutes! - usedMinutes!).clamp(0, limitMinutes!);
}
