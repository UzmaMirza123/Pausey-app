import 'package:flutter/material.dart';

import '../../widgets/glow_background.dart';
import 'package:intl/intl.dart' show DateFormat;

import '../../data/app_repo.dart';
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

/// Profile (opened from Settings).
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key, this.pushed = false});

  /// Opened as its own page (from Settings): back arrow, and "Settings" just goes back.
  final bool pushed;

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
        void settings() => pushed ? Navigator.of(context).maybePop() : _push(context, const SettingsScreen());
        final page = PageList(
          header: ScreenHeader(
            title: l.navProfile,
            onBack: pushed ? () => Navigator.of(context).maybePop() : null,
            trailing: RoundIconButton(icon: Icons.settings_rounded, tooltip: l.profileSettings, onTap: settings),
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
            FadeIn(
              delay: 4,
              child: PGroup(children: [
                PListTile(icon: Icons.flag_rounded, color: Tone.green, title: l.profileMyGoals, onTap: () => _push(context, const GoalsScreen())),
                PListTile(icon: Icons.local_fire_department_rounded, color: Tone.amber, title: l.profileStreaks, onTap: () => _push(context, const StreaksScreen())),
                PListTile(
                  icon: Icons.credit_card_rounded,
                  color: Tone.indigo,
                  title: l.profileSubscription,
                  subtitle: r.premium ? l.profileProActive : l.profileFree,
                  onTap: () => _push(context, const PaywallScreen()),
                ),
                PListTile(icon: Icons.settings_rounded, title: l.profileSettings, onTap: settings),
              ]),
            ),
            SignOutCard(onTap: () => confirmSignOut(context)),
          ],
        );
        if (!pushed) return page;
        return Scaffold(backgroundColor: Colors.transparent, body: GlowBackground(child: SafeArea(child: page)));
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
                      onTap: isGuest ? () => openSignUp(context) : onPaywall,
                      borderRadius: BorderRadius.circular(AppRadius.chip),
                      child: isGuest
                          ? Pill(l.signUp, color: Tone.violet, icon: Icons.person_add_alt_1_rounded)
                          : r.premium
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

