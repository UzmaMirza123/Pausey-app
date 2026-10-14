import 'dart:convert';
import 'dart:math';

import 'package:flutter/foundation.dart';

import '../services/local_store.dart';
import 'models.dart';

String dayKey(DateTime d) => '${d.year.toString().padLeft(4, '0')}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';
DateTime dateOnly(DateTime d) => DateTime(d.year, d.month, d.day);

/// All app data (apps, schedule, sessions, goals, settings), saved on the phone.
///
/// Every screen reads from here and calls the methods below to change things;
/// listeners rebuild automatically (`ListenableBuilder(listenable: AppRepo.instance, …)`).
class AppRepo extends ChangeNotifier {
  AppRepo._();
  static final AppRepo instance = AppRepo._();

  static const _key = 'app_state';

  List<ManagedApp> apps = [];
  LockSchedule schedule = LockSchedule();
  bool faceIdProtection = false;
  List<FocusSession> sessions = [];
  List<Goal> goals = [];
  AppSettings settings = AppSettings();
  bool premium = false;

  /// Phone unlock overrides used today (Emergency Override).
  Map<String, int> bypassUsed = {};

  /// Clock used everywhere (tests can replace it).
  DateTime Function() now = DateTime.now;

  /// Catalogue of apps shown in the "Add App" sheet. Ids are stable English names.
  static const catalog = <String, String>{
    'Instagram': 'social',
    'Twitter / X': 'social',
    'YouTube': 'video',
    'TikTok': 'video',
    'Facebook': 'social',
    'Netflix': 'video',
    'Reddit': 'community',
    'Snapchat': 'social',
    'WhatsApp': 'social',
    'Gaming Apps': 'games',
    'Shopping': 'shopping',
  };

  // ---------------------------------------------------------------------------
  // Load / save
  // ---------------------------------------------------------------------------

  void load() {
    final raw = LocalStore.instance.getRaw(_key);
    if (raw == null) {
      seedFromOnboarding();
      return;
    }
    try {
      final j = jsonDecode(raw) as Map<String, dynamic>;
      apps = ((j['apps'] as List?) ?? []).map((e) => ManagedApp.fromJson(Map<String, dynamic>.from(e as Map))).toList();
      schedule = LockSchedule.fromJson(Map<String, dynamic>.from((j['schedule'] as Map?) ?? {}));
      faceIdProtection = j['faceId'] as bool? ?? false;
      sessions = ((j['sessions'] as List?) ?? []).map((e) => FocusSession.fromJson(Map<String, dynamic>.from(e as Map))).toList();
      goals = ((j['goals'] as List?) ?? []).map((e) => Goal.fromJson(Map<String, dynamic>.from(e as Map))).toList();
      settings = AppSettings.fromJson(Map<String, dynamic>.from((j['settings'] as Map?) ?? {}));
      premium = j['premium'] as bool? ?? false;
      bypassUsed = Map<String, int>.from((j['bypass'] as Map?) ?? {});
    } catch (e) {
      debugPrint('AppRepo: bad saved data, starting fresh: $e');
      seedFromOnboarding();
    }
    notifyListeners();
  }

  Future<void> _save() async {
    notifyListeners();
    await LocalStore.instance.setRaw(
      _key,
      jsonEncode({
        'apps': apps.map((a) => a.toJson()).toList(),
        'schedule': schedule.toJson(),
        'faceId': faceIdProtection,
        'sessions': sessions.map((s) => s.toJson()).toList(),
        'goals': goals.map((g) => g.toJson()).toList(),
        'settings': settings.toJson(),
        'premium': premium,
        'bypass': bypassUsed,
      }),
    );
  }

