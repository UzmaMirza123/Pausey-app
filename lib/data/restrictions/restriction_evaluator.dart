import 'restriction_models.dart';

/// Central restriction rules. Pure functions (no I/O) so they are easy to test.
///
/// The Android enforcement service (RestrictionEngine.kt) implements exactly the
/// same rules on the native side; keep both in sync.
class RestrictionEvaluator {
  const RestrictionEvaluator._();

  /// Is [s] active at local time [t]?
  ///
  /// Half-open [start, end). Weekdays belong to the day the window starts, so an
  /// overnight Friday 23:00–07:00 window is active Saturday 06:59 but not
  /// Saturday 07:00, and is not active Saturday 23:00 unless Saturday is selected.
  static bool scheduleActiveAt(AppLockSchedule s, DateTime t) {
    if (!s.enabled || !s.isValid) return false;
    final m = t.hour * 60 + t.minute;
    final wd = t.weekday;
    if (!s.overnight) {
      return s.repeatWeekdays.contains(wd) && m >= s.startMinuteOfDay && m < s.endMinuteOfDay;
    }
    final yesterday = wd == 1 ? 7 : wd - 1;
    return (s.repeatWeekdays.contains(wd) && m >= s.startMinuteOfDay) || (s.repeatWeekdays.contains(yesterday) && m < s.endMinuteOfDay);
  }

  /// Next moment one of [schedules] starts after [t] (not counting windows already active).
  static DateTime? nextStart(Iterable<AppLockSchedule> schedules, DateTime t) {
    DateTime? best;
    for (final s in schedules) {
      if (!s.enabled || !s.isValid) continue;
      for (var off = 0; off <= 7; off++) {
        // DateTime(...) with a day overflow normalises across months; local wall-clock time.
        final c = DateTime(t.year, t.month, t.day + off, s.startMinuteOfDay ~/ 60, s.startMinuteOfDay % 60);
        if (!c.isAfter(t) || !s.repeatWeekdays.contains(c.weekday)) continue;
        if (best == null || c.isBefore(best)) best = c;
        break;
      }
    }
    return best;
  }

  /// Full state for one app.
  ///
  /// - [config]: the app's own policy (may be null for apps without a package).
  /// - [usedMinutes]: today's REAL usage, or null when unknown. Unknown usage never triggers the limit.
  /// - [globalRestricted]: the existing Block-tab rule applies right now.
  /// - [focusActive]: a Focus session is running and this app is in the managed list.
  /// - [unlock]: temporary unlock for this app, if any.
  static RestrictionState evaluate({
    required AppRestrictionConfig? config,
    required DateTime now,
    int? usedMinutes,
    bool globalRestricted = false,
    bool focusActive = false,
    TemporaryUnlock? unlock,
  }) {
    final raw = <RestrictionReason>{};
    final active = <String>{};
    DateTime? next;
    int? limit;
    if (config != null && config.enabled) {
      if (config.dailyLimitEnabled && config.dailyLimitMinutes > 0) {
        limit = config.dailyLimitMinutes;
        if (usedMinutes != null && usedMinutes >= limit) raw.add(RestrictionReason.dailyLimit);
      }
      if (config.schedulesEnabled) {
        for (final s in config.schedules) {
          if (scheduleActiveAt(s, now)) active.add(s.id);
        }
        // Overlapping windows count once.
        if (active.isNotEmpty) raw.add(RestrictionReason.schedule);
        next = nextStart(config.schedules.where((s) => !active.contains(s.id)), now);
      }
    }
    if (globalRestricted) raw.add(RestrictionReason.global);
    if (focusActive) raw.add(RestrictionReason.focus);

    final u = (unlock != null && unlock.activeAt(now)) ? unlock : null;
    final lifted = <RestrictionReason>{
      if (u != null)
        for (final r in raw)
          if (r != RestrictionReason.focus && u.permittedReasons.contains(r)) r,
    };
    return RestrictionState(
      reasons: raw.difference(lifted),
      liftedByUnlock: lifted,
      usedMinutes: usedMinutes,
      limitMinutes: limit,
      activeScheduleIds: active,
      nextLockStart: next,
      unlockExpiry: u?.expiry,
    );
  }
}
