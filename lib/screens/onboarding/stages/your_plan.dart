import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../../utils/app_theme.dart';
import '../../../utils/l10n.dart';
import '../../../services/installed_apps.dart';
import '../../../widgets/time_picker.dart';
import '../../../widgets/ui_kit.dart';
import '../../block/widgets/applock_ui.dart' show InstalledIcon;
import '../onboarding_state.dart';
import '../widgets/ob_kit.dart';
import '../widgets/story_phone.dart';
import 'about_you.dart' show appsList;

OnboardingState get _s => OnboardingState.instance;

String goalPhrase(AppLocalizations l, OnboardingState s) => switch (s.goal) {
      ObGoal.focus => l.cvPhraseFocus,
      ObGoal.sleep => l.cvPhraseSleep,
      ObGoal.scrolling => l.cvPhraseScrolling,
      ObGoal.me => l.cvPhraseMe,
      ObGoal.habits => l.cvPhraseHabits,
      ObGoal.other => s.goalOther.isEmpty ? l.cvPhraseOther : l.cvPhraseOtherNamed(s.goalOther),
      null => l.cvPhraseOther,
    };

String screenTimeLabel(AppLocalizations l, ObScreenTime t) => switch (t) {
      ObScreenTime.under2 => l.cvStUnder2,
      ObScreenTime.h2to4 => l.cvSt2to4,
      ObScreenTime.h4to6 => l.cvSt4to6,
      ObScreenTime.over6 => l.cvStOver6,
      ObScreenTime.notSure => l.cvStNotSure,
    };

// -----------------------------------------------------------------------------
// Stage 6 — Reflection built only from the answers
// -----------------------------------------------------------------------------

class ReflectionStage extends StatelessWidget {
  const ReflectionStage({super.key, required this.onNext});
  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final phrase = goalPhrase(l, _s);
    final headline = _s.apps.isEmpty ? l.cvReflectNoApps(phrase) : l.cvReflectApps(phrase, appsList(l, _s.apps));
    final st = _s.measuredMinutes != null
        ? l.cvReflectMeasured(fmtMinutes(_s.measuredMinutes!, h: l.unitH, m: l.unitM))
        : (_s.screenTime != null && _s.screenTime != ObScreenTime.notSure ? l.cvReflectEstimate(screenTimeLabel(l, _s.screenTime!)) : null);
    return ObPage(
      center: true,
      primaryLabel: l.cvShowMeHow,
      onPrimary: onNext,
      children: [
        ObReveal(child: ObTitle(l.cvReflectTitle)),
        ObReveal(child: ObSubtitle(headline)),
        if (st != null) ...[const SizedBox(height: 16), ObReveal(index: 1, child: Align(alignment: AlignmentDirectional.centerStart, child: ObTag(st, icon: Icons.schedule_rounded)))],
        const SizedBox(height: 22),
        ObReveal(index: 2, child: ObReply(l.cvReflectHelp)),
      ],
    );
  }
}

// -----------------------------------------------------------------------------
// Stage 7 — "How it works": a short tap-through story on a phone mockup
// -----------------------------------------------------------------------------

/// Four beats: the user opens their app without thinking → starts scrolling →
/// Pausey pauses it → and nudges before the limit runs out. Tap anywhere (or Next)
/// for the next beat; back goes to the previous beat first, then the previous stage.
class HowItHelpsStage extends StatefulWidget {
  const HowItHelpsStage({super.key, required this.onNext});
  final VoidCallback onNext;

  @override
  State<HowItHelpsStage> createState() => _HowItHelpsStageState();
}

class _HowItHelpsStageState extends State<HowItHelpsStage> {
  static const _beats = 4;
  int _beat = 0;
  ObBackGate? _gate;

  /// Set once the story hands over to the next stage (this one may still be fading out).
  bool _left = false;

  @override
  void initState() {
    super.initState();
    InstalledAppsCache.instance.ensureLoaded(); // real launcher icon (Android)
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _gate = ObFlowScope.of(context)?.backGate;
  }

