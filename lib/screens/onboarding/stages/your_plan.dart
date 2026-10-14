import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../../utils/app_theme.dart';
import '../../../utils/l10n.dart';
import '../../../widgets/time_picker.dart';
import '../../../widgets/ui_kit.dart';
import '../onboarding_state.dart';
import '../widgets/ob_kit.dart';
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
        ObReveal(child: ObTitle(headline)),
        if (st != null) ...[const SizedBox(height: 16), ObReveal(index: 1, child: Align(alignment: AlignmentDirectional.centerStart, child: ObTag(st, icon: Icons.schedule_rounded)))],
        const SizedBox(height: 22),
        ObReveal(index: 2, child: ObReply(l.cvReflectHelp)),
      ],
    );
  }
}

// -----------------------------------------------------------------------------
// Stage 7 — How Pausey helps (one interactive screen, three parts)
// -----------------------------------------------------------------------------

class HowItHelpsStage extends StatefulWidget {
  const HowItHelpsStage({super.key, required this.onNext});
  final VoidCallback onNext;

  @override
  State<HowItHelpsStage> createState() => _HowItHelpsStageState();
}

class _HowItHelpsStageState extends State<HowItHelpsStage> {
  int _part = 0;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final c = context.colors;
    final app = _s.apps.isEmpty ? null : _s.apps.first;
    final parts = [
      (Icons.pause_circle_outline_rounded, l.cvHowPauseTab, l.cvHowPauseTitle, l.cvHowPauseBody),
      (Icons.hourglass_bottom_rounded, l.cvHowLimitTab, l.cvHowLimitTitle, l.cvHowLimitBody),
      (Icons.bolt_rounded, l.cvHowFocusTab, l.cvHowFocusTitle, l.cvHowFocusBody),
    ];
    final (_, _, title, body) = parts[_part];
    return ObPage(
      primaryLabel: _part < 2 ? l.cvNext : l.cvBuildPlan,
      onPrimary: () => _part < 2 ? setState(() => _part++) : widget.onNext(),
      children: [
        ObReveal(child: ObTitle(l.cvHowTitle)),
        const SizedBox(height: 18),
        // Segmented tabs
        Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(color: context.isDark ? c.glassFill : Colors.white, borderRadius: BorderRadius.circular(AppRadius.chip), border: Border.all(color: c.glassBorder)),
          child: Row(children: [
            for (final (i, (icon, tab, _, _)) in parts.indexed)
              Expanded(
                child: Semantics(
                  button: true,
                  selected: i == _part,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(AppRadius.chip),
                    onTap: () => setState(() => _part = i),
                    child: AnimatedContainer(
                      duration: ObMotion.of(context, ObMotion.select),
                      constraints: const BoxConstraints(minHeight: 44),
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      decoration: BoxDecoration(color: i == _part ? AppPalette.accent : Colors.transparent, borderRadius: BorderRadius.circular(AppRadius.chip)),
                      child: Row(mainAxisSize: MainAxisSize.min, children: [
                        Icon(icon, size: 16, color: i == _part ? Colors.white : c.textSecondary),
                        const SizedBox(width: 4),
                        Flexible(
                          child: Text(tab, maxLines: 1, overflow: TextOverflow.ellipsis, style: AppText.rowSub.copyWith(fontWeight: FontWeight.w700, color: i == _part ? Colors.white : c.textSecondary)),
                        ),
                      ]),
                    ),
                  ),
                ),
              ),
          ]),
        ),
        const SizedBox(height: 18),
        AnimatedSwitcher(
          duration: ObMotion.of(context, ObMotion.content),
          transitionBuilder: (child, a) => FadeTransition(opacity: a, child: ScaleTransition(scale: Tween(begin: 0.97, end: 1.0).animate(a), child: child)),
          child: KeyedSubtree(
            key: ValueKey(_part),
            child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
              SizedBox(height: 200, child: switch (_part) { 0 => _PauseDemo(appName: app?.label), 1 => _LimitDemo(app: app), _ => const _FocusDemo() }),
              const SizedBox(height: 16),
              Text(title, style: AppText.cardTitle.copyWith(color: c.textPrimary)),
              const SizedBox(height: 6),
              Text(body, style: AppText.rowTitle.copyWith(fontWeight: FontWeight.w500, height: 1.45, color: c.textSecondary)),
            ]),
          ),
        ),
      ],
    );
  }
}

