import 'dart:math';

import '../../data/app_repo.dart';
import '../../data/models.dart';
import '../../data/screen_time.dart';

/// Time range picked with the filter chips on the Insights tab.
enum InsightsPeriod { today, week, month }

/// Pure numbers for the Analytics view (computed from [AppRepo]).
class AnalyticsData {
  AnalyticsData(this.repo, this.period) {
    final t = dateOnly(repo.now());
    n = period == InsightsPeriod.month ? 30 : 7;
    days = [for (var i = n - 1; i >= 0; i--) t.subtract(Duration(days: i))];
    focus = [for (final d in days) repo.focusMinutesOn(d)];
    prevFocus = [for (final d in days) repo.focusMinutesOn(d.subtract(Duration(days: n)))];
    total = focus.fold(0, (a, b) => a + b);
    prevTotal = prevFocus.fold(0, (a, b) => a + b);
    goalTotal = repo.dailyFocusGoalMinutes * n;

    if (period == InsightsPeriod.month) {
      score = _avg([for (var k = 0; k < 4; k++) repo.productivityScore(t.subtract(Duration(days: 7 * k)))]);
      prevScore = _avg([for (var k = 4; k < 8; k++) repo.productivityScore(t.subtract(Duration(days: 7 * k)))]);
      scoreLine = [for (final d in days) repo.productivityScore(d)];
    } else {
      score = repo.productivityScore(t);
      prevScore = repo.productivityScore(t.subtract(const Duration(days: 7)));
      scoreLine = repo.scoreLast7;
    }

    focusRing = min(1.0, total / max(1, goalTotal));
    consistency = days.where((d) => repo.focusMinutesOn(d) > 0).length / n;
    goalDays = {for (final g in repo.goals) g.id: days.where((d) => repo.goalMetOn(g, d)).length};
    goalsRing = repo.goals.isEmpty ? 0 : goalDays.values.fold(0, (a, b) => a + b) / (repo.goals.length * n);

    // Chart: this week Mon–Sun, or every day of the last 30.
    if (period == InsightsPeriod.month) {
      chartDays = days;
      chart = focus;
      highlight = n - 1;
    } else {
      final monday = t.subtract(Duration(days: t.weekday - 1));
      chartDays = [for (var i = 0; i < 7; i++) monday.add(Duration(days: i))];
      chart = repo.weekFocusMinutes;
      highlight = t.weekday - 1;
    }
    final elapsed = period == InsightsPeriod.month ? n : t.weekday;
    avgPerDay = chart.take(elapsed).fold(0, (a, b) => a + b) ~/ max(1, elapsed);
    var bi = 0;
    for (var i = 0; i < chart.length; i++) {
      if (chart[i] > chart[bi]) bi = i;
    }
    bestIndex = chart.isEmpty || chart[bi] == 0 ? null : bi;

    weeks = repo.last4WeeksFocus;
    weekGoal = repo.dailyFocusGoalMinutes * 7;
  }

  final AppRepo repo;
  final InsightsPeriod period;
  late final int n;
  late final List<DateTime> days;
  late final List<int> focus, prevFocus;
  late final int total, prevTotal, goalTotal;
  late final int score, prevScore;
  late final List<int> scoreLine;
  late final double focusRing, goalsRing, consistency;
  late final Map<String, int> goalDays;
  late final List<DateTime> chartDays;
  late final List<int> chart;
  late final int highlight;
  late final int avgPerDay;
  late final int? bestIndex;
  late final List<int> weeks;
  late final int weekGoal;

  int get scoreDelta => score - prevScore;
  int get focusDelta => total - prevTotal;

  static int _avg(List<int> v) => (v.fold(0, (a, b) => a + b) / v.length).round();
}

