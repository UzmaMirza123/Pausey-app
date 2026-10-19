import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../data/models.dart';
import '../../../data/restrictions/restriction_repo.dart';
import '../../../services/installed_apps.dart';
import '../../../services/native_bridge.dart';
import '../../../utils/app_theme.dart';
import '../../../utils/l10n.dart';
import '../../../widgets/ui_kit.dart';
import '../onboarding_state.dart';
import '../widgets/ob_apps_orbit.dart';
import '../widgets/ob_art.dart';
import '../widgets/ob_clock_hero.dart';
import '../widgets/ob_hourglass_hero.dart';
import '../widgets/ob_kit.dart';
import '../widgets/ob_text_motion.dart';

OnboardingState get _s => OnboardingState.instance;

/// Same order on every question: illustration → title → subtitle → answers
/// (rising in one by one) → Pausey's reply.
const _answersDelay = Duration(milliseconds: 500);
const _replyDelay = Duration(milliseconds: 900);

Widget _head(ObArtKind art, String title, String sub) => _headWith(ObArt(art), title, sub);

Widget _headWith(Widget art, String title, String sub) => Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      art,
      const SizedBox(height: 10),
      ObTitle(title, align: TextAlign.center),
      ObFadeUp(delay: const Duration(milliseconds: 400), child: ObSubtitle(sub, align: TextAlign.center)),
      const SizedBox(height: 18),
    ]);

/// Answers rise in one after another, after the title.
Widget _answer(int i, Widget child) => ObFadeUp(delay: _answersDelay, index: i, child: child);

// -----------------------------------------------------------------------------
// Stage 2 — "Lose track of time?"
// -----------------------------------------------------------------------------

class RelateStage extends StatelessWidget {
  const RelateStage({super.key, required this.onNext});
  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    return ListenableBuilder(
      listenable: _s,
      builder: (context, _) {
        final r = _s.relate;
        final reply = switch (r) {
          ObRelate.often => l.cvRelateReplyOften,
          ObRelate.sometimes => l.cvRelateReplySometimes,
          ObRelate.rarely => l.cvRelateReplyRarely,
          null => null,
        };
        return ObPage(
          center: true,
          primaryLabel: r == ObRelate.rarely ? l.cvNext : l.cvRelateCta,
          onPrimary: r == null ? null : onNext,
          children: [
            _headWith(ObClockHero(answer: r), l.cvRelateTitle, l.cvRelateSub),
            for (final (i, (v, label)) in [
              (ObRelate.often, l.cvRelateOften),
              (ObRelate.sometimes, l.cvRelateSometimes),
              (ObRelate.rarely, l.cvRelateRarely),
            ].indexed)
              _answer(i, ObAnswer(label: label, selected: r == v, onTap: () => _s.update((s) => s.relate = v))),
            ObFadeUp(delay: _replyDelay, child: ObReply(reply)),
          ],
        );
      },
    );
  }
}

// -----------------------------------------------------------------------------
// Stage 3 — Goal
// -----------------------------------------------------------------------------

String goalReply(AppLocalizations l, ObGoal g) => switch (g) {
      ObGoal.focus => l.cvGoalReplyFocus,
      ObGoal.sleep => l.cvGoalReplySleep,
      ObGoal.scrolling => l.cvGoalReplyScrolling,
      ObGoal.me => l.cvGoalReplyMe,
      ObGoal.habits => l.cvGoalReplyHabits,
      ObGoal.other => l.cvGoalReplyOther,
    };

class GoalStage extends StatefulWidget {
  const GoalStage({super.key, required this.onNext});
  final VoidCallback onNext;

  @override
  State<GoalStage> createState() => _GoalStageState();
}

class _GoalStageState extends State<GoalStage> {
  late final _other = TextEditingController(text: _s.goalOther);