  @override
  void dispose() {
    if (_gate?.handler == _stepBack) _gate?.handler = null;
    super.dispose();
  }

  void _next() {
    if (_left) return;
    if (_beat < _beats - 1) return setState(() => _beat++);
    _left = true;
    widget.onNext();
  }

  void _stepBack() => setState(() => _beat = math.max(0, _beat - 1));

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final c = context.colors;
    // Back (arrow or system gesture) steps through the beats before leaving the stage.
    if (!_left) _gate?.handler = _beat > 0 ? _stepBack : null;

    final app = _s.apps.isEmpty ? null : _s.apps.first;
    final appName = app?.label ?? l.stYourApp;
    final headlines = [l.stHow1(appName), l.stHow2, l.stHow3, l.stHow4];
    final limit = math.max(10, _s.planLimitMinutes);
    String fmt(int m) => fmtMinutes(m, h: l.unitH, m: l.unitM);

    final size = MediaQuery.sizeOf(context);
    final reduced = ObMotion.reduced(context);
    // Phone size: fits the width, and leaves room for the headline and footer on short screens.
    final byWidth = (math.min(size.width, 480) - AppSpacing.gutter * 2) * 0.76;
    final byHeight = (size.height - 420) / StoryPhone.aspect;
    final phoneW = math.max(150.0, math.min(byWidth, math.min(300.0, byHeight)));

    Widget appIcon(double s) {
      if (app == null) {
        return Container(
          width: s,
          height: s,
          decoration: BoxDecoration(shape: BoxShape.circle, color: context.isDark ? const Color(0xFF1E1A3A) : Colors.white),
          child: Icon(Icons.apps_rounded, size: s * 0.5, color: AppPalette.accent),
        );
      }
      return ListenableBuilder(
        listenable: InstalledAppsCache.instance,
        builder: (context, _) {
          final bytes = InstalledAppsCache.instance.iconFor(app.packageName);
          return bytes != null ? InstalledIcon(bytes, size: s) : AppGlyph(app.id, size: s);
        },
      );
    }

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      excludeFromSemantics: true, // the footer button does the same for screen readers
      onTap: _next,
      child: ObPage(
        center: true,
        dotsStep: _beat, // every beat is its own screen for the dots
        primaryLabel: _beat < _beats - 1 ? l.cvNext : l.cvBuildPlan,
        onPrimary: _next,
        children: [
          ObReveal(
            child: Text(l.stHowCaption, textAlign: TextAlign.center, style: AppText.rowSub.copyWith(fontWeight: FontWeight.w700, color: c.textMuted)),
          ),
          const SizedBox(height: 8),
          // All headlines are laid out (invisible) so the phone never jumps between beats.
          ObReveal(
            index: 1,
            child: Stack(alignment: Alignment.topCenter, children: [
              for (final (i, h) in headlines.indexed)
                ExcludeSemantics(
                  excluding: i != _beat,
                  child: AnimatedOpacity(
                    opacity: i == _beat ? 1 : 0,
                    duration: ObMotion.of(context, i == _beat ? const Duration(milliseconds: 420) : const Duration(milliseconds: 200)),
                    curve: Curves.easeOut,
                    child: AnimatedSlide(
                      offset: i == _beat ? Offset.zero : Offset(0, i < _beat ? -0.08 : 0.08),
                      duration: ObMotion.of(context, const Duration(milliseconds: 420)),
                      curve: Curves.easeOutCubic,
                      child: Semantics(liveRegion: i == _beat, child: ObTitle(h, align: TextAlign.center)),
                    ),
                  ),
                ),
            ]),
          ),
          const SizedBox(height: 18),
          ObReveal(
            index: 2,
            child: Center(
              child: StoryPhone(
                beat: _beat,
                width: phoneW,
                appIcon: appIcon,
                pausedTitle: l.nativeBlockTitle(app?.label ?? l.cvYourApp),
                nudgeTitle: app != null ? l.nudgeTitle(app.label) : l.stNudgeGeneric,
                nudgeText: l.nudgeText(fmt(limit - 5), fmt(limit)),
                nudgeProgress: (limit - 5) / limit,
              ),
            ),
          ),
          const SizedBox(height: 6),
          _TapHint(text: l.stTapToContinue, animate: !reduced),
        ],
      ),
    );
  }
}

