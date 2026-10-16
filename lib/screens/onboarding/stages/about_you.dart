import 'package:flutter/material.dart';

import '../../../data/models.dart';
import '../../../services/installed_apps.dart';
import '../../../services/native_bridge.dart';
import '../../../utils/app_theme.dart';
import '../../../utils/l10n.dart';
import '../../../widgets/ui_kit.dart';
import '../onboarding_state.dart';
import '../widgets/ob_clean_kit.dart';
import '../widgets/ob_kit.dart';
import '../widgets/ob_relate_goal.dart';
import '../widgets/ob_text_motion.dart';
import '../widgets/ob_time_life.dart';

OnboardingState get _s => OnboardingState.instance;

/// Same calm order on every question: title → subtitle → one interactive
/// centrepiece → a single line from Pausey. Nothing else on the screen.
const _centreDelay = Duration(milliseconds: 500);
const _captionDelay = Duration(milliseconds: 900);

/// Pausey's short answer under the centrepiece; cross-fades when it changes.
class _Caption extends StatelessWidget {
  const _Caption(this.text);
  final String? text;

  @override
  Widget build(BuildContext context) {
    final t = text;
    return ObFadeUp(
      delay: _captionDelay,
      child: AnimatedSwitcher(
        duration: ObMotion.of(context, ObMotion.content),
        // The old line leaves quickly so two lines never sit on top of each other.
        reverseDuration: ObMotion.of(context, const Duration(milliseconds: 120)),
        transitionBuilder: (child, a) => FadeTransition(
          opacity: a,
          child: SlideTransition(position: Tween(begin: const Offset(0, 0.2), end: Offset.zero).animate(a), child: child),
        ),
        child: t == null
            ? const SizedBox(key: ValueKey('none'), height: 20, width: double.infinity)
            : Semantics(
                liveRegion: true,
                key: ValueKey(t),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Text(t, textAlign: TextAlign.center, style: AppText.rowTitle.copyWith(fontWeight: FontWeight.w500, height: 1.45, color: context.colors.textSecondary)),
                ),
              ),
      ),
    );
  }
}

Widget _head(String title, String sub) => Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      ObTitle(title, align: TextAlign.center),
      ObFadeUp(delay: const Duration(milliseconds: 420), child: ObSubtitle(sub, align: TextAlign.center)),
    ]);

// -----------------------------------------------------------------------------
// Stage 2 — "Lose track of time?": drag the slider, the orb speeds up
// -----------------------------------------------------------------------------

class RelateStage extends StatelessWidget {
  const RelateStage({super.key, required this.onNext});
  final VoidCallback onNext;

  static const _order = [ObRelate.rarely, ObRelate.sometimes, ObRelate.often];

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
            _head(l.cvRelateTitle, l.cvRelateSub),
            const SizedBox(height: 18),
            ObFadeUp(
              delay: _centreDelay,
              child: RelateDial(
                value: _order.indexOf(r ?? ObRelate.sometimes),
                labels: [l.cvRelateRarely, l.cvRelateSometimes, l.cvRelateOften],
                onChanged: (i) => _s.update((s) => s.relate = _order[i]),
              ),
            ),
            _Caption(reply),
          ],
        );
      },
    );
  }
}

// -----------------------------------------------------------------------------
// Stage 3 — Goal: tap a floating bubble
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
        final sel = g == null ? null : options.indexWhere((o) => o.$1 == g);
        return ObPage(
          center: true,
          primaryLabel: l.cvNext,
          onPrimary: g == null ? null : widget.onNext,
          children: [
            _head(l.cvGoalTitle, l.cvGoalSub),
            const SizedBox(height: 14),
            ObFadeUp(
              delay: _centreDelay,
              child: BubblePicker(
                options: [for (final o in options) BubbleOption(icon: o.$2, label: o.$3)],
                selected: sel,
                onSelect: (i) => _s.update((s) => s.goal = options[i].$1),
              ),
            ),
            AnimatedSize(
              duration: ObMotion.of(context, ObMotion.content),
              child: g == ObGoal.other
                  ? Padding(
                      padding: const EdgeInsets.only(top: 8, bottom: 10),
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
            _Caption(g == null ? null : goalReply(l, g)),
          ],
        );
      },
    );
  }
}

