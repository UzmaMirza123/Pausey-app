import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../../../utils/app_theme.dart';
import '../../../utils/l10n.dart';

// Top illustration of "More time for what?": an hourglass whose sand keeps
// falling, with two orbit lines carrying
// little dots, twinkling sparkles and six round icons floating on the sides
// (alarm, target, chart · calendar, 2h, calm). Animations off: one still frame.

const _tau = math.pi * 2;

// The same purples as the clock ring on "Lose track of time?" (light lilac → violet → brand purple).
const _ink = AppPalette.accent;
const _lilac = Color(0xFFB7A6FF);
const _deep = AppPalette.accent;

class ObHourglassHero extends StatefulWidget {
  const ObHourglassHero({super.key});

  @override
  State<ObHourglassHero> createState() => _ObHourglassHeroState();
}

class _ObHourglassHeroState extends State<ObHourglassHero> with SingleTickerProviderStateMixin {
  late final Ticker _ticker = createTicker(_tick);
  final ValueNotifier<double> _t = ValueNotifier(0);
  Duration _last = Duration.zero;

  void _tick(Duration elapsed) {
    final dt = ((elapsed - _last).inMicroseconds / 1e6).clamp(0.0, 0.1);
    _last = elapsed;
    _t.value += dt;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (MediaQuery.maybeDisableAnimationsOf(context) ?? false) {
      if (_ticker.isActive) _ticker.stop();
      _t.value = 1.4;
    } else if (!_ticker.isActive) {
      _last = Duration.zero;
      _ticker.start();
    }
  }

  @override
  void dispose() {
    _ticker.dispose();
    _t.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final dark = context.isDark;
    final l = context.l10n;
    final h = (MediaQuery.sizeOf(context).height * 0.24).clamp(170.0, 215.0);
    return ExcludeSemantics(
      child: LayoutBuilder(
        builder: (context, box) {
          final w = math.min(box.maxWidth, 420.0);
          final k = math.min(w / 400, h / 220);
          return Center(
            child: _Entrance(
              child: SizedBox(
                width: w,
                height: h,
                child: ValueListenableBuilder<double>(
                  valueListenable: _t,
                  builder: (context, t, _) {
                    final c = Offset(w / 2, h / 2);
                    final b = 46 * k; // badge size
                    Offset bob(int i) => Offset(0, math.sin(t * _tau / 4.2 + i * 1.1) * 3 * k);
                    Widget badge(int i, Offset at, Widget child, {double scale = 1}) {
                      final p = at + bob(i);
                      final s = b * scale;
                      return Positioned(left: p.dx - s / 2, top: p.dy - s / 2, width: s, height: s, child: child);
                    }

                    final hh = h * 0.80, hw = hh * 0.52;
                    return Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Positioned.fill(child: CustomPaint(painter: _BackdropPainter(center: c, k: k, t: t, dark: dark, w: w, h: h))),
                        // Hourglass, tilted (like the reference) and gently rocking.
                        Positioned(
                          left: c.dx - hw / 2,
                          top: c.dy - hh / 2,
                          width: hw,
                          height: hh,
                          child: Transform.rotate(
                            angle: -0.2 + math.sin(t * _tau / 7) * 0.03,
                            child: CustomPaint(painter: _HourglassPainter(t: t, dark: dark, k: k)),
                          ),
                        ),
                        // Left icons.
                        badge(0, Offset(c.dx - 150 * k, c.dy - 62 * k), _Badge(icon: Icons.alarm_rounded, filled: true, dark: dark), scale: 1.2),
                        badge(1, Offset(c.dx - 176 * k, c.dy + 8 * k), _Badge(icon: Icons.track_changes_rounded, dark: dark)),
                        badge(2, Offset(c.dx - 140 * k, c.dy + 70 * k), _Badge(icon: Icons.bar_chart_rounded, dark: dark)),
                        // Right icons.
                        badge(3, Offset(c.dx + 146 * k, c.dy - 66 * k), _Badge(icon: Icons.calendar_month_rounded, dark: dark)),
                        badge(4, Offset(c.dx + 176 * k, c.dy + 4 * k), _Badge(text: '2${l.unitH}', progress: 0.72, dark: dark)),
                        badge(5, Offset(c.dx + 142 * k, c.dy + 70 * k), _Badge(icon: Icons.self_improvement_rounded, dark: dark)),
                      ],
                    );
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

/// Fade + scale 0.94 → 1 once.
class _Entrance extends StatelessWidget {
  const _Entrance({required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.maybeDisableAnimationsOf(context) ?? false) return child;
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: 1),
      duration: const Duration(milliseconds: 550),
      curve: Curves.easeOutCubic,
      builder: (_, v, c) => Opacity(opacity: v, child: Transform.scale(scale: 0.94 + 0.06 * v, child: c)),
      child: child,
    );
  }
}

/// Round white badge with a soft lavender glow; [filled] = the purple one.
/// Shows an [icon], or [text] with a [progress] arc around it.
class _Badge extends StatelessWidget {
  const _Badge({this.icon, this.text, this.progress, this.filled = false, required this.dark});
  final IconData? icon;
  final String? text;
  final double? progress;
  final bool filled, dark;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, box) {
      final s = box.maxWidth;
      final fg = filled ? Colors.white : _ink;
      return Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: filled ? null : (dark ? const Color(0xFF241F48) : Colors.white),
          gradient: filled ? const LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [_lilac, AppPalette.violet, _deep]) : null,
          border: filled ? null : Border.all(color: AppPalette.violet.withValues(alpha: dark ? 0.25 : 0.18)),
          boxShadow: [
            BoxShadow(color: _deep.withValues(alpha: filled ? 0.50 : (dark ? 0.30 : 0.22)), blurRadius: s * (filled ? 0.55 : 0.4), spreadRadius: s * 0.02),
          ],
        ),
        alignment: Alignment.center,
        child: text == null
            ? Icon(icon, size: s * 0.5, color: fg)
            : Stack(alignment: Alignment.center, children: [
                SizedBox(
                  width: s * 0.74,
                  height: s * 0.74,
                  child: CircularProgressIndicator(
                    value: progress,
                    strokeWidth: s * 0.06,
                    strokeCap: StrokeCap.round,
                    color: _ink,
                    backgroundColor: AppPalette.violet.withValues(alpha: 0.15),
                  ),
                ),
                Text(text!, style: AppText.rowTitle.copyWith(fontSize: s * 0.26, height: 1, fontWeight: FontWeight.w800, color: _ink)),
              ]),
      );
    });
  }
}

