import 'package:flutter/material.dart';
import 'package:intl/intl.dart' show DateFormat;

import '../../data/app_repo.dart';
import '../../data/models.dart';
import '../../utils/app_theme.dart';
import '../../utils/l10n.dart';
import '../../widgets/ui_kit.dart';
import '../goals/goal_detail_screen.dart';
import '../goals/goals_screen.dart';
import '../shell/app_shell.dart';
import 'insights_data.dart';
import 'widgets/insights_widgets.dart';

/// Insights tab — Analytics and Screen Time, switched with a segmented control.
class InsightsScreen extends StatefulWidget {
  const InsightsScreen({super.key, this.initialSegment = 0});

  /// 0 = Analytics, 1 = Screen Time.
  final int initialSegment;

  @override
  State<InsightsScreen> createState() => _InsightsScreenState();
}

class _InsightsScreenState extends State<InsightsScreen> {
  late int _segment = widget.initialSegment;
  InsightsPeriod _analyticsPeriod = InsightsPeriod.week;
  InsightsPeriod _screenPeriod = InsightsPeriod.week;

  String _periodLabel(InsightsPeriod p) => switch (p) {
    InsightsPeriod.today => context.l10n.insightsToday,
    InsightsPeriod.week => context.l10n.insightsWeek,
    InsightsPeriod.month => context.l10n.insightsMonth,
  };

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final loc = Localizations.localeOf(context).toString();
    return ListenableBuilder(
      listenable: AppRepo.instance,
      builder: (context, _) {
        final repo = AppRepo.instance;
        final now = repo.now();
        final analytics = _segment == 0;
        final header = ScreenHeader(
          title: analytics ? l.insightsAnalytics : l.insightsScreenTime,
          subtitle: analytics ? DateFormat.yMMMM(loc).format(now) : DateFormat.MMMMEEEEd(loc).format(now),
          trailing: analytics ? _analyticsChips() : _screenPeriodMenu(),
        );
        final List<Widget> body;
        if (analytics) {
          body = repo.sessions.isEmpty ? [_empty()] : _AnalyticsView(data: AnalyticsData(repo, _analyticsPeriod)).cards(context);
        } else {
          body = _ScreenTimeView(data: ScreenTimeData(repo, _screenPeriod)).cards(context);
        }
        final key = '$_segment-${analytics ? _analyticsPeriod.name : _screenPeriod.name}';
        return PageList(
          header: header,
          children: [
            InsightsSegment(labels: [l.insightsAnalytics, l.insightsScreenTime], index: _segment, onChanged: (i) => setState(() => _segment = i)),
            for (var i = 0; i < body.length; i++) FadeSlideIn(key: ValueKey('$key-$i'), index: i, child: body[i]),
          ],
        );
      },
    );
  }

  Widget _analyticsChips() => Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      for (final p in const [InsightsPeriod.week, InsightsPeriod.month]) ...[
        if (p == InsightsPeriod.month) const SizedBox(width: 6),
        ChoiceChipP(key: ValueKey('period_${p.name}'), label: _periodLabel(p), selected: _analyticsPeriod == p, onTap: () => setState(() => _analyticsPeriod = p)),
      ],
    ],
  );

  Widget _screenPeriodMenu() {
    final c = context.colors;
    return PopupMenuButton<InsightsPeriod>(
      key: const ValueKey('screen_period'),
      initialValue: _screenPeriod,
      onSelected: (p) => setState(() => _screenPeriod = p),
      position: PopupMenuPosition.under,
      color: context.isDark ? const Color(0xFF1E1A3A) : Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppRadius.tile)),
      itemBuilder: (_) => [
        for (final p in InsightsPeriod.values)
          PopupMenuItem(
            value: p,
            child: Text(_periodLabel(p), style: AppText.rowTitle.copyWith(color: c.textPrimary)),
          ),
      ],
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: c.glassFill,
          borderRadius: BorderRadius.circular(AppRadius.chip),
          border: Border.all(color: c.glassBorder),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.calendar_month_rounded, size: 15, color: AppPalette.violet),
            const SizedBox(width: 6),
            Text(
              _periodLabel(_screenPeriod),
              style: AppText.rowSub.copyWith(fontWeight: FontWeight.w700, color: c.textPrimary),
            ),
            Icon(Icons.keyboard_arrow_down_rounded, size: 18, color: c.textMuted),
          ],
        ),
      ),
    );
  }

  Widget _empty() {
    final l = context.l10n;
    return StateMessage(
      icon: Icons.insights_rounded,
      color: Tone.violet,
      badge: l.insightsEmptyBadge,
      title: l.insightsEmptyTitle,
      message: l.insightsEmptyBody,
      primaryLabel: l.insightsEmptyCta,
      onPrimary: () => AppShell.of(context)?.goTab(AppTab.focus),
    );
  }
}

