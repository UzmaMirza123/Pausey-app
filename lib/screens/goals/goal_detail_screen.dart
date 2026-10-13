import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart' show DateFormat;

import '../../data/app_repo.dart';
import '../../data/models.dart';
import '../../data/screen_time.dart';
import '../../utils/app_theme.dart';
import '../../utils/l10n.dart';
import '../../widgets/common.dart';
import '../../widgets/glow_background.dart';
import '../../widgets/ui_kit.dart';
import '../shell/app_shell.dart';
import 'widgets/goal_ui.dart';

/// One goal in detail: today's ring, week stats, trend, milestones, history.
class GoalDetailScreen extends StatefulWidget {
  const GoalDetailScreen({super.key, required this.goalId});
  final String goalId;

  @override
  State<GoalDetailScreen> createState() => _GoalDetailScreenState();
}

class _GoalDetailScreenState extends State<GoalDetailScreen> {
  bool _allHistory = false;

  /// Switch the app shell (under this pushed route) to a tab.
  void _goTab(AppTab tab) {
    AppShellState? shell;
    void visit(Element e) {
      if (shell != null) return;
      if (e is StatefulElement && e.state is AppShellState) {
        shell = e.state as AppShellState;
        return;
      }
      e.visitChildren(visit);
    }

    final root = Navigator.of(context, rootNavigator: true).context as Element;
    root.visitChildren(visit);
    if (shell != null) {
      Navigator.of(context).popUntil((r) => r.isFirst);
      shell!.goTab(tab);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(context.l10n.goalsStartSession)));
    }
  }

  Future<void> _menu(Goal g, String v) async {
    if (v == 'edit') {
      await showGoalSheet(context, goal: g);
    } else if (v == 'delete') {
      final nav = Navigator.of(context);
      if (await confirmDeleteGoal(context, g)) nav.maybePop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: GlowBackground(
        child: SafeArea(
          child: ListenableBuilder(
            listenable: AppRepo.instance,
            builder: (context, _) {
              final r = AppRepo.instance;
              final g = r.goals.where((x) => x.id == widget.goalId).firstOrNull;
              if (g == null) {
                return Column(children: [
                  ScreenHeader(title: l.goalsTitle, onBack: () => Navigator.of(context).maybePop()),
                  Padding(
                    padding: const EdgeInsets.all(AppSpacing.gutter),
                    child: StateMessage(
                      icon: Icons.flag_outlined,
                      color: Tone.amber,
                      badge: l.goalsTitle,
                      title: l.goalsNotFound,
                      message: l.goalsEmptyMsg,
                      primaryLabel: l.back,
                      onPrimary: () => Navigator.of(context).maybePop(),
                    ),
                  ),
                ]);
              }
              return Column(children: [
                Expanded(child: _body(context, r, g)),
                Padding(
                  padding: const EdgeInsets.fromLTRB(AppSpacing.gutter, 8, AppSpacing.gutter, 12),
                  child: _cta(context, r, g),
                ),
              ]);
            },
          ),
        ),
      ),
    );
  }

  Widget _cta(BuildContext context, AppRepo r, Goal g) {
    final l = context.l10n;
    if (g.isManual) {
      final on = r.goalMetOn(g, dateOnly(r.now()));
      return PrimaryButton(
        label: on ? l.goalsCheckedIn : l.goalsCheckIn,
        showArrow: false,
        leading: Icon(on ? Icons.check_circle_rounded : Icons.radio_button_unchecked_rounded, color: Colors.white),
        onPressed: () => checkInGoal(context, g),
      );
    }
    if (g.type == GoalType.blockApps) {
      return PrimaryButton(
        label: l.goalsManageApps,
        showArrow: false,
        leading: const Icon(Icons.shield_outlined, color: Colors.white),
        onPressed: () => _goTab(AppTab.block),
      );
    }
    return PrimaryButton(
      label: l.goalsStartSession,
      showArrow: false,
      leading: const Icon(Icons.bolt_rounded, color: Colors.white),
      onPressed: () => _goTab(AppTab.focus),
    );
  }

  Widget _body(BuildContext context, AppRepo r, Goal g) {
    final l = context.l10n;
    final c = context.colors;
    final locale = Localizations.localeOf(context).toString();
    final today = dateOnly(r.now());
    final week = [for (var i = 6; i >= 0; i--) today.subtract(Duration(days: i))];
    final p = goalShownProgress(r, g);
    final color = g.tone;
    final streak = r.goalStreak(g);
    final activeDays = week.where((d) => goalDayProgress(r, g, d) > 0).length;
    final metDays = week.where((d) => r.goalMetOn(g, d)).length;
    final trend = [for (final d in week) goalDayProgress(r, g, d)];
    final firstHalf = trend.take(3).fold(0.0, (a, b) => a + b) / 3;
    final secondHalf = trend.skip(4).fold(0.0, (a, b) => a + b) / 3;
    final trendDelta = ((secondHalf - firstHalf) * 100).round();

    final (String thirdValue, String thirdLabel, IconData thirdIcon) = switch (g.type) {
      GoalType.focusMinutes => (fmtMinutes(week.fold(0, (a, d) => a + r.focusMinutesOn(d)), h: l.unitH, m: l.unitM), l.goalsTotalTime, Icons.schedule_rounded),
      GoalType.sessions => ('${week.fold(0, (a, d) => a + r.completedSessionsOn(d))}', l.goalsSessionsLabel, Icons.layers_rounded),
      _ => ('$streak', l.goalsStreak, Icons.local_fire_department_rounded),
    };

    // Milestones reached within the 7-day window, with the day they were reached.
    final weekTarget = goalWeekTarget(g);
    DateTime? first, s3, half, s5, full;
    var run = 0, count = 0;
    for (final d in week) {
      if (r.goalMetOn(g, d)) {
        run++;
        count++;
        first ??= d;
        if (run >= 3) s3 ??= d;
        if (run >= 5) s5 ??= d;
        if (count * 2 >= weekTarget) half ??= d;
        if (count >= weekTarget) full ??= d;
      } else {
        run = 0;
      }
    }
    final milestones = [(l.goalsMsFirst, first), (l.goalsMs3, s3), (l.goalsMsHalf, half), (l.goalsMs5, s5), (l.goalsMsWeek, full)];
    String dayName(DateTime d) => d == today ? l.goalsToday : DateFormat.E(locale).format(d);

    final historyDays = [for (var i = 0; i < (_allHistory ? 14 : 5); i++) today.subtract(Duration(days: i))];

    return ListView(
      padding: const EdgeInsets.only(bottom: 16),
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(AppSpacing.gutter, 12, AppSpacing.gutter, 8),
          child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            RoundIconButton(icon: Icons.arrow_back_rounded, tooltip: MaterialLocalizations.of(context).backButtonTooltip, onTap: () => Navigator.of(context).maybePop()),
            const SizedBox(width: 12),
            Expanded(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(g.displayTitle(l), maxLines: 2, overflow: TextOverflow.ellipsis, style: AppText.screenTitle.copyWith(fontSize: 24, color: c.textPrimary)),
                const SizedBox(height: 6),
                Wrap(spacing: 8, runSpacing: 6, children: [
                  Pill(goalCategoryLabel(l, g.category), color: color, icon: goalCategoryIcon(g.category)),
                  if (streak > 0) Pill(l.goalsStreakN(streak), color: Tone.amber, icon: Icons.local_fire_department_rounded),
                  if (r.goalDone(g)) const GoalDonePill(),
                ]),
              ]),
            ),
            const SizedBox(width: 8),
            PopupMenuButton<String>(
              tooltip: l.goalsMore,
              onSelected: (v) => _menu(g, v),
              itemBuilder: (_) => [
                PopupMenuItem(value: 'edit', child: ListTile(leading: const Icon(Icons.edit_rounded), title: Text(l.goalsEdit), contentPadding: EdgeInsets.zero)),
                PopupMenuItem(
                  value: 'delete',
                  child: ListTile(leading: const Icon(Icons.delete_outline_rounded, color: Tone.red), title: Text(l.goalsDelete, style: const TextStyle(color: Tone.red)), contentPadding: EdgeInsets.zero),
                ),
              ],
              child: IgnorePointer(child: RoundIconButton(icon: Icons.more_horiz_rounded, onTap: () {})),
            ),
          ]),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(AppSpacing.gutter, 8, AppSpacing.gutter, 0),
          child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            Center(
              child: Ring(
                value: p,
                size: 180,
                stroke: 16,
                color: color,
                color2: AppPalette.violet,
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(mainAxisSize: MainAxisSize.min, children: [
                    TweenAnimationBuilder<double>(
                      tween: Tween(begin: 0, end: p * 100),
                      duration: const Duration(milliseconds: 900),
                      curve: Curves.easeOutCubic,
                      builder: (_, v, _) => Text('${v.round()}%', style: AppText.heroValue.copyWith(color: c.textPrimary)),
                    ),
                    Text(l.goalsComplete, maxLines: 1, overflow: TextOverflow.ellipsis, style: AppText.rowSub.copyWith(color: c.textMuted)),
                    const SizedBox(height: 2),
                    FittedBox(child: Text(goalProgressText(l, r, g), style: AppText.small.copyWith(color: AppPalette.violet))),
                  ]),
                ),
              ),
            ),
            if (g.type == GoalType.screenLimit) ...[
              const SizedBox(height: 12),
              Wrap(alignment: WrapAlignment.center, spacing: 8, runSpacing: 6, crossAxisAlignment: WrapCrossAlignment.center, children: [
                Text(l.goalsScreenToday(fmtMinutes(ScreenTime.instance.totalOn(today), h: l.unitH, m: l.unitM)), style: AppText.rowSub.copyWith(color: c.textSecondary)),
                if (ScreenTime.instance.isDemo) Pill(l.sampleData, color: Tone.amber),
              ]),
            ],
            if (g.type == GoalType.blockApps) ...[
              const SizedBox(height: 12),
              Text(l.goalsBlockHint, textAlign: TextAlign.center, style: AppText.rowSub.copyWith(color: c.textSecondary)),
            ],
            const SizedBox(height: AppSpacing.section + 4),
            Row(children: [
              Expanded(child: StatTile(icon: Icons.calendar_month_rounded, value: '$activeDays / 7', label: l.goalsDaysActive, color: Tone.violet)),
              const SizedBox(width: 10),
              Expanded(child: StatTile(icon: Icons.check_circle_outline_rounded, value: l.days(metDays), label: l.goalsCompleted, color: Tone.green)),
              const SizedBox(width: 10),
              Expanded(child: StatTile(icon: thirdIcon, value: thirdValue, label: thirdLabel, color: Tone.amber)),
            ]),
            const SizedBox(height: AppSpacing.section),
            PCard(
              child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                CardTitle(
                  icon: Icons.show_chart_rounded,
                  title: l.goals7Day,
                  trailing: Row(mainAxisSize: MainAxisSize.min, children: [
                    Icon(trendDelta >= 0 ? Icons.trending_up_rounded : Icons.trending_down_rounded, size: 16, color: trendDelta >= 0 ? Tone.green : Tone.red),
                    const SizedBox(width: 4),
                    Text('${trendDelta >= 0 ? '+' : ''}$trendDelta%', style: AppText.rowSub.copyWith(fontWeight: FontWeight.w700, color: trendDelta >= 0 ? Tone.green : Tone.red)),
                  ]),
                ),
                const SizedBox(height: 12),
                SparkLine(values: [...trend.map((v) => v * 100)], color: color),
                const SizedBox(height: 8),
                Row(children: [
                  Expanded(child: Text(l.goals7DaysAgo, style: AppText.rowSub.copyWith(color: c.textMuted))),
                  Text(l.goalsToday, style: AppText.rowSub.copyWith(color: c.textMuted)),
                ]),
              ]),
            ),
            const SizedBox(height: AppSpacing.section),
            PCard(
              child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                CardTitle(icon: Icons.flag_rounded, title: l.goalsMilestones, color: Tone.amber),
                const SizedBox(height: 10),
                for (final (label, day) in milestones)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: Row(children: [
                      Container(
                        width: 28,
                        height: 28,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: day != null ? Tone.green.withValues(alpha: 0.15) : c.glassFill,
                          border: Border.all(color: day != null ? Tone.green.withValues(alpha: 0.5) : c.glassBorder),
                        ),
                        child: Icon(day != null ? Icons.check_rounded : Icons.lock_outline_rounded, size: 15, color: day != null ? Tone.green : c.textMuted),
                      ),
                      const SizedBox(width: 12),
                      Expanded(child: Text(label, maxLines: 2, overflow: TextOverflow.ellipsis, style: AppText.rowSub.copyWith(color: day != null ? c.textPrimary : c.textMuted))),
                      const SizedBox(width: 8),
                      Text(day != null ? dayName(day) : l.goalsMsLocked, style: AppText.rowSub.copyWith(fontWeight: FontWeight.w700, color: day != null ? Tone.green : c.textMuted)),
                    ]),
                  ),
              ]),
            ),
            const SizedBox(height: AppSpacing.section),
            PCard(
              child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                CardTitle(
                  icon: Icons.history_rounded,
                  title: l.goalsHistory,
                  trailing: LinkText(_allHistory ? l.goalsShowLess : l.seeAll, onTap: () => setState(() => _allHistory = !_allHistory)),
                ),
                const SizedBox(height: 12),
                AnimatedSize(
                  duration: const Duration(milliseconds: 250),
                  alignment: AlignmentDirectional.topCenter,
                  child: Column(children: [
                    for (final d in historyDays) _HistoryRow(goal: g, repo: r, day: d, today: today, locale: locale),
                  ]),
                ),
              ]),
            ),
          ]),
        ),
      ],
    );
  }
}