/// "Tap to continue", softly pulsing.
class _TapHint extends StatefulWidget {
  const _TapHint({required this.text, required this.animate});
  final String text;
  final bool animate;

  @override
  State<_TapHint> createState() => _TapHintState();
}

class _TapHintState extends State<_TapHint> with SingleTickerProviderStateMixin {
  late final _c = AnimationController(vsync: this, duration: const Duration(milliseconds: 1800), value: 1);

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    widget.animate ? _c.repeat(reverse: true) : _c.value = 1;
  }

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => FadeTransition(
        opacity: Tween(begin: 0.45, end: 1.0).animate(CurvedAnimation(parent: _c, curve: Curves.easeInOut)),
        child: Text(widget.text, textAlign: TextAlign.center, style: AppText.rowSub.copyWith(fontWeight: FontWeight.w600, color: context.colors.textMuted)),
      );
}

// -----------------------------------------------------------------------------
// Stage 8 — Starter plan (suggested; nothing is applied yet)
// -----------------------------------------------------------------------------

class PlanStage extends StatelessWidget {
  const PlanStage({super.key, required this.onNext});
  final VoidCallback onNext;

  void _edit(void Function(OnboardingState s) f) => _s.update((s) {
        f(s);
        s.planEdited = true;
      });

  String _time(BuildContext context, int m) => MaterialLocalizations.of(context).formatTimeOfDay(TimeOfDay(hour: m ~/ 60, minute: m % 60));