/// Display title for a goal: the user's own, or a translated default.
String insightsGoalTitle(AppLocalizations l, Goal g) {
  if (g.title.trim().isNotEmpty) return g.title;
  String hrs(int min) => min % 60 == 0 ? '${min ~/ 60}' : (min / 60).toStringAsFixed(1);
  return switch (g.type) {
    GoalType.focusMinutes => l.insightsGoalFocus(hrs(g.target)),
    GoalType.blockApps => l.insightsGoalBlock,
    GoalType.sessions => l.insightsGoalPomo(g.target),
    GoalType.screenLimit => l.insightsGoalScreen(fmtMinutes(g.target, h: l.unitH, m: l.unitM)),
    GoalType.phoneFree => l.insightsGoalPhoneFree,
  };
}

String insightsCategory(AppLocalizations l, String c) => switch (c) {
  'social' => l.insightsCatSocial,
  'video' => l.insightsCatVideo,
  'games' => l.insightsCatGames,
  'shopping' => l.insightsCatShopping,
  'community' => l.insightsCatCommunity,
  _ => l.insightsCatOther,
};

String _fmtM(BuildContext context, int m) => fmtMinutes(m, h: context.l10n.unitH, m: context.l10n.unitM);

/// Icon + label row at the top of the small cards.
Widget _miniTitle(IconData icon, Color iconColor, String text, Color textColor) => Row(
  children: [
    Icon(icon, size: 16, color: iconColor),
    const SizedBox(width: 6),
    Expanded(
      child: Text(
        text,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: AppText.rowSub.copyWith(color: textColor),
      ),
    ),
  ],
);

// =============================================================================
// Analytics
// =============================================================================

class _AnalyticsView {
  _AnalyticsView({required this.data});
  final AnalyticsData data;

  bool get _month => data.period == InsightsPeriod.month;

  List<Widget> cards(BuildContext context) => [_hero(context), _focusAndRings(context), _chart(context), _trends(context), _goals(context)];

