import 'package:flutter/material.dart';

import '../../../data/models.dart';
import '../../../services/installed_apps.dart';
import '../../../services/native_bridge.dart';
import '../../../utils/app_theme.dart';
import '../../../utils/l10n.dart';
import '../../../widgets/ui_kit.dart';
import '../onboarding_state.dart';
import '../widgets/ob_art.dart';
import '../widgets/ob_kit.dart';
import '../widgets/ob_text_motion.dart';

OnboardingState get _s => OnboardingState.instance;

/// Same order on every question: illustration → title → subtitle → answers
/// (rising in one by one) → Pausey's reply.
const _answersDelay = Duration(milliseconds: 500);
const _replyDelay = Duration(milliseconds: 900);

Widget _head(ObArtKind art, String title, String sub) => Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      ObArt(art),
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
            _head(ObArtKind.relate, l.cvRelateTitle, l.cvRelateSub),
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
// Stage 4 — Apps that pull you in
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

  @override
  State<AppsStage> createState() => _AppsStageState();
}

class _AppsStageState extends State<AppsStage> {
  InstalledAppsCache get _cache => InstalledAppsCache.instance;
  String _query = '';

  /// After the entrance, rows that appear from the search show at once (no delay).
  bool _entered = false;

  @override
  void initState() {
    super.initState();
    _cache.ensureLoaded();
    Future.delayed(const Duration(milliseconds: 1500), () {
      if (mounted) setState(() => _entered = true);
    });
  }

  /// Installed app → stable id (catalogue name when it's a known app, so Home shows its icon).
  ObApp _fromInstalled(InstalledApp a) {
    final name = ManagedApp.knownPackages.entries.where((e) => e.value == a.packageName).map((e) => e.key).firstOrNull;
    return ObApp(id: name ?? a.packageName, label: name ?? a.label, packageName: a.packageName);
  }

  void _toggle(ObApp a) => _s.update((s) {
        final list = [...s.apps];
        if (!list.remove(a)) list.add(a);
        s.apps = list;
      });

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final c = context.colors;
    return ListenableBuilder(
      listenable: Listenable.merge([_s, _cache]),
      builder: (context, _) {
        // On a phone only its installed apps are offered; never a made-up list.
        final android = _cache.supported;
        final installed = _cache.apps;
        final real = android && _cache.loaded;
        final loading = android && !_cache.loaded && !_cache.failed;
        final failed = android && !_cache.loaded && _cache.failed && !_cache.loading;
        final List<(ObApp, Widget)> all;
        if (real) {
          final known = ManagedApp.knownPackages.values.toSet();
          final sorted = [...installed]..sort((a, b) {
              final ka = known.contains(a.packageName) ? 0 : 1, kb = known.contains(b.packageName) ? 0 : 1;
              return ka != kb ? ka - kb : a.label.toLowerCase().compareTo(b.label.toLowerCase());
            });
          all = [
            for (final a in sorted)
              (
                _fromInstalled(a),
                a.icon == null ? AppGlyph(a.packageName, size: 36) : ClipRRect(borderRadius: BorderRadius.circular(9), child: Image.memory(a.icon!, width: 36, height: 36, gaplessPlayback: true)),
              ),
          ];
        } else if (android) {
          all = const [];
        } else {
          all = [
            for (final name in const ['Instagram', 'TikTok', 'YouTube', 'Facebook', 'Twitter / X', 'Snapchat', 'Reddit', 'Netflix', 'WhatsApp'])
              (ObApp(id: name, label: name, packageName: ManagedApp.knownPackages[name]), AppGlyph(name, size: 36)),
          ];
        }
        final q = _query.toLowerCase();
        final rows = q.isEmpty ? all : [for (final r in all) if (r.$1.label.toLowerCase().contains(q)) r];
        final picked = _s.apps;
        // One app is pre-selected the first time the list shows (the user can change it).
        if (!_s.appsDefaulted && all.isNotEmpty) {
          final first = all.first.$1;
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (_s.appsDefaulted) return;
            _s.update((s) {
              s.appsDefaulted = true;
              if (s.apps.isEmpty) s.apps = [first];
            });
          });
        }
        return ObPage(
          center: true,
          primaryLabel: picked.isEmpty ? l.cvSkipForNow : l.cvNext,
          onPrimary: widget.onNext,
          children: [
            _head(ObArtKind.apps, l.cvAppsTitle, android ? l.cvAppsSubReal : l.cvAppsSubPopular),
            if (real)
              Padding(
                padding: const EdgeInsets.only(bottom: 14),
                child: TextField(
                  onChanged: (v) => setState(() => _query = v.trim()),
                  style: AppText.rowTitle.copyWith(color: c.textPrimary),
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search_rounded, color: c.textMuted),
                    hintText: l.cvAppsSearch,
                    filled: true,
                    fillColor: context.isDark ? c.glassFill : Colors.white,
                    contentPadding: const EdgeInsets.symmetric(vertical: 12),
                    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(AppRadius.chip), borderSide: BorderSide(color: c.glassBorder)),
                    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(AppRadius.chip), borderSide: const BorderSide(color: AppPalette.accent)),
                  ),
                ),
              ),
            if (loading || _cache.loading && !real)
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
            else
              for (final (i, (app, icon)) in rows.indexed)
                ObFadeUp(
                  key: ValueKey(app.id),
                  delay: _entered ? Duration.zero : _answersDelay,
                  index: _entered ? 0 : (i < 8 ? i : 8),
                  child: ObAnswer(multi: true, leading: icon, label: app.label, selected: picked.contains(app), onTap: () => _toggle(app)),
                ),
            ObFadeUp(delay: _replyDelay, child: ObReply(picked.isEmpty ? null : l.cvAppsReply(appsList(l, picked)))),
          ],
        );
      },
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
            _head(ObArtKind.screentime, l.cvStTitle, l.cvStSub),
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