class _HistoryRow extends StatelessWidget {
  const _HistoryRow({required this.goal, required this.repo, required this.day, required this.today, required this.locale});
  final Goal goal;
  final AppRepo repo;
  final DateTime day;
  final DateTime today;
  final String locale;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final c = context.colors;
    final p = goalDayProgress(repo, goal, day);
    final isToday = day == today;
    final met = repo.goalMetOn(goal, day);
    final color = met ? Tone.green : (isToday ? goal.tone : (p > 0 ? Tone.amber : c.textMuted));
    final icon = met ? Icons.check_rounded : (isToday ? goal.icon : (p > 0 ? Icons.remove_rounded : Icons.close_rounded));
    final date = DateFormat.MMMd(locale).format(day);
    final label = isToday
        ? l.goalsTodayDate(date)
        : day == today.subtract(const Duration(days: 1))
            ? l.goalsYesterdayDate(date)
            : '${DateFormat.E(locale).format(day)}, $date';
    final value = switch (goal.type) {
      GoalType.focusMinutes => fmtMinutes(repo.focusMinutesOn(day), h: l.unitH, m: l.unitM),
      GoalType.sessions => '${repo.completedSessionsOn(day)} / ${goal.target}',
      _ => met ? l.goalsDone : '—',
    };
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 14, 10),
      decoration: BoxDecoration(
        color: color.withValues(alpha: context.isDark ? 0.10 : 0.07),
        borderRadius: BorderRadius.circular(AppRadius.tile),
        border: Border.all(color: color.withValues(alpha: 0.2)),
      ),
      child: Row(children: [
        IconBadge(icon: icon, color: color, size: 36),
        const SizedBox(width: 12),
        Expanded(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(label, maxLines: 1, overflow: TextOverflow.ellipsis, style: AppText.rowSub.copyWith(fontWeight: FontWeight.w700, color: c.textPrimary)),
            const SizedBox(height: 6),
            Row(children: [
              Expanded(child: GoalBar(value: p, color: color, height: 5)),
              const SizedBox(width: 8),
              Text('${(p * 100).round()}%', style: AppText.small.copyWith(color: c.textMuted)),
            ]),
          ]),
        ),
        const SizedBox(width: 12),
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: max(60, MediaQuery.sizeOf(context).width * 0.22)),
          child: Text(value, maxLines: 1, overflow: TextOverflow.ellipsis, textAlign: TextAlign.end, style: AppText.rowTitle.copyWith(color: c.textPrimary)),
        ),
      ]),
    );
  }
}
