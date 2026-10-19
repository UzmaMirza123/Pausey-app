import 'package:flutter/material.dart';

import '../utils/app_theme.dart';

/// Soft, out-of-focus leaves along the bottom-left and bottom-right edges
/// (onboarding screens), mostly off-screen like a blurred photo backdrop.
/// Purely decorative: behind the content and the buttons, never takes touches.
class CornerLeaves extends StatelessWidget {
  const CornerLeaves({super.key});

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: ExcludeSemantics(
        child: CustomPaint(painter: _CornerLeavesPainter(dark: context.isDark), size: Size.infinite),
      ),
    );
  }
}

/// One leaf, in design pixels on a 412-wide screen: base [x] from the screen edge
/// (negative = off-screen), [y] above the bottom; [angle] in degrees from straight up,
/// leaning towards the middle of the screen; [blur] = how out of focus it is.
class _Leaf {
  const _Leaf(this.x, this.y, this.angle, this.length, this.width, this.color, this.blur);
  final double x, y, angle, length, width, blur;
  final int color;
}

class _CornerLeavesPainter extends CustomPainter {
  _CornerLeavesPainter({required this.dark});
  final bool dark;

  // Dusty lavender / blue-grey tones (like the reference), not bright purple.
  static const _left = [
    _Leaf(-6, 178, 14, 96, 34, 0xFF8E8BC4, 3.5),
    _Leaf(-10, 118, 44, 92, 36, 0xFF8792BF, 4.0),
    _Leaf(-8, 62, 60, 80, 32, 0xFFA7A9D6, 4.5),
    _Leaf(-2, -4, 26, 94, 38, 0xFF9C8AD8, 5.0),
    _Leaf(34, -16, 54, 66, 30, 0xFFBDAFEC, 6.0),
  ];

  static const _right = [
    _Leaf(-4, 156, 16, 108, 38, 0xFF8F8EC2, 3.5),
    _Leaf(-8, 90, 46, 96, 40, 0xFF8490BC, 4.0),
    _Leaf(8, -10, 20, 104, 42, 0xFF7C8FAD, 4.5),
    _Leaf(44, -22, 52, 80, 36, 0xFF8585B5, 5.5),
  ];

  @override
  void paint(Canvas canvas, Size size) {
    final k = (size.width / 412).clamp(0.8, 1.4);
    // Very soft lavender light pooling at the bottom corners.
    for (final cx in [size.width * 0.12, size.width * 0.86]) {
      final c = Offset(cx, size.height + 18 * k);
      canvas.drawCircle(
        c,
        110 * k,
        Paint()
          ..shader = RadialGradient(
            colors: [
              (dark ? const Color(0xFF6C5CE0) : const Color(0xFFC7B8FF)).withValues(alpha: dark ? 0.22 : 0.45),
              const Color(0x00C7B8FF),
            ],
          ).createShader(Rect.fromCircle(center: c, radius: 110 * k)),
      );
    }
    for (final leaf in _left) {
      _leaf(canvas, size, leaf, k, right: false);
    }
    for (final leaf in _right) {
      _leaf(canvas, size, leaf, k, right: true);
    }
  }

  void _leaf(Canvas canvas, Size size, _Leaf leaf, double k, {required bool right}) {
    final len = leaf.length * k, half = leaf.width * k / 2;
    final baseX = right ? size.width - leaf.x * k : leaf.x * k;
    final base = Offset(baseX, size.height - leaf.y * k);
    final tilt = leaf.angle * 3.14159265 / 180 * (right ? -1 : 1);
    var color = Color(leaf.color);
    if (dark) color = Color.lerp(color, const Color(0xFF2A2366), 0.55)!;
    final alpha = dark ? 0.60 : 0.78;

    canvas.save();
    canvas.translate(base.dx, base.dy);
    canvas.rotate(tilt);
    // Oval leaf with a soft point at the tip.
    final path = Path()
      ..moveTo(0, 0)
      ..cubicTo(half * 1.35, -len * 0.18, half * 1.15, -len * 0.78, 0, -len)
      ..cubicTo(-half * 1.15, -len * 0.78, -half * 1.35, -len * 0.18, 0, 0)
      ..close();
    final rect = Rect.fromLTWH(-half, -len, half * 2, len);
    canvas.drawPath(
      path,
      Paint()
        ..maskFilter = MaskFilter.blur(BlurStyle.normal, leaf.blur * k)
        ..shader = LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            color.withValues(alpha: alpha),
            Color.lerp(color, dark ? const Color(0xFF8C7FE0) : Colors.white, 0.28)!.withValues(alpha: alpha * 0.9),
          ],
        ).createShader(rect),
    );
    canvas.restore();
  }

  @override
  bool shouldRepaint(_CornerLeavesPainter old) => old.dark != dark;
}
