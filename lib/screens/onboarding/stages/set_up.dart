import 'package:flutter/material.dart';

import '../../../data/restrictions/restriction_repo.dart';
import '../../../services/auth_service.dart';
import '../../../services/native_bridge.dart';
import '../../../utils/app_theme.dart';
import '../../../utils/l10n.dart';
import '../../../widgets/ui_kit.dart';
import '../../auth/auth_widgets.dart';
import '../../auth/log_in_screen.dart';
import '../../auth/sign_up_screen.dart';
import '../onboarding_state.dart';
import '../widgets/ob_kit.dart';
import 'about_you.dart' show appsList;
import 'your_plan.dart' show goalPhrase;

OnboardingState get _s => OnboardingState.instance;

/// Pushes [page] and closes it automatically once the user is signed in (guest or account).
Future<void> pushUntilSignedIn(BuildContext context, Widget page) async {
  final nav = Navigator.of(context);
  final route = MaterialPageRoute<void>(builder: (_) => page);
  void listener() {
    if (AuthService.instance.value is! SignedOut && route.isActive) nav.removeRoute(route);
  }

  AuthService.instance.addListener(listener);
  await nav.push(route);
  AuthService.instance.removeListener(listener);
}

// -----------------------------------------------------------------------------
// Stage 9 — Permissions, with the phone's real state
// -----------------------------------------------------------------------------

class PermissionsStage extends StatelessWidget {
  const PermissionsStage({super.key, required this.onNext});
  final VoidCallback onNext;

  static const _strictMakers = ['xiaomi', 'redmi', 'poco', 'oppo', 'realme', 'vivo', 'oneplus', 'huawei', 'honor'];

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final c = context.colors;
    final repo = RestrictionRepo.instance;
    return ListenableBuilder(
      listenable: repo,
      builder: (context, _) {
        final st = repo.status;
        final all = st.supported && st.usageAccess && st.overlay;
        return ObPage(
          primaryLabel: all || !st.supported ? l.cvNext : l.cvContinueAnyway,
          onPrimary: onNext,
          children: [
            ObReveal(child: ObTitle(l.cvPermTitle)),
            ObReveal(index: 1, child: ObSubtitle(st.supported ? l.cvPermSub : l.cvPermUnsupported)),
            const SizedBox(height: 20),
            if (st.supported) ...[
              ObReveal(
                index: 2,
                child: _PermissionCard(
                  icon: Icons.query_stats_rounded,
                  title: l.cvPermUsageTitle,
                  why: l.cvPermUsageWhy,
                  without: l.cvPermUsageWithout,
                  granted: st.usageAccess,
                  onAllow: NativeBridge.instance.openUsageAccessSettings,
                ),
              ),
              ObReveal(
                index: 3,
                child: _PermissionCard(
                  icon: Icons.layers_rounded,
                  title: l.cvPermOverlayTitle,
                  why: l.cvPermOverlayWhy,
                  without: l.cvPermOverlayWithout,
                  granted: st.overlay,
                  onAllow: NativeBridge.instance.openOverlaySettings,
                ),
              ),
              if (_strictMakers.any(st.manufacturer.contains))
                ObReveal(
                  index: 4,
                  child: _PermissionCard(
                    icon: Icons.battery_saver_rounded,
                    title: l.cvPermBatteryTitle,
                    why: l.cvPermBatteryWhy,
                    without: l.cvPermBatteryWithout,
                    granted: st.batteryUnrestricted,
                    onAllow: NativeBridge.instance.openBatterySettings,
                    optional: true,
                  ),
                ),
              const SizedBox(height: 4),
              Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Icon(Icons.lock_outline_rounded, size: 16, color: c.textMuted),
                const SizedBox(width: 8),
                Expanded(child: Text(l.cvPermPrivacy, style: AppText.rowSub.copyWith(color: c.textMuted))),
              ]),
            ],
          ],
        );
      },
    );
  }
}

