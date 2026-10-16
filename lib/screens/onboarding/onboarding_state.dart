import 'dart:convert';

import 'package:flutter/foundation.dart';

import '../../data/app_repo.dart';
import '../../data/models.dart';
import '../../data/restrictions/restriction_repo.dart';
import '../../services/local_store.dart';

/// What the user wants more time for (stage 3).
enum ObGoal { focus, sleep, scrolling, me, habits, other }

/// "Ever picked up your phone for a minute and stayed much longer?" (stage 2).
enum ObRelate { often, sometimes, rarely }

/// Daily screen-time estimate (stage 5).
enum ObScreenTime { under2, h2to4, h4to6, over6, notSure }

/// An app the user picked in stage 4.
class ObApp {
  const ObApp({required this.id, required this.label, this.packageName});

  /// Catalogue name ("Instagram") when known, otherwise the package name.
  final String id;
  final String label;
  final String? packageName;

  Map<String, dynamic> toJson() => {'id': id, 'label': label, 'pkg': packageName};
  factory ObApp.fromJson(Map<String, dynamic> j) => ObApp(id: j['id'] as String, label: j['label'] as String? ?? j['id'] as String, packageName: j['pkg'] as String?);

  @override
  bool operator ==(Object other) => other is ObApp && other.id == id;
  @override
  int get hashCode => id.hashCode;
}

/// Answers and progress of the conversational onboarding.
///
/// Saved after every change (prefs key `onboarding_v2`) so an interrupted setup
/// resumes on the same stage. Nothing here changes the app's real settings until
/// [applyPlan] runs on the last stage.
class OnboardingState extends ChangeNotifier {
  OnboardingState._();
  static final OnboardingState instance = OnboardingState._();

  static const _key = 'onboarding_v2';

  int stage = 0;
  ObRelate? relate;
  ObGoal? goal;
  String goalOther = '';
  List<ObApp> apps = [];

  /// The first app was pre-selected once (so it isn't re-added after the user clears it).
  bool appsDefaulted = false;
  ObScreenTime? screenTime;

  /// Exact daily screen time from the ruler (minutes); [screenTime] is its range.
  int? screenMinutes;

  /// Minutes measured on the phone today (only when usage access was already on).
  int? measuredMinutes;
  String name = '';

  // Starter plan (stage 8) — suggestions until applied.
  bool planEdited = false;
  int focusMinutes = 25;
  int dailyFocusGoal = 60;
  bool limitOn = true;
  String? limitAppId;
  int limitMinutes = 30;
  bool windDownOn = false;
  int windStart = 22 * 60;
  int windEnd = 7 * 60;

  void load() {
    final raw = LocalStore.instance.getRaw(_key);
    if (raw == null) return;
    try {
      final j = jsonDecode(raw) as Map<String, dynamic>;
      stage = j['stage'] as int? ?? 0;
      relate = _enum(ObRelate.values, j['relate']);
      goal = _enum(ObGoal.values, j['goal']);
      goalOther = j['goalOther'] as String? ?? '';
      apps = [for (final a in (j['apps'] as List? ?? const [])) ObApp.fromJson(Map<String, dynamic>.from(a as Map))];
      appsDefaulted = j['appsDefaulted'] as bool? ?? false;
      screenTime = _enum(ObScreenTime.values, j['screenTime']);
      screenMinutes = j['screenMinutes'] as int?;
      measuredMinutes = j['measured'] as int?;
      name = j['name'] as String? ?? '';
      final p = Map<String, dynamic>.from(j['plan'] as Map? ?? const {});
      planEdited = p['edited'] as bool? ?? false;
      focusMinutes = p['focus'] as int? ?? 25;
      dailyFocusGoal = p['daily'] as int? ?? 60;
      limitOn = p['limitOn'] as bool? ?? true;
      limitAppId = p['limitApp'] as String?;
      limitMinutes = p['limitMin'] as int? ?? 30;
      windDownOn = p['windOn'] as bool? ?? false;
      windStart = p['windStart'] as int? ?? 22 * 60;
      windEnd = p['windEnd'] as int? ?? 7 * 60;
    } catch (e) {
      debugPrint('OnboardingState: bad saved data, starting over: $e');
    }
  }

  static T? _enum<T extends Enum>(List<T> values, Object? name) {
    for (final v in values) {
      if (v.name == name) return v;
    }
    return null;
  }

