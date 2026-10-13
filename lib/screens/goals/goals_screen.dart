import 'dart:math';

import 'package:flutter/material.dart';

import '../../data/app_repo.dart';
import '../../data/models.dart';
import '../../utils/app_theme.dart';
import '../../utils/l10n.dart';
import '../../widgets/glow_background.dart';
import '../../widgets/ui_kit.dart';
import 'goal_detail_screen.dart';
import 'widgets/goal_ui.dart';

enum _Filter { all, active, done, focus, discipline, wellness }

/// My Goals: summary, filters and every goal with its progress.
class GoalsScreen extends StatefulWidget {
  const GoalsScreen({super.key});

  @override
  State<GoalsScreen> createState() => _GoalsScreenState();
}

class _GoalsScreenState extends State<GoalsScreen> {
  _Filter _filter = _Filter.all;

  bool _matches(AppRepo r, Goal g) => switch (_filter) {
        _Filter.all => true,
        _Filter.active => !r.goalDone(g),
        _Filter.done => r.goalDone(g),
        _Filter.focus => g.category == GoalCategory.focus,
        _Filter.discipline => g.category == GoalCategory.discipline,
        _Filter.wellness => g.category == GoalCategory.wellness,
      };

  /// Average weekly progress of the 7 days before this week's window.
  double _lastWeekCompletion(AppRepo r) {
    if (r.goals.isEmpty) return 0;
    final today = dateOnly(r.now());
    var sum = 0.0;
    for (final g in r.goals) {
      var met = 0;
      for (var i = 7; i < 14; i++) {
        if (r.goalMetOn(g, today.subtract(Duration(days: i)))) met++;
      }
      sum += (met / max(1, goalWeekTarget(g))).clamp(0.0, 1.0);
    }
    return sum / r.goals.length;
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
              final done = r.goals.where(r.goalDone).length;
              final active = r.goals.length - done;
              final shown = r.goals.where((g) => _matches(r, g)).toList();
              return ListView(
                padding: const EdgeInsets.only(bottom: 40),
                children: [
                  ScreenHeader(
                    title: l.goalsTitle,
                    subtitle: l.goalsSubtitle(active, done),
                    onBack: Navigator.of(context).canPop() ? () => Navigator.of(context).maybePop() : null,
                    trailing: _AddButton(onTap: () => openNewGoal(context)),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(AppSpacing.gutter, 8, AppSpacing.gutter, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        if (r.goals.isEmpty)
                          StateMessage(
                            icon: Icons.flag_rounded,
                            color: Tone.violet,
                            badge: l.goalsEmptyBadge,
                            title: l.goalsEmptyTitle,
                            message: l.goalsEmptyMsg,
                            primaryLabel: l.goalsCreateNew,
                            onPrimary: () => openNewGoal(context),
                          )
                        else ...[
                          Row(children: [
                            Expanded(child: StatTile(icon: Icons.check_circle_outline_rounded, value: '$done', label: l.goalsCompleted, color: Tone.green, onTap: () => setState(() => _filter = _Filter.done))),
                            const SizedBox(width: 10),
                            Expanded(child: StatTile(icon: Icons.schedule_rounded, value: '$active', label: l.goalsActive, color: Tone.violet, onTap: () => setState(() => _filter = _Filter.active))),
                            const SizedBox(width: 10),
                            Expanded(child: StatTile(icon: Icons.local_fire_department_rounded, value: '${r.streak}', label: l.goalsStreak, color: Tone.amber)),
                          ]),
                          const SizedBox(height: AppSpacing.section),
                          _OverallCard(repo: r, lastWeek: _lastWeekCompletion(r)),
                          const SizedBox(height: AppSpacing.section),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(children: [
                              for (final f in _Filter.values) ...[
                                ChoiceChipP(label: _filterLabel(l, f), selected: _filter == f, onTap: () => setState(() => _filter = f)),
                                const SizedBox(width: 8),
                              ],
                            ]),
                          ),
                          const SizedBox(height: AppSpacing.section),
                          if (shown.isEmpty)
                            PCard(
                              child: Column(children: [
                                Icon(Icons.filter_alt_off_rounded, color: context.colors.textMuted),
                                const SizedBox(height: 8),
                                Text(l.goalsFilterEmpty, textAlign: TextAlign.center, style: AppText.rowSub.copyWith(color: context.colors.textSecondary)),
                                const SizedBox(height: 8),
                                LinkText(l.goalsFilterAll, onTap: () => setState(() => _filter = _Filter.all)),
                              ]),
                            ),
                          for (var i = 0; i < shown.length; i++) ...[
                            _Entrance(index: i, child: _GoalCard(key: ValueKey(shown[i].id), goal: shown[i], repo: r)),
                            const SizedBox(height: 12),
                          ],
                          const SizedBox(height: 4),
                          _CreateButton(onTap: () => openNewGoal(context)),
                          if (!r.premium) ...[
                            const SizedBox(height: 10),
                            Text(l.goalsFreeLimit(AppRepo.freeMaxGoals), textAlign: TextAlign.center, style: AppText.rowSub.copyWith(color: context.colors.textMuted)),
                          ],
                        ],
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

  String _filterLabel(AppLocalizations l, _Filter f) => switch (f) {
        _Filter.all => l.goalsFilterAll,
        _Filter.active => l.goalsActive,
        _Filter.done => l.goalsDone,
        _Filter.focus => l.goalsCatFocus,
        _Filter.discipline => l.goalsCatDiscipline,
        _Filter.wellness => l.goalsCatWellness,
      };
}

class _AddButton extends StatelessWidget {
  const _AddButton({required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppRadius.chip),
        child: Ink(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          decoration: BoxDecoration(gradient: heroGradient, borderRadius: BorderRadius.circular(AppRadius.chip)),
          child: Row(mainAxisSize: MainAxisSize.min, children: [
            const Icon(Icons.add_rounded, size: 18, color: Colors.white),
            const SizedBox(width: 6),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 110),
              child: Text(context.l10n.goalsAdd, maxLines: 1, overflow: TextOverflow.ellipsis, style: AppText.rowSub.copyWith(fontWeight: FontWeight.w700, color: Colors.white)),
            ),
          ]),
        ),
      ),
    );
  }
}