class _PermissionCard extends StatelessWidget {
  const _PermissionCard({
    required this.icon,
    required this.title,
    required this.why,
    required this.without,
    required this.granted,
    required this.onAllow,
    this.optional = false,
  });
  final IconData icon;
  final String title, why, without;
  final bool granted, optional;
  final Future<void> Function() onAllow;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final c = context.colors;
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: PCard(
        accent: granted ? Tone.green : null,
        child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Row(children: [
            IconBadge(icon: icon, color: granted ? Tone.green : Tone.violet),
            const SizedBox(width: 12),
            Expanded(child: Text(title, style: AppText.rowTitle.copyWith(fontWeight: FontWeight.w700, color: c.textPrimary))),
            if (optional && !granted) ObTag(l.cvOptional, color: Tone.blue),
          ]),
          const SizedBox(height: 10),
          Text(why, style: AppText.rowSub.copyWith(height: 1.45, color: c.textSecondary)),
          if (!granted) ...[
            const SizedBox(height: 6),
            Text(without, style: AppText.rowSub.copyWith(height: 1.45, color: c.textMuted)),
          ],
          const SizedBox(height: 12),
          AnimatedSwitcher(
            duration: ObMotion.of(context, ObMotion.content),
            child: granted
                ? Row(key: const ValueKey('ok'), children: [
                    const Icon(Icons.check_circle_rounded, size: 18, color: Tone.green),
                    const SizedBox(width: 6),
                    Expanded(child: Text(l.cvAllowed, style: AppText.rowSub.copyWith(fontWeight: FontWeight.w700, color: Tone.green))),
                  ])
                : Align(
                    key: const ValueKey('ask'),
                    alignment: AlignmentDirectional.centerStart,
                    child: FilledButton(
                      onPressed: onAllow,
                      style: FilledButton.styleFrom(
                        backgroundColor: AppPalette.accent,
                        foregroundColor: Colors.white,
                        minimumSize: const Size(120, 44),
                        shape: const StadiumBorder(),
                        textStyle: AppText.rowSub.copyWith(fontWeight: FontWeight.w700),
                      ),
                      child: Text(l.cvAllowInSettings),
                    ),
                  ),
          ),
          if (!granted) ...[
            const SizedBox(height: 8),
            Text(l.cvPermLater, style: AppText.small.copyWith(letterSpacing: 0, fontWeight: FontWeight.w500, color: c.textMuted)),
          ],
        ]),
      ),
    );
  }
}

// -----------------------------------------------------------------------------
// Stage 10 — Account (only the sign-in methods that exist)
// -----------------------------------------------------------------------------

class AccountStage extends StatefulWidget {
  const AccountStage({super.key, required this.onNext});
  final VoidCallback onNext;

  @override
  State<AccountStage> createState() => _AccountStageState();
}

class _AccountStageState extends State<AccountStage> {
  String? _busy;
  String? _error;
  late final _name = TextEditingController(text: _s.name);

  @override
  void dispose() {
    _name.dispose();
    super.dispose();
  }

  Future<void> _run(String which, Future<void> Function() action) async {
    setState(() {
      _busy = which;
      _error = null;
    });
    try {
      await action();
      if (mounted && AuthService.instance.value is! SignedOut) widget.onNext();
    } catch (e) {
      if (mounted) setState(() => _error = authErrorText(context, e));
    } finally {
      if (mounted) setState(() => _busy = null);
    }
  }

  Future<void> _email() async {
    await pushUntilSignedIn(context, const SignUpScreen());
    if (mounted && AuthService.instance.value is! SignedOut) widget.onNext();
  }

  Future<void> _login() async {
    await pushUntilSignedIn(context, const LogInScreen());
    if (mounted && AuthService.instance.value is! SignedOut) widget.onNext();
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final c = context.colors;
    final auth = AuthService.instance;
    return ObPage(
      primaryLabel: l.cvContinueGuest,
      showArrow: false,
      onPrimary: _busy != null
          ? null
          : () => _run('guest', () async {
                _s.update((s) => s.name = _name.text.trim());
                await auth.continueAsGuest(name: _name.text.trim());
              }),
      secondaryLabel: l.haveAccount,
      onSecondary: _busy == null ? _login : null,
      children: [
        ObReveal(child: ObTitle(l.cvAccountTitle)),
        ObReveal(index: 1, child: ObSubtitle(l.cvAccountSub)),
        const SizedBox(height: 20),
        ObReveal(
          index: 2,
          child: TextField(
            controller: _name,
            maxLength: 30,
            textCapitalization: TextCapitalization.words,
            style: AppText.rowTitle.copyWith(color: c.textPrimary),
            decoration: InputDecoration(
              counterText: '',
              labelText: l.cvNameLabel,
              hintText: l.cvNameHint,
              filled: true,
              fillColor: context.isDark ? c.glassFill : Colors.white,
              enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(AppRadius.tile), borderSide: BorderSide(color: c.glassBorder)),
              focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(AppRadius.tile), borderSide: const BorderSide(color: AppPalette.accent, width: 1.5)),
            ),
          ),
        ),
        const SizedBox(height: 18),
        AuthErrorBanner(message: _error),
        if (auth.firebaseReady) ...[
          ObReveal(
            index: 3,
            child: SocialButton(
              kind: SocialKind.google,
              label: l.continueWithGoogle,
              loading: _busy == 'google',
              onPressed: _busy == null ? () => _run('google', auth.signInWithGoogle) : null,
            ),
          ),
          const SizedBox(height: 10),
          ObReveal(
            index: 4,
            child: SocialButton(
              kind: SocialKind.apple,
              label: l.continueWithApple,
              loading: _busy == 'apple',
              onPressed: _busy == null ? () => _run('apple', auth.signInWithApple) : null,
            ),
          ),
          const SizedBox(height: 10),
          ObReveal(
            index: 5,
            child: OutlinedButton.icon(
              onPressed: _busy == null ? _email : null,
              icon: const Icon(Icons.mail_outline_rounded),
              label: Text(l.signUpWithEmail),
              style: OutlinedButton.styleFrom(
                minimumSize: const Size.fromHeight(52),
                foregroundColor: c.textPrimary,
                side: BorderSide(color: c.glassBorder),
                shape: const StadiumBorder(),
                textStyle: AppText.button,
              ),
            ),
          ),
          const SizedBox(height: 16),
        ],
        Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Icon(Icons.phone_android_rounded, size: 16, color: c.textMuted),
          const SizedBox(width: 8),
          Expanded(child: Text(l.cvAccountNote, style: AppText.rowSub.copyWith(color: c.textMuted))),
        ]),
      ],
    );
  }
}