  Widget _hero(BuildContext context) {
    final l = context.l10n;
    final d = data.scoreDelta;
    final white70 = Colors.white.withValues(alpha: 0.75);
    return PCard(
      gradient: heroGradient,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.psychology_rounded, size: 16, color: Colors.white),
                        const SizedBox(width: 6),
                        Flexible(
                          child: Text(
                            l.insightsProductivity.toUpperCase(),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: AppText.small.copyWith(color: Colors.white, letterSpacing: 0.8),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        CountUp(
                          value: data.score,
                          style: AppText.heroValue.copyWith(color: Colors.white),
                        ),
                        const SizedBox(width: 6),
                        Text('/100', style: AppText.rowTitle.copyWith(color: white70)),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      runSpacing: 4,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                          decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.16), borderRadius: BorderRadius.circular(AppRadius.chip)),
                          child: DeltaText(text: l.insightsPts('${d >= 0 ? '+' : '−'}${d.abs()}'), up: d >= 0, good: d >= 0, onDark: true),
                        ),
                        Text(_month ? l.insightsVsLastMonth : l.insightsVsLastWeek, style: AppText.rowSub.copyWith(color: white70)),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              Ring(
                value: data.score / 100,
                size: 88,
                stroke: 9,
                color: Colors.white,
                track: Colors.white.withValues(alpha: 0.22),
                child: Text('${data.score}', style: AppText.cardTitle.copyWith(color: Colors.white)),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.fromLTRB(14, 12, 14, 8),
            decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.12), borderRadius: BorderRadius.circular(AppRadius.tile)),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        l.insightsScoreDays(data.scoreLine.length),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppText.rowSub.copyWith(color: Colors.white),
                      ),
                    ),
                    Text('${data.scoreLine.first} → ${data.scoreLine.last}', style: AppText.rowSub.copyWith(color: white70)),
                  ],
                ),
                const SizedBox(height: 6),
                SparkLine(values: data.scoreLine.map((e) => e.toDouble()).toList(), height: 54, onDark: true),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _focusAndRings(BuildContext context) {
    final l = context.l10n;
    final c = context.colors;
    final fd = data.focusDelta;
    Widget ring(double v, Color col, String label) => Column(
      children: [
        Ring(
          value: v,
          size: 64,
          stroke: 7,
          color: col,
          child: Text(
            '${(v * 100).round()}%',
            style: AppText.rowSub.copyWith(fontWeight: FontWeight.w800, color: c.textPrimary),
          ),
        ),
        const SizedBox(height: 6),
        Text(
          label,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: AppText.small.copyWith(color: c.textMuted),
        ),
      ],
    );
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 11,
            child: PCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _miniTitle(Icons.schedule_rounded, Tone.violet, l.insightsFocusHours, c.textSecondary),
                  const SizedBox(height: 8),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    alignment: AlignmentDirectional.centerStart,
                    child: Text(_fmtM(context, data.total), style: AppText.tileValue.copyWith(color: c.textPrimary)),
                  ),
                  const SizedBox(height: 6),
                  DeltaText(text: '${fd >= 0 ? '+' : '−'}${_fmtM(context, fd.abs())} ${_month ? l.insightsThisMonth : l.insightsThisWeek}', up: fd >= 0, good: fd >= 0),
                  const Spacer(),
                  const SizedBox(height: 14),
                  PBar(value: data.focusRing, height: 7),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          l.insightsGoalOf(_fmtM(context, data.total), _fmtM(context, data.goalTotal)),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: AppText.small.copyWith(color: c.textMuted),
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '${(data.focusRing * 100).round()}%',
                        style: AppText.small.copyWith(fontWeight: FontWeight.w800, color: Tone.violet),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            flex: 9,
            child: PCard(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
              child: Column(
                children: [
                  ring(data.focusRing, Tone.violet, l.insightsFocusScore),
                  const SizedBox(height: 12),
                  ring(data.goalsRing, Tone.green, l.insightsGoals),
                  const SizedBox(height: 12),
                  ring(data.consistency, Tone.amber, l.insightsConsistency),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _chart(BuildContext context) {
    final l = context.l10n;
    final c = context.colors;
    final loc = Localizations.localeOf(context).toString();
    final bi = data.bestIndex;
    final bestDay = bi == null ? null : (_month ? DateFormat.MMMd(loc) : DateFormat.E(loc)).format(data.chartDays[bi]);
    return PCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CardTitle(
            icon: Icons.bar_chart_rounded,
            title: _month ? l.insightsDailyFocus(data.n) : l.insightsWeeklyFocus,
            trailing: _month ? null : Text('${DateFormat.E(loc).format(data.chartDays.first)} – ${DateFormat.E(loc).format(data.chartDays.last)}', style: AppText.small.copyWith(color: c.textMuted)),
          ),
          const SizedBox(height: 18),
          if (_month)
            ThinBars(values: data.chart, highlight: data.highlight, labelFor: (i) => DateFormat.d(loc).format(data.chartDays[i]))
          else
            PillBars(values: data.chart.map((e) => e.toDouble()).toList(), labels: [for (final d in data.chartDays) DateFormat.EEEEE(loc).format(d)], highlight: data.highlight),
          const SizedBox(height: 12),
          Divider(height: 1, color: c.divider),
          const SizedBox(height: 12),
          Row(
            children: [
              const Icon(Icons.bolt_rounded, size: 16, color: Tone.violet),
              const SizedBox(width: 4),
              Expanded(
                child: Text(
                  bestDay == null ? '—' : l.insightsBestDay(bestDay, _fmtM(context, data.chart[bi!])),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppText.small.copyWith(color: c.textSecondary),
                ),
              ),
              const SizedBox(width: 8),
              Text(l.insightsAvgDay(_fmtM(context, data.avgPerDay)), style: AppText.small.copyWith(color: c.textMuted)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _trends(BuildContext context) {
    final l = context.l10n;
    final c = context.colors;
    var best = 0;
    for (var i = 0; i < data.weeks.length; i++) {
      if (data.weeks[i] > data.weeks[best]) best = i;
    }
    final diff = data.weeks[best] - data.weekGoal;
    final beat = diff >= 0;
    return PCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CardTitle(
            icon: Icons.calendar_month_rounded,
            color: Tone.amber,
            title: l.insightsMonthlyTrends,
            trailing: Wrap(
              spacing: 10,
              children: [
                LegendDot(color: Tone.violet, label: l.insightsActual),
                LegendDot(color: c.textMuted, label: l.insightsGoal, hollow: true),
              ],
            ),
          ),
          const SizedBox(height: 18),
          WeekTiles(values: data.weeks, goal: data.weekGoal, labels: [for (var i = 1; i <= 4; i++) l.insightsWk(i)]),
          const SizedBox(height: 12),
          Divider(height: 1, color: c.divider),
          const SizedBox(height: 12),
          Row(
            children: [
              Icon(beat ? Icons.check_circle_rounded : Icons.flag_rounded, size: 16, color: beat ? Tone.green : Tone.amber),
              const SizedBox(width: 6),
              Expanded(
                child: Text(beat ? l.insightsWeekBeat(best + 1, _fmtM(context, diff)) : l.insightsWeekShort(best + 1, _fmtM(context, -diff)), style: AppText.small.copyWith(color: c.textSecondary)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _goals(BuildContext context) {
    final l = context.l10n;
    final c = context.colors;
    final goals = data.repo.goals;
    final colors = [Tone.violet, Tone.green, Tone.amber, Tone.blue, Tone.indigo];
    final overall = (data.goalsRing * 100).round();
    void openGoals() => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const GoalsScreen()));
    return PCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CardTitle(
            icon: Icons.track_changes_rounded,
            color: Tone.green,
            title: l.insightsGoalCompletion,
            trailing: Pill('$overall%', color: Tone.green),
          ),
          const SizedBox(height: 10),
          if (goals.isEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(l.insightsNoGoals, style: AppText.rowSub.copyWith(color: c.textMuted)),
            ),
          for (var i = 0; i < goals.length; i++)
            Builder(
              builder: (context) {
                final g = goals[i];
                final met = data.goalDays[g.id] ?? 0;
                final full = met >= data.n;
                return InkWell(
                  borderRadius: BorderRadius.circular(12),
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => GoalDetailScreen(goalId: g.id))),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 7),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(full ? Icons.check_circle_rounded : Icons.radio_button_unchecked_rounded, size: 17, color: full ? Tone.green : c.textMuted),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                insightsGoalTitle(l, g),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: AppText.rowSub.copyWith(color: c.textPrimary),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(l.insightsDaysOf(met, data.n), style: AppText.small.copyWith(color: c.textMuted)),
                          ],
                        ),
                        const SizedBox(height: 7),
                        PBar(value: met / data.n, color: full ? Tone.green : colors[i % colors.length], height: 6),
                      ],
                    ),
                  ),
                );
              },
            ),
          Align(
            alignment: AlignmentDirectional.centerEnd,
            child: LinkText(l.insightsManageGoals, onTap: openGoals),
          ),
        ],
      ),
    );
  }
}