class _OverallCard extends StatelessWidget {
  const _OverallCard({required this.repo, required this.lastWeek});
  final AppRepo repo;
  final double lastWeek;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final r = repo;
    final pct = (r.overallGoalCompletion * 100).round();
    final hit = r.goals.fold(0, (a, g) => a + r.goalDaysThisWeek(g).clamp(0, goalWeekTarget(g)));
    final total = r.goals.fold(0, (a, g) => a + goalWeekTarget(g));
    final delta = ((r.overallGoalCompletion - lastWeek) * 100).round();
    final up = delta >= 0;
    return PCard(
      gradient: heroGradient,
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Row(children: [
          const Icon(Icons.track_changes_rounded, size: 18, color: Colors.white),
          const SizedBox(width: 8),
          Expanded(child: Text(l.goalsOverall, maxLines: 1, overflow: TextOverflow.ellipsis, style: AppText.cardTitle.copyWith(color: Colors.white))),
          TweenAnimationBuilder<double>(
            tween: Tween(begin: 0, end: pct.toDouble()),
            duration: const Duration(milliseconds: 700),
            builder: (_, v, _) => Text('${v.round()}%', style: AppText.cardTitle.copyWith(color: Colors.white)),
          ),
        ]),
        const SizedBox(height: 12),
        _WhiteBar(value: r.overallGoalCompletion),
        const SizedBox(height: 10),
        Row(children: [
          Expanded(child: Text(l.goalsWeeklyHit(hit, total), maxLines: 2, overflow: TextOverflow.ellipsis, style: AppText.rowSub.copyWith(color: Colors.white.withValues(alpha: 0.8)))),
          const SizedBox(width: 8),
          Icon(up ? Icons.trending_up_rounded : Icons.trending_down_rounded, size: 16, color: Colors.white),
          const SizedBox(width: 4),
          Flexible(
            child: Text(l.goalsVsLastWeek('${up ? '+' : ''}$delta%'),
                maxLines: 1, overflow: TextOverflow.ellipsis, style: AppText.rowSub.copyWith(fontWeight: FontWeight.w700, color: Colors.white)),
          ),
        ]),
      ]),
    );
  }
}

class _WhiteBar extends StatelessWidget {
  const _WhiteBar({required this.value});
  final double value;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(99),
      child: SizedBox(
        height: 8,
        child: Stack(children: [
          Container(color: Colors.white.withValues(alpha: 0.22)),
          TweenAnimationBuilder<double>(
            tween: Tween(begin: 0, end: value.clamp(0.0, 1.0)),
            duration: const Duration(milliseconds: 700),
            curve: Curves.easeOutCubic,
            builder: (_, v, _) => FractionallySizedBox(
              alignment: AlignmentDirectional.centerStart,
              widthFactor: v,
              child: Container(decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(99))),
            ),
          ),
        ]),
      ),
    );
  }
}