  /// First run: start from what the user picked in onboarding.
  /// Called once when onboarding finishes.
  void seedFromOnboarding() {
    final a = LocalStore.instance.answers;
    final locked = ((a['lockedApps'] as List?) ?? const ['Instagram', 'YouTube', 'Twitter / X']).cast<String>();
    apps = [
      for (final id in locked) ManagedApp(id: id, name: id, category: catalog[id] ?? 'other'),
    ];
    schedule = LockSchedule();
    final hours = (a['dailyGoalHours'] as num?) ?? 4;
    goals = [
      Goal(id: 'g_focus', title: '', type: GoalType.focusMinutes, category: GoalCategory.focus, target: (hours * 60).round()),
      Goal(id: 'g_block', title: '', type: GoalType.blockApps, category: GoalCategory.discipline, target: 7),
      Goal(id: 'g_pomo', title: '', type: GoalType.sessions, category: GoalCategory.focus, target: 3),
    ];
    _save();
  }

  /// Delete everything (Settings → Clear activity data keeps apps & goals).
  Future<void> clearActivity() async {
    sessions = [];
    for (final g in goals) {
      g.checkedDays.clear();
    }
    await _save();
  }

  // ---------------------------------------------------------------------------
  // Apps & schedule
  // ---------------------------------------------------------------------------

  int get lockedCount => apps.where((a) => a.locked).length;
  int get unlockedCount => apps.where((a) => !a.locked).length;
  int get scheduledCount => apps.where((a) => a.scheduled).length;

  /// Is [app] blocked right now?
  bool isBlockedNow(ManagedApp app) => app.locked && (!app.scheduled || schedule.activeAt(now()));

  Future<void> setAppLocked(String id, bool locked) async {
    apps.firstWhere((a) => a.id == id).locked = locked;
    await _save();
  }

  Future<void> setAppScheduled(String id, bool v) async {
    apps.firstWhere((a) => a.id == id).scheduled = v;
    await _save();
  }

  /// Replace the managed list with the apps chosen in the Select Apps sheet.
  Future<void> setManagedApps(Iterable<String> ids) async {
    final keep = {for (final a in apps) a.id: a};
    apps = [
      for (final id in ids) keep[id] ?? ManagedApp(id: id, name: id, category: catalog[id] ?? 'other'),
      // keep unlocked apps that were managed before so the user can re-lock them
      for (final a in keep.values)
        if (!ids.contains(a.id) && (!a.locked || !catalog.containsKey(a.id))) a,
    ];
    await _save();
  }

  /// Add apps picked from the phone's installed-app list (id = package name).
  Future<void> addInstalledApps(Iterable<({String packageName, String label})> picked) async {
    for (final p in picked) {
      if (apps.any((a) => a.packageName == p.packageName)) continue;
      apps.add(ManagedApp(id: p.packageName, name: p.label, category: 'other', packageName: p.packageName));
    }
    await _save();
  }

  Future<void> removeApp(String id) async {
    apps.removeWhere((a) => a.id == id);
    await _save();
  }

  Future<void> lockAll() async {
    for (final a in apps) {
      a.locked = true;
    }
    await _save();
  }

  Future<void> updateSchedule(void Function(LockSchedule s) change) async {
    change(schedule);
    await _save();
  }

  Future<void> setFaceIdProtection(bool v) async {
    faceIdProtection = v;
    await _save();
  }

  int get bypassLeftToday => max(0, settings.bypassPerDay - (bypassUsed[dayKey(now())] ?? 0));

  /// Use one emergency unlock. Returns false when none are left.
  Future<bool> useBypass() async {
    if (!settings.emergencyBypass || bypassLeftToday <= 0) return false;
    final k = dayKey(now());
    bypassUsed = {k: (bypassUsed[k] ?? 0) + 1};
    await _save();
    return true;
  }

  // ---------------------------------------------------------------------------
  // Focus sessions
  // ---------------------------------------------------------------------------

  Future<void> addSession(FocusSession s) async {
    sessions.add(s);
    await _save();
  }

  int minutesPlanned(FocusMode m) => switch (m) {
        FocusMode.pomodoro => settings.pomodoroMinutes,
        FocusMode.deep => settings.deepMinutes,
        FocusMode.custom => settings.customMinutes,
      };

