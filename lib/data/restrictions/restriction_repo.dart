import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart' show mapEquals;
import 'package:flutter/widgets.dart';

import '../../l10n/app_localizations.dart';

import '../../screens/focus/focus_timer.dart';
import '../../services/local_store.dart';
import '../../services/native_bridge.dart';
import '../app_repo.dart';
import '../models.dart';
import 'restriction_evaluator.dart';
import 'restriction_models.dart';

/// Per-app restriction policy + live usage + permission status.
///
/// Policy is saved locally under `restrictions_v1` (never needs the network) and pushed to
/// the native Android enforcement service whenever it, the app list, the global schedule or
/// the Focus timer changes.
class RestrictionRepo extends ChangeNotifier with WidgetsBindingObserver {
  RestrictionRepo._();
  static final RestrictionRepo instance = RestrictionRepo._();

  static const _key = 'restrictions_v1';

  /// How long a temporary unlock lasts.
  static const unlockDuration = Duration(minutes: 15);

  final Map<String, AppRestrictionConfig> _configs = {};
  final Map<String, TemporaryUnlock> _unlocks = {};

  /// Today's real usage (minutes) per package; null = not available (no permission / not Android).
  Map<String, int>? usage;

  /// How many times each app was opened today; null = not available.
  Map<String, int>? opens;

  /// How many times each app was unblocked today (any way: the Home badge, a temporary
  /// unlock or the Unblock button). Resets at midnight.
  final Map<String, int> _unblocks = {};
  String _unblocksDay = '';
  NativeStatus status = const NativeStatus();

  /// Translated texts for the native block screen / notification (set from the app's builder).
  Map<String, String> _nativeStrings = const {};

  void setNativeStrings(AppLocalizations l) {
    final m = {
      'blockTitle': l.nativeBlockTitle('{app}'),
      'reasonLimit': l.nativeReasonLimit,
      'reasonSchedule': l.nativeReasonSchedule,
      'reasonGlobal': l.nativeReasonGlobal,
      'reasonFocus': l.nativeReasonFocus,
      'close': l.nativeClose,
      'notifTitle': l.nativeNotifTitle,
      'notifText': l.nativeNotifText,
      // "Almost at your limit" nudge; the native side substitutes the placeholders.
      'nudgeTitle': l.nudgeTitle('{app}'),
      'nudgeText': l.nudgeText('{used}', '{limit}'),
      // Time units for the nudge text, same format as the rest of the app (e.g. "25m", "1h 25m").
      'durMin': '{m}${l.unitM}',
      'durH': '{h}${l.unitH}',
      'durHM': '{h}${l.unitH} {m}${l.unitM}',
    };
    if (mapEquals(m, _nativeStrings)) return;
    _nativeStrings = m;
    _scheduleSync();
  }

  Timer? _tick;
  Timer? _syncDebounce;
  Timer? _unlockEnd;
  bool _started = false;

  DateTime now() => AppRepo.instance.now();

  // ---------------------------------------------------------------------------
  // Lifecycle
  // ---------------------------------------------------------------------------

  void load() {
    _configs.clear();
    _unlocks.clear();
    _unblocks.clear();
    _unblocksDay = '';
    final raw = LocalStore.instance.getRaw(_key);
    if (raw != null) {
      try {
        final j = jsonDecode(raw) as Map<String, dynamic>;
        for (final c in (j['configs'] as List? ?? const [])) {
          final cfg = AppRestrictionConfig.fromJson(Map<String, dynamic>.from(c as Map));
          _configs[cfg.packageName] = cfg;
        }
        for (final u in (j['unlocks'] as List? ?? const [])) {
          final t = TemporaryUnlock.fromJson(Map<String, dynamic>.from(u as Map));
          if (t.activeAt(now())) _unlocks[t.packageName] = t;
        }
        final ub = j['unblocks'];
        if (ub is Map) {
          _unblocksDay = ub['day'] as String? ?? '';
          for (final e in Map<String, dynamic>.from(ub['counts'] as Map? ?? const {}).entries) {
            _unblocks[e.key] = (e.value as num).toInt();
          }
        }
      } catch (e) {
        debugPrint('RestrictionRepo: bad saved data, ignoring: $e');
      }
    }
    notifyListeners();
    _armUnlockEnd();
  }

  /// Starts listening for changes and keeps usage/permissions fresh. Call once after load().
  void start() {
    if (_started) return;
    _started = true;
    WidgetsBinding.instance.addObserver(this);
    AppRepo.instance.addListener(_scheduleSync);
    FocusTimer.instance.addListener(_scheduleSync);
    _tick = Timer.periodic(const Duration(seconds: 60), (_) => refresh());
    refresh();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // Coming back from Android settings: re-check permissions straight away.
    if (state == AppLifecycleState.resumed) refresh();
  }

