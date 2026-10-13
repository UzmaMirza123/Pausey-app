import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../data/app_repo.dart';
import '../../data/models.dart';
import '../../utils/app_theme.dart';
import '../../utils/l10n.dart';
import '../../widgets/common.dart';
import '../../widgets/glow_background.dart';
import '../../widgets/ui_kit.dart';
import 'widgets/focus_widgets.dart';

/// Shown after a focus session ends (finished or stopped early).
///
/// Pops with [startAnother] or [done]; the Focus tab acts on it.
class SessionCompleteScreen extends StatelessWidget {
  const SessionCompleteScreen({super.key, this.session});
  final FocusSession? session;

  static const startAnother = 'start';
  static const done = 'done';

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final c = context.colors;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: GlowBackground(
        child: SafeArea(
          child: ListenableBuilder(
            listenable: AppRepo.instance,
            builder: (context, _) {
              final repo = AppRepo.instance;
              final s = session ?? (repo.sessions.isEmpty ? null : repo.sessions.last);
              if (s == null) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(AppSpacing.gutter),
                    child: StateMessage(
                      icon: Icons.timer_outlined,
                      color: Tone.violet,
                      badge: l.navFocus,
                      title: l.focusEndedTitle,
                      message: l.focusFirstHint,
                      primaryLabel: l.focusStartNext,
                      onPrimary: () => Navigator.of(context).maybePop(startAnother),
                    ),
                  ),
                );
              }
              final goal = repo.dailyFocusGoalMinutes;
              final today = repo.todayFocusMinutes;
              final pct = (today / math.max(1, goal) * 100).round().clamp(0, 100);
              final plus = (s.focusedSeconds / 60 / math.max(1, goal) * 100).round();
              final quotes = [l.focusQuote1, l.focusQuote2, l.focusQuote3];
              final quote = quotes[repo.sessions.length % quotes.length];
              final ok = s.completed;

              return ListView(
                padding: const EdgeInsets.fromLTRB(AppSpacing.gutter, 8, AppSpacing.gutter, 24),
                children: [
                  Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: RoundIconButton(
                      icon: Icons.close_rounded,
                      tooltip: MaterialLocalizations.of(context).closeButtonTooltip,
                      onTap: () => Navigator.of(context).maybePop(done),
                    ),
                  ),
                  const _Badge(),
                  const SizedBox(height: 20),
                  EnterAnim(
                    delay: 150,
                    child: Text.rich(
                      TextSpan(children: ok
                          ? [
                              TextSpan(text: '${l.focusCompleteA} '),
                              TextSpan(text: l.focusCompleteB, style: const TextStyle(color: AppPalette.violet)),
                            ]
                          : [TextSpan(text: l.focusEndedTitle)]),
                      textAlign: TextAlign.center,
                      style: AppText.screenTitle.copyWith(color: c.textPrimary),
                    ),
                  ),
                  const SizedBox(height: 8),
                  EnterAnim(
                    delay: 200,
                    child: Text(
                      ok ? l.focusCompleteMsg(modeName(l, s.mode)) : l.focusEndedMsg,
                      textAlign: TextAlign.center,
                      style: AppText.rowSub.copyWith(color: c.textSecondary, height: 1.5),
                    ),
                  ),
                  const SizedBox(height: 24),
                  EnterAnim(
                    delay: 250,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            TweenAnimationBuilder<double>(
                              tween: Tween(begin: 0, end: s.focusedMinutes.toDouble()),
                              duration: const Duration(milliseconds: 900),
                              curve: Curves.easeOutCubic,
                              builder: (_, v, _) => Text('${v.round()}', style: AppText.heroValue.copyWith(color: c.textPrimary)),
                            ),
                            const SizedBox(width: 6),
                            Text(l.focusMinUnit, style: AppText.cardTitle.copyWith(color: c.textMuted)),
                          ],
                        ),
                        Text(l.focusDurationLabel, style: AppText.small.copyWith(color: c.textMuted, letterSpacing: 1.4)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  EnterAnim(
                    delay: 300,
                    child: Row(
                      children: [
                        Expanded(child: StatTile(icon: modeIcon(s.mode), value: clock(s.focusedSeconds), label: modeName(l, s.mode))),
                        const SizedBox(width: 10),
                        Expanded(child: StatTile(icon: Icons.local_fire_department_rounded, color: Tone.amber, value: '${repo.streak}', label: l.focusDayStreak)),
                        const SizedBox(width: 10),
                        Expanded(child: StatTile(icon: Icons.shield_outlined, color: Tone.blue, value: '${repo.lockedCount}', label: l.focusAppsLabel)),
                      ],
                    ),
                  ),
                  const SizedBox(height: AppSpacing.section),
                  EnterAnim(
                    delay: 350,
                    child: PCard(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          CardTitle(
                            icon: Icons.track_changes_rounded,
                            title: l.focusTodayGoal,
                            trailing: Text('${fmtMinutes(today, h: l.unitH, m: l.unitM)} / ${fmtMinutes(goal, h: l.unitH, m: l.unitM)}',
                                style: AppText.rowSub.copyWith(color: c.textMuted)),
                          ),
                          const SizedBox(height: 12),
                          PBar(value: pct / 100),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Expanded(child: Text(l.focusPctCompleted(pct), maxLines: 1, overflow: TextOverflow.ellipsis, style: AppText.rowSub.copyWith(color: c.textMuted))),
                              if (plus > 0) ...[
                                Container(width: 6, height: 6, decoration: const BoxDecoration(color: Tone.green, shape: BoxShape.circle)),
                                const SizedBox(width: 6),
                                Flexible(child: Text(l.focusPlusPct(plus), maxLines: 1, overflow: TextOverflow.ellipsis, style: AppText.rowSub.copyWith(color: Tone.green))),
                              ],
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: AppSpacing.section),
                  EnterAnim(
                    delay: 400,
                    child: PCard(
                      accent: Tone.violet,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(Icons.lightbulb_rounded, color: Tone.amber, size: 26),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(l.focusMomentum, style: AppText.rowTitle.copyWith(color: c.textPrimary)),
                                const SizedBox(height: 4),
                                Text('“$quote”', style: AppText.rowSub.copyWith(color: c.textSecondary)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  PrimaryButton(
                    label: l.focusStartNext,
                    showArrow: false,
                    leading: const Icon(Icons.bolt_rounded, color: Colors.white, size: 20),
                    onPressed: () => Navigator.of(context).maybePop(startAnother),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    height: 54,
                    child: OutlinedButton.icon(
                      style: OutlinedButton.styleFrom(
                        foregroundColor: c.textPrimary,
                        side: BorderSide(color: c.glassBorder),
                        shape: const StadiumBorder(),
                        backgroundColor: context.isDark ? const Color(0xFF14122C) : Colors.white,
                      ),
                      onPressed: () => Navigator.of(context).maybePop(done),
                      icon: const Icon(Icons.home_outlined, size: 20),
                      label: Text(l.focusBackHome, style: AppText.button.copyWith(color: c.textPrimary)),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

/// Glowing check badge with a few confetti dots; pops in.
class _Badge extends StatelessWidget {
  const _Badge();

  @override
  Widget build(BuildContext context) {
    const dots = [
      (-120.0, -50.0, Tone.amber, 7.0),
      (110.0, -70.0, Tone.green, 5.0),
      (130.0, 20.0, Tone.violet, 8.0),
      (-135.0, 40.0, Tone.blue, 6.0),
      (-90.0, 85.0, Tone.green, 5.0),
      (95.0, 80.0, Tone.pink, 6.0),
    ];
    return SizedBox(
      height: 200,
      child: TweenAnimationBuilder<double>(
        tween: Tween(begin: 0, end: 1),
        duration: const Duration(milliseconds: 700),
        curve: Curves.easeOutBack,
        builder: (context, t, _) => Stack(
          alignment: Alignment.center,
          children: [
            for (final r in [190.0, 160.0])
              Container(
                width: r * t.clamp(0, 1),
                height: r * t.clamp(0, 1),
                decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: AppPalette.violet.withValues(alpha: 0.18))),
              ),
            for (final d in dots)
              Transform.translate(
                offset: Offset(d.$1 * t, d.$2 * t),
                child: Opacity(
                  opacity: t.clamp(0, 1),
                  child: Container(width: d.$4, height: d.$4, decoration: BoxDecoration(color: d.$3, shape: BoxShape.circle)),
                ),
              ),
            Transform.scale(
              scale: t,
              child: Container(
                width: 128,
                height: 128,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: const LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [AppPalette.violet, AppPalette.accent]),
                  boxShadow: [BoxShadow(color: AppPalette.accent.withValues(alpha: 0.5), blurRadius: 40)],
                ),
                child: Center(
                  child: Container(
                    width: 64,
                    height: 64,
                    decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white.withValues(alpha: 0.16)),
                    child: const Icon(Icons.check_rounded, color: Colors.white, size: 40),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
