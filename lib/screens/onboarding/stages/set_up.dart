import 'package:flutter/material.dart';

import '../../../data/restrictions/restriction_repo.dart';
import '../../../services/auth_service.dart';
import '../../../services/native_bridge.dart';
import '../../../utils/app_theme.dart';
import '../../../utils/l10n.dart';
import '../../../widgets/common.dart';
import '../../../widgets/ui_kit.dart';
import '../../auth/auth_widgets.dart';
import '../../auth/log_in_screen.dart' show LogInScreen;
import '../../auth/sign_up_screen.dart';
import '../onboarding_state.dart';
import '../widgets/ob_art.dart';
import '../widgets/ob_kit.dart';
import '../widgets/ob_text_motion.dart';
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
// Stage 9 — Permissions, conversational, each switch shows the phone's real state
// -----------------------------------------------------------------------------

class PermissionsStage extends StatelessWidget {
  const PermissionsStage({super.key, required this.onNext});
  final VoidCallback onNext;

  static const _strictMakers = ['xiaomi', 'redmi', 'poco', 'oppo', 'realme', 'vivo', 'oneplus', 'huawei', 'honor'];

  /// Already on: Pausey can't switch a permission off itself, so explain where to do it.
  static void _explainOff(BuildContext context) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(context.l10n.stPermOnHint), behavior: SnackBarBehavior.floating));
  }

  static Future<void> _askNotifications() async {
    await NativeBridge.instance.requestNotifications();
    await RestrictionRepo.instance.refresh();
  }

  static Future<void> _askAccessibility(BuildContext context) async {
    final ok = await showDialog<bool>(context: context, builder: (_) => const _AccessibilityWhyDialog());
    if (ok == true) await NativeBridge.instance.openAccessibilitySettings();
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final c = context.colors;
    final repo = RestrictionRepo.instance;
    final bridge = NativeBridge.instance;
    return ListenableBuilder(
      listenable: repo,
      builder: (context, _) {
        final st = repo.status;
        final strict = _strictMakers.any(st.manufacturer.contains);
        var n = 0;
        Widget card({required IconData icon, required String title, required String why, required bool on, required VoidCallback onAsk, bool optional = false}) =>
            ObFadeUp(
              delay: const Duration(milliseconds: 600),
              index: n++,
              child: _PermToggleCard(icon: icon, title: title, why: why, on: on, optional: optional, onAsk: onAsk, onExplainOff: () => _explainOff(context)),
            );
        return ObPage(
          center: true,
          primaryLabel: st.canEnforce || !st.supported ? l.continueLabel : l.cvContinueAnyway,
          onPrimary: onNext,
          children: [
            // Same order as the question screens: illustration → title → subtitle → content.
            const ObArt(ObArtKind.perm),
            const SizedBox(height: 10),
            ObTitle(l.stPermTitle, align: TextAlign.center),
            ObFadeUp(
              delay: const Duration(milliseconds: 420),
              child: ObSubtitle(st.supported ? l.cvPermSub : l.cvPermUnsupported, align: TextAlign.center),
            ),
            if (st.supported) ...[
              const SizedBox(height: 20),
              card(icon: Icons.hourglass_bottom_rounded, title: l.stPermUsageTitle, why: l.stPermUsageWhy, on: st.usageAccess, onAsk: bridge.openUsageAccessSettings),
              card(icon: Icons.layers_rounded, title: l.stPermOverlayTitle, why: l.stPermOverlayWhy, on: st.overlay, onAsk: bridge.openOverlaySettings),
              card(icon: Icons.notifications_none_rounded, title: l.stPermNotifTitle, why: l.stPermNotifWhy, on: st.notifications, onAsk: _askNotifications),
              card(icon: Icons.accessibility_new_rounded, title: l.stPermA11yTitle, why: l.stPermA11yWhy, on: st.accessibility, onAsk: () => _askAccessibility(context)),
              ObFadeUp(
                delay: const Duration(milliseconds: 600),
                index: n,
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(4, 0, 4, 12),
                  child: Text(l.stPermA11yNote, textAlign: TextAlign.center, style: AppText.rowSub.copyWith(fontSize: 12, height: 1.45, color: c.textMuted)),
                ),
              ),
              if (strict)
                card(icon: Icons.battery_saver_rounded, title: l.cvPermBatteryTitle, why: l.cvPermBatteryWhy, on: st.batteryUnrestricted, onAsk: bridge.openBatterySettings, optional: true),
              // Privacy promise at the end, as its own soft card.
              ObFadeUp(
                delay: const Duration(milliseconds: 600),
                index: n + 1,
                child: Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: AppPalette.accent.withValues(alpha: context.isDark ? 0.14 : 0.07),
                    borderRadius: BorderRadius.circular(AppRadius.tile),
                  ),
                  child: Row(children: [
                    const Icon(Icons.lock_outline_rounded, size: 20, color: AppPalette.accent),
                    const SizedBox(width: 10),
                    Expanded(child: Text(l.cvPermPrivacy, style: AppText.rowSub.copyWith(height: 1.4, color: c.textSecondary))),
                  ]),
                ),
              ),
            ],
          ],
        );
      },
    );
  }
}

