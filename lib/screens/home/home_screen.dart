import 'package:flutter/material.dart';
import 'package:intl/intl.dart' show DateFormat;

import '../../data/app_repo.dart';
import '../../data/models.dart';
import '../../data/screen_time.dart';
import '../../services/auth_service.dart';
import '../../utils/app_theme.dart';
import '../../utils/l10n.dart';
import '../../widgets/ui_kit.dart';
import '../goals/goals_screen.dart';
import '../paywall/paywall_screen.dart';
import '../profile/streaks_screen.dart';
import '../shell/app_shell.dart';

/// Home tab: screen time (primary), focus + streak, daily goal, quick start, locked apps, slim upgrade row.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: Listenable.merge([AppRepo.instance, AuthService.instance]),
      builder: (context, _) {
        final children = <Widget>[
          const _ScreenTimeHero(),
          const _MetricsRow(),
          const _GoalCard(),
          const _QuickStartButton(),
          const _LockedAppsCard(),
          if (!AppRepo.instance.premium) const _UpgradeRow(),
        ];
        return PageList(
          header: const _Header(),
          children: [for (var i = 0; i < children.length; i++) _Entrance(index: i, child: children[i])],
        );
      },
    );
  }
}

/// Fade + slide up, staggered by [index]. Plays once (key-less TweenAnimationBuilder keeps its end value).
class _Entrance extends StatelessWidget {
  const _Entrance({required this.index, required this.child});
  final int index;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: 1),
      duration: Duration(milliseconds: 380 + index * 70),
      curve: Curves.easeOutCubic,
      builder: (_, t, c) => Opacity(
        opacity: t,
        child: Transform.translate(offset: Offset(0, 16 * (1 - t)), child: c),
      ),
      child: child,
    );
  }
}

void _goTab(BuildContext context, AppTab tab) => AppShell.of(context)?.goTab(tab);

