import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../auth/sign_up_screen.dart';

import '../../../data/app_repo.dart';
import '../../../services/auth_service.dart';
import '../../../services/local_store.dart';
import '../../../utils/app_theme.dart';
import '../../../utils/l10n.dart';
import '../../../widgets/ui_kit.dart';

/// Shared bits for Profile, Settings and Streaks.

/// Display name for the current session (falls back to "Guest").
String profileName(BuildContext context) {
  final n = AuthService.instance.value.displayName.trim();
  return n.isEmpty ? context.l10n.profileGuestName : n;
}

bool get isGuest => AuthService.instance.value is GuestSession;

String? get profileEmail {
  final s = AuthService.instance.value;
  return s is AccountSession ? s.user.email : null;
}

DateTime? get memberSince {
  final s = AuthService.instance.value;
  return switch (s) {
    GuestSession(:final profile) => profile.createdAt,
    AccountSession(:final user) => user.metadata.creationTime,
    _ => null,
  };
}

String initials(String name) {
  final parts = name.trim().split(RegExp(r'\s+')).where((p) => p.isNotEmpty).toList();
  if (parts.isEmpty) return '?';
  final a = parts.first.characters.first;
  final b = parts.length > 1 ? parts.last.characters.first : '';
  return (a + b).toUpperCase();
}

/// Round avatar with initials (or a person icon for guests without a name).
class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({super.key, required this.name, this.size = 72, this.online = true});

  final String? name;
  final double size;
  final bool online;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        children: [
          Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: heroGradient,
              border: Border.all(color: AppPalette.violet.withValues(alpha: 0.7), width: 2),
            ),
            alignment: Alignment.center,
            child: name == null
                ? Icon(Icons.person_rounded, color: Colors.white, size: size * 0.5)
                : Text(initials(name!), style: AppText.tileValue.copyWith(color: Colors.white, fontSize: size * 0.34)),
          ),
          if (online)
            PositionedDirectional(
              end: size * 0.02,
              bottom: size * 0.04,
              child: Container(
                width: size * 0.2,
                height: size * 0.2,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Tone.green,
                  border: Border.all(color: context.isDark ? const Color(0xFF14122C) : Colors.white, width: 2),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

/// Rename the guest. AuthService has no rename API, so we update the stored
/// guest profile and re-publish the session.
Future<void> editGuestName(BuildContext context) async {
  final l10n = context.l10n;
  final ctrl = TextEditingController(text: AuthService.instance.value.displayName);
  final name = await showDialog<String>(
    context: context,
    builder: (ctx) => AlertDialog(
      title: Text(l10n.profileEditName),
      content: TextField(
        controller: ctrl,
        autofocus: true,
        maxLength: 30,
        textCapitalization: TextCapitalization.words,
        decoration: InputDecoration(hintText: l10n.profileNameHint),
        onSubmitted: (v) => Navigator.pop(ctx, v),
      ),
      actions: [
        TextButton(onPressed: () => Navigator.pop(ctx), child: Text(l10n.cancel)),
        FilledButton(onPressed: () => Navigator.pop(ctx, ctrl.text), child: Text(l10n.profileSave)),
      ],
    ),
  );
  if (name == null) return;
  try {
    await LocalStore.instance.updateGuestName(name.trim());
    final g = LocalStore.instance.guest;
    if (g != null) AuthService.instance.value = GuestSession(g);
  } catch (_) {}
}

/// Sign out with confirmation. Guests are warned their data is deleted.
Future<void> confirmSignOut(BuildContext context) async {
  final l10n = context.l10n;
  final guest = isGuest;
  final ok = await showDialog<bool>(
    context: context,
    builder: (ctx) => AlertDialog(
      title: Text(l10n.profileSignOutTitle),
      content: Text(guest ? l10n.signOutGuestWarn : l10n.profileSignOutBody),
      actions: [
        TextButton(onPressed: () => Navigator.pop(ctx, false), child: Text(l10n.cancel)),
        FilledButton(
          style: FilledButton.styleFrom(backgroundColor: Tone.red),
          onPressed: () => Navigator.pop(ctx, true),
          child: Text(l10n.signOut),
        ),
      ],
    ),
  );
  if (ok != true || !context.mounted) return;
  final nav = Navigator.of(context);
  await AuthService.instance.signOut();
  if (guest) AppRepo.instance.load();
  nav.popUntil((r) => r.isFirst);
}

/// Most sessions finished on a single day.
int maxSessionsInADay(AppRepo r) {
  final m = <String, int>{};
  for (final s in r.sessions.where((s) => s.completed)) {
    final k = dayKey(s.start);
    m[k] = (m[k] ?? 0) + 1;
  }
  return m.values.fold(0, math.max);
}

class Achievement {
  const Achievement(this.icon, this.color, this.title, this.desc, this.progress);
  final IconData icon;
  final Color color;
  final String title;
  final String desc;

  /// 0..1; 1 = unlocked.
  final double progress;
  bool get unlocked => progress >= 1;
}

List<Achievement> achievements(BuildContext context, AppRepo r) {
  final l = context.l10n;
  final best = r.bestStreak;
  double p(num v, num t) => (v / t).clamp(0.0, 1.0).toDouble();
  return [
    Achievement(Icons.local_fire_department_rounded, Tone.amber, l.profileAchOnFire, l.profileAchStreakDesc(7), p(best, 7)),
    Achievement(Icons.shield_rounded, Tone.green, l.profileAchIronWill, l.profileAchSessionsDesc(25), p(r.completedSessions, 25)),
    Achievement(Icons.star_rounded, Tone.violet, l.profileAchFocusMaster, l.profileAchHoursDesc(50), p(r.totalFocusMinutes, 50 * 60)),
    Achievement(Icons.self_improvement_rounded, Tone.blue, l.profileAchMonk, l.profileAchStreakDesc(21), p(best, 21)),
    Achievement(Icons.emoji_events_rounded, Tone.pink, l.profileAchLegend, l.profileAchStreakDesc(30), p(best, 30)),
    Achievement(Icons.bolt_rounded, Tone.red, l.profileAchSpeed, l.profileAchDayDesc(10), p(maxSessionsInADay(r), 10)),
  ];
}

/// Fades + slides a child in once.
class FadeIn extends StatelessWidget {
  const FadeIn({super.key, required this.child, this.delay = 0});
  final Widget child;
  final int delay;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: 1),
      duration: Duration(milliseconds: 380 + delay * 70),
      curve: Curves.easeOutCubic,
      builder: (_, t, c) => Opacity(opacity: t, child: Transform.translate(offset: Offset(0, (1 - t) * 14), child: c)),
      child: child,
    );
  }
}

/// Full-width red "Sign out" pill card.
class SignOutCard extends StatelessWidget {
  const SignOutCard({super.key, required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return PCard(
      onTap: onTap,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.logout_rounded, size: 18, color: Tone.red),
          const SizedBox(width: 8),
          Flexible(child: Text(context.l10n.signOut, maxLines: 1, overflow: TextOverflow.ellipsis, style: AppText.button.copyWith(color: Tone.red))),
        ],
      ),
    );
  }
}


/// Guest → open the sign-up screen; closes itself once an account is signed in.
Future<void> openSignUp(BuildContext context) async {
  final nav = Navigator.of(context);
  final route = MaterialPageRoute<void>(builder: (_) => const SignUpScreen());
  void listener() {
    if (AuthService.instance.value is! GuestSession && route.isActive) nav.removeRoute(route);
  }

  AuthService.instance.addListener(listener);
  await nav.push(route);
  AuthService.instance.removeListener(listener);
}