/// Numbers for the Screen Time view (per-app usage from [ScreenTime.instance]).
class ScreenTimeData {
  ScreenTimeData(this.repo, this.period, [ScreenTimeSource? src]) {
    final s = src ?? ScreenTime.instance;
    final t = dateOnly(repo.now());
    int usage(DateTime d) => d.isAfter(t) ? 0 : s.totalOn(d);

    switch (period) {
      case InsightsPeriod.today:
        range = [t];
        prevRange = [for (var i = 7; i >= 1; i--) t.subtract(Duration(days: i))];
      case InsightsPeriod.week:
        final monday = t.subtract(Duration(days: t.weekday - 1));
        range = [for (var i = 0; i < t.weekday; i++) monday.add(Duration(days: i))];
        prevRange = [for (var i = 0; i < 7; i++) monday.subtract(Duration(days: 7 - i))];
      case InsightsPeriod.month:
        range = [for (var i = 29; i >= 0; i--) t.subtract(Duration(days: i))];
        prevRange = [for (var i = 59; i >= 30; i--) t.subtract(Duration(days: i))];
    }
    final totals = {
      for (final d in {...range, ...prevRange}) d: usage(d),
    };
    dailyAvg = range.map((d) => totals[d]!).fold(0, (a, b) => a + b) ~/ range.length;
    prevDailyAvg = prevRange.map((d) => totals[d]!).fold(0, (a, b) => a + b) ~/ prevRange.length;
    focus = range.map(repo.focusMinutesOn).fold(0, (a, b) => a + b);
    // Compare like with like: the same number of days just before.
    final before = [for (final d in range) d.subtract(Duration(days: period == InsightsPeriod.month ? 30 : (period == InsightsPeriod.week ? 7 : 1)))];
    prevFocus = before.map(repo.focusMinutesOn).fold(0, (a, b) => a + b);

    // Bars: this week by day, or the last 4 weeks.
    if (period == InsightsPeriod.month) {
      bars = [
        for (var w = 3; w >= 0; w--)
          (
            day: t.subtract(Duration(days: w * 7 + 6)),
            usage: [for (var i = 0; i < 7; i++) usage(t.subtract(Duration(days: w * 7 + i)))].fold(0, (a, b) => a + b),
            focus: [for (var i = 0; i < 7; i++) repo.focusMinutesOn(t.subtract(Duration(days: w * 7 + i)))].fold(0, (a, b) => a + b),
          ),
      ];
      highlight = 3;
    } else {
      final monday = t.subtract(Duration(days: t.weekday - 1));
      bars = [for (var i = 0; i < 7; i++) (day: monday.add(Duration(days: i)), usage: usage(monday.add(Duration(days: i))), focus: repo.focusMinutesOn(monday.add(Duration(days: i))))];
      highlight = t.weekday - 1;
    }

    trendDays = period == InsightsPeriod.month ? 30 : 14;
    trend = [for (var i = trendDays - 1; i >= 0; i--) usage(t.subtract(Duration(days: i)))];
    final half = trendDays ~/ 2;
    improving = trend.skip(half).fold(0, (a, b) => a + b) <= trend.take(half).fold(0, (a, b) => a + b);

    final perApp = <String, int>{};
    final cat = <String, String>{};
    for (final d in range) {
      for (final u in s.usageOn(d)) {
        perApp[u.appId] = (perApp[u.appId] ?? 0) + u.minutes;
        cat[u.appId] = u.category;
      }
    }
    apps = [for (final e in perApp.entries) AppUsage(e.key, cat[e.key]!, e.value ~/ range.length)]..sort((a, b) => b.minutes.compareTo(a.minutes));
    rangeTotal = perApp.values.fold(0, (a, b) => a + b);
    final byCat = <String, int>{};
    for (final e in perApp.entries) {
      byCat[cat[e.key]!] = (byCat[cat[e.key]!] ?? 0) + e.value;
    }
    categories = byCat.entries.toList()..sort((a, b) => b.value.compareTo(a.value));
    isDemo = s.isDemo;
  }

  final AppRepo repo;
  final InsightsPeriod period;
  late final List<DateTime> range, prevRange;
  late final int dailyAvg, prevDailyAvg, focus, prevFocus;
  late final List<({DateTime day, int usage, int focus})> bars;
  late final int highlight;
  late final int trendDays;
  late final List<int> trend;
  late final bool improving;

  /// Average minutes per day for each app in the range, biggest first.
  late final List<AppUsage> apps;
  late final int rangeTotal;
  late final List<MapEntry<String, int>> categories;
  late final bool isDemo;

  /// Percentage change of daily usage vs the period before (negative = less).
  int get usageChangePct => prevDailyAvg == 0 ? 0 : ((dailyAvg - prevDailyAvg) * 100 / prevDailyAvg).round();
  int get focusChangePct => prevFocus == 0 ? (focus > 0 ? 100 : 0) : ((focus - prevFocus) * 100 / prevFocus).round();
}