/// One permission: icon, what it's for, and a switch that mirrors the real state.
/// Off → opens the right Android screen. On → explains how to turn it off there.
/// Turned on, the card tints teal so the user sees their progress at a glance.
class _PermToggleCard extends StatelessWidget {
  const _PermToggleCard({
    required this.icon,
    required this.title,
    required this.why,
    required this.on,
    required this.onAsk,
    required this.onExplainOff,
    this.optional = false,
  });
  final IconData icon;
  final String title, why;
  final bool on, optional;
  final VoidCallback onAsk, onExplainOff;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final c = context.colors;
    final dark = context.isDark;
    void tap() => on ? onExplainOff() : onAsk();
    final r = BorderRadius.circular(AppRadius.tile);
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: MergeSemantics(
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: tap,
            borderRadius: r,
            child: AnimatedContainer(
              duration: ObMotion.of(context, ObMotion.content),
              curve: Curves.easeOutCubic,
              padding: const EdgeInsetsDirectional.fromSTEB(14, 14, 10, 14),
              decoration: BoxDecoration(
                borderRadius: r,
                color: on ? AppPalette.teal.withValues(alpha: dark ? 0.14 : 0.09) : (dark ? c.glassFill : Colors.white),
                border: Border.all(color: on ? AppPalette.teal.withValues(alpha: 0.55) : c.glassBorder, width: on ? 1.4 : 1),
                boxShadow: [
                  BoxShadow(color: (on ? AppPalette.teal : AppPalette.accent).withValues(alpha: dark ? 0.10 : 0.08), blurRadius: 18, offset: const Offset(0, 6)),
                ],
              ),
              child: Row(children: [
                AnimatedSwitcher(
                  duration: ObMotion.of(context, ObMotion.content),
                  transitionBuilder: (child, a) => ScaleTransition(scale: CurvedAnimation(parent: a, curve: Curves.easeOutBack), child: child),
                  child: IconBadge(key: ValueKey(on), icon: on ? Icons.check_rounded : icon, color: on ? Tone.green : Tone.violet),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Wrap(spacing: 6, runSpacing: 4, crossAxisAlignment: WrapCrossAlignment.center, children: [
                      Text(title, style: AppText.rowTitle.copyWith(fontWeight: FontWeight.w700, color: c.textPrimary)),
                      if (optional && !on) ObTag(l.cvOptional, color: Tone.blue),
                    ]),
                    const SizedBox(height: 3),
                    Text(why, style: AppText.rowSub.copyWith(height: 1.4, color: c.textSecondary)),
                  ]),
                ),
                const SizedBox(width: 6),
                PSwitch(value: on, onChanged: (_) => tap()),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}

/// Shown before opening Accessibility settings: what it is used for, and what it is never used for.
class _AccessibilityWhyDialog extends StatelessWidget {
  const _AccessibilityWhyDialog();

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final c = context.colors;
    final dark = context.isDark;
    return AlertDialog(
      backgroundColor: dark ? const Color(0xFF17142F) : Colors.white,
      surfaceTintColor: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppRadius.card)),
      icon: const Center(child: IconBadge(icon: Icons.accessibility_new_rounded, color: Tone.violet, size: 48)),
      title: Text(l.stA11yDialogTitle, style: AppText.cardTitle.copyWith(fontSize: 20, color: c.textPrimary)),
      content: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisSize: MainAxisSize.min, children: [
          Text(l.stA11yDialogBody, style: AppText.rowSub.copyWith(fontSize: 14, height: 1.5, color: c.textSecondary)),
          const SizedBox(height: 16),
          Text(l.stA11yNot, style: AppText.rowSub.copyWith(fontSize: 14, fontWeight: FontWeight.w800, color: c.textPrimary)),
          const SizedBox(height: 8),
          for (final s in [l.stA11yNot1, l.stA11yNot2, l.stA11yNot3])
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Container(
                  margin: const EdgeInsets.only(top: 1),
                  width: 18,
                  height: 18,
                  decoration: BoxDecoration(shape: BoxShape.circle, color: AppPalette.accent.withValues(alpha: 0.14)),
                  child: const Icon(Icons.close_rounded, size: 12, color: AppPalette.accent),
                ),
                const SizedBox(width: 10),
                Expanded(child: Text(s, style: AppText.rowSub.copyWith(fontSize: 14, height: 1.4, color: c.textPrimary))),
              ]),
            ),
        ]),
      ),
      actionsPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, false),
          style: TextButton.styleFrom(foregroundColor: c.textSecondary, minimumSize: const Size(64, 44)),
          child: Text(l.cancel),
        ),
        FilledButton(
          onPressed: () => Navigator.pop(context, true),
          style: FilledButton.styleFrom(backgroundColor: AppPalette.accent, foregroundColor: Colors.white, minimumSize: const Size(96, 44), shape: const StadiumBorder()),
          child: Text(l.continueLabel),
        ),
      ],
    );
  }
}

