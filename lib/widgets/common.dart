import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/app_theme.dart';
import '../utils/theme_controller.dart';
import 'glow_background.dart';
import 'onboarding_nav.dart';
import '../utils/l10n.dart';

/// Header row on every onboarding screen: theme switch (sun/moon) and "Skip",
/// both on the right.
class OnboardingHeader extends StatelessWidget {
  const OnboardingHeader({super.key, this.onSkip, this.showSkip = true});

  final VoidCallback? onSkip;
  final bool showSkip;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    return Padding(
      padding: const EdgeInsets.fromLTRB(AppSpacing.gutter, 12, AppSpacing.gutter, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const SizedBox(height: 30),
          const ThemeToggleButton(),
          if (showSkip) ...[
            const SizedBox(width: 6),
            TextButton(
              onPressed: onSkip,
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                minimumSize: Size.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: Text(context.l10n.skip, style: AppText.link.copyWith(color: c.textMuted)),
            ),
          ],
        ],
      ),
    );
  }
}

/// 30×30 rounded glass tile with the blue lock icon.
class LogoBadge extends StatelessWidget {
  const LogoBadge({super.key, this.size = 30});

  final double size;

  @override
  Widget build(BuildContext context) {
    final dark = context.isDark;
    return Container(
      width: size,
      height: size,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size / 3),
        border: Border.all(
          color: dark ? const Color(0x29FFFFFF) : AppPalette.blue.withValues(alpha: 0.25),
        ),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: dark
              ? [const Color(0x21FFFFFF), AppPalette.blue.withValues(alpha: 0.2)]
              : [Colors.white, AppPalette.blue.withValues(alpha: 0.18)],
        ),
        boxShadow: [
          BoxShadow(
            color: AppPalette.blue.withValues(alpha: 0.22),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: SvgPicture.asset('assets/svg/header_lock.svg', width: size * 0.42),
    );
  }
}

/// Small round button that flips between light and dark mode.
class ThemeToggleButton extends StatelessWidget {
  const ThemeToggleButton({super.key});

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    return Semantics(
      button: true,
      label: context.isDark ? context.l10n.switchToLight : context.l10n.switchToDark,
      child: InkResponse(
        onTap: ThemeController.instance.toggle,
        radius: 20,
        child: Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: c.glassFill,
            border: Border.all(color: c.glassBorder),
          ),
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 250),
            transitionBuilder: (child, a) => RotationTransition(turns: a, child: FadeTransition(opacity: a, child: child)),
            child: Icon(
              context.isDark ? Icons.light_mode_rounded : Icons.dark_mode_rounded,
              key: ValueKey(context.isDark),
              size: 15,
              color: c.textLabel,
            ),
          ),
        ),
      ),
    );
  }
}

/// Page indicator: active dot is a 24×5 blue→violet pill, others 6×5.
class PageDots extends StatelessWidget {
  const PageDots({super.key, this.count = 3, required this.index});

  final int count;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (var i = 0; i < count; i++) ...[
          if (i > 0) const SizedBox(width: 8),
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
            width: i == index ? 24 : 6,
            height: 5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(99),
              gradient: i == index ? AppPalette.brandGradient : null,
              color: i == index ? null : context.colors.dotInactive,
            ),
          ),
        ],
      ],
    );
  }
}