// =============================================================================
// Screen Time
// =============================================================================

class _ScreenTimeView {
  _ScreenTimeView({required this.data});
  final ScreenTimeData data;

  static const _catColors = {'social': Tone.violet, 'video': Tone.amber, 'shopping': Tone.green, 'games': Tone.indigo, 'community': Tone.blue, 'other': Tone.red};
  static const _appColors = [Tone.violet, Tone.amber, Tone.blue, Tone.green, Tone.red, Tone.indigo];

  List<Widget> cards(BuildContext context) => [_tops(context), _bars(context), _trend(context), _apps(context), _breakdown(context)];

  Widget _sample(BuildContext context, {bool onDark = false}) => data.isDemo ? Pill(context.l10n.sampleData, color: onDark ? Colors.white : Tone.amber) : const SizedBox.shrink();

  Widget _tops(BuildContext context) {
    final l = context.l10n;
    final c = context.colors;
    final u = data.usageChangePct, f = data.focusChangePct;
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: PCard(
              gradient: heroGradient,
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _miniTitle(Icons.smartphone_rounded, Colors.white, l.insightsDailyUsage, Colors.white),
                  const SizedBox(height: 8),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    alignment: AlignmentDirectional.centerStart,
                    child: Text(_fmtM(context, data.dailyAvg), style: AppText.tileValue.copyWith(color: Colors.white)),
                  ),
                  const SizedBox(height: 6),
                  DeltaText(text: '${u > 0 ? '+' : (u < 0 ? '−' : '')}${u.abs()}% ${l.insightsVsAvg}', up: u > 0, good: u <= 0, onDark: true),
                  if (data.isDemo) ...[const SizedBox(height: 8), _sample(context, onDark: true)],
                ],
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: PCard(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _miniTitle(Icons.bolt_rounded, Tone.violet, l.insightsFocusTime, c.textSecondary),
                  const SizedBox(height: 8),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    alignment: AlignmentDirectional.centerStart,
                    child: Text(_fmtM(context, data.focus), style: AppText.tileValue.copyWith(color: c.textPrimary)),
                  ),
                  const SizedBox(height: 6),
                  DeltaText(text: '${f >= 0 ? '+' : '−'}${f.abs()}%', up: f >= 0, good: f >= 0),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _bars(BuildContext context) {
    final l = context.l10n;
    final loc = Localizations.localeOf(context).toString();
    final month = data.period == InsightsPeriod.month;
    return PCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CardTitle(
            icon: Icons.bar_chart_rounded,
            title: month ? l.insightsUsageByWeek : l.insightsUsageByDay,
            trailing: Wrap(
              spacing: 10,
              children: [
                LegendDot(color: Tone.violet, label: l.insightsUsage),
                LegendDot(color: Tone.green, label: l.navFocus),
              ],
            ),
          ),
          const SizedBox(height: 18),
          StackedBars(
            a: [for (final b in data.bars) b.usage],
            b: [for (final b in data.bars) b.focus],
            labels: [for (var i = 0; i < data.bars.length; i++) month ? l.insightsWk(i + 1) : DateFormat.EEEEE(loc).format(data.bars[i].day)],
            highlight: data.highlight,
          ),
        ],
      ),
    );
  }

  Widget _trend(BuildContext context) {
    final l = context.l10n;
    final c = context.colors;
    final good = data.improving;
    return PCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CardTitle(
            icon: Icons.show_chart_rounded,
            color: Tone.green,
            title: l.insightsTrend(data.trendDays),
            trailing: DeltaText(text: good ? l.insightsImproving : l.insightsRising, up: !good, good: good),
          ),
          const SizedBox(height: 14),
          SparkLine(values: data.trend.map((e) => e.toDouble()).toList(), height: 70),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: Text(l.insightsDaysAgo(data.trendDays), style: AppText.small.copyWith(color: c.textMuted)),
              ),
              Text(l.insightsToday, style: AppText.small.copyWith(color: c.textMuted)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _appRow(BuildContext context, AppUsage u, int i, {Widget? trailing}) {
    final c = context.colors;
    final top = data.apps.isEmpty || data.apps.first.minutes == 0 ? 1 : data.apps.first.minutes;
    final pct = data.rangeTotal == 0 ? 0 : (u.minutes * data.range.length * 100 / data.rangeTotal).round();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: Row(
        children: [
          AppGlyph(u.appId, size: 38),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        u.appId,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppText.rowTitle.copyWith(color: c.textPrimary),
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(_fmtM(context, u.minutes), style: AppText.small.copyWith(color: c.textMuted)),
                  ],
                ),
                const SizedBox(height: 6),
                PBar(value: u.minutes / top, color: _appColors[i % _appColors.length], height: 6),
              ],
            ),
          ),
          const SizedBox(width: 10),
          SizedBox(
            width: 40,
            child: Text(
              '$pct%',
              textAlign: TextAlign.end,
              style: AppText.rowSub.copyWith(color: c.textSecondary),
            ),
          ),
          ?trailing,
        ],
      ),
    );
  }

  Widget _apps(BuildContext context) {
    final l = context.l10n;
    final c = context.colors;
    return PCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CardTitle(
            icon: Icons.phone_iphone_rounded,
            color: Tone.amber,
            title: l.insightsMostUsed,
            trailing: data.apps.isEmpty ? null : LinkText(l.seeAll, onTap: () => _allApps(context)),
          ),
          const SizedBox(height: 8),
          if (data.apps.isEmpty) Text(l.insightsNoUsage, style: AppText.rowSub.copyWith(color: c.textMuted)),
          for (var i = 0; i < data.apps.length && i < 5; i++) _appRow(context, data.apps[i], i),
        ],
      ),
    );
  }

  void _allApps(BuildContext context) {
    final messenger = ScaffoldMessenger.of(context);
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: context.isDark ? const Color(0xFF14122C) : Colors.white,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(AppRadius.card))),
      builder: (_) => ListenableBuilder(
        listenable: AppRepo.instance,
        builder: (sheet, _) {
          final l = sheet.l10n;
          final repo = AppRepo.instance;
          return SafeArea(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxHeight: MediaQuery.sizeOf(sheet).height * 0.8),
              child: ListView(
                shrinkWrap: true,
                padding: const EdgeInsets.fromLTRB(AppSpacing.gutter, 16, AppSpacing.gutter, 16),
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(l.insightsAllApps, style: AppText.cardTitle.copyWith(color: sheet.colors.textPrimary)),
                      ),
                      _sample(sheet),
                    ],
                  ),
                  const SizedBox(height: 8),
                  for (var i = 0; i < data.apps.length; i++)
                    Builder(
                      builder: (_) {
                        final id = data.apps[i].appId;
                        final managed = repo.apps.where((a) => a.id == id).firstOrNull;
                        final locked = managed?.locked ?? false;
                        return _appRow(
                          sheet,
                          data.apps[i],
                          i,
                          trailing: IconButton(
                            tooltip: l.insightsLockApp,
                            icon: Icon(locked ? Icons.lock_rounded : Icons.lock_open_rounded, color: locked ? Tone.violet : sheet.colors.textMuted, size: 20),
                            onPressed: locked
                                ? null
                                : () async {
                                    if (managed == null) {
                                      await repo.setManagedApps([...repo.apps.where((a) => a.locked).map((a) => a.id), id]);
                                    }
                                    await repo.setAppLocked(id, true);
                                    messenger.showSnackBar(SnackBar(content: Text(l.insightsLocked(id))));
                                  },
                          ),
                        );
                      },
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _breakdown(BuildContext context) {
    final l = context.l10n;
    final c = context.colors;
    final cats = data.categories;
    final total = data.rangeTotal == 0 ? 1 : data.rangeTotal;
    return PCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CardTitle(icon: Icons.pie_chart_rounded, title: l.insightsBreakdown, trailing: _sample(context)),
          const SizedBox(height: 16),
          Row(
            children: [
              Donut(
                values: [for (final e in cats) e.value.toDouble()],
                colors: [for (final e in cats) _catColors[e.key] ?? Tone.red],
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          _fmtM(context, data.dailyAvg),
                          style: AppText.rowSub.copyWith(fontWeight: FontWeight.w800, color: c.textPrimary),
                        ),
                      ),
                      Text(
                        l.insightsTotal,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppText.small.copyWith(color: c.textMuted),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  children: [
                    if (cats.isEmpty) Text(l.insightsNoUsage, style: AppText.rowSub.copyWith(color: c.textMuted)),
                    for (final e in cats.take(5))
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Row(
                          children: [
                            Container(
                              width: 8,
                              height: 8,
                              decoration: BoxDecoration(shape: BoxShape.circle, color: _catColors[e.key] ?? Tone.red),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                insightsCategory(l, e.key),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: AppText.rowSub.copyWith(color: c.textPrimary),
                              ),
                            ),
                            SizedBox(
                              width: 40,
                              child: PBar(value: e.value / total, color: _catColors[e.key] ?? Tone.red, height: 5),
                            ),
                            SizedBox(
                              width: 40,
                              child: Text(
                                '${(e.value * 100 / total).round()}%',
                                textAlign: TextAlign.end,
                                style: AppText.rowSub.copyWith(fontWeight: FontWeight.w700, color: c.textPrimary),
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