// -----------------------------------------------------------------------------
// Stage 10 — Log in (email), sign up, Google / Apple, or continue as guest
// -----------------------------------------------------------------------------

/// "Start your Pausey journey": Google, Apple or guest, plus links to log in or
/// sign up (each opens its own screen and comes back here when done).
class AccountStage extends StatefulWidget {
  const AccountStage({super.key, required this.onNext});
  final VoidCallback onNext;

  @override
  State<AccountStage> createState() => _AccountStageState();
}

class _AccountStageState extends State<AccountStage> {
  String? _busy; // google | apple | guest
  String? _error;

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

  /// "Continue as guest" first asks what to call the user.
  Future<void> _guest() async {
    final name = await _askName(context);
    if (name == null || !mounted) return;
    _s.update((s) => s.name = name);
    await _run('guest', () => AuthService.instance.continueAsGuest(name: name));
  }

  Future<void> _open(Widget page) async {
    await pushUntilSignedIn(context, page);
    if (mounted && AuthService.instance.value is! SignedOut) widget.onNext();
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final c = context.colors;
    final auth = AuthService.instance;
    final free = _busy == null;
    Widget link(String text, VoidCallback onTap) => TextButton(
          onPressed: free ? onTap : null,
          style: TextButton.styleFrom(minimumSize: const Size(48, 44), padding: const EdgeInsets.symmetric(horizontal: 10)),
          child: Text(text, style: AppText.option.copyWith(fontWeight: FontWeight.w800, color: AppPalette.violet)),
        );
    return ObPage(
      center: true,
      primaryLabel: l.continueLabel,
      onPrimary: free ? _guest : null,
      children: [
        const ObArt(ObArtKind.journey),
        const SizedBox(height: 10),
        ObTitle(l.cvJourneyTitle, align: TextAlign.center),
        ObFadeUp(delay: const Duration(milliseconds: 400), child: ObSubtitle(l.cvJourneySub, align: TextAlign.center)),
        const SizedBox(height: 20),
        AuthErrorBanner(message: _error),
        ObFadeUp(
          delay: const Duration(milliseconds: 500),
          child: SocialButton(kind: SocialKind.google, label: l.continueWithGoogle, loading: _busy == 'google', onPressed: free ? () => _run('google', auth.signInWithGoogle) : null),
        ),
        const SizedBox(height: 12),
        ObFadeUp(
          delay: const Duration(milliseconds: 500),
          index: 1,
          child: SocialButton(kind: SocialKind.apple, label: l.continueWithApple, loading: _busy == 'apple', onPressed: free ? () => _run('apple', auth.signInWithApple) : null),
        ),
        const SizedBox(height: 12),
        ObFadeUp(
          delay: const Duration(milliseconds: 500),
          index: 2,
          child: OutlinedButton.icon(
            onPressed: free ? _guest : null,
            icon: _busy == 'guest'
                ? const SizedBox.square(dimension: 18, child: CircularProgressIndicator(strokeWidth: 2.2))
                : const Icon(Icons.person_rounded, size: 20, color: AppPalette.accent),
            label: Text(l.cvContinueGuest, style: AppText.button.copyWith(color: AppPalette.accent)),
            style: OutlinedButton.styleFrom(
              minimumSize: const Size.fromHeight(54),
              backgroundColor: AppPalette.accent.withValues(alpha: context.isDark ? 0.14 : 0.07),
              side: BorderSide(color: AppPalette.accent.withValues(alpha: 0.45)),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppRadius.tile)),
            ),
          ),
        ),
        const SizedBox(height: 14),
        ObFadeUp(
          delay: const Duration(milliseconds: 500),
          index: 3,
          child: Column(children: [
            Text(l.haveAccount, textAlign: TextAlign.center, style: AppText.rowSub.copyWith(fontSize: 14, color: c.textSecondary)),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              link(l.logIn, () => _open(LogInScreen(onGuest: _guest))),
              Text('|', style: AppText.rowSub.copyWith(color: c.textMuted)),
              link(l.signUp, () => _open(const SignUpScreen())),
            ]),
          ]),
        ),
      ],
    );
  }
}

