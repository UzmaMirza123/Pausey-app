import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

import '../utils/app_theme.dart';

/// Soft, out-of-focus lavender leaves growing from the bottom-left and
/// bottom-right corners (onboarding screens). Purely decorative: it sits behind
/// the content and the buttons and never takes touches.
class CornerLeaves extends StatelessWidget {
  const CornerLeaves({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = context.isDark;
    final size = MediaQuery.sizeOf(context);
    // Each cluster is about a third of the width, never huge on tablets.
    final w = (size.width * 0.46).clamp(140.0, 240.0);
    final h = w * 1.35;
    Widget cluster({required bool mirror}) => SizedBox(
          width: w,
          height: h,
          child: Transform(
            alignment: Alignment.center,
            transform: Matrix4.diagonal3Values(mirror ? -1 : 1, 1, 1),
            child: Stack(
              fit: StackFit.expand,
              children: [
                // Back leaves: a little sharper and lighter.
                ImageFiltered(
                  imageFilter: ui.ImageFilter.blur(sigmaX: 1.2, sigmaY: 1.2),
                  child: CustomPaint(painter: _LeavesPainter(dark: dark, front: false)),
                ),
                // Front leaves: bigger and more out of focus (depth of field).
                ImageFiltered(
                  imageFilter: ui.ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                  child: CustomPaint(painter: _LeavesPainter(dark: dark, front: true)),
                ),
              ],
            ),
          ),
        );
    return IgnorePointer(
      child: ExcludeSemantics(
        child: Stack(
          children: [
            Positioned(left: -w * 0.30, bottom: -h * 0.06, child: cluster(mirror: false)),
            Positioned(right: -w * 0.30, bottom: -h * 0.06, child: cluster(mirror: true)),
          ],
        ),
      ),
    );
  }
}

/// One leaf: base at the bottom, pointing up along [angle] (radians, 0 = straight up,
/// positive = leaning right), [length] and [width] as fractions of the cluster.
class _Leaf {
  const _Leaf(this.baseX, this.angle, this.length, this.width, this.tone);
  final double baseX, angle, length, width;

  /// 0 = palest lavender … 1 = deepest violet.
  final double tone;
}

class _LeavesPainter extends CustomPainter {
  _LeavesPainter({required this.dark, required this.front});
  final bool dark, front;

  // Broad leaves fanning out from the corner (angles lean towards the screen's middle).
  static const _back = [
    _Leaf(0.42, 0.20, 0.92, 0.26, 0.30),
    _Leaf(0.50, 0.62, 0.80, 0.25, 0.50),
    _Leaf(0.36, -0.12, 0.74, 0.22, 0.18),
    _Leaf(0.55, 1.05, 0.62, 0.22, 0.40),
  ];

  static const _front = [
    _Leaf(0.30, 0.40, 0.66, 0.32, 0.70),
    _Leaf(0.50, 1.25, 0.52, 0.28, 0.90),
    _Leaf(0.22, 0.05, 0.56, 0.27, 0.60),
  ];

  @override
  void paint(Canvas canvas, Size size) {
    final light = dark ? const Color(0xFF6B5AC9) : const Color(0xFFD9CCFF);
    final deep = dark ? const Color(0xFF3A2C86) : const Color(0xFFA48FF0);
    final alpha = dark ? (front ? 0.60 : 0.50) : (front ? 0.80 : 0.70);
    for (final leaf in front ? _front : _back) {
      final base = Offset(size.width * leaf.baseX, size.height);
      final len = size.height * leaf.length;
      final half = size.width * leaf.width;
      final c = Color.lerp(light, deep, leaf.tone)!;
      canvas.save();
      canvas.translate(base.dx, base.dy);
      canvas.rotate(leaf.angle);
      // Leaf outline: two curves meeting in a soft point at the tip.
      final path = Path()
        ..moveTo(0, 0)
        ..cubicTo(half * 1.25, -len * 0.25, half * 0.9, -len * 0.75, 0, -len)
        ..cubicTo(-half * 0.9, -len * 0.75, -half * 1.25, -len * 0.25, 0, 0)
        ..close();
      final rect = Rect.fromLTWH(-half, -len, half * 2, len);
      canvas.drawPath(
        path,
        Paint()
          ..shader = ui.Gradient.linear(
            rect.bottomLeft,
            rect.topRight,
            [c.withValues(alpha: alpha), Color.lerp(c, Colors.white, dark ? 0.12 : 0.45)!.withValues(alpha: alpha * 0.85)],
          ),
      );
      // Midrib: a faint lighter line down the middle.
      canvas.drawPath(
        Path()
          ..moveTo(0, -len * 0.04)
          ..quadraticBezierTo(half * 0.12, -len * 0.5, 0, -len * 0.9),
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = math.max(1, half * 0.05)
          ..color = Colors.white.withValues(alpha: dark ? 0.10 : 0.35),
      );
      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(_LeavesPainter old) => old.dark != dark || old.front != front;
}
