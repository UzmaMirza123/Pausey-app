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
import 'widgets/my_apps_card.dart';

/// Home tab: today's focus, streak, goal, screen time, quick start, locked apps, upgrade.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: Listenable.merge([AppRepo.instance, AuthService.instance]),
      builder: (context, _) {
        final children = <Widget>[
          const _HeroRow(),
          const _GoalCard(),
          const _ScreenTimeCard(),
          const _QuickStartButton(),
          const MyAppsSection(),
          AppRepo.instance.premium ? const _ProActiveCard() : const _UpgradeCard(),
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

class _HeroRow extends StatelessWidget {
  const _HeroRow();

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final c = context.colors;
    final repo = AppRepo.instance;
    final today = repo.todayFocusMinutes;
    final yest = repo.yesterdayFocusMinutes;
    String? delta;
    if (yest > 0) {
      final p = ((today - yest) / yest * 100).round();
      delta = l.homeVsYesterday('${p >= 0 ? '+' : ''}$p');
    }
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 3,
            child: PCard(
              gradient: heroGradient,
              onTap: () => _goTab(context, AppTab.insights),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.schedule_rounded, size: 15, color: Colors.white),
                      const SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          l.homeTodayFocus,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppText.rowSub.copyWith(color: Colors.white.withValues(alpha: 0.9)),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  TweenAnimationBuilder<double>(
                    tween: Tween(begin: 0, end: today.toDouble()),
                    duration: const Duration(milliseconds: 900),
                    curve: Curves.easeOutCubic,
                    builder: (_, v, _) => FittedBox(
                      fit: BoxFit.scaleDown,
                      alignment: AlignmentDirectional.centerStart,
                      child: Text(
                        fmtMinutes(v.round(), h: l.unitH, m: l.unitM),
                        style: AppText.heroValue.copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Icon(delta == null ? Icons.bolt_rounded : (today >= yest ? Icons.trending_up_rounded : Icons.trending_down_rounded), size: 15, color: Colors.white),
                      const SizedBox(width: 5),
                      Expanded(
                        child: Text(
                          delta ?? (today == 0 ? l.homeStartToday : l.homeKeepGoing),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: AppText.rowSub.copyWith(fontSize: 12, color: Colors.white.withValues(alpha: 0.85)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            flex: 2,
            child: PCard(
              onTap: () => _push(context, const StreaksScreen()),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: AppSpacing.card),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.local_fire_department_rounded, size: 30, color: repo.streak > 0 ? Tone.amber : c.textMuted),
                  const SizedBox(height: 4),
                  Text('${repo.streak}', style: AppText.heroValue.copyWith(color: c.textPrimary)),
                  Text(
                    l.homeDayStreak,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppText.rowSub.copyWith(color: c.textMuted),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

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
    return PCard(
      onTap: () => _push(context, const GoalsScreen()),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CardTitle(
            icon: Icons.track_changes_rounded,
            title: l.homeTodayGoal,
            trailing: Text(
              '${fmtMinutes(done, h: l.unitH, m: l.unitM)} / ${fmtMinutes(goal, h: l.unitH, m: l.unitM)}',
              style: AppText.rowSub.copyWith(color: c.textMuted),
            ),
          ),
          const SizedBox(height: 14),
          PBar(value: p),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: Text(
                  l.homePctCompleted((p * 100).round()),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppText.rowSub.copyWith(color: c.textMuted),
                ),
              ),
              Icon(Icons.circle, size: 7, color: statusColor),
              const SizedBox(width: 6),
              Text(
                met ? l.homeGoalMet : (onTrack ? l.homeOnTrack : l.homeKeepGoing),
                style: AppText.rowSub.copyWith(fontWeight: FontWeight.w700, color: statusColor),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ScreenTimeCard extends StatelessWidget {
  const _ScreenTimeCard();

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
    final wd = DateFormat.E(Localizations.localeOf(context).toString());
    final labels = [for (final d in week) wd.format(d).characters.first.toUpperCase()];
    return PCard(
      onTap: () => _goTab(context, AppTab.insights),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CardTitle(
            icon: Icons.phone_iphone_rounded,
            color: Tone.amber,
            title: l.homeScreenTimeTitle,
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (st.isDemo) ...[Pill(l.sampleData, color: Tone.amber), const SizedBox(width: 6)],
                Text(l.homeToday, style: AppText.rowSub.copyWith(color: c.textMuted)),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 12,
            runSpacing: 4,
            children: [
              Text(
                fmtMinutes(todayMin, h: l.unitH, m: l.unitM),
                style: AppText.heroValue.copyWith(color: c.textPrimary),
              ),
              if (avg > 0)
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(better ? Icons.trending_down_rounded : Icons.trending_up_rounded, size: 16, color: better ? Tone.green : Tone.red),
                    const SizedBox(width: 4),
                    Text(
                      l.homeVsAvg('${pct > 0 ? '+' : ''}$pct'),
                      style: AppText.rowSub.copyWith(fontWeight: FontWeight.w700, color: better ? Tone.green : Tone.red),
                    ),
                  ],
                ),
            ],
          ),
          const SizedBox(height: 12),
          PillBars(values: values, labels: labels, highlight: today.weekday - 1, height: 44, color: Tone.violet),
        ],
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
        boxShadow: [BoxShadow(color: AppPalette.accent.withValues(alpha: 0.35), blurRadius: 22, offset: const Offset(0, 8))],
      ),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          onTap: () => _goTab(context, AppTab.focus),
          borderRadius: BorderRadius.circular(AppRadius.chip),
          child: Ink(
            height: 58,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppRadius.chip),
              gradient: const LinearGradient(colors: [AppPalette.accent, AppPalette.violet]),
            ),
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

class _UpgradeCard extends StatelessWidget {
  const _UpgradeCard();

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final c = context.colors;
    void open() => _push(context, const PaywallScreen());
    return PCard(
      accent: Tone.violet,
      onTap: open,
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: const BoxDecoration(shape: BoxShape.circle, gradient: heroGradient),
            child: const Icon(Icons.workspace_premium_rounded, color: Colors.white, size: 24),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  spacing: 8,
                  runSpacing: 4,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Text(
                      l.homeUpgradeTitle,
                      style: AppText.rowTitle.copyWith(fontWeight: FontWeight.w800, color: c.textPrimary),
                    ),
                    Pill(l.homePro, filled: true),
                  ],
                ),
                const SizedBox(height: 4),
                Text(l.homeUpgradeBody, style: AppText.rowSub.copyWith(fontSize: 12, color: c.textSecondary)),
              ],
            ),
          ),
          const SizedBox(width: 10),
          FilledButton(
            key: const ValueKey('home_try_free'),
            onPressed: open,
            style: FilledButton.styleFrom(
              backgroundColor: AppPalette.accent,
              foregroundColor: Colors.white,
              shape: const StadiumBorder(),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              textStyle: AppText.rowSub.copyWith(fontWeight: FontWeight.w700),
            ),
            child: Text(l.homeTryFree),
          ),
        ],
      ),
    );
  }
}

class _ProActiveCard extends StatelessWidget {
  const _ProActiveCard();

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final c = context.colors;
    return PCard(
      accent: Tone.green,
      child: Row(
        children: [
          const IconBadge(icon: Icons.workspace_premium_rounded, color: Tone.green),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l.homeProActive,
                  style: AppText.rowTitle.copyWith(fontWeight: FontWeight.w800, color: c.textPrimary),
                ),
                const SizedBox(height: 2),
                Text(l.homeProActiveBody, style: AppText.rowSub.copyWith(fontSize: 12, color: c.textSecondary)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