void _push(BuildContext context, Widget screen) => Navigator.of(context).push(MaterialPageRoute(builder: (_) => screen));

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final c = context.colors;
    final hour = AppRepo.instance.now().hour;
    final greet = hour < 12 ? l.homeGoodMorning : (hour < 18 ? l.homeGoodAfternoon : l.homeGoodEvening);
    final greetIcon = hour < 12 ? Icons.wb_sunny_rounded : (hour < 18 ? Icons.wb_cloudy_rounded : Icons.nightlight_round);
    final name = AuthService.instance.value.displayName.trim();
    return Padding(
      padding: const EdgeInsets.fromLTRB(AppSpacing.gutter, 12, AppSpacing.gutter, 8),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        greet,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppText.rowSub.copyWith(color: c.textMuted),
                      ),
                    ),
                    const SizedBox(width: 6),
                    Icon(greetIcon, size: 14, color: Tone.amber),
                  ],
                ),
                const SizedBox(height: 2),
                Text(
                  name.isEmpty ? l.homeFriend : name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppText.screenTitle.copyWith(color: c.textPrimary),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          RoundIconButton(icon: Icons.notifications_none_rounded, tooltip: l.homeNotifications, onTap: () => _showNotifications(context)),
          const SizedBox(width: 10),
          Tooltip(
            message: l.navProfile,
            child: InkResponse(
              onTap: () => _goTab(context, AppTab.profile),
              radius: 26,
              child: Container(
                width: 44,
                height: 44,
                alignment: Alignment.center,
                decoration: const BoxDecoration(shape: BoxShape.circle, gradient: heroGradient),
                child: name.isEmpty
                    ? const Icon(Icons.person_rounded, color: Colors.white, size: 22)
                    : Text(name.characters.first.toUpperCase(), style: AppText.cardTitle.copyWith(color: Colors.white)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showNotifications(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: context.isDark ? const Color(0xFF14122C) : Colors.white,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(AppRadius.card))),
      builder: (ctx) => ListenableBuilder(
        listenable: AppRepo.instance,
        builder: (ctx, _) {
          final l = ctx.l10n;
          final c = ctx.colors;
          final s = AppRepo.instance.settings;
          Widget row(IconData icon, String title, bool v, void Function(AppSettings s, bool v) set) => PListTile(
            icon: icon,
            title: title,
            trailing: PSwitch(value: v, onChanged: (nv) => AppRepo.instance.updateSettings((s) => set(s, nv))),
          );
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(AppSpacing.gutter, 20, AppSpacing.gutter, 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CardTitle(icon: Icons.notifications_rounded, title: l.homeNotifications),
                  const SizedBox(height: 14),
                  Row(
                    children: [
                      const Icon(Icons.check_circle_rounded, size: 18, color: Tone.green),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(l.homeNoNotifications, style: AppText.rowSub.copyWith(color: c.textSecondary)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),
                  PGroup(
                    children: [
                      row(Icons.notifications_active_rounded, l.homePushLabel, s.push, (s, v) => s.push = v),
                      row(Icons.alarm_rounded, l.homeFocusReminder, s.focusReminder, (s, v) => s.focusReminder = v),
                      row(Icons.local_fire_department_rounded, l.homeStreakAlerts, s.streakAlerts, (s, v) => s.streakAlerts = v),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

/// Primary metric: today's screen time vs the 7-day average, with this week's bars.
class _ScreenTimeHero extends StatelessWidget {
  const _ScreenTimeHero();

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final c = context.colors;
    final repo = AppRepo.instance;
    final st = ScreenTime.instance;
    final today = dateOnly(repo.now());
    final monday = today.subtract(Duration(days: today.weekday - 1));
    final week = [for (var i = 0; i < 7; i++) monday.add(Duration(days: i))];
    final values = [for (final d in week) d.isAfter(today) ? 0.0 : st.totalOn(d).toDouble()];
    final todayMin = st.totalOn(today);
    final prev = [for (var i = 1; i <= 7; i++) st.totalOn(today.subtract(Duration(days: i)))];
    final avg = prev.reduce((a, b) => a + b) / 7;
    final pct = avg <= 0 ? 0 : ((todayMin - avg) / avg * 100).round();
    final better = pct <= 0;
    final trend = better ? Tone.green : Tone.red;
    final wd = DateFormat.E(Localizations.localeOf(context).toString());
    final labels = [for (final d in week) wd.format(d).characters.first.toUpperCase()];
    return PCard(
      onTap: () => _goTab(context, AppTab.insights),
      padding: const EdgeInsets.fromLTRB(20, 18, 20, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  l.homeScreenTimeTitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppText.rowSub.copyWith(fontWeight: FontWeight.w600, color: c.textSecondary),
                ),
              ),
              if (st.isDemo)
                Row(mainAxisSize: MainAxisSize.min, children: [
                  Icon(Icons.info_outline_rounded, size: 13, color: c.textMuted),
                  const SizedBox(width: 4),
                  Text(l.sampleData, style: AppText.small.copyWith(color: c.textMuted)),
                ])
              else
                Text(l.homeToday, style: AppText.small.copyWith(color: c.textMuted)),
            ],
          ),
          const SizedBox(height: 6),
          TweenAnimationBuilder<double>(
            tween: Tween(begin: 0, end: todayMin.toDouble()),
            duration: const Duration(milliseconds: 700),
            curve: Curves.easeOutCubic,
            builder: (_, v, _) => FittedBox(
              fit: BoxFit.scaleDown,
              alignment: AlignmentDirectional.centerStart,
              child: Text(fmtMinutes(v.round(), h: l.unitH, m: l.unitM), style: AppText.heroValue.copyWith(fontSize: 40, color: c.textPrimary)),
            ),
          ),
          if (avg > 0) ...[
            const SizedBox(height: 2),
            Row(children: [
              Icon(better ? Icons.south_east_rounded : Icons.north_east_rounded, size: 15, color: trend),
              const SizedBox(width: 4),
              Flexible(
                child: Text(
                  l.homeVsAvg('${pct > 0 ? '+' : ''}$pct'),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppText.rowSub.copyWith(fontWeight: FontWeight.w700, color: trend),
                ),
              ),
            ]),
          ],
          const SizedBox(height: 16),
          PillBars(values: values, labels: labels, highlight: today.weekday - 1, height: 56, color: Tone.violet, goal: avg > 0 ? avg : null),
          if (avg > 0) ...[
            const SizedBox(height: 8),
            Row(children: [
              CustomPaint(size: const Size(14, 1.5), painter: _Dash(c.textMuted)),
              const SizedBox(width: 6),
              Text(l.homeAvgLegend, style: AppText.small.copyWith(color: c.textMuted)),
            ]),
          ],
        ],
      ),
    );
  }
}

/// Supporting metrics: today's focus time and the current streak.
class _MetricsRow extends StatelessWidget {
  const _MetricsRow();

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final c = context.colors;
    final repo = AppRepo.instance;
    final today = repo.todayFocusMinutes;
    final yest = repo.yesterdayFocusMinutes;
    String sub;
    Color subColor = c.textMuted;
    if (yest > 0) {
      final p = ((today - yest) / yest * 100).round();
      sub = l.homeVsYesterday('${p >= 0 ? '+' : ''}$p');
      subColor = p >= 0 ? Tone.green : c.textMuted;
    } else {
      sub = today == 0 ? l.homeStartToday : l.homeKeepGoing;
    }
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: _MetricTile(
              icon: Icons.bolt_rounded,
              iconColor: AppPalette.accent,
              label: l.homeTodayFocus,
              value: fmtMinutes(today, h: l.unitH, m: l.unitM),
              sub: sub,
              subColor: subColor,
              onTap: () => _goTab(context, AppTab.insights),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: _MetricTile(
              icon: Icons.local_fire_department_rounded,
              iconColor: repo.streak > 0 ? Tone.amber : c.textMuted,
              label: l.homeDayStreak,
              value: '${repo.streak}',
              sub: l.days(repo.bestStreak),
              subPrefix: '${l.homeBest} ',
              onTap: () => _push(context, const StreaksScreen()),
            ),
          ),
        ],
      ),
    );
  }
}

class _MetricTile extends StatelessWidget {
  const _MetricTile({
    required this.icon,
    required this.iconColor,
    required this.label,
    required this.value,
    required this.sub,
    this.subColor,
    this.subPrefix = '',
    required this.onTap,
  });
  final IconData icon;
  final Color iconColor;
  final String label, value, sub, subPrefix;
  final Color? subColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    return PCard(
      onTap: onTap,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            Icon(icon, size: 16, color: iconColor),
            const SizedBox(width: 6),
            Expanded(
              child: Text(label, maxLines: 1, overflow: TextOverflow.ellipsis, style: AppText.rowSub.copyWith(fontWeight: FontWeight.w600, color: c.textSecondary)),
            ),
          ]),
          const SizedBox(height: 10),
          FittedBox(
            fit: BoxFit.scaleDown,
            alignment: AlignmentDirectional.centerStart,
            child: Text(value, style: AppText.tileValue.copyWith(color: c.textPrimary)),
          ),
          const SizedBox(height: 2),
          Text('$subPrefix$sub', maxLines: 2, overflow: TextOverflow.ellipsis, style: AppText.small.copyWith(letterSpacing: 0, color: subColor ?? c.textMuted)),
        ],
      ),
    );
  }
}