  Iterable<FocusSession> sessionsOn(DateTime day) {
    final d = dateOnly(day);
    return sessions.where((s) => dateOnly(s.start) == d);
  }

  /// Focus minutes on [day].
  int focusMinutesOn(DateTime day) => sessionsOn(day).fold(0, (a, s) => a + s.focusedSeconds) ~/ 60;
  int completedSessionsOn(DateTime day) => sessionsOn(day).where((s) => s.completed).length;

  int get todayFocusMinutes => focusMinutesOn(now());
  int get yesterdayFocusMinutes => focusMinutesOn(now().subtract(const Duration(days: 1)));

  /// Focus minutes for the 7 days of the current week, Monday first.
  List<int> get weekFocusMinutes {
    final monday = dateOnly(now()).subtract(Duration(days: now().weekday - 1));
    return [for (var i = 0; i < 7; i++) focusMinutesOn(monday.add(Duration(days: i)))];
  }

  /// Focus minutes per day for the last [days] days, oldest first.
  List<int> lastDaysFocus(int days) {
    final today = dateOnly(now());
    return [for (var i = days - 1; i >= 0; i--) focusMinutesOn(today.subtract(Duration(days: i)))];
  }

  /// Focus minutes per week for the last 4 weeks, oldest first.
  List<int> get last4WeeksFocus {
    final days = lastDaysFocus(28);
    return [for (var w = 0; w < 4; w++) days.sublist(w * 7, w * 7 + 7).fold(0, (a, b) => a + b)];
  }

  int get totalFocusMinutes => sessions.fold(0, (a, s) => a + s.focusedSeconds) ~/ 60;
  int get completedSessions => sessions.where((s) => s.completed).length;

  /// A day "counts" for the streak when the user finished at least one session.
  bool dayActive(DateTime d) => completedSessionsOn(d) > 0;

  /// Consecutive active days ending today (or yesterday if today has none yet).
  int get streak {
    var d = dateOnly(now());
    if (!dayActive(d)) d = d.subtract(const Duration(days: 1));
    var n = 0;
    while (dayActive(d)) {
      n++;
      d = d.subtract(const Duration(days: 1));
    }
    return n;
  }

  int get bestStreak {
    if (sessions.isEmpty) return 0;
    final days = sessions.where((s) => s.completed).map((s) => dateOnly(s.start)).toSet().toList()..sort();
    var best = 0, run = 0;
    DateTime? prev;
    for (final d in days) {
      run = (prev != null && d.difference(prev).inDays == 1) ? run + 1 : 1;
      best = max(best, run);
      prev = d;
    }
    return best;
  }

  // ---------------------------------------------------------------------------
  // Goals
  // ---------------------------------------------------------------------------

  Future<void> addGoal(Goal g) async {
    goals.add(g);
    await _save();
  }

  Future<void> updateGoal(Goal g) async {
    final i = goals.indexWhere((x) => x.id == g.id);
    if (i >= 0) goals[i] = g;
    await _save();
  }

  Future<void> deleteGoal(String id) async {
    goals.removeWhere((g) => g.id == id);
    await _save();
  }

  /// Mark/unmark today as done for goals the app can't measure itself.
  Future<void> toggleGoalToday(Goal g) async {
    final k = dayKey(now());
    if (!g.checkedDays.remove(k)) g.checkedDays.add(k);
    await _save();
  }

  /// The daily focus goal in minutes (first focus-minutes goal, default 4h).
  int get dailyFocusGoalMinutes =>
      goals.firstWhere((g) => g.type == GoalType.focusMinutes, orElse: () => Goal(id: '', title: '', type: GoalType.focusMinutes, category: GoalCategory.focus, target: 240)).target;

  /// Was [g] met on [day]?
  bool goalMetOn(Goal g, DateTime day) => switch (g.type) {
        GoalType.focusMinutes => focusMinutesOn(day) >= g.target,
        GoalType.sessions => completedSessionsOn(day) >= g.target,
        GoalType.blockApps => schedule.enabled && lockedCount > 0 && !day.isAfter(now()) && !day.isBefore(dateOnly(g.createdAt)),
        GoalType.phoneFree || GoalType.screenLimit => g.checkedDays.contains(dayKey(day)),
      };