  @override
  void dispose() {
    _other.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final c = context.colors;
    return ListenableBuilder(
      listenable: _s,
      builder: (context, _) {
        final g = _s.goal;
        final options = [
          (ObGoal.focus, Icons.center_focus_strong_rounded, l.cvGoalFocus),
          (ObGoal.sleep, Icons.bedtime_rounded, l.cvGoalSleep),
          (ObGoal.scrolling, Icons.swipe_vertical_rounded, l.cvGoalScrolling),
          (ObGoal.me, Icons.self_improvement_rounded, l.cvGoalMe),
          (ObGoal.habits, Icons.eco_rounded, l.cvGoalHabits),
          (ObGoal.other, Icons.edit_rounded, l.cvGoalOther),
        ];
        return ObPage(
          center: true,
          primaryLabel: l.cvNext,
          onPrimary: g == null ? null : widget.onNext,
          children: [
            _head(ObArtKind.goal, l.cvGoalTitle, l.cvGoalSub),
            for (final (i, (v, icon, label)) in options.indexed)
              _answer(i, ObAnswer(icon: icon, label: label, selected: g == v, onTap: () => _s.update((s) => s.goal = v))),
            AnimatedSize(
              duration: ObMotion.of(context, ObMotion.content),
              child: g == ObGoal.other
                  ? Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: TextField(
                        controller: _other,
                        autofocus: _s.goalOther.isEmpty,
                        maxLength: 40,
                        textCapitalization: TextCapitalization.sentences,
                        onChanged: (v) => _s.update((s) => s.goalOther = v.trim()),
                        style: AppText.rowTitle.copyWith(color: c.textPrimary),
                        decoration: InputDecoration(
                          counterText: '',
                          hintText: l.cvGoalOtherHint,
                          filled: true,
                          fillColor: context.isDark ? c.glassFill : Colors.white,
                          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(AppRadius.tile), borderSide: BorderSide(color: c.glassBorder)),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(AppRadius.tile),
                            borderSide: const BorderSide(color: AppPalette.accent, width: 1.5),
                          ),
                        ),
                      ),
                    )
                  : const SizedBox(width: double.infinity),
            ),
            ObFadeUp(delay: _replyDelay, child: ObReply(g == null ? null : goalReply(l, g))),
          ],
        );
      },
    );
  }
}

// -----------------------------------------------------------------------------
// Stage 4 — Apps: the ones this phone uses most, all to be paused; ✕ removes one
// -----------------------------------------------------------------------------

String appsList(AppLocalizations l, List<ObApp> apps) {
  if (apps.isEmpty) return '';
  if (apps.length == 1) return apps.first.label;
  if (apps.length == 2) return l.cvAnd(apps[0].label, apps[1].label);
  return l.cvAndMore(apps[0].label, apps[1].label, apps.length - 2);
}

class AppsStage extends StatefulWidget {
  const AppsStage({super.key, required this.onNext});
  final VoidCallback onNext;

  /// How many apps are offered at most.
  static const maxApps = 8;

  @override
  State<AppsStage> createState() => _AppsStageState();
}

class _AppsStageState extends State<AppsStage> {
  InstalledAppsCache get _cache => InstalledAppsCache.instance;
  RestrictionRepo get _repo => RestrictionRepo.instance;

  /// Today's minutes per package (null = no usage access / not Android).
  Map<String, int>? _usage;
  bool _usageLoaded = false;

  @override
  void initState() {
    super.initState();
    _cache.ensureLoaded();
    _repo.addListener(_onStatus);
    _loadUsage();
  }

  @override
  void dispose() {
    _repo.removeListener(_onStatus);
    super.dispose();
  }

  /// Coming back from Android settings with usage access now on: read usage again.
  void _onStatus() {
    if (_repo.status.usageAccess && _usage == null) _loadUsage();
  }

  Future<void> _loadUsage() async {
    final m = await NativeBridge.instance.usageToday(const []);
    if (!mounted) return;
    setState(() {
      _usage = m;
      _usageLoaded = true;
    });
  }