/// Daily focus goal with an accessible progress bar.
class _GoalCard extends StatelessWidget {
  const _GoalCard();

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final c = context.colors;
    final repo = AppRepo.instance;
    final goal = repo.dailyFocusGoalMinutes;
    final done = repo.todayFocusMinutes;
    final p = goal <= 0 ? 0.0 : (done / goal).clamp(0.0, 1.0);
    // "On track" = progress at least equals the share of the waking day (8:00–22:00) that has passed.
    final n = repo.now();
    final dayShare = ((n.hour + n.minute / 60 - 8) / 14).clamp(0.0, 1.0);
    final met = p >= 1;
    final onTrack = met || p >= dayShare;
    final statusColor = onTrack ? Tone.green : Tone.amber;
    final status = met ? l.homeGoalMet : (onTrack ? l.homeOnTrack : l.homeKeepGoing);
    final doneTxt = fmtMinutes(done, h: l.unitH, m: l.unitM);
    final goalTxt = fmtMinutes(goal, h: l.unitH, m: l.unitM);
    return PCard(
      onTap: () => _push(context, const GoalsScreen()),
      padding: const EdgeInsets.all(16),
      child: Semantics(
        label: '${l.homeTodayGoal}: ${l.homeGoalOf(doneTxt, goalTxt)}, ${l.homePctCompleted((p * 100).round())}, $status',
        excludeSemantics: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(children: [
              Expanded(
                child: Text(l.homeTodayGoal, maxLines: 1, overflow: TextOverflow.ellipsis, style: AppText.rowSub.copyWith(fontWeight: FontWeight.w600, color: c.textSecondary)),
              ),
              Icon(Icons.circle, size: 7, color: statusColor),
              const SizedBox(width: 6),
              Text(status, style: AppText.small.copyWith(letterSpacing: 0, fontWeight: FontWeight.w700, color: statusColor)),
            ]),
            const SizedBox(height: 8),
            Row(crossAxisAlignment: CrossAxisAlignment.baseline, textBaseline: TextBaseline.alphabetic, children: [
              Expanded(
                child: Text(l.homeGoalOf(doneTxt, goalTxt), maxLines: 2, overflow: TextOverflow.ellipsis, style: AppText.cardTitle.copyWith(color: c.textPrimary)),
              ),
              const SizedBox(width: 8),
              Text('${(p * 100).round()}%', style: AppText.rowTitle.copyWith(fontWeight: FontWeight.w800, color: c.textPrimary)),
            ]),
            const SizedBox(height: 10),
            PBar(value: p, color: met ? Tone.green : Tone.violet),
          ],
        ),
      ),
    );
  }
}

