import 'package:flutter/material.dart';
import 'package:intl/intl.dart' show DateFormat;

import '../../data/app_repo.dart';
import '../../data/models.dart';
import '../../services/auth_service.dart';
import '../../utils/app_theme.dart';
import '../../utils/l10n.dart';
import '../../widgets/ui_kit.dart';
import '../goals/goals_screen.dart';
import '../paywall/paywall_screen.dart';
import '../shell/app_shell.dart';
import 'settings_screen.dart';
import 'streaks_screen.dart';
import 'widgets/profile_kit.dart';

/// Profile tab.
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  void _push(BuildContext context, Widget w) => Navigator.of(context).push(MaterialPageRoute(builder: (_) => w));

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    return ListenableBuilder(
      listenable: Listenable.merge([AppRepo.instance, AuthService.instance]),
      builder: (context, _) {
        final r = AppRepo.instance;
        final shell = AppShell.of(context);
        final goalsDone = r.goals.where(r.goalDone).length;
        return PageList(
          header: ScreenHeader(
            title: l.navProfile,
            trailing: RoundIconButton(icon: Icons.settings_rounded, tooltip: l.profileSettings, onTap: () => _push(context, const SettingsScreen())),
          ),
          children: [
            FadeIn(child: _IdentityCard(onPaywall: () => _push(context, const PaywallScreen()), onStreaks: () => _push(context, const StreaksScreen()))),
            FadeIn(
              delay: 1,
              child: Column(children: [
                Row(children: [
                  Expanded(
                    child: StatTile(
                      icon: Icons.schedule_rounded,
                      value: fmtMinutes(r.totalFocusMinutes, h: l.unitH, m: l.unitM),
                      label: l.profileFocusTime,
                      progress: (r.totalFocusMinutes / (50 * 60)).clamp(0.0, 1.0),
                      onTap: () => shell?.goTab(AppTab.insights),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: StatTile(
                      icon: Icons.track_changes_rounded,
                      color: Tone.green,
                      value: '$goalsDone/${r.goals.length}',
                      label: l.profileGoalsDone,
                      progress: r.overallGoalCompletion,
                      onTap: () => _push(context, const GoalsScreen()),
                    ),
                  ),
                ]),
                const SizedBox(height: 12),
                Row(children: [
                  Expanded(
                    child: StatTile(
                      icon: Icons.local_fire_department_rounded,
                      color: Tone.amber,
                      value: '${r.streak}',
                      label: l.profileDayStreak,
                      progress: r.bestStreak == 0 ? 0 : r.streak / r.bestStreak,
                      onTap: () => _push(context, const StreaksScreen()),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: StatTile(
                      icon: Icons.shield_rounded,
                      color: Tone.blue,
                      value: '${r.lockedCount}',
                      label: l.profileAppsBlocked,
                      progress: r.apps.isEmpty ? 0 : r.lockedCount / r.apps.length,
                      onTap: () => shell?.goTab(AppTab.block),
                    ),
                  ),
                ]),
              ]),
            ),
            FadeIn(delay: 2, child: _Heatmap(onTap: () => _push(context, const StreaksScreen()))),
            FadeIn(delay: 3, child: _Recent(onSeeAll: () => shell?.goTab(AppTab.insights), onStart: () => shell?.goTab(AppTab.focus))),
            FadeIn(
              delay: 4,
              child: PGroup(children: [
                PListTile(icon: Icons.flag_rounded, color: Tone.green, title: l.profileMyGoals, onTap: () => _push(context, const GoalsScreen())),
                PListTile(icon: Icons.local_fire_department_rounded, color: Tone.amber, title: l.profileStreaks, onTap: () => _push(context, const StreaksScreen())),
                PListTile(
                  icon: Icons.credit_card_rounded,
                  color: Tone.pink,
                  title: l.profileSubscription,
                  subtitle: r.premium ? l.profileProActive : l.profileFree,
                  onTap: () => _push(context, const PaywallScreen()),
                ),
                PListTile(icon: Icons.settings_rounded, title: l.profileSettings, onTap: () => _push(context, const SettingsScreen())),
              ]),
            ),
            SignOutCard(onTap: () => confirmSignOut(context)),
          ],
        );
      },
    );
  }
}

