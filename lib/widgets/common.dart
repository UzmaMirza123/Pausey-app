import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/app_theme.dart';
import '../utils/theme_controller.dart';
import 'corner_leaves.dart';
import 'glow_background.dart';
import 'onboarding_nav.dart';
import '../utils/l10n.dart';

/// Header row on every onboarding screen: theme switch (sun/moon) and "Skip",
/// both on the right.
class OnboardingHeader extends StatelessWidget {
  const OnboardingHeader({super.key, this.onSkip, this.showSkip = true, this.leading});

  final VoidCallback? onSkip;
  final bool showSkip;

  /// Optional widget on the start side (e.g. the Pausey wordmark).
  final Widget? leading;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    return Padding(
      padding: const EdgeInsets.fromLTRB(AppSpacing.gutter, 12, AppSpacing.gutter, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const SizedBox(height: 30),
          if (leading != null) ...[leading!, const Spacer()],
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
    this.headerLeading,
    this.swipeForward = true,
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

  /// Optional widget at the start of the header row.
  final Widget? headerLeading;

  /// false: a left swipe does not run the button (last screen: it would open the app).
  final bool swipeForward;

  @override
  Widget build(BuildContext context) {
    final scope = OnboardingPageScope.maybeOf(context);
    // In the flow a swipe does what the button / back arrow do.
    final b = button;
    return OnboardingSwipe(
      onNext: scope != null && swipeForward && b is PrimaryButton ? b.onPressed : null,
      onBack: scope != null && scope.canBack ? scope.onBack : null,
      child: _scaffold(context, scope),
    );
  }

  Widget _scaffold(BuildContext context, OnboardingPageScope? scope) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      // Inside the conversational flow the background fades and the content slides,
      // while the footer stays still (see FlowSwitchScope).
      body: Stack(
        fit: StackFit.expand,
        children: [
          FlowSwitch.fade(context, GlowBackground(blobs: blobs, starsAsset: starsAsset, child: const SizedBox.shrink())),
          // Soft leaves in the bottom corners, behind the content and the buttons.
          const Positioned.fill(child: CornerLeaves()),
          SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: FlowSwitch.content(
                    context,
                    Column(
                      children: [
                        OnboardingHeader(onSkip: onSkip, showSkip: showSkip, leading: headerLeading),
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

/// Footer inside the onboarding flow. While pages change it stays still on
/// screen: the dots glide to the next step and the buttons cross-fade.
/// From the second screen on, a back arrow sits left of the main button.
class _FlowFooter extends StatelessWidget {
  const _FlowFooter({required this.scope, required this.button, this.footerExtra});

  final OnboardingPageScope scope;
  final Widget button;
  final Widget? footerExtra;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(AppSpacing.gutter, 16, AppSpacing.gutter, 6),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 5,
            child: FlowSwitch.dots(context, FlowDotsGlide(from: scope.dotsFrom.toDouble(), to: scope.dotsAt.toDouble())),
          ),
          const SizedBox(height: 18),
          FlowSwitch.fade(
            context,
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    if (scope.canBack) ...[BackCircleButton(onPressed: scope.onBack), const SizedBox(width: 10)],
                    Expanded(child: button),
                  ],
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
        ],
      ),
    );
  }
}

/// Swipe left / right on an onboarding screen = the same as its primary button
/// ([onNext]) / back arrow ([onBack]); mirrored for right-to-left languages.
/// A null action does nothing (e.g. Continue is still off), so swipes never skip a rule.
class OnboardingSwipe extends StatelessWidget {
  const OnboardingSwipe({super.key, required this.child, this.onNext, this.onBack});
  final Widget child;
  final VoidCallback? onNext, onBack;

  @override
  Widget build(BuildContext context) {
    final rtl = Directionality.of(context) == TextDirection.rtl;
    // Nothing to do: no drag handler, so the drag goes on to others (the intro
    // PageView needs it to swipe pages). The widget stays, so no state is lost.
    final active = onNext != null || onBack != null;
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onHorizontalDragEnd: !active
          ? null
          : (d) {
              final v = d.primaryVelocity ?? 0;
              if (v.abs() < 250) return; // a real swipe, not a small drift
              final forward = rtl ? v > 0 : v < 0;
              (forward ? onNext : onBack)?.call();
            },
      child: child,
    );
  }
}
