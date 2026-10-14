import 'package:flutter/material.dart';

import '../../../utils/app_theme.dart';
import '../../../widgets/common.dart';
import '../../../widgets/glow_background.dart';
import '../../../widgets/onboarding_nav.dart';

/// Shared motion values for the onboarding. All of them collapse to zero when the
/// phone's "Remove animations" accessibility setting is on.
class ObMotion {
  const ObMotion._();
  static const select = Duration(milliseconds: 220);
  static const content = Duration(milliseconds: 320);
  static const page = Duration(milliseconds: 420);

  static bool reduced(BuildContext context) => MediaQuery.maybeDisableAnimationsOf(context) ?? false;
  static Duration of(BuildContext context, Duration d) => reduced(context) ? Duration.zero : d;
}

/// Where a stage sits in the flow; provided by OnboardingFlow.
class ObFlowScope extends InheritedWidget {
  const ObFlowScope({super.key, required this.chapter, required this.canBack, required this.onBack, required super.child});

  /// 0, 1 or 2 for the three progress dots; null hides them (welcome).
  final int? chapter;
  final bool canBack;
  final VoidCallback onBack;

  static ObFlowScope? of(BuildContext context) => context.dependOnInheritedWidgetOfExactType<ObFlowScope>();

  @override
  bool updateShouldNotify(ObFlowScope old) => old.chapter != chapter || old.canBack != canBack;
}

/// One onboarding stage: scrollable content with the 20px gutter, and a footer
/// with the 3 progress dots, a back arrow and one clear primary action.
class ObPage extends StatelessWidget {
  const ObPage({
    super.key,
    required this.children,
    required this.primaryLabel,
    required this.onPrimary,
    this.secondaryLabel,
    this.onSecondary,
    this.showArrow = true,
    this.center = false,
  });

  final List<Widget> children;
  final String primaryLabel;
  final VoidCallback? onPrimary;
  final String? secondaryLabel;
  final VoidCallback? onSecondary;
  final bool showArrow;

  /// Vertically centre short content (welcome, reflection).
  final bool center;

