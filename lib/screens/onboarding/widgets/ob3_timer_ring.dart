import 'dart:async';
import 'dart:math' as math;
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../utils/app_theme.dart';
import 'ob3_svg_light_mapper.dart';

/// 320×320 focus-timer hero (Figma 727:41249). The dial, arc and side cards are
/// the Figma artwork; the countdown text and play/pause button are live, and the
/// gradient arc sweeps in on load and shrinks as the timer runs.
class Ob3TimerRing extends StatefulWidget {
  const Ob3TimerRing({super.key, this.total = const Duration(minutes: 25)});

  final Duration total;

  @override
  State<Ob3TimerRing> createState() => _Ob3TimerRingState();
}

class _Ob3TimerRingState extends State<Ob3TimerRing> with SingleTickerProviderStateMixin {
  late final AnimationController _intro = AnimationController(vsync: this, duration: const Duration(milliseconds: 1200))
    ..forward();
  late final Animation<double> _introCurve = CurvedAnimation(parent: _intro, curve: Curves.easeOutCubic);

  Timer? _ticker;
  late int _remaining = widget.total.inSeconds;

  bool get _running => _ticker != null;

  @override
  void didUpdateWidget(covariant Ob3TimerRing old) {
    super.didUpdateWidget(old);
    if (old.total != widget.total) {
      _stop();
      _remaining = widget.total.inSeconds;
      _intro.forward(from: 0);
    }
  }

  void _toggle() {
    setState(() {
      if (_running) {
        _stop();
      } else {
        if (_remaining <= 0) _remaining = widget.total.inSeconds;
        _ticker = Timer.periodic(const Duration(seconds: 1), (_) {
          setState(() {
            _remaining--;
            if (_remaining <= 0) _stop();
          });
        });
      }
    });
  }

  void _stop() {
    _ticker?.cancel();
    _ticker = null;
  }

  @override
  void dispose() {
    _stop();
    _intro.dispose();
    super.dispose();
  }

  String get _label {
    final m = _remaining ~/ 60, s = _remaining % 60;
    return '${m.toString().padLeft(2, '0')}:${s.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    final dark = context.isDark;
    final fraction = widget.total.inSeconds == 0 ? 0.0 : _remaining / widget.total.inSeconds;
    return SizedBox(
      width: 320,
      height: 320,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          ob3ThemedSvg(context, 'assets/svg/ob3_ring_base.svg', width: 320, height: 320, dark: dark),
          // Progress arc, revealed by a rotating sector clip.
          TweenAnimationBuilder<double>(
            tween: Tween(end: fraction),
            duration: const Duration(milliseconds: 900),
            curve: Curves.easeOut,
            builder: (context, f, child) => AnimatedBuilder(
              animation: _introCurve,
              builder: (context, child) => ClipPath(clipper: _SectorClipper(_introCurve.value * f), child: child),
              child: child,
            ),
            child: SvgPicture.asset('assets/svg/ob3_ring_arc.svg', width: 320, height: 320),
          ),
          ob3ThemedSvg(context, 'assets/svg/ob3_ring_cards.svg', width: 320, height: 320, dark: dark),
          // "25:00" — Nunito ExtraBold 34, tracking -2, centred at x≈159.6, y≈139.6.
          Positioned(
            left: 0,
            right: 0.74,
            top: 119.06,
            height: 41.14,
            child: Center(
              child: OverflowBox(
                maxHeight: 60,
                child: Text(
                  _label,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: AppText.fontFamily,
                    fontSize: 34,
                    fontWeight: FontWeight.w800,
                    letterSpacing: -2,
                    height: 1,
                    color: dark ? Colors.white : context.colors.textPrimary,
                    fontFeatures: const [FontFeature.tabularFigures()],
                  ),
                ),
              ),
            ),
          ),
          // Play / pause button: 28px circle centred at (160, 195).
          Positioned(
            left: 146,
            top: 181,
            child: _PlayButton(running: _running, onTap: _toggle),
          ),
          // Soft blue/violet glow over the dial (Figma "Gradient+Blur", 260×240, blur 19).
          Positioned(
            left: 30,
            top: 40,
            width: 260,
            height: 240,
            child: IgnorePointer(
              child: ImageFiltered(
                imageFilter: ImageFilter.blur(sigmaX: 9.5, sigmaY: 9.5),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(125),
                    gradient: RadialGradient(
                      center: const Alignment(0, 0.1),
                      radius: 0.77,
                      colors: [
                        AppPalette.blue.withValues(alpha: 0.26),
                        AppPalette.violet.withValues(alpha: 0.12),
                        AppPalette.violet.withValues(alpha: 0),
                      ],
                      stops: const [0, 0.45, 0.72],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Pie-slice clip that starts just above 9 o'clock and sweeps clockwise.
/// t = 1 shows the whole Figma arc (incl. its rounded end cap).
class _SectorClipper extends CustomClipper<Path> {
  _SectorClipper(this.t);

  final double t;
  static const _start = 175 * math.pi / 180;
  static const _fullSweep = 305 * math.pi / 180;

  @override
  Path getClip(Size size) {
    final c = size.center(Offset.zero);
    final r = size.width;
    return Path()
      ..moveTo(c.dx, c.dy)
      ..arcTo(Rect.fromCircle(center: c, radius: r), _start, _fullSweep * t.clamp(0.0, 1.0), false)
      ..close();
  }

  @override
  bool shouldReclip(_SectorClipper old) => old.t != t;
}

class _PlayButton extends StatelessWidget {
  const _PlayButton({required this.running, required this.onTap});

  final bool running;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final glyph = context.isDark
        ? Colors.white.withValues(alpha: 0.8)
        : context.colors.textPrimary.withValues(alpha: 0.8);
    return Semantics(
      button: true,
      label: running ? 'Pause timer' : 'Start timer',
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: 28,
          height: 28,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppPalette.blue.withValues(alpha: running ? 0.32 : 0.22),
            border: Border.all(color: AppPalette.blue.withValues(alpha: 0.42)),
          ),
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            transitionBuilder: (child, a) => ScaleTransition(scale: a, child: child),
            child: CustomPaint(
              key: ValueKey(running),
              size: const Size(28, 28),
              painter: _GlyphPainter(running: running, color: glyph),
            ),
          ),
        ),
      ),
    );
  }
}

/// Play triangle (Figma: 156.5,190 → 169.5,195 → 156.5,200 in the 320 box) or pause bars.
class _GlyphPainter extends CustomPainter {
  _GlyphPainter({required this.running, required this.color});

  final bool running;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final p = Paint()..color = color;
    if (running) {
      final r = const Radius.circular(1);
      canvas.drawRRect(RRect.fromRectAndRadius(const Rect.fromLTWH(9.5, 9, 3, 10), r), p);
      canvas.drawRRect(RRect.fromRectAndRadius(const Rect.fromLTWH(15.5, 9, 3, 10), r), p);
    } else {
      canvas.drawPath(
        Path()
          ..moveTo(10.5, 9)
          ..lineTo(23.5, 14)
          ..lineTo(10.5, 19)
          ..close(),
        p,
      );
    }
  }

  @override
  bool shouldRepaint(_GlyphPainter old) => old.running != running || old.color != color;
}