/// Glow, two orbit lines with travelling dots, sparkles.
class _BackdropPainter extends CustomPainter {
  _BackdropPainter({required this.center, required this.k, required this.t, required this.dark, required this.w, required this.h});
  final Offset center;
  final double k, t, w, h;
  final bool dark;

  void _sparkle(Canvas canvas, Offset c, double r, Color color) {
    final q = r * 0.28;
    canvas.drawPath(
      Path()
        ..moveTo(c.dx, c.dy - r)
        ..quadraticBezierTo(c.dx + q, c.dy - q, c.dx + r, c.dy)
        ..quadraticBezierTo(c.dx + q, c.dy + q, c.dx, c.dy + r)
        ..quadraticBezierTo(c.dx - q, c.dy + q, c.dx - r, c.dy)
        ..quadraticBezierTo(c.dx - q, c.dy - q, c.dx, c.dy - r)
        ..close(),
      Paint()..color = color,
    );
  }

  @override
  void paint(Canvas canvas, Size size) {
    // Glow.
    final glowR = h * 0.75;
    canvas.drawCircle(
      center,
      glowR,
      Paint()
        ..shader = RadialGradient(colors: [
          AppPalette.violet.withValues(alpha: dark ? 0.26 : 0.24),
          AppPalette.violet.withValues(alpha: 0),
        ]).createShader(Rect.fromCircle(center: center, radius: glowR)),
    );
    // Two orbit lines (tilted ellipses) with dots travelling along them.
    final orbits = [
      (rx: w * 0.47, ry: h * 0.24, tilt: -0.10, speed: 1 / 14.0, colors: const [Color(0xFF93AEFF), Color(0xFFC6A9FF)]),
      (rx: w * 0.40, ry: h * 0.34, tilt: 0.16, speed: -1 / 18.0, colors: const [Color(0xFF93AEFF), Color(0xFFB9A3FF)]),
    ];
    for (final (i, o) in orbits.indexed) {
      canvas.save();
      canvas.translate(center.dx, center.dy + 6 * k);
      canvas.rotate(o.tilt);
      final r = Rect.fromCenter(center: Offset.zero, width: o.rx * 2, height: o.ry * 2);
      canvas.drawOval(
        r,
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2 * k
          ..shader = SweepGradient(colors: [
            Colors.white.withValues(alpha: dark ? 0.10 : 0.9),
            AppPalette.violet.withValues(alpha: dark ? 0.30 : 0.35),
            Colors.white.withValues(alpha: dark ? 0.06 : 0.6),
            AppPalette.violet.withValues(alpha: dark ? 0.30 : 0.30),
            Colors.white.withValues(alpha: dark ? 0.10 : 0.9),
          ]).createShader(r),
      );
      for (var d = 0; d < 2; d++) {
        final a = t * _tau * o.speed + d * math.pi + i * 1.3;
        final p = Offset(math.cos(a) * o.rx, math.sin(a) * o.ry);
        final col = o.colors[d];
        canvas.drawCircle(p, 6 * k, Paint()..color = col.withValues(alpha: 0.30)..maskFilter = MaskFilter.blur(BlurStyle.normal, 4 * k));
        canvas.drawCircle(p, 4.2 * k, Paint()..color = col);
        canvas.drawCircle(p + Offset(-1.3 * k, -1.3 * k), 1.4 * k, Paint()..color = Colors.white.withValues(alpha: 0.7));
      }
      canvas.restore();
    }
    // Twinkling sparkles.
    for (final (i, (dx, dy, r, blue)) in const [(-98.0, -78.0, 9.0, false), (-62.0, -2.0, 7.0, false), (66.0, -8.0, 7.5, false), (84.0, 52.0, 8.0, true)].indexed) {
      final tw = 0.55 + 0.45 * (0.5 + 0.5 * math.sin(t * _tau / 2.4 + i * 1.7));
      final col = blue ? const Color(0xFF93AEFF) : _lilac;
      _sparkle(canvas, center + Offset(dx * k, dy * k), r * k * (0.85 + 0.15 * tw), col.withValues(alpha: 0.9 * tw));
    }
  }

