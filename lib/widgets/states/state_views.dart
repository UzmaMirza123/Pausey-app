import 'package:flutter/material.dart';

import '../../utils/app_theme.dart';
import '../../utils/l10n.dart';
import '../ui_kit.dart';

/// Ready-made state cards (Error States design). All texts are translated;
/// pass callbacks to make the buttons work. Built on ui_kit [StateMessage].

/// "You're offline" card (red).
class OfflineState extends StatelessWidget {
  const OfflineState({super.key, required this.onRetry, this.onOpenSettings});
  final VoidCallback onRetry;
  final VoidCallback? onOpenSettings;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    return StateMessage(
      icon: Icons.wifi_off_rounded,
      color: Tone.red,
      badge: l.statesConnectionLost,
      title: l.statesOfflineTitle,
      message: l.statesOfflineMsg,
      primaryLabel: l.statesTryAgain,
      onPrimary: onRetry,
      secondaryLabel: onOpenSettings == null ? null : l.statesOpenSettings,
      onSecondary: onOpenSettings,
    );
  }
}

/// "Access blocked" card for a missing Screen Time permission (amber).
class PermissionDeniedState extends StatelessWidget {
  const PermissionDeniedState({super.key, required this.onGrant, this.onLearnMore, this.message});
  final VoidCallback onGrant;
  final VoidCallback? onLearnMore;
  /// Override the default Screen Time explanation.
  final String? message;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    return StateMessage(
      icon: Icons.shield_outlined,
      color: Tone.amber,
      badge: l.statesPermRequired,
      title: l.statesPermTitle,
      message: message ?? l.statesPermMsg,
      primaryLabel: l.statesGrant,
      onPrimary: onGrant,
      secondaryLabel: onLearnMore == null ? null : l.statesLearnMore,
      onSecondary: onLearnMore,
    );
  }
}

/// "Data couldn't load" card (violet) with retry + optional use-cached.
class LoadFailedState extends StatelessWidget {
  const LoadFailedState({super.key, required this.onRetry, this.onUseCached, this.message});
  final VoidCallback onRetry;
  final VoidCallback? onUseCached;
  final String? message;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    return StateMessage(
      icon: Icons.cloud_off_rounded,
      color: Tone.violet,
      badge: l.statesSyncFailed,
      title: l.statesLoadTitle,
      message: message ?? l.statesLoadMsg,
      primaryLabel: l.statesRetrySync,
      onPrimary: onRetry,
      secondaryLabel: onUseCached == null ? null : l.statesUseCached,
      onSecondary: onUseCached,
    );
  }
}

/// Friendly empty state with a call to action (e.g. new user, 0 sessions).
class EmptyState extends StatelessWidget {
  const EmptyState({
    super.key,
    required this.title,
    required this.message,
    this.icon = Icons.hourglass_empty_rounded,
    this.color = Tone.blue,
    this.badge,
    this.actionLabel,
    this.onAction,
  });
  final String title;
  final String message;
  final IconData icon;
  final Color color;
  final String? badge;
  final String? actionLabel;
  final VoidCallback? onAction;

  @override
  Widget build(BuildContext context) => StateMessage(
        icon: icon,
        color: color,
        badge: badge ?? context.l10n.statesNothingYet,
        title: title,
        message: message,
        primaryLabel: actionLabel,
        onPrimary: onAction,
      );
}

/// One row of a [StateChecklist].
class StateCheckItem {
  const StateCheckItem(this.label, {required this.ok, this.okLabel, this.badLabel});
  final String label;
  final bool ok;
  /// Status text; defaults to Available / Unavailable.
  final String? okLabel;
  final String? badLabel;
}

/// Card listing what still works (offline mode, permissions…).
class StateChecklist extends StatelessWidget {
  const StateChecklist({super.key, required this.icon, required this.title, required this.items, this.color = Tone.red, this.badge, this.badColor = Tone.red});
  final IconData icon;
  final String title;
  final Color color;
  final String? badge;
  final Color badColor;
  final List<StateCheckItem> items;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final l = context.l10n;
    return PCard(
      accent: color,
      padding: EdgeInsets.zero,
      child: Column(children: [
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(AppSpacing.card, 14, AppSpacing.card, 12),
          child: Row(children: [
            Icon(icon, size: 18, color: color),
            const SizedBox(width: 8),
            Expanded(child: Text(title, maxLines: 2, overflow: TextOverflow.ellipsis, style: AppText.rowTitle.copyWith(color: color))),
            if (badge != null) Pill(badge!, color: color),
          ]),
        ),
        for (final it in items) ...[
          Divider(height: 1, color: c.divider),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: Padding(
              key: ValueKey(it.ok),
              padding: const EdgeInsetsDirectional.symmetric(horizontal: AppSpacing.card, vertical: 12),
              child: Row(children: [
                _Dot(ok: it.ok, bad: badColor),
                const SizedBox(width: 12),
                Expanded(child: Text(it.label, style: AppText.rowSub.copyWith(color: c.textPrimary))),
                const SizedBox(width: 8),
                Text(it.ok ? (it.okLabel ?? l.statesAvailable) : (it.badLabel ?? l.statesUnavailable),
                    style: AppText.small.copyWith(color: it.ok ? Tone.green : badColor)),
              ]),
            ),
          ),
        ],
      ]),
    );
  }
}

