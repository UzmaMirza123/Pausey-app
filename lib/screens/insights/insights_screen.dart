import 'package:flutter/material.dart';
import 'package:intl/intl.dart' show DateFormat;

import '../../data/app_repo.dart';
import '../../data/models.dart';
import '../../utils/app_theme.dart';
import '../../utils/l10n.dart';
import '../../widgets/ui_kit.dart';
import 'insights_data.dart';
import 'widgets/insights_widgets.dart';

/// Insights tab — Screen Time only, with the Today / Week / Month selection.
class InsightsScreen extends StatefulWidget {
  const InsightsScreen({super.key});

  @override
  State<InsightsScreen> createState() => _InsightsScreenState();
}

class _InsightsScreenState extends State<InsightsScreen> {
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
        final header = ScreenHeader(
          title: l.insightsScreenTime,
          subtitle: DateFormat.MMMMEEEEd(loc).format(now),
          trailing: _screenPeriodMenu(),
        );
        final body = _ScreenTimeView(data: ScreenTimeData(repo, _screenPeriod)).cards(context);
        final key = _screenPeriod.name;
        return PageList(
          header: header,
          children: [
            for (var i = 0; i < body.length; i++) FadeSlideIn(key: ValueKey('$key-$i'), index: i, child: body[i]),
          ],
        );
      },
    );
  }

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