class _QuickStartButton extends StatelessWidget {
  const _QuickStartButton();

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppRadius.chip),
        boxShadow: [BoxShadow(color: AppPalette.accent.withValues(alpha: 0.22), blurRadius: 12, offset: const Offset(0, 4))],
      ),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          onTap: () => _goTab(context, AppTab.focus),
          borderRadius: BorderRadius.circular(AppRadius.chip),
          child: Ink(
            height: 56,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(AppRadius.chip), color: AppPalette.accent),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.bolt_rounded, color: Colors.white, size: 22),
                  const SizedBox(width: 10),
                  Flexible(
                    child: Text(
                      l.homeQuickStart,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppText.button.copyWith(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _LockedAppsCard extends StatelessWidget {
  const _LockedAppsCard();

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final c = context.colors;
    final repo = AppRepo.instance;
    final usage = {for (final u in ScreenTime.instance.usageOn(repo.now())) u.appId: u.minutes};
    final apps = repo.apps.where((a) => a.locked).toList()..sort((a, b) => (usage[b.id] ?? 0).compareTo(usage[a.id] ?? 0));
    final shown = apps.take(3).toList();
    return PCard(
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(children: [
            Expanded(
              child: Text(
                apps.isEmpty ? l.homeLockedApps : '${l.homeLockedApps} · ${apps.length}',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppText.rowSub.copyWith(fontWeight: FontWeight.w600, color: c.textSecondary),
              ),
            ),
            LinkText(repo.apps.isEmpty ? l.homeAddApps : l.homeManage, onTap: () => _goTab(context, AppTab.block)),
          ]),
          const SizedBox(height: 6),
          if (shown.isEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                children: [
                  const IconBadge(icon: Icons.shield_outlined, color: Tone.violet),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(l.homeNoApps, style: AppText.rowSub.copyWith(color: c.textSecondary)),
                  ),
                ],
              ),
            )
          else
            for (final a in shown)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Row(
                  children: [
                    AppGlyph(a.id, size: 32),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        a.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppText.rowTitle.copyWith(color: c.textPrimary),
                      ),
                    ),
                    if (usage[a.id] != null)
                      Text(
                        fmtMinutes(usage[a.id]!, h: l.unitH, m: l.unitM),
                        style: AppText.rowSub.copyWith(color: c.textMuted),
                      ),
                    const SizedBox(width: 10),
                    _LockToggle(app: a),
                  ],
                ),
              ),
        ],
      ),
    );
  }
}

class _LockToggle extends StatelessWidget {
  const _LockToggle({required this.app});
  final ManagedApp app;

  /// Status only (not tappable): filled lock when the app is locked.
  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final on = app.locked;
    return Container(
      key: ValueKey('home_lock_${app.id}'),
      width: 26,
      height: 26,
      decoration: BoxDecoration(shape: BoxShape.circle, color: on ? AppPalette.accent : c.glassFill),
      child: Icon(on ? Icons.lock_rounded : Icons.lock_open_rounded, size: 13, color: on ? Colors.white : c.textMuted),
    );
  }
}

/// Low-key upgrade entry (hidden for Pro users).
class _UpgradeRow extends StatelessWidget {
  const _UpgradeRow();

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final c = context.colors;
    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        key: const ValueKey('home_try_free'),
        onTap: () => _push(context, const PaywallScreen()),
        borderRadius: BorderRadius.circular(AppRadius.tile),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(AppRadius.tile), border: Border.all(color: c.glassBorder)),
          child: Row(children: [
            const Icon(Icons.workspace_premium_outlined, size: 20, color: AppPalette.accent),
            const SizedBox(width: 12),
            Expanded(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(l.homeUpgradeTitle, maxLines: 1, overflow: TextOverflow.ellipsis, style: AppText.rowTitle.copyWith(fontSize: 14, fontWeight: FontWeight.w700, color: c.textPrimary)),
                Text(l.homeUpgradeBody, maxLines: 1, overflow: TextOverflow.ellipsis, style: AppText.small.copyWith(letterSpacing: 0, color: c.textMuted)),
              ]),
            ),
            const SizedBox(width: 8),
            Icon(Directionality.of(context) == TextDirection.rtl ? Icons.chevron_left_rounded : Icons.chevron_right_rounded, color: c.textMuted),
          ]),
        ),
      ),
    );
  }
}

class _Dash extends CustomPainter {
  _Dash(this.color);
  final Color color;
  @override
  void paint(Canvas canvas, Size size) {
    final p = Paint()
      ..color = color
      ..strokeWidth = size.height;
    canvas.drawLine(Offset.zero, const Offset(4, 0), p);
    canvas.drawLine(const Offset(8, 0), const Offset(12, 0), p);
  }

  @override
  bool shouldRepaint(_Dash old) => old.color != color;
}
