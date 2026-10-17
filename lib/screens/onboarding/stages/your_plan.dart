import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../../data/restrictions/restriction_repo.dart';
import '../../../services/native_bridge.dart';
import '../../../utils/app_theme.dart';
import '../../../utils/l10n.dart';
import '../../../services/installed_apps.dart';
import '../../../widgets/time_picker.dart';
import '../../../widgets/ui_kit.dart';
import '../onboarding_state.dart';
import '../widgets/ob_kit.dart';
import '../widgets/ob_text_motion.dart';
import '../widgets/ob_art.dart';
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

/// What Pausey understood, built only from the answers.
class ReflectionStage extends StatelessWidget {
  const ReflectionStage({super.key, required this.onNext});
  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final c = context.colors;
    final phrase = goalPhrase(l, _s);
    final headline = _s.apps.isEmpty ? l.cvReflectNoApps(phrase) : l.cvReflectApps(phrase, appsList(l, _s.apps));
    final measured = _s.measuredMinutes;
    final st = measured != null
        ? l.cvReflectMeasured(fmtMinutes(measured, h: l.unitH, m: l.unitM))
        : (_s.screenTime != null && _s.screenTime != ObScreenTime.notSure ? l.cvReflectEstimate(screenTimeLabel(l, _s.screenTime!)) : null);
    return ObPage(
      center: true,
      primaryLabel: l.cvShowMeHow,
      onPrimary: onNext,
      children: [
        const ObArt(ObArtKind.reflect, maxHeight: 230),
        const SizedBox(height: 12),
        // What Pausey understood writes itself in, word by word.
        ObRevealText(headline, style: AppText.cardTitle.copyWith(fontSize: 19, height: 1.35, color: c.textPrimary)),
        if (st != null) ...[
          const SizedBox(height: 16),
          ObFadeUp(
            delay: const Duration(milliseconds: 700),
            child: PCard(
              child: Row(children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(color: AppPalette.accent.withValues(alpha: 0.12), borderRadius: BorderRadius.circular(AppRadius.icon)),
                  child: const Icon(Icons.bar_chart_rounded, color: AppPalette.accent),
                ),
                const SizedBox(width: 12),
                Expanded(child: Text(st, style: AppText.rowTitle.copyWith(color: c.textPrimary))),
              ]),
            ),
          ),
        ],
        const SizedBox(height: 14),
        ObFadeUp(delay: const Duration(milliseconds: 1000), child: ObReply(l.cvReflectHelp)),
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

  /// Beat 1 is scrolling with the time-left badge; beat 2 the nudge; beat 3 the block.
  static const _scrollBeat = 1, _nudgeBeat = 2;

  /// The story always shows Instagram (fixed icon), whatever apps were picked.
  static const _storyApp = 'Instagram';
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
    if (_beat < _beats - 1) {
      setState(() => _beat++);
      // "Nudges before time's up": ask for notifications right here, once.
      if (_beat == _nudgeBeat) WidgetsBinding.instance.addPostFrameCallback((_) => _askNotifications());
      return;
    }
    _left = true;
    widget.onNext();
  }

  bool _askedNotifications = false;

  Future<void> _askNotifications() async {
    if (_askedNotifications || !mounted) return;
    final st = RestrictionRepo.instance.status;
    if (!st.supported || st.notifications) return;
    _askedNotifications = true;
    final allow = await showDialog<bool>(context: context, builder: (_) => const _NotificationAsk());
    if (allow == true) {
      await NativeBridge.instance.requestNotifications();
      await RestrictionRepo.instance.refresh();
    }
  }

  void _stepBack() => setState(() => _beat = math.max(0, _beat - 1));

  /// Badge reached 25:00 left: the nudge comes in by itself.
  void _countdownDone() {
    if (_beat == _scrollBeat) _next();
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final c = context.colors;
    // Back (arrow or system gesture) steps through the beats before leaving the stage.
    if (!_left) _gate?.handler = _beat > 0 ? _stepBack : null;

    const appName = _storyApp;
    final headlines = [l.stHow1(appName), l.stHow2, l.stHow4, l.stHow3];
    final limit = math.max(10, _s.planLimitMinutes);
    String fmt(int m) => fmtMinutes(m, h: l.unitH, m: l.unitM);
    // The badge counts down to 25:00 left (less on very small limits), then the nudge shows.
    final leftAtNudge = math.min(25, limit - 5);
    final leftAtStart = math.min(limit, leftAtNudge + 5);
    final usedAtNudge = limit - leftAtNudge;

    final size = MediaQuery.sizeOf(context);
    // Phone size: fits the width, and leaves room for the headline and footer on short screens.
    final byWidth = (math.min(size.width, 480) - AppSpacing.gutter * 2) * 0.76;
    final byHeight = (size.height - 420) / StoryPhone.aspect;
    final phoneW = math.max(150.0, math.min(byWidth, math.min(300.0, byHeight)));

    Widget appIcon(double s) => ClipRRect(
          borderRadius: BorderRadius.circular(s * 0.26),
          child: Image.asset('assets/svg/sheet_instagram.png', width: s, height: s, fit: BoxFit.cover, filterQuality: FilterQuality.medium),
        );

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
          // All headlines are laid out (invisible) so the phone never jumps between beats;
          // the current one writes itself in word by word, again on every beat.
          ObReveal(
            index: 1,
            child: Stack(alignment: Alignment.topCenter, children: [
              for (final h in headlines)
                ExcludeSemantics(
                  child: Opacity(opacity: 0, child: Text(h, textAlign: TextAlign.center, style: AppText.h1)),
                ),
              Semantics(liveRegion: true, child: ObTitle(headlines[_beat], align: TextAlign.center)),
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
                pausedTitle: l.stBlockedTitle(appName),
                nudgeTitle: l.nudgeTitle(appName),
                nudgeText: l.nudgeText(fmt(usedAtNudge), fmt(limit)),
                nudgeProgress: usedAtNudge / limit,
                timerFromSeconds: leftAtStart * 60,
                timerToSeconds: leftAtNudge * 60,
                onCountdownDone: _countdownDone,
              ),
            ),
          ),
        ],
      ),
    );
  }
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

/// Popup on the "nudges" story beat: allow notifications so Pausey can nudge
/// before a limit runs out.
class _NotificationAsk extends StatelessWidget {
  const _NotificationAsk();

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final c = context.colors;
    return AlertDialog(
      backgroundColor: context.isDark ? const Color(0xFF17142F) : Colors.white,
      surfaceTintColor: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppRadius.card)),
      icon: const Center(child: IconBadge(icon: Icons.notifications_active_rounded, color: Tone.violet, size: 52)),
      title: Text(l.cvNotifAskTitle, textAlign: TextAlign.center, style: AppText.cardTitle.copyWith(fontSize: 20, color: c.textPrimary)),
      content: Text(l.stPermNotifWhy, textAlign: TextAlign.center, style: AppText.rowSub.copyWith(fontSize: 14, height: 1.5, color: c.textSecondary)),
      actionsAlignment: MainAxisAlignment.center,
      actionsPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, false),
          style: TextButton.styleFrom(foregroundColor: c.textSecondary, minimumSize: const Size(64, 44)),
          child: Text(l.cvNotNow),
        ),
        FilledButton(
          onPressed: () => Navigator.pop(context, true),
          style: FilledButton.styleFrom(backgroundColor: AppPalette.accent, foregroundColor: Colors.white, minimumSize: const Size(110, 44), shape: const StadiumBorder()),
          child: Text(l.alAllow),
        ),
      ],
    );
  }
}
