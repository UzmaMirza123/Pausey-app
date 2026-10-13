import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart' show DateFormat;

import '../../data/app_repo.dart';
import '../../utils/app_theme.dart';
import '../../utils/l10n.dart';
import '../../widgets/glow_background.dart';
import '../../widgets/ui_kit.dart';
import 'widgets/profile_kit.dart';

/// Streaks & achievements.
class StreaksScreen extends StatefulWidget {
  const StreaksScreen({super.key});

  static const milestones = [3, 7, 14, 21, 30];

  @override
  State<StreaksScreen> createState() => _StreaksScreenState();
}

class _StreaksScreenState extends State<StreaksScreen> {
  late DateTime _month = DateTime(AppRepo.instance.now().year, AppRepo.instance.now().month);

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final loc = Localizations.localeOf(context).toString();
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: GlowBackground(
        child: SafeArea(
          child: ListenableBuilder(
            listenable: AppRepo.instance,
            builder: (context, _) {
              final r = AppRepo.instance;
              return ListView(
                padding: const EdgeInsets.only(bottom: 40),
                children: [
                  ScreenHeader(
                    title: l.profileStreaksTitle,
                    subtitle: DateFormat.yMMMM(loc).format(r.now()),
                    onBack: () => Navigator.of(context).maybePop(),
                    trailing: RoundIconButton(icon: Icons.share_rounded, tooltip: l.profileShare, onTap: () => _share(context, r.streak)),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(AppSpacing.gutter, 8, AppSpacing.gutter, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        FadeIn(child: _hero(context, r)),
                        const SizedBox(height: AppSpacing.section),
                        FadeIn(delay: 1, child: _week(context, r)),
                        const SizedBox(height: AppSpacing.section),
                        FadeIn(delay: 2, child: _calendar(context, r)),
                        const SizedBox(height: AppSpacing.section),
                        FadeIn(delay: 3, child: _milestones(context, r)),
                        const SizedBox(height: AppSpacing.section),
                        FadeIn(delay: 4, child: _achievements(context, r)),
                      ],
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

  void _share(BuildContext context, int streak) {
    final l = context.l10n;
    Clipboard.setData(ClipboardData(text: l.profileShareText(streak)));
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(l.profileCopied)));
  }

  Widget _hero(BuildContext context, AppRepo r) {
    final l = context.l10n;
    final c = context.colors;
    final streak = r.streak;
    final next = StreaksScreen.milestones.where((m) => m > streak).firstOrNull;
    final msg = streak == 0 ? l.profileStartStreak : next == null ? l.profileAllMilestones : l.profileNextMilestone(next - streak);
    final badges = achievements(context, r).where((a) => a.unlocked).length;
    Widget stat(IconData i, String v, String label) => Expanded(
          child: Column(children: [
            Icon(i, size: 18, color: Tone.amber),
            const SizedBox(height: 4),
            FittedBox(fit: BoxFit.scaleDown, child: Text(v, style: AppText.rowTitle.copyWith(fontWeight: FontWeight.w800, color: c.textPrimary))),
            Text(label, maxLines: 1, overflow: TextOverflow.ellipsis, style: AppText.rowSub.copyWith(fontSize: 12, color: c.textMuted)),
          ]),
        );
    return PCard(
      accent: Tone.amber,
      padding: const EdgeInsets.fromLTRB(20, 24, 20, 20),
      child: Column(children: [
        Container(
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: const LinearGradient(colors: [Color(0xFFFFC14D), Tone.amber], begin: Alignment.topLeft, end: Alignment.bottomRight),
            boxShadow: [BoxShadow(color: Tone.amber.withValues(alpha: 0.4), blurRadius: 22)],
          ),
          child: const Icon(Icons.local_fire_department_rounded, color: Colors.white, size: 34),
        ),
        const SizedBox(height: 12),
        TweenAnimationBuilder<double>(
          tween: Tween(begin: 0, end: streak.toDouble()),
          duration: const Duration(milliseconds: 900),
          curve: Curves.easeOutCubic,
          builder: (_, v, _) => Text('${v.round()}', style: AppText.heroValue.copyWith(fontSize: 56, height: 1.1, color: Tone.amber)),
        ),
        Text(l.profileDayStreak, style: AppText.cardTitle.copyWith(color: c.textPrimary)),
        const SizedBox(height: 6),
        Text(msg, textAlign: TextAlign.center, style: AppText.rowSub.copyWith(color: c.textSecondary)),
        const SizedBox(height: 18),
        Row(children: [
          stat(Icons.emoji_events_rounded, '$badges', l.profileBadges),
          stat(Icons.calendar_today_rounded, '${r.bestStreak}', l.profileBest),
          stat(Icons.schedule_rounded, fmtMinutes(r.totalFocusMinutes, h: l.unitH, m: l.unitM), l.profileFocusTime),
        ]),
      ]),
    );
  }

  Widget _week(BuildContext context, AppRepo r) {
    final l = context.l10n;
    final c = context.colors;
    final loc = Localizations.localeOf(context).toString();
    final today = dateOnly(r.now());
    final monday = today.subtract(Duration(days: today.weekday - 1));
    final days = [for (var i = 0; i < 7; i++) monday.add(Duration(days: i))];
    final done = days.where(r.dayActive).length;
    return PCard(
      child: Column(children: [
        CardTitle(
          icon: Icons.bar_chart_rounded,
          title: l.profileThisWeek,
          trailing: Flexible(child: Text(l.profileDaysCompleted(done), maxLines: 1, overflow: TextOverflow.ellipsis, style: AppText.rowSub.copyWith(color: Tone.green))),
        ),
        const SizedBox(height: 14),
        PillBars(
          values: [for (final m in r.weekFocusMinutes) m.toDouble()],
          labels: [for (final d in days) DateFormat.E(loc).format(d)],
          highlight: today.weekday - 1,
          color: Tone.amber,
          height: 100,
        ),
        const SizedBox(height: 8),
        Row(children: [
          for (final d in days)
            Expanded(
              child: Icon(
                r.dayActive(d) ? Icons.check_circle_rounded : Icons.circle,
                size: r.dayActive(d) ? 18 : 10,
                color: r.dayActive(d) ? Tone.amber : c.dotInactive,
              ),
            ),
        ]),
      ]),
    );
  }

  Widget _calendar(BuildContext context, AppRepo r) {
    final l = context.l10n;
    final c = context.colors;
    final loc = Localizations.localeOf(context).toString();
    final today = dateOnly(r.now());
    final first = _month;
    final daysIn = DateTime(first.year, first.month + 1, 0).day;
    final lead = first.weekday - 1; // Monday first
    final thisMonth = DateTime(today.year, today.month);
    final canNext = first.isBefore(thisMonth);
    final weekStart = first.subtract(Duration(days: lead));

    Widget cell(DateTime d) {
      final future = d.isAfter(today);
      final done = r.dayActive(d);
      final partial = !done && r.focusMinutesOn(d) > 0;
      final isToday = d == today;
      final color = done ? Tone.amber : partial ? Tone.violet : null;
      return Padding(
        padding: const EdgeInsets.all(3),
        child: AspectRatio(
          aspectRatio: 1,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isToday && done ? Tone.amber : color?.withValues(alpha: 0.18) ?? (future ? null : c.glassFill),
              border: Border.all(color: isToday ? Tone.amber : color?.withValues(alpha: 0.5) ?? c.glassBorder, width: isToday ? 2 : 1),
            ),
            alignment: Alignment.center,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text('${d.day}',
                  style: AppText.rowSub.copyWith(
                    fontWeight: FontWeight.w700,
                    color: isToday && done ? Colors.white : future ? c.textMuted.withValues(alpha: 0.5) : (color ?? c.textMuted),
                  )),
            ),
          ),
        ),
      );
    }

    Widget legend(Color col, String t) => Row(mainAxisSize: MainAxisSize.min, children: [
          Container(width: 12, height: 12, decoration: BoxDecoration(shape: BoxShape.circle, color: col.withValues(alpha: 0.25), border: Border.all(color: col))),
          const SizedBox(width: 6),
          Text(t, style: AppText.rowSub.copyWith(fontSize: 12, color: c.textMuted)),
        ]);

    final rows = ((lead + daysIn) / 7).ceil();
    return PCard(
      child: Column(children: [
        Row(children: [
          const Icon(Icons.calendar_month_rounded, size: 18, color: Tone.violet),
          const SizedBox(width: 8),
          Expanded(child: Text(DateFormat.yMMMM(loc).format(first), maxLines: 1, overflow: TextOverflow.ellipsis, style: AppText.cardTitle.copyWith(color: c.textPrimary))),
          IconButton(
            tooltip: l.profilePrevMonth,
            onPressed: () => setState(() => _month = DateTime(first.year, first.month - 1)),
            icon: Icon(Icons.chevron_left_rounded, color: c.textPrimary, textDirection: Directionality.of(context)),
          ),
          IconButton(
            tooltip: l.profileNextMonth,
            onPressed: canNext ? () => setState(() => _month = DateTime(first.year, first.month + 1)) : null,
            icon: Icon(Icons.chevron_right_rounded, color: canNext ? c.textPrimary : c.textMuted.withValues(alpha: 0.4), textDirection: Directionality.of(context)),
          ),
        ]),
        const SizedBox(height: 8),
        Row(children: [
          for (var i = 0; i < 7; i++)
            Expanded(child: Text(DateFormat.EEEEE(loc).format(weekStart.add(Duration(days: i))), textAlign: TextAlign.center, style: AppText.small.copyWith(color: c.textMuted))),
        ]),
        const SizedBox(height: 6),
        for (var w = 0; w < rows; w++)
          Row(children: [
            for (var i = 0; i < 7; i++)
              Expanded(
                child: () {
                  final idx = w * 7 + i - lead;
                  return idx < 0 || idx >= daysIn ? const SizedBox.shrink() : cell(DateTime(first.year, first.month, idx + 1));
                }(),
              ),
          ]),
        Padding(padding: const EdgeInsets.symmetric(vertical: 12), child: Divider(height: 1, color: c.divider)),
        Wrap(spacing: 16, runSpacing: 8, alignment: WrapAlignment.center, children: [
          legend(Tone.amber, l.profileCompleted),
          legend(Tone.violet, l.profilePartial),
          legend(c.textMuted, l.profileMissed),
        ]),
      ]),
    );
  }

  Widget _milestones(BuildContext context, AppRepo r) {
    final l = context.l10n;
    final c = context.colors;
    final best = r.bestStreak;
    return PCard(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        CardTitle(icon: Icons.flag_rounded, title: l.profileMilestones, color: Tone.amber),
        const SizedBox(height: 16),
        Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          for (final m in StreaksScreen.milestones)
            Expanded(
              child: Column(children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 400),
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: best >= m ? Tone.amber : c.glassFill,
                    border: Border.all(color: best >= m ? Tone.amber : c.glassBorder),
                  ),
                  alignment: Alignment.center,
                  child: best >= m
                      ? const Icon(Icons.check_rounded, color: Colors.white, size: 22)
                      : Text('$m', style: AppText.rowSub.copyWith(fontWeight: FontWeight.w800, color: c.textMuted)),
                ),
                const SizedBox(height: 6),
                Text(l.days(m), textAlign: TextAlign.center, maxLines: 2, style: AppText.rowSub.copyWith(fontSize: 12, color: best >= m ? Tone.amber : c.textMuted)),
              ]),
            ),
        ]),
      ]),
    );
  }

  Widget _achievements(BuildContext context, AppRepo r) {
    final l = context.l10n;
    final c = context.colors;
    final list = achievements(context, r);
    final n = list.where((a) => a.unlocked).length;
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      Row(children: [
        const Icon(Icons.emoji_events_rounded, size: 18, color: Tone.amber),
        const SizedBox(width: 8),
        Expanded(child: Text(l.profileAchievements, style: AppText.cardTitle.copyWith(color: c.textPrimary))),
        Pill('$n / ${list.length}', color: Tone.amber),
      ]),
      const SizedBox(height: 12),
      LayoutBuilder(builder: (context, box) {
        final w = (box.maxWidth - 20) / 3;
        return Wrap(spacing: 10, runSpacing: 10, children: [
          for (final a in list)
            SizedBox(
              width: w,
              child: Opacity(
                opacity: a.unlocked ? 1 : 0.55,
                child: PCard(
                  accent: a.unlocked ? a.color : null,
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 14),
                  child: Column(children: [
                    Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(shape: BoxShape.circle, color: a.unlocked ? a.color : c.glassFill),
                      child: Icon(a.unlocked ? a.icon : Icons.lock_rounded, color: a.unlocked ? Colors.white : c.textMuted, size: 22),
                    ),
                    const SizedBox(height: 8),
                    Text(a.title, textAlign: TextAlign.center, maxLines: 2, overflow: TextOverflow.ellipsis, style: AppText.rowTitle.copyWith(fontSize: 13, color: c.textPrimary)),
                    const SizedBox(height: 2),
                    Text(a.desc, textAlign: TextAlign.center, maxLines: 2, overflow: TextOverflow.ellipsis, style: AppText.small.copyWith(fontWeight: FontWeight.w400, color: c.textMuted)),
                    if (!a.unlocked) ...[
                      const SizedBox(height: 8),
                      PBar(value: a.progress, color: a.color, height: 4),
                    ],
                  ]),
                ),
              ),
            ),
        ]);
      }),
    ]);
  }
}