  /// Today's progress 0..1.
  double goalTodayProgress(Goal g) {
    final t = now();
    return switch (g.type) {
      GoalType.focusMinutes => (focusMinutesOn(t) / max(1, g.target)).clamp(0.0, 1.0),
      GoalType.sessions => (completedSessionsOn(t) / max(1, g.target)).clamp(0.0, 1.0),
      _ => goalMetOn(g, t) ? 1.0 : 0.0,
    };
  }

  /// Days met in the last 7 days (for weekly-style goals).
  int goalDaysThisWeek(Goal g) => [for (var i = 0; i < 7; i++) goalMetOn(g, dateOnly(now()).subtract(Duration(days: i)))].where((x) => x).length;

  /// Weekly progress 0..1 (days met / 7, or / target for "N days per week" goals).
  double goalWeekProgress(Goal g) {
    final denom = (g.type == GoalType.blockApps || g.type == GoalType.phoneFree) ? g.target : 7;
    return (goalDaysThisWeek(g) / max(1, denom)).clamp(0.0, 1.0);
  }

  bool goalDone(Goal g) => goalWeekProgress(g) >= 1.0;

  /// Consecutive days the goal was met, ending today/yesterday.
  int goalStreak(Goal g) {
    var d = dateOnly(now());
    if (!goalMetOn(g, d)) d = d.subtract(const Duration(days: 1));
    var n = 0;
    while (n < 365 && goalMetOn(g, d)) {
      n++;
      d = d.subtract(const Duration(days: 1));
    }
    return n;
  }

  double get overallGoalCompletion => goals.isEmpty ? 0 : goals.map(goalWeekProgress).reduce((a, b) => a + b) / goals.length;

  // ---------------------------------------------------------------------------
  // Scores (Insights)
  // ---------------------------------------------------------------------------

  /// 0–100 for the 7 days ending [end]: 50% focus vs goal, 30% goals met, 20% consistency.
  int productivityScore([DateTime? end]) {
    final e = dateOnly(end ?? now());
    final days = [for (var i = 0; i < 7; i++) e.subtract(Duration(days: i))];
    final focus = days.map((d) => min(1.0, focusMinutesOn(d) / max(1, dailyFocusGoalMinutes))).reduce((a, b) => a + b) / 7;
    final goalPart = goals.isEmpty
        ? focus
        : days.map((d) => goals.where((g) => goalMetOn(g, d)).length / goals.length).reduce((a, b) => a + b) / 7;
    final consistency = days.where(dayActive).length / 7;
    return ((focus * 0.5 + goalPart * 0.3 + consistency * 0.2) * 100).round();
  }

  /// Score for each of the last 7 days (oldest first) — the sparkline.
  List<int> get scoreLast7 => [for (var i = 6; i >= 0; i--) productivityScore(now().subtract(Duration(days: i)))];

  int get focusScore => (min(1.0, weekFocusMinutes.fold(0, (a, b) => a + b) / max(1, dailyFocusGoalMinutes * 7)) * 100).round();
  int get consistencyScore => (lastDaysFocus(7).where((m) => m > 0).length / 7 * 100).round();

  // ---------------------------------------------------------------------------
  // Settings / premium
  // ---------------------------------------------------------------------------

  Future<void> updateSettings(void Function(AppSettings s) change) async {
    change(settings);
    await _save();
  }

  Future<void> setPremium(bool v) async {
    premium = v;
    await _save();
  }

  /// Free plan limits (Paywall compares these).
  static const freeMaxGoals = 3;
  static const freeMaxApps = 3;
  /// Tell listeners after changing fields directly (demo data, tests).
  void refresh() => notifyListeners();

  bool get canAddGoal => premium || goals.length < freeMaxGoals;
}