  @override
  void dispose() {
    _tick?.cancel();
    _syncDebounce?.cancel();
    _unlockEnd?.cancel();
    super.dispose();
  }

  /// Re-reads permissions and today's usage from Android.
  Future<void> refresh() async {
    status = await NativeBridge.instance.status();
    final pkgs = AppRepo.instance.apps.map((a) => a.packageName).whereType<String>().toSet();
    usage = status.usageAccess && pkgs.isNotEmpty ? await NativeBridge.instance.usageToday(pkgs) : (status.usageAccess ? {} : null);
    opens = status.usageAccess && pkgs.isNotEmpty ? await NativeBridge.instance.opensToday(pkgs) : (status.usageAccess ? {} : null);
    _dropExpiredUnlocks();
    notifyListeners();
    _scheduleSync();
  }

  Future<void> _save() async {
    notifyListeners();
    await LocalStore.instance.setRaw(
      _key,
      jsonEncode({
        'configs': [for (final c in _configs.values) c.toJson()],
        'unlocks': [for (final u in _unlocks.values) u.toJson()],
        'unblocks': {'day': _unblocksDay, 'counts': _unblocks},
      }),
    );
    _scheduleSync();
  }

  // ---------------------------------------------------------------------------
  // Reading
  // ---------------------------------------------------------------------------

  /// Saved config, or a fresh default (not stored until changed).
  AppRestrictionConfig configFor(String pkg) => _configs[pkg]?.copy() ?? AppRestrictionConfig(packageName: pkg);

  bool hasOwnRules(String pkg) {
    final c = _configs[pkg];
    return c != null && c.enabled && ((c.dailyLimitEnabled && c.dailyLimitMinutes > 0) || (c.schedulesEnabled && c.schedules.any((s) => s.enabled && s.isValid)));
  }

  TemporaryUnlock? unlockFor(String pkg) {
    final u = _unlocks[pkg];
    return u != null && u.activeAt(now()) ? u : null;
  }

  /// Times [pkg] was opened today, or null when it can't be read.
  int? opensFor(String? pkg) => pkg == null ? null : (opens == null ? null : (opens![pkg] ?? 0));

  static String _day(DateTime t) => '${t.year}-${t.month}-${t.day}';

  /// Times [pkg] was unblocked today.
  int unblocksToday(String? pkg) => pkg == null || _unblocksDay != _day(now()) ? 0 : (_unblocks[pkg] ?? 0);

  /// Counts one unblock for each of [pkgs] (saved with the next write).
  void countUnblock(Iterable<String> pkgs) {
    final d = _day(now());
    if (_unblocksDay != d) {
      _unblocks.clear();
      _unblocksDay = d;
    }
    for (final p in pkgs) {
      _unblocks[p] = (_unblocks[p] ?? 0) + 1;
    }
  }

  /// Counts an unblock for [pkg] and saves it.
  Future<void> recordUnblock(String pkg) async {
    countUnblock([pkg]);
    await _save();
  }

  int? usedMinutes(String? pkg) => pkg == null ? null : (usage == null ? null : (usage![pkg] ?? 0));

  /// Existing Block-tab rule (unchanged meaning): a locked app is blocked during the global
  /// schedule when "scheduled", otherwise all day — unless it has its own limit/schedules,
  /// which then decide instead of "all day".
  bool globalRestricted(ManagedApp a) {
    if (!a.locked) return false;
    if (a.scheduled) return AppRepo.instance.schedule.activeAt(now());
    return a.packageName == null || !hasOwnRules(a.packageName!);
  }

  bool get focusActive => FocusTimer.instance.isRunning && !FocusTimer.instance.onBreak;

  /// Current state for one managed app.
  RestrictionState stateFor(ManagedApp a) {
    final pkg = a.packageName;
    return RestrictionEvaluator.evaluate(
      config: pkg == null || !a.locked ? null : _configs[pkg],
      now: now(),
      usedMinutes: usedMinutes(pkg),
      globalRestricted: globalRestricted(a),
      focusActive: focusActive && a.locked,
      unlock: pkg == null ? null : unlockFor(pkg),
    );
  }

  // ---------------------------------------------------------------------------
  // Writing (each call changes exactly one app)
  // ---------------------------------------------------------------------------

  Future<void> updateConfig(String pkg, void Function(AppRestrictionConfig c) change) async {
    final c = _configs[pkg] ?? AppRestrictionConfig(packageName: pkg);
    change(c);
    c.dailyLimitMinutes = c.dailyLimitMinutes.clamp(1, 24 * 60);
    c.schedules.removeWhere((s) => !s.isValid);
    c.updatedAt = DateTime.now();
    _configs[pkg] = c;
    await _save();
  }