/// Big purple pill button ("Continue →"). Shrinks slightly when pressed.
class PrimaryButton extends StatefulWidget {
  const PrimaryButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.showArrow = true,
    this.leading,
    this.width = double.infinity,
    this.height = 58,
  });

  final String label;
  final VoidCallback? onPressed;
  final bool showArrow;
  final Widget? leading;
  final double width;
  final double height;

  @override
  State<PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  bool _down = false;

  @override
  Widget build(BuildContext context) {
    final enabled = widget.onPressed != null;
    return Semantics(
      button: true,
      enabled: enabled,
      label: widget.label,
      child: GestureDetector(
        onTapDown: enabled ? (_) => setState(() => _down = true) : null,
        onTapCancel: () => setState(() => _down = false),
        onTapUp: enabled ? (_) => setState(() => _down = false) : null,
        onTap: widget.onPressed,
        child: AnimatedScale(
          scale: _down ? 0.97 : 1,
          duration: const Duration(milliseconds: 120),
          child: AnimatedOpacity(
            opacity: enabled ? 1 : 0.5,
            duration: const Duration(milliseconds: 200),
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: widget.width),
              child: Container(
                height: widget.height,
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: AppPalette.accent,
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(color: const Color(0x2EFFFFFF)),
                  boxShadow: [
                    BoxShadow(
                      color: AppPalette.accent.withValues(alpha: 0.28),
                      blurRadius: 14,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                foregroundDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment(0, -0.85),
                    colors: [Color(0x38FFFFFF), Color(0x00FFFFFF)],
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (widget.leading != null) ...[widget.leading!, const SizedBox(width: 8)],
                    Flexible(
                      child: Text(widget.label, maxLines: 1, overflow: TextOverflow.ellipsis, style: AppText.button.copyWith(color: Colors.white)),
                    ),
                    if (widget.showArrow) ...[
                      const SizedBox(width: 5),
                      // points the reading direction (flips for Urdu/Arabic)
                      Transform.flip(
                        flipX: Directionality.of(context) == TextDirection.rtl,
                        child: SvgPicture.asset('assets/svg/arrow_right.svg', width: 14, height: 14),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Frosted card used for options, stats and permission rows.
class GlassCard extends StatelessWidget {
  const GlassCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(14),
    this.radius = 16,
    this.color,
    this.borderColor,
    this.onTap,
  });

  final Widget child;
  final EdgeInsetsGeometry padding;
  final double radius;
  final Color? color;
  final Color? borderColor;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final card = AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      padding: padding,
      decoration: BoxDecoration(
        color: color ?? c.glassFill,
        borderRadius: BorderRadius.circular(radius),
        border: Border.all(color: borderColor ?? c.glassBorder),
      ),
      child: child,
    );
    if (onTap == null) return card;
    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(radius),
        child: card,
      ),
    );
  }
}

/// Layout shared by the onboarding pages: header at top, scrollable body in the
/// middle, page dots + button pinned at the bottom.
class OnboardingScaffold extends StatelessWidget {
  const OnboardingScaffold({
    super.key,
    required this.body,
    required this.button,
    this.dotsIndex,
    this.dotsCount = 3,
    this.onSkip,
    this.showSkip = true,
    this.blobs = Blob.onboarding,
    this.starsAsset = 'assets/svg/ob1_stars.svg',
    this.footerExtra,
  });

  final Widget body;
  final Widget button;
  final int? dotsIndex;
  final int dotsCount;
  final VoidCallback? onSkip;
  final bool showSkip;
  final List<Blob> blobs;
  final String? starsAsset;

  /// Optional small text under the button (e.g. "You can change this later").
  final Widget? footerExtra;

  @override
  Widget build(BuildContext context) {
    final scope = OnboardingPageScope.maybeOf(context);
    return Scaffold(
      backgroundColor: Colors.transparent,
      // Inside the conversational flow the background fades and the content slides,
      // while the footer stays still (see FlowSwitchScope).
      body: Stack(
        fit: StackFit.expand,
        children: [
          FlowSwitch.fade(context, GlowBackground(blobs: blobs, starsAsset: starsAsset, child: const SizedBox.shrink())),
          SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: FlowSwitch.content(
                    context,
                    Column(
                      children: [
                        OnboardingHeader(onSkip: onSkip, showSkip: showSkip),
                        // Body fits any screen: shrinks on short phones, centres on tall ones,
                        // and stays a readable width on tablets.
                        Expanded(
                          child: LayoutBuilder(
                            builder: (context, box) => SingleChildScrollView(
                              physics: const BouncingScrollPhysics(),
                              child: Center(
                                child: ConstrainedBox(
                                  constraints: const BoxConstraints(maxWidth: 480),
                                  child: FitToViewport(viewportHeight: box.maxHeight, child: body),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                scope == null ? _staticFooter() : _FlowFooter(scope: scope, button: button, footerExtra: footerExtra),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Footer used when the page is shown on its own (outside the flow).
  Widget _staticFooter() => Padding(
        padding: const EdgeInsets.fromLTRB(AppSpacing.gutter, 18, AppSpacing.gutter, 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (dotsIndex != null) ...[
              PageDots(count: dotsCount, index: dotsIndex!),
              const SizedBox(height: 18),
            ],
            button,
            if (footerExtra != null) ...[const SizedBox(height: 12), footerExtra!],
          ],
        ),
      );
}

/// Footer inside the onboarding flow. While pages slide, it stays still on
/// screen: the dots glide to the next step and the buttons cross-fade.
/// From the second page on, a back arrow sits left of the main button.
class _FlowFooter extends StatelessWidget {
  const _FlowFooter({required this.scope, required this.button, this.footerExtra});

  final OnboardingPageScope scope;
  final Widget button;
  final Widget? footerExtra;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    // Button row uses the same side gutter as the screen content.
    final rowWidth = width - 2 * AppSpacing.gutter;
    return AnimatedBuilder(
      animation: scope.controller,
      builder: (context, _) {
        final c = scope.controller;
        final paged = c.hasClients && c.position.haveDimensions;
        final pos = paged ? c.page ?? scope.index.toDouble() : scope.index.toDouble();
        final delta = pos - scope.index;
        final nearest = pos.round() == scope.index;
        final fade = (1 - delta.abs() * 1.6).clamp(0.0, 1.0);
        // Outside a PageView (the conversational flow) the dots glide in from the previous step.
        final at = scope.dotsAt;
        final Widget dots = !paged && at != null
            ? FlowSwitch.dots(context, FlowDotsGlide(from: (scope.dotsFrom ?? at).toDouble(), to: at.toDouble()))
            : FlowDots(position: pos);
        return Transform.translate(
          // cancel the page's slide so the footer stays in place
          offset: Offset(delta * width, 0),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(AppSpacing.gutter, 16, AppSpacing.gutter, 6),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Only the nearest page draws the dots, so they never double up.
                SizedBox(height: 5, child: nearest ? dots : null),
                const SizedBox(height: 18),
                IgnorePointer(
                  ignoring: !nearest,
                  child: Opacity(
                    opacity: fade,
                    child: FlowSwitch.fade(
                      context,
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            width: rowWidth,
                            child: Row(
                              children: [
                                if (scope.index > 0) ...[
                                  BackCircleButton(onPressed: scope.onBack),
                                  const SizedBox(width: 10),
                                ],
                                Expanded(child: button),
                              ],
                            ),
                          ),
                          // Same height on every page (text or not), so the dots
                          // and buttons never jump while pages change.
                          SizedBox(
                            height: 36,
                            child: footerExtra == null
                                ? null
                                : Padding(
                                    padding: const EdgeInsets.only(top: 12),
                                    child: Align(alignment: Alignment.topCenter, child: footerExtra),
                                  ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