  /// Installed app → stable id (catalogue name when it's a known app, so Home shows its icon).
  ObApp _fromInstalled(InstalledApp a) {
    final name = ManagedApp.knownPackages.entries.where((e) => e.value == a.packageName).map((e) => e.key).firstOrNull;
    return ObApp(id: name ?? a.packageName, label: name ?? a.label, packageName: a.packageName);
  }

  /// The apps to pause: most used today first, then well-known distracting apps on this phone.
  List<ObApp> _candidates() {
    if (!_cache.supported) {
      return [
        for (final name in const ['Instagram', 'TikTok', 'YouTube', 'Facebook', 'Snapchat'])
          ObApp(id: name, label: name, packageName: ManagedApp.knownPackages[name]),
      ];
    }
    final usage = _usage ?? const <String, int>{};
    final known = ManagedApp.knownPackages.values.toSet();
    final apps = [
      for (final a in _cache.apps)
        if (a.packageName != 'com.pausey.pausey' && (usage.containsKey(a.packageName) || known.contains(a.packageName))) a,
    ]..sort((a, b) {
        final ua = usage[a.packageName] ?? -1, ub = usage[b.packageName] ?? -1;
        if (ua != ub) return ub.compareTo(ua);
        final ka = known.contains(a.packageName) ? 0 : 1, kb = known.contains(b.packageName) ? 0 : 1;
        return ka != kb ? ka - kb : a.label.toLowerCase().compareTo(b.label.toLowerCase());
      });
    return [for (final a in apps.take(AppsStage.maxApps)) _fromInstalled(a)];
  }

  void _remove(ObApp a) => _s.update((s) => s.apps = [...s.apps]..remove(a));

  String? _usageLine(AppLocalizations l, ObApp a) {
    if (_usage == null) return null;
    final m = _usage![a.packageName];
    if (m == null) return l.cvUsageNone;
    if (m < 1) return l.cvUsageUnder1;
    return l.cvUsageToday(fmtMinutes(m, h: l.unitH, m: l.unitM));
  }