// -----------------------------------------------------------------------------
// Stage 11 — Ready
// -----------------------------------------------------------------------------

/// What the user lands on after onboarding.
enum ObFirstAction { focus, appLimits }

class ReadyStage extends StatelessWidget {
  const ReadyStage({super.key, required this.onFinish});
  final void Function(ObFirstAction action) onFinish;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final c = context.colors;
    final s = _s;
    final st = RestrictionRepo.instance.status;
    final needsSetup = st.supported && !st.canEnforce && s.apps.isNotEmpty;
    final intention = switch (s.goal) {
      ObGoal.focus => l.cvReadyFocus,
      ObGoal.sleep => l.cvReadySleep,
      ObGoal.scrolling => l.cvReadyScrolling,
      ObGoal.me => l.cvReadyMe,
      ObGoal.habits => l.cvReadyHabits,
      _ => l.cvReadyOther,
    };
    final name = AuthService.instance.value.displayName.trim();
    String fmt(int m) => fmtMinutes(m, h: l.unitH, m: l.unitM);
    final rows = <(IconData, String)>[
      if (s.goal != null) (Icons.favorite_border_rounded, l.cvSumGoal(goalPhrase(l, s))),
      if (s.apps.isNotEmpty) (Icons.apps_rounded, l.cvSumApps(appsList(l, s.apps))),
      (Icons.bolt_rounded, l.cvSumFocus(fmt(s.focusMinutes), fmt(s.dailyFocusGoal))),
      if (s.limitOn && s.limitApp != null) (Icons.hourglass_bottom_rounded, l.cvPlanLimitSub(s.limitApp!.label, fmt(s.limitMinutes))),
      if (s.windDownOn)
        (
          Icons.bedtime_rounded,
          l.cvPlanWindSub(
            MaterialLocalizations.of(context).formatTimeOfDay(TimeOfDay(hour: s.windStart ~/ 60, minute: s.windStart % 60)),
            MaterialLocalizations.of(context).formatTimeOfDay(TimeOfDay(hour: s.windEnd ~/ 60, minute: s.windEnd % 60)),
          ),
        ),
    ];
    return ObPage(
      primaryLabel: needsSetup ? l.cvFinishLimits : l.cvStartFirstFocus,
      onPrimary: () => onFinish(needsSetup ? ObFirstAction.appLimits : ObFirstAction.focus),
      secondaryLabel: needsSetup ? l.cvStartFirstFocus : null,
      onSecondary: needsSetup ? () => onFinish(ObFirstAction.focus) : null,
      children: [
        ObReveal(child: ObTitle(name.isEmpty ? l.cvReadyTitle : l.cvReadyTitleNamed(name))),
        ObReveal(index: 1, child: ObSubtitle(intention)),
        const SizedBox(height: 22),
        ObReveal(
          index: 2,
          child: PCard(
            child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
              Text(l.cvYourPlan, style: AppText.cardTitle.copyWith(color: c.textPrimary)),
              const SizedBox(height: 10),
              for (final (icon, text) in rows)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Icon(icon, size: 18, color: AppPalette.accent),
                    const SizedBox(width: 10),
                    Expanded(child: Text(text, style: AppText.rowTitle.copyWith(fontWeight: FontWeight.w500, color: c.textPrimary))),
                  ]),
                ),
            ]),
          ),
        ),
        if (needsSetup) ...[
          const SizedBox(height: 14),
          Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Icon(Icons.info_outline_rounded, size: 16, color: Tone.amber),
            const SizedBox(width: 8),
            Expanded(child: Text(l.cvReadyNeedsPerm, style: AppText.rowSub.copyWith(color: c.textSecondary))),
          ]),
        ],
        const SizedBox(height: 14),
        Text(l.cvReadyChange, style: AppText.rowSub.copyWith(color: c.textMuted)),
      ],
    );
  }
}