  /// Adds or replaces a schedule (matched by id). Returns false for an invalid (zero-length / no days) schedule.
  Future<bool> saveSchedule(String pkg, AppLockSchedule s) async {
    if (!s.isValid) return false;
    await updateConfig(pkg, (c) {
      final i = c.schedules.indexWhere((x) => x.id == s.id);
      if (i >= 0) {
        c.schedules[i] = s.copy();
      } else {
        c.schedules.add(s.copy());
      }
    });
    return true;
  }

  Future<void> deleteSchedule(String pkg, String scheduleId) => updateConfig(pkg, (c) => c.schedules.removeWhere((s) => s.id == scheduleId));

  /// Removes this app's own limit and schedules (the app stays in the list).
  Future<void> resetApp(String pkg) async {
    _configs.remove(pkg);
    _unlocks.remove(pkg);
    await _save();
  }

  /// Uses one Emergency Override (existing policy) to unlock [pkg] for [unlockDuration].
  /// Focus restrictions are never lifted. Returns false when no override is left.
  Future<bool> temporaryUnlock(String pkg) async {
    if (!await AppRepo.instance.useBypass()) return false;
    _unlocks[pkg] = TemporaryUnlock(packageName: pkg, expiry: DateTime.now().add(unlockDuration));
    countUnblock([pkg]);
    await _save();
    return true;
  }

  /// Home "Unblock apps": unblocks every app in [pkgs] for [d] at once (no Emergency
  /// Override is used; the wait screen is the friction). Focus restrictions stay on.
  /// When the time is up the apps are blocked again by themselves (here and natively).
  Future<void> unlockAllFor(Iterable<String> pkgs, Duration d) async {
    final until = DateTime.now().add(d);
    for (final p in pkgs) {
      _unlocks[p] = TemporaryUnlock(packageName: p, expiry: until);
    }
    countUnblock(pkgs);
    await _save();
    _armUnlockEnd();
  }

  /// Packages unblocked right now, and when the latest unblock ends (null = none).
  List<String> get unlockedNow => [for (final u in _unlocks.values) if (u.activeAt(now())) u.packageName];
  DateTime? get unlockEndsAt {
    DateTime? end;
    for (final u in _unlocks.values) {
      if (u.activeAt(now()) && (end == null || u.expiry.isAfter(end))) end = u.expiry;
    }
    return end;
  }

  /// Re-blocks as soon as the next unblock runs out.
  void _armUnlockEnd() {
    _unlockEnd?.cancel();
    DateTime? next;
    for (final u in _unlocks.values) {
      if (next == null || u.expiry.isBefore(next)) next = u.expiry;
    }
    if (next == null) return;
    final wait = next.difference(DateTime.now());
    _unlockEnd = Timer(wait.isNegative ? Duration.zero : wait + const Duration(milliseconds: 200), () async {
      _dropExpiredUnlocks();
      await _save();
      _armUnlockEnd();
    });
  }

  Future<void> endUnlock(String pkg) async {
    _unlocks.remove(pkg);
    await _save();
    _armUnlockEnd();
  }

  void _dropExpiredUnlocks() => _unlocks.removeWhere((_, u) => !u.activeAt(now()));

  /// New schedule id.
  static String newId() => 's${DateTime.now().microsecondsSinceEpoch.toRadixString(36)}';

  // ---------------------------------------------------------------------------
  // Native sync
  // ---------------------------------------------------------------------------

  void _scheduleSync() {
    _syncDebounce?.cancel();
    _syncDebounce = Timer(const Duration(milliseconds: 400), () => NativeBridge.instance.syncPolicy(policyJson()));
  }

  /// Everything the native service needs to decide on its own (Flutter may be closed).
  Map<String, dynamic> policyJson() {
    final r = AppRepo.instance;
    final ft = FocusTimer.instance;
    return {
      'version': 1,
      'apps': [
        for (final a in r.apps)
          if (a.packageName != null)
            {
              'pkg': a.packageName,
              'name': a.name,
              'locked': a.locked,
              'scheduled': a.scheduled,
              if (a.locked && _configs[a.packageName] != null) 'config': _configs[a.packageName]!.toJson(),
            },
      ],
      'globalSchedule': r.schedule.toJson(),
      // Wall-clock end of the running focus segment; the service ignores it once passed.
      'focusUntilMs': focusActive ? DateTime.now().add(Duration(seconds: ft.remainingSeconds)).millisecondsSinceEpoch : 0,
      'unlocks': [for (final u in _unlocks.values) u.toJson()],
      'strings': _nativeStrings,
    };
  }
}