  @override
  Widget build(BuildContext context) {
    final scope = ObFlowScope.of(context);
    final c = context.colors;
    final content = Column(crossAxisAlignment: CrossAxisAlignment.stretch, mainAxisSize: MainAxisSize.min, children: children);
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: GlowBackground(
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: LayoutBuilder(
                  builder: (context, box) => SingleChildScrollView(
                    padding: const EdgeInsets.fromLTRB(AppSpacing.gutter, 28, AppSpacing.gutter, 16),
                    child: Center(
                      child: ConstrainedBox(
                        constraints: BoxConstraints(maxWidth: 480, minHeight: center ? box.maxHeight - 44 : 0),
                        child: center ? Center(child: content) : content,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(AppSpacing.gutter, 8, AppSpacing.gutter, 12),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 480),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (scope?.chapter != null) ...[
                        TweenAnimationBuilder<double>(
                          tween: Tween(end: scope!.chapter!.toDouble()),
                          duration: ObMotion.of(context, ObMotion.page),
                          curve: Curves.easeInOutCubic,
                          builder: (_, v, _) => FlowDots(position: v),
                        ),
                        const SizedBox(height: 16),
                      ],
                      Row(
                        children: [
                          if (scope?.canBack ?? false) ...[
                            BackCircleButton(onPressed: scope!.onBack, size: 56),
                            const SizedBox(width: 12),
                          ],
                          Expanded(child: PrimaryButton(label: primaryLabel, onPressed: onPrimary, showArrow: showArrow, height: 56)),
                        ],
                      ),
                      if (secondaryLabel != null)
                        Padding(
                          padding: const EdgeInsets.only(top: 6),
                          child: TextButton(
                            onPressed: onSecondary,
                            style: TextButton.styleFrom(minimumSize: const Size(48, 44)),
                            child: Text(secondaryLabel!, style: AppText.link.copyWith(color: c.textSecondary)),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Big question / statement at the top of a stage.
class ObTitle extends StatelessWidget {
  const ObTitle(this.text, {super.key, this.align = TextAlign.start});
  final String text;
  final TextAlign align;

  @override
  Widget build(BuildContext context) =>
      Semantics(header: true, child: Text(text, textAlign: align, style: AppText.h1.copyWith(color: context.colors.textPrimary)));
}

class ObSubtitle extends StatelessWidget {
  const ObSubtitle(this.text, {super.key, this.align = TextAlign.start});
  final String text;
  final TextAlign align;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Text(text, textAlign: align, style: AppText.rowTitle.copyWith(fontWeight: FontWeight.w500, height: 1.45, color: context.colors.textSecondary)),
      );
}

/// Fade + small rise when it first appears (once; no replay on rebuild).
class ObReveal extends StatelessWidget {
  const ObReveal({super.key, required this.child, this.index = 0});
  final Widget child;
  final int index;

  @override
  Widget build(BuildContext context) {
    if (ObMotion.reduced(context)) return child;
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: 1),
      duration: Duration(milliseconds: 320 + index * 60),
      curve: Curves.easeOutCubic,
      builder: (_, t, c) => Opacity(opacity: t, child: Transform.translate(offset: Offset(0, 12 * (1 - t)), child: c)),
      child: child,
    );
  }
}

/// A tappable answer. Single or multi choice (round vs square check).
class ObAnswer extends StatelessWidget {
  const ObAnswer({super.key, required this.label, required this.selected, required this.onTap, this.icon, this.leading, this.multi = false});

  final String label;
  final bool selected;
  final VoidCallback onTap;
  final IconData? icon;
  final Widget? leading;
  final bool multi;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final dark = context.isDark;
    final r = BorderRadius.circular(AppRadius.tile);
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Semantics(
        button: true,
        selected: selected,
        label: label,
        excludeSemantics: true,
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: onTap,
            borderRadius: r,
            child: AnimatedContainer(
              duration: ObMotion.of(context, ObMotion.select),
              constraints: const BoxConstraints(minHeight: 58),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              decoration: BoxDecoration(
                borderRadius: r,
                color: selected ? AppPalette.accent.withValues(alpha: dark ? 0.20 : 0.10) : (dark ? c.glassFill : Colors.white),
                border: Border.all(color: selected ? AppPalette.accent : c.glassBorder, width: selected ? 1.5 : 1),
              ),
              child: Row(
                children: [
                  if (leading != null) ...[leading!, const SizedBox(width: 12)] else if (icon != null) ...[
                    Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(color: AppPalette.accent.withValues(alpha: 0.12), borderRadius: BorderRadius.circular(AppRadius.icon)),
                      child: Icon(icon, size: 19, color: AppPalette.accent),
                    ),
                    const SizedBox(width: 12),
                  ],
                  Expanded(child: Text(label, style: AppText.rowTitle.copyWith(color: c.textPrimary))),
                  const SizedBox(width: 8),
                  AnimatedContainer(
                    duration: ObMotion.of(context, ObMotion.select),
                    width: 22,
                    height: 22,
                    decoration: BoxDecoration(
                      shape: multi ? BoxShape.rectangle : BoxShape.circle,
                      borderRadius: multi ? BorderRadius.circular(6) : null,
                      color: selected ? AppPalette.accent : Colors.transparent,
                      border: Border.all(color: selected ? AppPalette.accent : c.textMuted, width: 1.5),
                    ),
                    child: selected ? const Icon(Icons.check_rounded, size: 15, color: Colors.white) : null,
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

/// Pausey answering the user: a short line that fades in when it changes.
class ObReply extends StatelessWidget {
  const ObReply(this.text, {super.key});
  final String? text;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final t = text;
    return AnimatedSwitcher(
      duration: ObMotion.of(context, ObMotion.content),
      switchInCurve: Curves.easeOutCubic,
      transitionBuilder: (child, a) => FadeTransition(
        opacity: a,
        child: SlideTransition(position: Tween(begin: const Offset(0, 0.15), end: Offset.zero).animate(a), child: child),
      ),
      child: t == null || t.isEmpty
          ? const SizedBox(key: ValueKey('none'), width: double.infinity)
          : Semantics(
              liveRegion: true,
              key: ValueKey(t),
              child: Padding(
                padding: const EdgeInsets.only(top: 6, bottom: 6),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 28,
                      height: 28,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(shape: BoxShape.circle, color: AppPalette.accent),
                      child: const Icon(Icons.pause_rounded, size: 16, color: Colors.white),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                        decoration: BoxDecoration(
                          color: AppPalette.accent.withValues(alpha: context.isDark ? 0.16 : 0.08),
                          borderRadius: const BorderRadiusDirectional.only(
                            topEnd: Radius.circular(16),
                            bottomStart: Radius.circular(16),
                            bottomEnd: Radius.circular(16),
                            topStart: Radius.circular(4),
                          ),
                        ),
                        child: Text(t, style: AppText.rowTitle.copyWith(fontWeight: FontWeight.w500, height: 1.4, color: c.textPrimary)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}

/// Small rounded label, e.g. "Preview" or "Your estimate".
class ObTag extends StatelessWidget {
  const ObTag(this.text, {super.key, this.icon, this.color = AppPalette.accent});
  final String text;
  final IconData? icon;
  final Color color;

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        decoration: BoxDecoration(color: color.withValues(alpha: 0.12), borderRadius: BorderRadius.circular(AppRadius.chip)),
        child: Row(mainAxisSize: MainAxisSize.min, children: [
          if (icon != null) ...[Icon(icon, size: 13, color: color), const SizedBox(width: 4)],
          Flexible(child: Text(text, maxLines: 1, overflow: TextOverflow.ellipsis, style: AppText.small.copyWith(letterSpacing: 0.2, color: color))),
        ]),
      );
}