/// Bottom sheet: "What should we call you?" with a "Your name" field. Returns the name, or null if closed.
Future<String?> _askName(BuildContext context) {
  final ctl = TextEditingController(text: _s.name);
  return showModalBottomSheet<String>(
    context: context,
    isScrollControlled: true,
    backgroundColor: context.isDark ? const Color(0xFF14122C) : Colors.white,
    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(AppRadius.card))),
    builder: (ctx) {
      final l = ctx.l10n;
      final c = ctx.colors;
      void done() => Navigator.of(ctx).pop(ctl.text.trim());
      return Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.viewInsetsOf(ctx).bottom),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(AppSpacing.gutter, 22, AppSpacing.gutter, 16),
            child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.stretch, children: [
              Text(l.cvNameHint, style: AppText.cardTitle.copyWith(fontSize: 20, color: c.textPrimary)),
              const SizedBox(height: 16),
              TextField(
                controller: ctl,
                autofocus: true,
                maxLength: 30,
                textCapitalization: TextCapitalization.words,
                textInputAction: TextInputAction.done,
                onSubmitted: (_) => done(),
                style: AppText.rowTitle.copyWith(color: c.textPrimary),
                decoration: InputDecoration(
                  counterText: '',
                  labelText: l.cvYourName,
                  hintText: l.cvNameHint,
                  filled: true,
                  fillColor: ctx.isDark ? c.glassFill : const Color(0xFFF6F4FF),
                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(AppRadius.tile), borderSide: BorderSide(color: c.glassBorder)),
                  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(AppRadius.tile), borderSide: const BorderSide(color: AppPalette.accent, width: 1.5)),
                ),
              ),
              const SizedBox(height: 18),
              PrimaryButton(label: l.continueLabel, onPressed: done, height: 54),
            ]),
          ),
        ),
      );
    },
  );
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