class _IdentityCard extends StatelessWidget {
  const _IdentityCard({required this.onPaywall, required this.onStreaks});
  final VoidCallback onPaywall, onStreaks;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final c = context.colors;
    final r = AppRepo.instance;
    final name = profileName(context);
    final hasName = AuthService.instance.value.displayName.trim().isNotEmpty;
    final since = memberSince;
    final loc = Localizations.localeOf(context).toString();
    final unlocked = achievements(context, r).where((a) => a.unlocked).toList();
    return PCard(
      accent: Tone.violet,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ProfileAvatar(name: hasName ? name : null, size: 76),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(children: [
                      Flexible(child: Text(name, maxLines: 1, overflow: TextOverflow.ellipsis, style: AppText.cardTitle.copyWith(fontSize: 20, color: c.textPrimary))),
                      if (isGuest)
                        IconButton(
                          visualDensity: VisualDensity.compact,
                          tooltip: l.profileEditName,
                          icon: Icon(Icons.edit_rounded, size: 18, color: c.textMuted),
                          onPressed: () => editGuestName(context),
                        ),
                    ]),
                    Text(profileEmail ?? l.profileGuestBadge, maxLines: 1, overflow: TextOverflow.ellipsis, style: AppText.rowSub.copyWith(color: c.textSecondary)),
                    if (since != null)
                      Text(l.profileMemberSince(DateFormat.yMMM(loc).format(since)), maxLines: 1, overflow: TextOverflow.ellipsis, style: AppText.rowSub.copyWith(color: c.textMuted)),
                    const SizedBox(height: 8),
                    InkWell(
                      onTap: onPaywall,
                      borderRadius: BorderRadius.circular(AppRadius.chip),
                      child: r.premium
                          ? Pill(l.profileProActive, color: Tone.amber, icon: Icons.workspace_premium_rounded)
                          : Pill('${l.profileFree} · ${l.profileUpgrade}', color: Tone.violet, icon: Icons.workspace_premium_rounded),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(padding: const EdgeInsets.symmetric(vertical: 14), child: Divider(height: 1, color: c.divider)),
          InkWell(
            onTap: onStreaks,
            child: Row(
              children: [
                Text(l.profileBadges, style: AppText.rowSub.copyWith(color: c.textMuted)),
                const SizedBox(width: 10),
                Expanded(
                  child: unlocked.isEmpty
                      ? Text(l.profileNoBadges, maxLines: 2, overflow: TextOverflow.ellipsis, style: AppText.rowSub.copyWith(color: c.textSecondary))
                      : Wrap(spacing: 6, runSpacing: 6, children: [for (final a in unlocked.take(3)) Pill(a.title, color: a.color, icon: a.icon)]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Heatmap extends StatelessWidget {
  const _Heatmap({required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final c = context.colors;
    final r = AppRepo.instance;
    final loc = Localizations.localeOf(context).toString();
    final today = dateOnly(r.now());
    final monday = today.subtract(Duration(days: today.weekday - 1));
    final start = monday.subtract(const Duration(days: 21));
    final goal = r.dailyFocusGoalMinutes <= 0 ? 60 : r.dailyFocusGoalMinutes;
    return PCard(
      onTap: onTap,
      child: Column(
        children: [
          CardTitle(
            icon: Icons.show_chart_rounded,
            title: l.profileFocusActivity,
            trailing: Flexible(child: Text(l.profileLast4Weeks, maxLines: 1, overflow: TextOverflow.ellipsis, style: AppText.rowSub.copyWith(color: c.textMuted))),
          ),
          const SizedBox(height: 14),
          for (var w = 0; w < 4; w++)
            Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: Row(children: [
                for (var d = 0; d < 7; d++) Expanded(child: _cell(context, start.add(Duration(days: w * 7 + d)), today, r, goal)),
              ]),
            ),
          const SizedBox(height: 4),
          Row(children: [
            for (var d = 0; d < 7; d++)
              Expanded(
                child: Text(DateFormat.EEEEE(loc).format(monday.add(Duration(days: d))), textAlign: TextAlign.center, style: AppText.small.copyWith(color: c.textMuted)),
              ),
          ]),
        ],
      ),
    );
  }

  Widget _cell(BuildContext context, DateTime day, DateTime today, AppRepo r, int goal) {
    final future = day.isAfter(today);
    final m = r.focusMinutesOn(day);
    final t = (m / goal).clamp(0.0, 1.0);
    final color = m == 0 || future ? context.colors.dotInactive : Color.lerp(Tone.violet.withValues(alpha: 0.35), AppPalette.violet, t)!;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3),
      child: Tooltip(
        message: '${DateFormat.MMMd(Localizations.localeOf(context).toString()).format(day)} · ${fmtMinutes(m, h: context.l10n.unitH, m: context.l10n.unitM)}',
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          height: 22,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(8),
            border: day == today ? Border.all(color: AppPalette.violet, width: 1.5) : null,
          ),
        ),
      ),
    );
  }
}

class _Recent extends StatelessWidget {
  const _Recent({required this.onSeeAll, required this.onStart});
  final VoidCallback onSeeAll, onStart;

  String _ago(BuildContext context, DateTime t, DateTime now) {
    final l = context.l10n;
    final d = now.difference(t);
    if (d.inMinutes < 1) return l.profileJustNow;
    if (d.inHours < 1) return l.profileAgoMinutes(d.inMinutes);
    if (dateOnly(t) == dateOnly(now)) return l.profileAgoHours(d.inHours);
    if (dateOnly(t) == dateOnly(now).subtract(const Duration(days: 1))) return l.profileYesterday;
    return DateFormat.MMMd(Localizations.localeOf(context).toString()).format(t);
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final c = context.colors;
    final r = AppRepo.instance;
    if (r.sessions.isEmpty) {
      return StateMessage(
        icon: Icons.bolt_rounded,
        color: Tone.violet,
        badge: l.profileRecentActivity,
        title: l.profileEmptyTitle,
        message: l.profileEmptyBody,
        primaryLabel: l.profileStartFocus,
        onPrimary: onStart,
      );
    }
    final list = [...r.sessions]..sort((a, b) => b.start.compareTo(a.start));
    return PCard(
      padding: const EdgeInsets.fromLTRB(AppSpacing.card, AppSpacing.card, AppSpacing.card, 8),
      child: Column(
        children: [
          CardTitle(icon: Icons.history_rounded, title: l.profileRecentActivity, trailing: LinkText(l.seeAll, onTap: onSeeAll)),
          const SizedBox(height: 6),
          for (final s in list.take(4))
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(children: [
                IconBadge(icon: s.completed ? Icons.bolt_rounded : Icons.timer_off_rounded, color: s.completed ? Tone.violet : Tone.amber, size: 36),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text(s.completed ? l.profileSessionDone : l.profileSessionStopped, maxLines: 1, overflow: TextOverflow.ellipsis, style: AppText.rowTitle.copyWith(fontSize: 14, color: c.textPrimary)),
                    Text(
                      '${fmtMinutes(s.focusedMinutes, h: l.unitH, m: l.unitM)} · ${switch (s.mode) { FocusMode.pomodoro => l.profileModePomodoro, FocusMode.deep => l.profileModeDeep, FocusMode.custom => l.profileModeCustom }}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppText.rowSub.copyWith(fontSize: 12, color: c.textMuted),
                    ),
                  ]),
                ),
                const SizedBox(width: 8),
                Text(_ago(context, s.start, r.now()), style: AppText.rowSub.copyWith(fontSize: 12, color: c.textMuted)),
              ]),
            ),
        ],
      ),
    );
  }
}
