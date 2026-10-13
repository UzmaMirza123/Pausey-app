import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/app_theme.dart';

/// Tells an onboarding page where it sits in the flow. The flow wraps every
/// page in one of these so the shared footer can animate and go back.
class OnboardingPageScope extends InheritedWidget {
  const OnboardingPageScope({
    super.key,
    required this.index,
    required this.controller,
    required this.onBack,
    required super.child,
  });

  final int index;
  final PageController controller;
  final VoidCallback onBack;

  static OnboardingPageScope? maybeOf(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<OnboardingPageScope>();

  @override
  bool updateShouldNotify(OnboardingPageScope old) => old.index != index || old.controller != controller;
}

/// Three dots that follow the page position. Each new screen moves the active
/// pill one dot to the right (1 → 2 → 3 → 1 …), sliding smoothly while the
/// page changes.
class FlowDots extends StatelessWidget {
  const FlowDots({super.key, required this.position, this.count = 3});

  /// Current page position (can be fractional mid-swipe).
  final double position;
  final int count;

  @override
  Widget build(BuildContext context) {
    final inactive = context.colors.dotInactive;
    final active = position % count;
    return Semantics(
      label: 'Step ${position.round() + 1}',
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (var i = 0; i < count; i++) ...[
            if (i > 0) const SizedBox(width: 8),
            Builder(builder: (_) {
              final d = (active - i).abs();
              final dist = math.min(d, count - d); // wraps 3 → 1
              final a = Curves.easeInOut.transform((1 - dist).clamp(0.0, 1.0));
              return Container(
                width: 6 + 18 * a,
                height: 5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(99),
                  gradient: LinearGradient(colors: [
                    Color.lerp(inactive, AppPalette.blue, a)!,
                    Color.lerp(inactive, AppPalette.violet, a)!,
                  ]),
                ),
              );
            }),
          ],
        ],
      ),
    );
  }
}

/// Round 58×58 back button that sits left of the main button.
class BackCircleButton extends StatefulWidget {
  const BackCircleButton({super.key, required this.onPressed, this.size = 58});

  final VoidCallback onPressed;
  final double size;

  @override
  State<BackCircleButton> createState() => _BackCircleButtonState();
}

class _BackCircleButtonState extends State<BackCircleButton> {
  bool _down = false;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final dark = context.isDark;
    return Semantics(
      button: true,
      label: 'Back',
      child: GestureDetector(
        onTapDown: (_) => setState(() => _down = true),
        onTapCancel: () => setState(() => _down = false),
        onTapUp: (_) => setState(() => _down = false),
        onTap: widget.onPressed,
        child: AnimatedScale(
          scale: _down ? 0.92 : 1,
          duration: const Duration(milliseconds: 120),
          child: Container(
            width: widget.size,
            height: widget.size,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: dark ? const Color(0x14FFFFFF) : Colors.white.withValues(alpha: 0.85),
              border: Border.all(color: dark ? const Color(0x2EFFFFFF) : AppPalette.button.withValues(alpha: 0.25)),
              boxShadow: [
                BoxShadow(color: AppPalette.blue.withValues(alpha: dark ? 0.18 : 0.15), blurRadius: 16, offset: const Offset(0, 4)),
              ],
            ),
            child: Transform.rotate(
              angle: math.pi,
              child: SvgPicture.asset(
                'assets/svg/arrow_right.svg',
                width: 16,
                height: 16,
                colorFilter: ColorFilter.mode(dark ? Colors.white : c.textPrimary, BlendMode.srcIn),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Lays the child out at full width and its natural height, then shrinks it
/// (never below [minScale]) so it fits [viewportHeight]. If it is shorter than
/// the viewport it is centred vertically. If it still does not fit at
/// [minScale], it keeps that scale and the parent scroll view scrolls.
class FitToViewport extends SingleChildRenderObjectWidget {
  const FitToViewport({super.key, required this.viewportHeight, this.minScale = 0.62, super.child});

  final double viewportHeight;
  final double minScale;

  @override
  RenderObject createRenderObject(BuildContext context) => _RenderFit(viewportHeight, minScale);

  @override
  void updateRenderObject(BuildContext context, RenderObject renderObject) {
    (renderObject as _RenderFit)
      ..viewportHeight = viewportHeight
      ..minScale = minScale;
  }
}

class _RenderFit extends RenderProxyBox {
  _RenderFit(this._viewportHeight, this._minScale);

  double _viewportHeight;
  double _minScale;
  double _scale = 1;
  Offset _offset = Offset.zero;

  set viewportHeight(double v) {
    if (v == _viewportHeight) return;
    _viewportHeight = v;
    markNeedsLayout();
  }

  set minScale(double v) {
    if (v == _minScale) return;
    _minScale = v;
    markNeedsLayout();
  }

  @override
  void performLayout() {
    final w = constraints.maxWidth;
    final c = child!;
    // Lay the child out a little wider than the screen when it has to shrink,
    // so after scaling it still fills the full width (equal side gaps on
    // every phone). A few passes settle the scale because wider text wraps
    // into fewer lines.
    _scale = 1;
    for (var pass = 0; pass < 3; pass++) {
      c.layout(BoxConstraints.tightFor(width: w / _scale), parentUsesSize: true);
      final ch = c.size.height;
      final next = ch <= 0 ? 1.0 : (_viewportHeight / ch).clamp(_minScale, 1.0);
      if ((next - _scale).abs() < 0.005) break;
      _scale = next;
    }
    c.layout(BoxConstraints.tightFor(width: w / _scale), parentUsesSize: true);
    final ch = c.size.height;
    final h = math.max(_viewportHeight, ch * _scale);
    size = constraints.constrain(Size(w, h));
    _offset = Offset(0, (size.height - ch * _scale) / 2);
  }

  Matrix4 get _transform => Matrix4.identity()
    ..translateByDouble(_offset.dx, _offset.dy, 0, 1)
    ..scaleByDouble(_scale, _scale, 1, 1);

  @override
  void paint(PaintingContext context, Offset offset) {
    if (child == null) return;
    layer = context.pushTransform(needsCompositing, offset, _transform, (ctx, o) => ctx.paintChild(child!, o),
        oldLayer: layer as TransformLayer?);
  }

  @override
  bool hitTestChildren(BoxHitTestResult result, {required Offset position}) {
    return result.addWithPaintTransform(
      transform: _transform,
      position: position,
      hitTest: (r, p) => child!.hitTest(r, position: p),
    );
  }

  @override
  void applyPaintTransform(RenderBox child, Matrix4 transform) => transform.multiply(_transform);
}