  Future<void> _pick(BuildContext context, bool start) async {
    final t = await showPTimePicker(context, initial: PTime.fromMinutes(start ? _s.windStart : _s.windEnd));
    if (t == null) return;
    if ((start ? t.totalMinutes : _s.windStart) == (start ? _s.windEnd : t.totalMinutes)) return; // zero-length
    _edit((s) => start ? s.windStart = t.totalMinutes : s.windEnd = t.totalMinutes);
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final c = context.colors;
    return ListenableBuilder(
      listenable: _s,
      builder: (context, _) {
        String fmt(int m) => fmtMinutes(m, h: l.unitH, m: l.unitM);
        Widget chips(List<int> values, int current, void Function(int) set) => Wrap(spacing: 8, runSpacing: 8, children: [
              for (final v in values) ChoiceChipP(label: fmt(v), selected: v == current, onTap: () => set(v)),
            ]);
        Widget section({required IconData icon, required String title, required String sub, Widget? trailing, Widget? body, bool dim = false}) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: PCard(
                child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                  Row(children: [
                    IconBadge(icon: icon, color: Tone.violet),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Text(title, style: AppText.rowTitle.copyWith(fontWeight: FontWeight.w700, color: c.textPrimary)),
                        Text(sub, style: AppText.rowSub.copyWith(color: c.textSecondary)),
                      ]),
                    ),
                    ?trailing,
                  ]),
                  if (body != null)
                    AnimatedSize(
                      duration: ObMotion.of(context, ObMotion.content),
                      child: dim ? const SizedBox(width: double.infinity) : Padding(padding: const EdgeInsets.only(top: 14), child: body),
                    ),
                ]),
              ),
            );
        final limitApp = _s.limitApp;
        return ObPage(
          primaryLabel: l.cvUsePlan,
          onPrimary: onNext,
          children: [
            ObReveal(child: ObTitle(l.cvPlanTitle)),
            ObReveal(index: 1, child: ObSubtitle(l.cvPlanSub)),
            const SizedBox(height: 20),
            ObReveal(
              index: 2,
              child: section(
                icon: Icons.bolt_rounded,
                title: l.cvPlanFocus,
                sub: l.cvPlanFocusSub(fmt(_s.focusMinutes)),
                body: chips([15, 25, 45], _s.focusMinutes, (v) => _edit((s) => s.focusMinutes = v)),
              ),
            ),
            ObReveal(
              index: 3,
              child: section(
                icon: Icons.flag_rounded,
                title: l.cvPlanDaily,
                sub: l.cvPlanDailySub(fmt(_s.dailyFocusGoal)),
                body: chips([30, 60, 120], _s.dailyFocusGoal, (v) => _edit((s) => s.dailyFocusGoal = v)),
              ),
            ),
            if (_s.apps.isNotEmpty)
              ObReveal(
                index: 4,
                child: section(
                  icon: Icons.hourglass_bottom_rounded,
                  title: l.cvPlanLimit,
                  sub: _s.limitOn && limitApp != null ? l.cvPlanLimitSub(limitApp.label, fmt(_s.limitMinutes)) : l.cvPlanOff,
                  trailing: PSwitch(value: _s.limitOn, onChanged: (v) => _edit((s) => s.limitOn = v)),
                  dim: !_s.limitOn,
                  body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                    if (_s.apps.length > 1) ...[
                      Wrap(spacing: 8, runSpacing: 8, children: [
                        for (final a in _s.apps) ChoiceChipP(label: a.label, selected: a.id == _s.limitAppId, onTap: () => _edit((s) => s.limitAppId = a.id)),
                      ]),
                      const SizedBox(height: 12),
                    ],
                    chips([15, 30, 60], _s.limitMinutes, (v) => _edit((s) => s.limitMinutes = v)),
                    if (limitApp != null && limitApp.packageName == null) ...[
                      const SizedBox(height: 10),
                      Text(l.cvPlanLimitNoPkg, style: AppText.rowSub.copyWith(color: c.textMuted)),
                    ],
                  ]),
                ),
              ),
            ObReveal(
              index: 5,
              child: section(
                icon: Icons.bedtime_rounded,
                title: l.cvPlanWind,
                sub: _s.windDownOn ? l.cvPlanWindSub(_time(context, _s.windStart), _time(context, _s.windEnd)) : l.cvPlanOff,
                trailing: PSwitch(value: _s.windDownOn, onChanged: (v) => _edit((s) => s.windDownOn = v)),
                dim: !_s.windDownOn,
                body: Row(children: [
                  Expanded(child: _TimeButton(label: l.cvStarts, value: _time(context, _s.windStart), onTap: () => _pick(context, true))),
                  const SizedBox(width: 10),
                  Expanded(child: _TimeButton(label: l.cvEnds, value: _time(context, _s.windEnd), onTap: () => _pick(context, false))),
                ]),
              ),
            ),
            const SizedBox(height: 4),
            Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Icon(Icons.info_outline_rounded, size: 16, color: c.textMuted),
              const SizedBox(width: 8),
              Expanded(child: Text(l.cvPlanNote, style: AppText.rowSub.copyWith(color: c.textMuted))),
            ]),
          ],
        );
      },
    );
  }
}

class _TimeButton extends StatelessWidget {
  const _TimeButton({required this.label, required this.value, required this.onTap});
  final String label, value;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    return Semantics(
      button: true,
      label: '$label $value',
      excludeSemantics: true,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppRadius.tile),
        child: Container(
          constraints: const BoxConstraints(minHeight: 56),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(AppRadius.tile), border: Border.all(color: c.glassBorder)),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisSize: MainAxisSize.min, children: [
            Text(label, style: AppText.rowSub.copyWith(color: c.textMuted)),
            Text(value, style: AppText.rowTitle.copyWith(fontWeight: FontWeight.w800, color: c.textPrimary)),
          ]),
        ),
      ),
    );
  }
}