  Widget _icon(ObApp a) {
    final bytes = a.packageName == null ? null : _cache.iconFor(a.packageName!);
    return bytes != null
        ? ClipRRect(borderRadius: BorderRadius.circular(11), child: Image.memory(bytes, width: 44, height: 44, gaplessPlayback: true))
        : AppGlyph(a.id, size: 44);
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final c = context.colors;
    return ListenableBuilder(
      listenable: Listenable.merge([_s, _cache, _repo]),
      builder: (context, _) {
        final android = _cache.supported;
        final ready = !android || (_cache.loaded && _usageLoaded);
        final failed = android && !_cache.loaded && _cache.failed && !_cache.loading;
        final needsAccess = android && _usageLoaded && _usage == null;
        // Fill the list once (and once more if usage access arrives later).
        if (ready && (!_s.appsDefaulted || (!_s.appsFromUsage && _usage != null && android))) {
          final fromUsage = _usage != null;
          final list = _candidates();
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (!mounted || (_s.appsDefaulted && (_s.appsFromUsage || !fromUsage))) return;
            _s.update((s) {
              s.appsDefaulted = true;
              s.appsFromUsage = fromUsage;
              s.apps = list;
            });
          });
        }
        final picked = _s.apps;
        return ObPage(
          center: true,
          primaryLabel: picked.isEmpty ? l.cvSkipForNow : l.cvNext,
          onPrimary: widget.onNext,
          children: [
            _headWith(ObAppsOrbit(lockedCount: picked.length), l.cvAppsTitle, android ? l.cvAppsSubReal : l.cvAppsSubPopular),
            if (needsAccess)
              ObFadeUp(
                delay: _answersDelay,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 14),
                  child: PCard(
                    child: Row(children: [
                      const Icon(Icons.hourglass_bottom_rounded, color: AppPalette.accent),
                      const SizedBox(width: 12),
                      Expanded(child: Text(l.cvAppsUsageNeeded, style: AppText.rowSub.copyWith(height: 1.4, color: c.textSecondary))),
                      const SizedBox(width: 8),
                      FilledButton(
                        onPressed: NativeBridge.instance.openUsageAccessSettings,
                        style: FilledButton.styleFrom(backgroundColor: AppPalette.accent, shape: const StadiumBorder(), minimumSize: const Size(72, 40)),
                        child: Text(l.alAllow),
                      ),
                    ]),
                  ),
                ),
              ),
            if (!ready && !failed)
              const Padding(padding: EdgeInsets.all(24), child: Center(child: CircularProgressIndicator(strokeWidth: 2.5)))
            else if (failed)
              PCard(
                child: Column(children: [
                  Text(l.cvAppsLoadFailed, textAlign: TextAlign.center, style: AppText.rowTitle.copyWith(color: c.textPrimary)),
                  const SizedBox(height: 12),
                  OutlinedButton(
                    onPressed: () => _cache.ensureLoaded(force: true),
                    style: OutlinedButton.styleFrom(minimumSize: const Size(120, 44), shape: const StadiumBorder(), foregroundColor: AppPalette.accent),
                    child: Text(l.cvTryAgain),
                  ),
                ]),
              )
            else ...[
              ObFadeUp(
                delay: _answersDelay,
                child: Container(
                  decoration: BoxDecoration(
                    color: context.isDark ? c.glassFill : Colors.white,
                    borderRadius: BorderRadius.circular(AppRadius.card),
                    border: Border.all(color: c.glassBorder),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  child: Column(children: [
                    for (final (i, a) in picked.indexed)
                      _BlockRow(
                        key: ValueKey(a.id),
                        icon: _icon(a),
                        title: a.label,
                        subtitle: _usageLine(l, a),
                        removeLabel: l.cvRemoveApp(a.label),
                        divider: i < picked.length - 1,
                        onRemove: () => _remove(a),
                      ),
                  ]),
                ),
              ),
              const SizedBox(height: 14),
              ObFadeUp(
                delay: _replyDelay,
                child: Text(l.cvAppsSelected(picked.length), textAlign: TextAlign.center, style: AppText.rowTitle.copyWith(fontWeight: FontWeight.w500, color: c.textSecondary)),
              ),
            ],
          ],
        );
      },
    );
  }
}

/// One app that will be paused: icon, name, today's use and a ✕ to leave it out.
/// The row folds away smoothly when removed.
class _BlockRow extends StatefulWidget {
  const _BlockRow({super.key, required this.icon, required this.title, required this.subtitle, required this.removeLabel, required this.divider, required this.onRemove});
  final Widget icon;
  final String title;
  final String? subtitle;
  final String removeLabel;
  final bool divider;
  final VoidCallback onRemove;

  @override
  State<_BlockRow> createState() => _BlockRowState();
}

class _BlockRowState extends State<_BlockRow> {
  bool _gone = false;

  void _tap() {
    if (_gone) return;
    HapticFeedback.selectionClick();
    final d = ObMotion.of(context, const Duration(milliseconds: 260));
    setState(() => _gone = true);
    Future.delayed(d, () {
      if (mounted) widget.onRemove();
    });
  }

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final d = ObMotion.of(context, const Duration(milliseconds: 260));
    return AnimatedSize(
      duration: d,
      curve: Curves.easeInOutCubic,
      child: _gone
          ? const SizedBox(width: double.infinity)
          : AnimatedOpacity(
              opacity: _gone ? 0 : 1,
              duration: d,
              child: Container(
                decoration: BoxDecoration(border: widget.divider ? Border(bottom: BorderSide(color: c.divider)) : null),
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Row(children: [
                  widget.icon,
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisSize: MainAxisSize.min, children: [
                      Text(widget.title, maxLines: 1, overflow: TextOverflow.ellipsis, style: AppText.rowTitle.copyWith(fontWeight: FontWeight.w700, color: c.textPrimary)),
                      if (widget.subtitle != null) ...[
                        const SizedBox(height: 2),
                        Text(widget.subtitle!, style: AppText.rowSub.copyWith(color: c.textMuted)),
                      ],
                    ]),
                  ),
                  const SizedBox(width: 8),
                  Semantics(
                    button: true,
                    label: widget.removeLabel,
                    excludeSemantics: true,
                    child: Material(
                      color: context.isDark ? Colors.white.withValues(alpha: 0.08) : const Color(0xFFF1EFFA),
                      shape: const CircleBorder(),
                      child: InkWell(
                        customBorder: const CircleBorder(),
                        onTap: _tap,
                        child: SizedBox.square(dimension: 40, child: Icon(Icons.close_rounded, size: 20, color: c.textPrimary)),
                      ),
                    ),
                  ),
                ]),
              ),
            ),
    );
  }
}