class _GoalCard extends StatelessWidget {
  const _GoalCard({super.key, required this.goal, required this.repo});
  final Goal goal;
  final AppRepo repo;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final c = context.colors;
    final g = goal;
    final r = repo;
    final done = r.goalDone(g);
    final p = goalShownProgress(r, g);
    final color = done ? Tone.green : g.tone;
    final streak = r.goalStreak(g);
    final checkedToday = g.isManual && r.goalMetOn(g, dateOnly(r.now()));
    return PCard(
      accent: done ? Tone.green : null,
      onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => GoalDetailScreen(goalId: g.id))),
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          IconBadge(icon: g.icon, color: color, size: 44),
          const SizedBox(width: 12),
          Expanded(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Wrap(spacing: 8, runSpacing: 4, crossAxisAlignment: WrapCrossAlignment.center, children: [
                Text(g.displayTitle(l), style: AppText.rowTitle.copyWith(color: c.textPrimary)),
                if (done) const GoalDonePill(),
              ]),
              const SizedBox(height: 4),
              Row(children: [
                Flexible(child: Text(goalCategoryLabel(l, g.category), maxLines: 1, overflow: TextOverflow.ellipsis, style: AppText.rowSub.copyWith(color: c.textMuted))),
                if (streak > 0) ...[
                  Padding(padding: const EdgeInsets.symmetric(horizontal: 6), child: Text('·', style: AppText.rowSub.copyWith(color: c.textMuted))),
                  const Icon(Icons.local_fire_department_rounded, size: 14, color: Tone.amber),
                  const SizedBox(width: 2),
                  Text(l.goalsStreakShort(streak), style: AppText.rowSub.copyWith(fontWeight: FontWeight.w700, color: Tone.amber)),
                ],
              ]),
              const SizedBox(height: 6),
              Text(g.description(l), maxLines: 2, overflow: TextOverflow.ellipsis, style: AppText.rowSub.copyWith(color: c.textSecondary)),
            ]),
          ),
          const SizedBox(width: 10),
          Ring(
            value: p,
            size: 48,
            stroke: 5,
            color: color,
            child: FittedBox(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Text('${(p * 100).round()}%', style: AppText.small.copyWith(color: c.textPrimary)),
              ),
            ),
          ),
        ]),
        const SizedBox(height: 14),
        GoalBar(value: p, color: color, height: 6),
        const SizedBox(height: 8),
        Row(children: [
          Expanded(child: Text(goalProgressText(l, r, g), maxLines: 1, overflow: TextOverflow.ellipsis, style: AppText.rowSub.copyWith(color: c.textMuted))),
          Text('${(p * 100).round()}%', style: AppText.rowSub.copyWith(fontWeight: FontWeight.w700, color: color)),
        ]),
        if (g.isManual) ...[
          const SizedBox(height: 12),
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: ChoiceChipP(
              icon: checkedToday ? Icons.check_circle_rounded : Icons.radio_button_unchecked_rounded,
              label: checkedToday ? l.goalsCheckedIn : l.goalsCheckIn,
              selected: checkedToday,
              onTap: () => checkInGoal(context, g),
            ),
          ),
        ],
      ]),
    );
  }
}

class _CreateButton extends StatelessWidget {
  const _CreateButton({required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    return PCard(
      onTap: onTap,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Icon(Icons.add_circle_outline_rounded, color: AppPalette.violet, size: 20),
        const SizedBox(width: 8),
        Flexible(child: Text(context.l10n.goalsCreateNew, maxLines: 1, overflow: TextOverflow.ellipsis, style: AppText.rowTitle.copyWith(color: c.textPrimary))),
      ]),
    );
  }
}

/// Fade + slide in, staggered by index.
class _Entrance extends StatelessWidget {
  const _Entrance({required this.index, required this.child});
  final int index;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: 1),
      duration: Duration(milliseconds: 350 + 70 * min(index, 6)),
      curve: Curves.easeOutCubic,
      builder: (_, v, ch) => Opacity(opacity: v, child: Transform.translate(offset: Offset(0, 16 * (1 - v)), child: ch)),
      child: child,
    );
  }
}
