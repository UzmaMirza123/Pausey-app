import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

import '../utils/app_theme.dart';

/// How far each part of the logo has appeared (0 = hidden, 1 = done).
/// Used to animate the logo piece by piece; all 1 = the finished logo.
@immutable
class LogoProgress {
  const LogoProgress({
    this.glow = 1,
    this.stem = 1,
    this.ring = 1,
    this.button = 1,
    this.bars = 1,
    this.pulse = 0,
  });

  static const done = LogoProgress();

  final double glow;
  final double stem;
  final double ring;
  final double button;
  final double bars;

  /// 0..1 looping "breath" after the intro (soft glow + tiny button swell).
  final double pulse;
}

/// The Pausey mark: a "P" whose round part is a glowing pause button inside a
/// progress ring. Drawn in code, so it is sharp at any size and every part can
/// animate. Looks right on both the light and dark backgrounds.
class PauseyLogo extends StatelessWidget {
  const PauseyLogo({super.key, this.size = 120, this.progress = LogoProgress.done});

  final double size;
  final LogoProgress progress;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: 'Pausey logo',
      image: true,
      child: SizedBox.square(
        dimension: size,
        child: CustomPaint(painter: _LogoPainter(progress, context.isDark)),
      ),
    );
  }
}

class _LogoPainter extends CustomPainter {
  _LogoPainter(this.p, this.dark);

  final LogoProgress p;
  final bool dark;

  // Geometry in a 1024-unit box (same as the app-icon artwork).
  static const _cx = 552.0, _cy = 420.0;
  static const _ringR = 196.0, _ringW = 22.0;
  static const _btnR = 146.0;
  static const _stem = Rect.fromLTWH(272, 220, 104, 584);

  @override
  void paint(Canvas canvas, Size size) {
    final s = size.width / 1024;
    canvas.save();
    canvas.scale(s);
    canvas.translate(-3.5, 0); // centre the mark optically

    final center = const Offset(_cx, _cy);

    // Soft violet glow behind the button.
    if (p.glow > 0) {
      final a = (dark ? 0.55 : 0.32) * p.glow * (0.85 + 0.15 * p.pulse);
      canvas.drawCircle(
        center + const Offset(0, 30),
        230,
        Paint()
          ..color = const Color(0xFF8B5CF6).withValues(alpha: a)
          ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 70),
      );
    }

    // Ring track + gradient progress arc (draws clockwise from 12 o'clock).
    if (p.ring > 0) {
      canvas.drawCircle(
        center,
        _ringR,
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = _ringW
          ..color = (dark ? Colors.white : const Color(0xFF1B1838))
              .withValues(alpha: (dark ? 0.12 : 0.10) * p.ring.clamp(0, 1)),
      );
      final sweep = math.pi * 1.5 * p.ring;
      final arcRect = Rect.fromCircle(center: center, radius: _ringR);
      final arcPaint = Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = _ringW
        ..strokeCap = StrokeCap.round
        ..shader = ui.Gradient.linear(
          const Offset(352, 220),
          const Offset(752, 620),
          dark ? const [Color(0xFFB9A6FF), Color(0xFFF3A6FF)] : const [Color(0xFF8E7BFF), Color(0xFFD16CF5)],
        );
      // glow copy
      canvas.drawArc(
        arcRect,
        -math.pi / 2,
        sweep,
        false,
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = _ringW
          ..strokeCap = StrokeCap.round
          ..color = const Color(0xFFD9B8FF).withValues(alpha: 0.5 * p.ring)
          ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 14),
      );
      canvas.drawArc(arcRect, -math.pi / 2, sweep, false, arcPaint);
    }

    // Pause button: pops in from the centre.
    if (p.button > 0) {
      final scale = p.button * (1 + 0.025 * p.pulse);
      canvas.save();
      canvas.translate(_cx, _cy);
      canvas.scale(scale);
      canvas.translate(-_cx, -_cy);

      canvas.drawCircle(
        center + const Offset(0, 14),
        _btnR,
        Paint()
          ..color = const Color(0xFF3A0FA0).withValues(alpha: dark ? 0.6 : 0.35)
          ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 16),
      );
      canvas.drawCircle(
        center,
        _btnR,
        Paint()
          ..shader = ui.Gradient.radial(
            const Offset(_cx - 58, _cy - 88),
            _btnR * 1.6,
            const [Color(0xFFB49CFF), Color(0xFF6227D9)],
          ),
      );
      // top highlight
      final hl = Rect.fromCenter(center: const Offset(_cx, _cy - 78), width: 192, height: 100);
      canvas.drawOval(
        hl,
        Paint()
          ..shader = ui.Gradient.linear(
            hl.topCenter,
            hl.bottomCenter,
            [Colors.white.withValues(alpha: 0.45), Colors.white.withValues(alpha: 0)],
          ),
      );

      // Pause bars grow from the middle.
      if (p.bars > 0) {
        final h = 124 * p.bars;
        final bar = Paint()..color = Colors.white;
        for (final x in const [_cx - 58, _cx + 18]) {
          canvas.drawRRect(
            RRect.fromRectAndRadius(Rect.fromLTWH(x, _cy - h / 2, 40, h), const Radius.circular(20)),
            bar,
          );
        }
      }
      canvas.restore();
    }

    // Stem of the "P" rises from the bottom.
    if (p.stem > 0) {
      final top = _stem.bottom - _stem.height * p.stem;
      final r = Rect.fromLTRB(_stem.left, top, _stem.right, _stem.bottom);
      canvas.drawRRect(
        RRect.fromRectAndRadius(r, Radius.circular(math.min(52, r.height / 2))),
        Paint()
          ..shader = ui.Gradient.linear(
            _stem.topCenter,
            _stem.bottomCenter,
            const [Color(0xFFC9B8FF), Color(0xFF7C3AED)],
          ),
      );
    }

    canvas.restore();
  }

  @override
  bool shouldRepaint(_LogoPainter old) =>
      old.dark != dark ||
      old.p.glow != p.glow ||
      old.p.stem != p.stem ||
      old.p.ring != p.ring ||
      old.p.button != p.button ||
      old.p.bars != p.bars ||
      old.p.pulse != p.pulse;
}

/// "Pausey" written with each letter rising in, one after another.
class PauseyWordmark extends StatelessWidget {
  const PauseyWordmark({super.key, required this.t, this.style});

  /// 0..1 progress of the letter animation.
  final double t;
  final TextStyle? style;

  static const _word = 'Pausey';

  @override
  Widget build(BuildContext context) {
    final base = style ?? AppText.logo.copyWith(color: context.colors.textPrimary);
    return Semantics(
      label: _word,
      child: ExcludeSemantics(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            for (var i = 0; i < _word.length; i++)
              Builder(builder: (context) {
                // each letter starts a little after the previous one
                final start = i * 0.11;
                final local = ((t - start) / 0.45).clamp(0.0, 1.0);
                final e = Curves.easeOutBack.transform(local);
                final isAccent = i >= 4; // "ey" in the brand gradient
                Widget letter = Text(_word[i], style: base);
                if (isAccent) {
                  letter = ShaderMask(
                    blendMode: BlendMode.srcIn,
                    shaderCallback: (r) => const LinearGradient(
                      colors: [AppPalette.blue, AppPalette.accent],
                    ).createShader(r),
                    child: letter,
                  );
                }
                return Opacity(
                  opacity: local,
                  child: Transform.translate(offset: Offset(0, 18 * (1 - e)), child: letter),
                );
              }),
          ],
        ),
      ),
    );
  }
}