class _Dot extends StatelessWidget {
  const _Dot({required this.ok, required this.bad});
  final bool ok;
  final Color bad;
  @override
  Widget build(BuildContext context) {
    final col = ok ? Tone.green : bad;
    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(shape: BoxShape.circle, color: col.withValues(alpha: 0.15)),
      child: Icon(ok ? Icons.check_rounded : Icons.close_rounded, size: 14, color: col),
    );
  }
}

/// Small rounded info note with an icon.
class StateNote extends StatelessWidget {
  const StateNote({super.key, required this.icon, required this.text, this.color = Tone.violet});
  final IconData icon;
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) => PCard(
        padding: const EdgeInsetsDirectional.fromSTEB(14, 12, 16, 12),
        child: Row(children: [
          IconBadge(icon: icon, color: color, size: 32),
          const SizedBox(width: 12),
          Expanded(child: Text(text, style: AppText.rowSub.copyWith(color: context.colors.textSecondary))),
        ]),
      );
}

/// Key/value rows card (e.g. error details).
class StateDetails extends StatelessWidget {
  const StateDetails({super.key, required this.title, required this.rows, this.trailing, this.footer, this.color = Tone.violet});
  final String title;
  final List<(String, String)> rows;
  final String? trailing;
  final Widget? footer;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    return PCard(
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        CardTitle(icon: Icons.terminal_rounded, title: title, color: color,
            trailing: trailing == null ? null : Text(trailing!, style: AppText.small.copyWith(color: c.textMuted))),
        const SizedBox(height: 12),
        for (final r in rows)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Row(children: [
              Expanded(child: Text(r.$1, style: AppText.rowSub.copyWith(color: c.textMuted))),
              const SizedBox(width: 8),
              Flexible(child: Text(r.$2, textAlign: TextAlign.end, style: AppText.rowSub.copyWith(color: c.textPrimary))),
            ]),
          ),
        if (footer != null) ...[const SizedBox(height: 12), footer!],
      ]),
    );
  }
}

/// Pill with a spinner: "Crunching your data…".
class LoadingPill extends StatelessWidget {
  const LoadingPill(this.label, {super.key, this.color = Tone.violet});
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) => Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 9),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppRadius.chip),
            color: color.withValues(alpha: 0.10),
            border: Border.all(color: color.withValues(alpha: 0.3)),
          ),
          child: Row(mainAxisSize: MainAxisSize.min, children: [
            SizedBox(width: 14, height: 14, child: CircularProgressIndicator(strokeWidth: 2, color: color)),
            const SizedBox(width: 10),
            Flexible(child: Text(label, overflow: TextOverflow.ellipsis, style: AppText.rowSub.copyWith(color: context.colors.textSecondary))),
          ]),
        ),
      );
}

/// Phases for [AsyncStateSwitcher].
enum ViewPhase { loading, error, content }

/// Cross-fades between loading / error / content builders.
class AsyncStateSwitcher extends StatelessWidget {
  const AsyncStateSwitcher({super.key, required this.phase, required this.loading, required this.error, required this.content});
  final ViewPhase phase;
  final Widget loading;
  final Widget error;
  final Widget content;

  @override
  Widget build(BuildContext context) => AnimatedSwitcher(
        duration: const Duration(milliseconds: 350),
        transitionBuilder: (child, a) => FadeTransition(
          opacity: a,
          child: SlideTransition(position: Tween(begin: const Offset(0, 0.03), end: Offset.zero).animate(a), child: child),
        ),
        layoutBuilder: (cur, prev) => Stack(alignment: Alignment.topCenter, children: [...prev, ?cur]),
        child: KeyedSubtree(
          key: ValueKey(phase),
          child: switch (phase) { ViewPhase.loading => loading, ViewPhase.error => error, ViewPhase.content => content },
        ),
      );
}