// -----------------------------------------------------------------------------
// Stage 5 — Daily screen time (estimate, or measured when usage access is on)
// -----------------------------------------------------------------------------

class ScreenTimeStage extends StatefulWidget {
  const ScreenTimeStage({super.key, required this.onNext});
  final VoidCallback onNext;

  @override
  State<ScreenTimeStage> createState() => _ScreenTimeStageState();
}

class _ScreenTimeStageState extends State<ScreenTimeStage> {
  @override
  void initState() {
    super.initState();
    _measure();
  }

  /// Only when the user already allowed usage access: today's real total so far.
  Future<void> _measure() async {
    final st = await NativeBridge.instance.status();
    if (!st.usageAccess) return;
    final m = await NativeBridge.instance.usageToday(const []);
    if (m == null || !mounted) return;
    final total = m.entries.where((e) => !e.key.contains('launcher') && !e.key.contains('systemui') && e.key != 'android').fold(0, (a, e) => a + e.value);
    _s.update((s) => s.measuredMinutes = total);
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    return ListenableBuilder(
      listenable: _s,
      builder: (context, _) {
        final v = _s.screenTime;
        final reply = switch (v) {
          ObScreenTime.under2 => l.cvStReplyUnder2,
          ObScreenTime.h2to4 => l.cvStReply2to4,
          ObScreenTime.h4to6 => l.cvStReply4to6,
          ObScreenTime.over6 => l.cvStReplyOver6,
          ObScreenTime.notSure => l.cvStReplyNotSure,
          null => null,
        };
        final measured = _s.measuredMinutes;
        return ObPage(
          center: true,
          primaryLabel: v == null ? l.cvSkipForNow : l.cvNext,
          onPrimary: widget.onNext,
          children: [
            _headWith(const ObHourglassHero(), l.cvStTitle, l.cvStSub),
            if (measured != null)
              ObFadeUp(
                delay: _answersDelay,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: PCard(
                    child: Row(children: [
                      const Icon(Icons.phone_android_rounded, color: AppPalette.accent),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(l.cvStMeasured(fmtMinutes(measured, h: l.unitH, m: l.unitM)), style: AppText.rowTitle.copyWith(color: context.colors.textPrimary)),
                      ),
                    ]),
                  ),
                ),
              ),
            for (final (i, (opt, label, icon)) in [
              (ObScreenTime.under2, l.cvStUnder2, Icons.hourglass_empty_rounded),
              (ObScreenTime.h2to4, l.cvSt2to4, Icons.schedule_rounded),
              (ObScreenTime.h4to6, l.cvSt4to6, Icons.access_time_filled_rounded),
              (ObScreenTime.over6, l.cvStOver6, Icons.history_toggle_off_rounded),
              (ObScreenTime.notSure, l.cvStNotSure, Icons.help_outline_rounded),
            ].indexed)
              _answer(
                i + (measured != null ? 1 : 0),
                ObAnswer(
                  icon: icon,
                  label: label,
                  selected: v == opt,
                  onTap: () => _s.update((s) {
                    s.screenTime = opt;
                    s.screenMinutes = null; // a range was picked, not an exact time
                  }),
                ),
              ),
            ObFadeUp(delay: _replyDelay, child: ObReply(reply)),
          ],
        );
      },
    );
  }
}