// -----------------------------------------------------------------------------
// Stage 4 — Apps: tap icons, they fly into the lock tray
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

  @override
  void initState() {
    super.initState();
    _cache.ensureLoaded();
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
                a.icon == null ? AppGlyph(a.packageName, size: 48) : Image.memory(a.icon!, width: 48, height: 48, gaplessPlayback: true),
              ),
          ];
        } else if (android) {
          all = const [];
        } else {
          all = [
            for (final name in const ['Instagram', 'TikTok', 'YouTube', 'Facebook', 'Twitter / X', 'Snapchat', 'Reddit', 'Netflix', 'WhatsApp'])
              (ObApp(id: name, label: name, packageName: ManagedApp.knownPackages[name]), AppGlyph(name, size: 48)),
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
        final byId = {for (final r in all) r.$1.id: r.$1};
        return ObPage(
          center: true,
          primaryLabel: picked.isEmpty ? l.cvSkipForNow : l.cvNext,
          onPrimary: widget.onNext,
          children: [
            _head(l.cvAppsTitle, android ? l.cvAppsSubReal : l.cvAppsSubPopular),
            const SizedBox(height: 18),
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
              ObFadeUp(
                delay: _centreDelay,
                child: AppPickGrid(
                  apps: [for (final (app, icon) in rows) AppPick(id: app.id, label: app.label, icon: icon)],
                  selected: {for (final a in picked) a.id},
                  trayLabel: picked.isEmpty ? l.cvAppsTrayEmpty : l.cvAppsTray(picked.length),
                  onToggle: (id) {
                    final app = byId[id];
                    if (app != null) _toggle(app);
                  },
                ),
              ),
          ],
        );
      },
    );
  }
}

// -----------------------------------------------------------------------------
// Stage 5 — Daily screen time: drag the ruler (or "Not sure")
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
    final c = context.colors;
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
        final notSure = v == ObScreenTime.notSure;
        return ObPage(
          center: true,
          primaryLabel: v == null ? l.cvSkipForNow : l.cvNext,
          onPrimary: widget.onNext,
          children: [
            _head(l.cvStTitle, measured != null ? l.cvStMeasured(fmtMinutes(measured, h: l.unitH, m: l.unitM)) : l.cvStSub),
            const SizedBox(height: 22),
            ObFadeUp(
              delay: _centreDelay,
              child: AnimatedOpacity(
                opacity: notSure ? 0.45 : 1,
                duration: ObMotion.of(context, ObMotion.content),
                child: TimeRuler(
                  minutes: _s.screenMinutes ?? 180,
                  semanticsLabel: l.cvStTitle,
                  format: (m) => fmtMinutes(m, h: l.unitH, m: l.unitM),
                  onChanged: (m) => _s.update((s) => s.setScreenMinutes(m)),
                ),
              ),
            ),
            ObFadeUp(
              delay: _centreDelay,
              child: Center(
                child: TextButton.icon(
                  onPressed: () => _s.update((s) => s.screenTime = notSure ? s.bucketFor(s.screenMinutes ?? 180) : ObScreenTime.notSure),
                  icon: Icon(notSure ? Icons.check_circle_rounded : Icons.help_outline_rounded, size: 18, color: notSure ? AppPalette.accent : c.textMuted),
                  label: Text(l.cvStNotSure, style: AppText.label.copyWith(color: notSure ? AppPalette.accent : c.textSecondary)),
                  style: TextButton.styleFrom(minimumSize: const Size(48, 44)),
                ),
              ),
            ),
            const SizedBox(height: 6),
            _Caption(reply),
          ],
        );
      },
    );
  }
}