  /// Each question starts with its first answer selected (the user can change it).
  void selectDefaults() {
    if (relate != null && goal != null && screenTime != null) return;
    relate ??= ObRelate.sometimes;
    goal ??= ObGoal.values.first;
    if (screenTime == null) setScreenMinutes(screenMinutes ?? 180);
    _save();
  }

  /// Range for an exact daily screen time.
  ObScreenTime bucketFor(int minutes) => minutes < 120
      ? ObScreenTime.under2
      : minutes < 240
          ? ObScreenTime.h2to4
          : minutes < 360
              ? ObScreenTime.h4to6
              : ObScreenTime.over6;

  void setScreenMinutes(int minutes) {
    screenMinutes = minutes;
    screenTime = bucketFor(minutes);
  }

  /// Hours a day on the phone: measured, else the ruler, else the middle of the range.
  double get dailyHours {
    final m = measuredMinutes ?? screenMinutes;
    if (m != null && screenTime != ObScreenTime.notSure) return m / 60;
    return switch (screenTime) {
      ObScreenTime.under2 => 1.5,
      ObScreenTime.h2to4 => 3,
      ObScreenTime.h4to6 => 5,
      ObScreenTime.over6 => 7,
      _ => 3.5,
    };
  }

  /// Change something and save.
  void update(void Function(OnboardingState s) change) {
    change(this);
    notifyListeners();
    _save();
  }

  Future<void> _save() => LocalStore.instance.setRaw(
        _key,
        jsonEncode({
          'stage': stage,
          'relate': relate?.name,
          'goal': goal?.name,
          'goalOther': goalOther,
          'apps': [for (final a in apps) a.toJson()],
          'appsDefaulted': appsDefaulted,
          'screenTime': screenTime?.name,
          'screenMinutes': screenMinutes,
          'measured': measuredMinutes,
          'name': name,
          'plan': {
            'edited': planEdited,
            'focus': focusMinutes,
            'daily': dailyFocusGoal,
            'limitOn': limitOn,
            'limitApp': limitAppId,
            'limitMin': limitMinutes,
            'windOn': windDownOn,
            'windStart': windStart,
            'windEnd': windEnd,
          },
        }),
      );

  /// The daily app limit the starter plan uses (or will suggest from the answers).
  int get planLimitMinutes => planEdited ? limitMinutes : _suggestedLimit;
  int get _suggestedLimit => switch (screenTime) { ObScreenTime.over6 || ObScreenTime.h4to6 => 60, _ => 30 };

  /// Fills the starter plan from the answers, unless the user already edited it.
  void suggestPlan() {
    if (planEdited) return;
    update((s) {
      s.focusMinutes = 25;
      s.dailyFocusGoal = switch (goal) { ObGoal.focus => 120, ObGoal.habits || ObGoal.me => 45, _ => 60 };
      s.limitOn = apps.isNotEmpty;
      s.limitAppId = apps.isEmpty ? null : apps.first.id;
      s.limitMinutes = _suggestedLimit;
      s.windDownOn = goal == ObGoal.sleep;
    });
  }

  ObApp? get limitApp {
    for (final a in apps) {
      if (a.id == limitAppId) return a;
    }
    return null;
  }

  /// Turns the accepted plan into real settings. Gentle by design: picked apps are
  /// only restricted during the wind-down window, Focus sessions, or their own limit.
  Future<void> applyPlan() async {
    final repo = AppRepo.instance;
    await repo.applyStarterPlan(
      apps: [
        for (final a in apps)
          ManagedApp(
            id: a.id,
            name: a.label,
            category: AppRepo.catalog[a.id] ?? 'other',
            locked: true,
            scheduled: true,
            packageName: a.packageName,
          ),
      ],
      windDownOn: windDownOn,
      windStart: windStart,
      windEnd: windEnd,
      focusMinutes: focusMinutes,
      dailyFocusGoalMinutes: dailyFocusGoal,
    );
    final la = limitApp;
    final pkg = la?.packageName;
    if (limitOn && pkg != null) {
      await RestrictionRepo.instance.updateConfig(pkg, (c) {
        c.enabled = true;
        c.dailyLimitEnabled = true;
        c.dailyLimitMinutes = limitMinutes;
      });
    }
  }

  /// Clears the saved progress (after finishing, or "replay onboarding").
  Future<void> reset() async {
    stage = 0;
    relate = null;
    goal = null;
    goalOther = '';
    apps = [];
    appsDefaulted = false;
    screenTime = null;
    screenMinutes = null;
    measuredMinutes = null;
    name = '';
    planEdited = false;
    notifyListeners();
    await LocalStore.instance.removeRaw(_key);
  }
}
