import 'package:flutter/material.dart';

import '../../services/auth_service.dart';
import '../../services/local_store.dart';
import '../../utils/app_theme.dart';
import '../../utils/l10n.dart';
import '../../widgets/common.dart';
import '../../widgets/glow_background.dart';
import '../../widgets/pausey_logo.dart';
import '../auth/auth_welcome_screen.dart';
import '../auth/auth_widgets.dart';
import '../auth/sign_up_screen.dart';

/// Placeholder home after sign-in: greets the user and shows what they chose
/// in onboarding (read from local storage). Replace with the real dashboard.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final c = context.colors;
    final session = AuthService.instance.value;
    final isGuest = session is GuestSession;
    final name = session.displayName;
    final a = LocalStore.instance.answers;

    String text(Object? v) {
      if (v == null) return l.homeNotSet;
      if (v is List) return v.isEmpty ? l.homeNotSet : v.join(', ');
      return '$v';
    }

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: GlowBackground(
        child: SafeArea(
          child: ListView(
            padding: const EdgeInsets.fromLTRB(AppSpacing.gutter, 12, AppSpacing.gutter, 24),
            children: [
              Row(
                children: [
                  const PauseyLogo(size: 40),
                  const SizedBox(width: 8),
                  Text(l.appName, style: AppText.stat.copyWith(fontSize: 20, color: c.textPrimary)),
                  const Spacer(),
                  const LanguageButton(),
                  const SizedBox(width: 8),
                  const ThemeToggleButton(),
                ],
              ),
              const SizedBox(height: 28),
              EnterUp(
                child: Text(name.isEmpty ? l.homeHelloGuest : l.homeHello(name), style: AppText.h1.copyWith(color: c.textPrimary)),
              ),
              const SizedBox(height: 6),
              EnterUp(
                delay: const Duration(milliseconds: 80),
                child: Text(l.homeSubtitle, style: AppText.body.copyWith(color: c.textSecondary)),
              ),
              if (isGuest) ...[
                const SizedBox(height: 14),
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
                    decoration: BoxDecoration(
                      color: AppPalette.gold.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(99),
                      border: Border.all(color: AppPalette.gold.withValues(alpha: 0.35)),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.smartphone_rounded, size: 14, color: AppPalette.gold),
                        const SizedBox(width: 6),
                        Text(l.homeGuestBadge, style: AppText.caption.copyWith(fontSize: 12, fontWeight: FontWeight.w700, color: c.textPrimary)),
                      ],
                    ),
                  ),
                ),
              ],
              const SizedBox(height: 24),
              _InfoTile(icon: Icons.flag_rounded, color: AppPalette.violet, label: l.homeDailyGoal, value: text(a['dailyGoalHours'] == null ? null : '${a['dailyGoalHours']}h')),
              const SizedBox(height: 12),
              _InfoTile(icon: Icons.phone_android_rounded, color: AppPalette.coral, label: l.homeScreenTime, value: text(a['screenTime'])),
              const SizedBox(height: 12),
              _InfoTile(icon: Icons.lock_rounded, color: AppPalette.teal, label: l.homeLockedApps, value: text(a['lockedApps'])),
              const SizedBox(height: 28),
              if (isGuest) ...[
                PrimaryButton(label: l.homeCreateAccount, onPressed: () => Navigator.of(context).push(authRoute(const SignUpScreen()))),
                const SizedBox(height: 12),
              ],
              TextButton.icon(
                onPressed: () => _confirmSignOut(context, isGuest),
                icon: const Icon(Icons.logout_rounded, size: 18, color: AppPalette.coral),
                label: Text(l.signOut, style: AppText.option.copyWith(color: AppPalette.coral)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _confirmSignOut(BuildContext context, bool guest) async {
    final l = context.l10n;
    if (!guest) {
      await AuthService.instance.signOut();
      return;
    }
    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(l.signOut),
        content: Text(l.signOutGuestWarn),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx, false), child: Text(l.cancel)),
          TextButton(onPressed: () => Navigator.pop(ctx, true), child: Text(l.signOut, style: const TextStyle(color: AppPalette.coral))),
        ],
      ),
    );
    if (ok == true) await AuthService.instance.signOut();
  }
}

class _InfoTile extends StatelessWidget {
  const _InfoTile({required this.icon, required this.color, required this.label, required this.value});

  final IconData icon;
  final Color color;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    return GlassCard(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: color.withValues(alpha: 0.14)),
            child: Icon(icon, color: color, size: 20),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: AppText.caption.copyWith(fontSize: 12, color: c.textMuted)),
                const SizedBox(height: 2),
                Text(value, style: AppText.option.copyWith(fontSize: 16, fontWeight: FontWeight.w700, color: c.textPrimary)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