  @override
  bool shouldRepaint(_BackdropPainter old) => old.t != t || old.center != center || old.dark != dark || old.k != k;
}

/// Glass hourglass with thick purple caps; sand falls in a thin stream with grains.
class _HourglassPainter extends CustomPainter {
  _HourglassPainter({required this.t, required this.dark, required this.k});
  final double t, k;
  final bool dark;

  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width, h = size.height;
    final cap = h * 0.075;
    final top = cap * 0.9, bottom = h - cap * 0.9;
    final cx = w / 2, mid = (top + bottom) / 2, g = bottom - top;
    final l = w * 0.12, r = w * 0.88, neck = w * 0.04;
    final glass = Path()
      ..moveTo(l, top)
      ..cubicTo(l, top + g * 0.30, cx - neck, mid - g * 0.14, cx - neck, mid)
      ..cubicTo(cx - neck, mid + g * 0.14, l, bottom - g * 0.30, l, bottom)
      ..lineTo(r, bottom)
      ..cubicTo(r, bottom - g * 0.30, cx + neck, mid + g * 0.14, cx + neck, mid)
      ..cubicTo(cx + neck, mid - g * 0.14, r, top + g * 0.30, r, top)
      ..close();
    final box = Offset.zero & size;

    // Soft back panel (the tinted glass box behind, like the reference).
    canvas.drawRRect(
      RRect.fromRectAndRadius(Rect.fromLTRB(w * 0.08, top, w * 0.92, bottom), Radius.circular(w * 0.06)),
      Paint()..color = (dark ? Colors.white : AppPalette.violet).withValues(alpha: dark ? 0.05 : 0.08),
    );
    // Glass.
    canvas.drawPath(
      glass,
      Paint()
        ..shader = LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: dark ? [Colors.white.withValues(alpha: 0.14), Colors.white.withValues(alpha: 0.05)] : [Colors.white.withValues(alpha: 0.95), const Color(0xFFE9E3FF)],
        ).createShader(box),
    );

    // Sand.
    canvas.save();
    canvas.clipPath(glass);
    final sand = Paint()
      ..shader = const LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [_lilac, AppPalette.violet, _deep]).createShader(Rect.fromLTWH(0, top, w, g));
    final wobble = math.sin(t * _tau / 2.2) * g * 0.006;
    final topLevel = top + (mid - top) * 0.42;
    canvas.drawPath(
      Path()
        ..moveTo(0, topLevel)
        ..quadraticBezierTo(cx, topLevel + g * 0.07 + wobble, w, topLevel)
        ..lineTo(w, mid)
        ..lineTo(0, mid)
        ..close(),
      sand,
    );
    final pileTop = bottom - (bottom - mid) * 0.52;
    canvas.drawPath(
      Path()
        ..moveTo(0, bottom)
        ..lineTo(0, pileTop + g * 0.11)
        ..quadraticBezierTo(cx, pileTop - g * 0.07 - wobble, w, pileTop + g * 0.11)
        ..lineTo(w, bottom)
        ..close(),
      sand,
    );
    // Falling stream + grains.
    final peak = pileTop + g * 0.02;
    canvas.drawLine(
      Offset(cx, mid),
      Offset(cx, peak),
      Paint()
        ..strokeWidth = 1.3 * k
        ..color = _deep.withValues(alpha: 0.5),
    );
    for (var i = 0; i < 7; i++) {
      final p = (t * 0.8 + i / 7) % 1;
      canvas.drawCircle(
        Offset(cx + math.sin(i * 2.3 + t * 3) * 1.3 * k, mid + p * (peak - mid)),
        1.6 * k,
        Paint()..color = AppPalette.violet.withValues(alpha: 1 - p * 0.5),
      );
    }
    canvas.restore();

    // Highlights + outline.
    canvas.drawPath(
      Path()
        ..moveTo(l + w * 0.09, top + g * 0.06)
        ..quadraticBezierTo(l + w * 0.07, top + g * 0.22, cx - neck * 3.2, mid - g * 0.12),
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2.4 * k
        ..strokeCap = StrokeCap.round
        ..color = Colors.white.withValues(alpha: dark ? 0.30 : 0.95),
    );
    canvas.drawPath(
      Path()
        ..moveTo(r - w * 0.10, bottom - g * 0.08)
        ..quadraticBezierTo(r - w * 0.08, bottom - g * 0.2, cx + neck * 3, mid + g * 0.14),
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.6 * k
        ..strokeCap = StrokeCap.round
        ..color = Colors.white.withValues(alpha: dark ? 0.18 : 0.7),
    );
    canvas.drawPath(
      glass,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.4 * k
        ..color = dark ? Colors.white.withValues(alpha: 0.26) : AppPalette.violet.withValues(alpha: 0.45),
    );

    // Thick purple caps.
    for (final y in [0.0, h - cap * 1.25]) {
      final rr = RRect.fromRectAndRadius(Rect.fromLTWH(0, y, w, cap * 1.25), Radius.circular(cap * 0.62));
      canvas.drawRRect(
        rr.shift(Offset(0, 3 * k)),
        Paint()
          ..color = _deep.withValues(alpha: dark ? 0.50 : 0.32)
          ..maskFilter = MaskFilter.blur(BlurStyle.normal, 5 * k),
      );
      canvas.drawRRect(rr, Paint()..shader = const LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [_lilac, AppPalette.violet, _deep]).createShader(rr.outerRect));
      canvas.drawRRect(
        RRect.fromRectAndRadius(Rect.fromLTWH(w * 0.10, y + cap * 0.2, w * 0.8, cap * 0.28), Radius.circular(cap)),
        Paint()..color = Colors.white.withValues(alpha: 0.35),
      );
    }
  }

  @override
  bool shouldRepaint(_HourglassPainter old) => old.t != t || old.dark != dark || old.k != k;
}