/// Frame for the three illustrations, always marked "Preview".
class _DemoFrame extends StatelessWidget {
  const _DemoFrame({required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    return Semantics(
      label: context.l10n.cvPreview,
      child: Container(
        decoration: BoxDecoration(
          color: context.isDark ? c.glassFill : Colors.white,
          borderRadius: BorderRadius.circular(AppRadius.card),
          border: Border.all(color: c.glassBorder),
        ),
        child: Stack(children: [
          Positioned.fill(child: Padding(padding: const EdgeInsets.all(18), child: child)),
          PositionedDirectional(top: 12, end: 12, child: ObTag(context.l10n.cvPreview, icon: Icons.visibility_outlined)),
        ]),
      ),
    );
  }
}

class _PauseDemo extends StatelessWidget {
  const _PauseDemo({this.appName});
  final String? appName;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    return _DemoFrame(
      child: Center(
        child: Container(
          width: 150,
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
          decoration: BoxDecoration(color: const Color(0xFF0D0B22), borderRadius: BorderRadius.circular(22)),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            _Breath(
              child: Container(
                width: 38,
                height: 38,
                decoration: const BoxDecoration(shape: BoxShape.circle, color: AppPalette.accent),
                child: const Icon(Icons.pause_rounded, color: Colors.white, size: 22),
              ),
            ),
            const SizedBox(height: 10),
            Text(l.nativeBlockTitle(appName ?? 'App'), maxLines: 2, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center, style: AppText.rowSub.copyWith(fontWeight: FontWeight.w800, color: Colors.white)),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
              decoration: BoxDecoration(color: AppPalette.accent, borderRadius: BorderRadius.circular(99)),
              child: Text(l.nativeClose, style: AppText.small.copyWith(color: Colors.white, letterSpacing: 0)),
            ),
          ]),
        ),
      ),
    );
  }
}

/// Slow, calm scale loop (a breath). Still when animations are off.
class _Breath extends StatefulWidget {
  const _Breath({required this.child});
  final Widget child;
  @override
  State<_Breath> createState() => _BreathState();
}

class _BreathState extends State<_Breath> with SingleTickerProviderStateMixin {
  late final _c = AnimationController(vsync: this, duration: const Duration(milliseconds: 2600));

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    ObMotion.reduced(context) ? _c.stop() : _c.repeat(reverse: true);
  }

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) =>
      ScaleTransition(scale: Tween(begin: 0.9, end: 1.08).animate(CurvedAnimation(parent: _c, curve: Curves.easeInOut)), child: widget.child);
}

class _LimitDemo extends StatelessWidget {
  const _LimitDemo({this.app});
  final ObApp? app;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final c = context.colors;
    final name = app?.label ?? l.cvYourApp;
    return _DemoFrame(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        for (final (i, (n, used, limit)) in [(name, 18, 30), (l.cvAnotherApp, 40, 60)].indexed) ...[
          if (i > 0) const SizedBox(height: 16),
          Row(children: [
            i == 0 && app != null ? AppGlyph(app!.id, size: 32) : CircleAvatar(radius: 16, backgroundColor: c.glassBorder, child: Icon(Icons.apps_rounded, size: 16, color: c.textMuted)),
            const SizedBox(width: 10),
            Expanded(child: Text(n, maxLines: 1, overflow: TextOverflow.ellipsis, style: AppText.rowTitle.copyWith(color: c.textPrimary))),
            Text(l.cvMinOf(used, limit), style: AppText.rowSub.copyWith(color: c.textMuted)),
          ]),
          const SizedBox(height: 8),
          PBar(value: used / limit, color: i == 0 ? Tone.violet : Tone.blue),
        ],
      ]),
    );
  }
}

class _FocusDemo extends StatelessWidget {
  const _FocusDemo();

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final reduced = ObMotion.reduced(context);
    return _DemoFrame(
      child: Center(
        child: TweenAnimationBuilder<double>(
          tween: Tween(begin: reduced ? 0.6 : 0, end: 0.6),
          duration: reduced ? Duration.zero : const Duration(milliseconds: 1400),
          curve: Curves.easeOutCubic,
          builder: (_, v, _) => SizedBox.square(
            dimension: 140,
            child: CustomPaint(
              painter: _RingPainter(v, c.glassBorder),
              child: Center(
                child: Text(
                  '${(25 * (1 - v)).floor().toString().padLeft(2, '0')}:${((25 * 60 * (1 - v)) % 60).floor().toString().padLeft(2, '0')}',
                  style: AppText.heroValue.copyWith(fontSize: 30, color: c.textPrimary),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _RingPainter extends CustomPainter {
  _RingPainter(this.v, this.track);
  final double v;
  final Color track;

  @override
  void paint(Canvas canvas, Size size) {
    final r = size.width / 2 - 6;
    final center = size.center(Offset.zero);
    canvas.drawCircle(center, r, Paint()
      ..color = track
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8);
    canvas.drawArc(Rect.fromCircle(center: center, radius: r), -math.pi / 2, 2 * math.pi * v, false, Paint()
      ..color = AppPalette.accent
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 8);
  }

  @override
  bool shouldRepaint(_RingPainter old) => old.v != v || old.track != track;
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
