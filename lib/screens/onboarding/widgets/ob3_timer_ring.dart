import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../../../utils/app_theme.dart';
import '../../../utils/l10n.dart';

/// "Stay Focused Every Day" hero: a soft focus dial with a gradient progress
/// ring, the live countdown and play/pause in the middle, and floating cards
/// (day streak, goal completion, "Focus builds a better you"), a leaf badge and
/// bubbles around it.
///
/// The ring works as before: it sweeps in on load, shrinks while the timer runs
/// and sweeps in again when the session length changes.
///
/// Laid out on a 400×300 design box and scaled to [width].
class Ob3TimerRing extends StatefulWidget {
  const Ob3TimerRing({super.key, this.total = const Duration(minutes: 25), this.width = 400});

  final Duration total;
  final double width;

  /// Height for a given [width].
  static double heightFor(double width) => width * _h / _w;

  @override
  State<Ob3TimerRing> createState() => _Ob3TimerRingState();
}

const _w = 400.0, _h = 300.0;
const _c = Offset(202, 152);
const _arcR = 82.0; // progress ring radius
const _arcStroke = 13.0;
const _discR = 63.0; // inner plate
const _dialR = 104.0; // outer plate with ticks

class _Ob3TimerRingState extends State<Ob3TimerRing> with TickerProviderStateMixin {
  late final AnimationController _intro = AnimationController(vsync: this, duration: const Duration(milliseconds: 1200))
    ..forward();
  late final Animation<double> _introCurve = CurvedAnimation(parent: _intro, curve: Curves.easeOutCubic);

  // Slow clock for the floating cards and bubbles.
  late final Ticker _floatTicker = createTicker((e) => _float.value = e.inMicroseconds / 1e6);
  final ValueNotifier<double> _float = ValueNotifier(0);

  Timer? _ticker;
  late int _remaining = widget.total.inSeconds;

  bool get _running => _ticker != null;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final reduced = MediaQuery.maybeDisableAnimationsOf(context) ?? false;
    if (reduced && _floatTicker.isActive) _floatTicker.stop();
    if (!reduced && !_floatTicker.isActive) _floatTicker.start();
  }

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
    _floatTicker.dispose();
    _float.dispose();
    super.dispose();
  }

  String get _label {
    final m = _remaining ~/ 60, s = _remaining % 60;
    return '${m.toString().padLeft(2, '0')}:${s.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    final dark = context.isDark;
    final l = context.l10n;
    final c = context.colors;
    final fraction = widget.total.inSeconds == 0 ? 0.0 : _remaining / widget.total.inSeconds;
    final ink = dark ? Colors.white : c.textPrimary;
    final muted = dark ? const Color(0xFFA9A3D6) : const Color(0xFF6E6A93);

    Widget floating(int i, Offset at, Size size, double tilt, Widget child) => ValueListenableBuilder<double>(
          valueListenable: _float,
          builder: (context, t, child) {
            final dy = math.sin(t * math.pi * 2 / 4.2 + i * 1.7) * 3;
            return Positioned(
              left: at.dx - size.width / 2,
              top: at.dy - size.height / 2 + dy,
              width: size.width,
              height: size.height,
              child: child!,
            );
          },
          child: Transform.rotate(angle: tilt * math.pi / 180, child: child),
        );

    return SizedBox(
      width: widget.width,
      height: Ob3TimerRing.heightFor(widget.width),
      child: FittedBox(
        child: SizedBox(
          width: _w,
          height: _h,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              // Soft lavender shapes, plates and ticks.
              Positioned.fill(child: CustomPaint(painter: _BackdropPainter(dark: dark))),
              // Bubbles.
              Positioned.fill(
                child: ValueListenableBuilder<double>(
                  valueListenable: _float,
                  builder: (context, t, _) => CustomPaint(painter: _BubblesPainter(t: t, dark: dark)),
                ),
              ),
              // Progress ring: sweeps in, then follows the remaining time.
              Positioned.fill(
                child: TweenAnimationBuilder<double>(
                  tween: Tween(end: fraction),
                  duration: const Duration(milliseconds: 900),
                  curve: Curves.easeOut,
                  builder: (context, f, _) => AnimatedBuilder(
                    animation: _introCurve,
                    builder: (context, _) => CustomPaint(painter: _ArcPainter(progress: _introCurve.value * f, dark: dark)),
                  ),
                ),
              ),
              // Centre: time, label, play / pause, sessions.
              Positioned(
                left: _c.dx - _discR,
                top: _c.dy - _discR,
                width: _discR * 2,
                height: _discR * 2,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 4),
                    Text(
                      _label,
                      style: TextStyle(
                        fontFamily: AppText.fontFamily,
                        fontSize: 30,
                        fontWeight: FontWeight.w800,
                        letterSpacing: -1.2,
                        height: 1,
                        color: ink,
                        fontFeatures: const [FontFeature.tabularFigures()],
                      ),
                    ),
                    const SizedBox(height: 4),
                    SizedBox(
                      width: _discR * 1.7,
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          l.ob3DeepFocus.toUpperCase(),
                          style: TextStyle(fontFamily: AppText.fontFamily, fontSize: 8.5, fontWeight: FontWeight.w600, letterSpacing: 2.2, color: muted),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    _PlayButton(running: _running, onTap: _toggle),
                    const SizedBox(height: 7),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        for (var i = 0; i < 4; i++)
                          Container(
                            width: 6,
                            height: 6,
                            margin: const EdgeInsets.symmetric(horizontal: 2),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: i < 3 ? AppPalette.violet : AppPalette.violet.withValues(alpha: dark ? 0.25 : 0.18),
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 3),
                    SizedBox(
                      width: _discR * 1.6,
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(l.ob3RingSessions(3, 4), style: TextStyle(fontFamily: AppText.fontFamily, fontSize: 7.5, fontWeight: FontWeight.w600, color: muted)),
                      ),
                    ),
                  ],
                ),
                ),
              ),
              // Day streak.
              floating(
                0,
                const Offset(98, 118),
                const Size(78, 62),
                -8,
                _Card(
                  dark: dark,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ShaderMask(
                            shaderCallback: (r) => const LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [Color(0xFFFFB020), Color(0xFFFF6A2B)],
                            ).createShader(r),
                            child: const Icon(Icons.local_fire_department_rounded, size: 22, color: Colors.white),
                          ),
                          const SizedBox(width: 2),
                          Text('7', style: TextStyle(fontFamily: AppText.fontFamily, fontSize: 19, fontWeight: FontWeight.w800, height: 1, color: ink)),
                        ],
                      ),
                      const SizedBox(height: 3),
                      _FitText(l.ob3RingStreak, size: 8.5, color: muted),
                    ],
                  ),
                ),
              ),
              // Goal completion.
              floating(
                1,
                const Offset(342, 112),
                const Size(92, 80),
                -6,
                _Card(
                  dark: dark,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const _Bars(heights: [8, 13, 18, 26], colors: [Color(0xFFC9BCFF), Color(0xFF8B9BFF), AppPalette.blue, Color(0xFF2DD4BF)]),
                      const SizedBox(height: 5),
                      Text('94%', style: TextStyle(fontFamily: AppText.fontFamily, fontSize: 15, fontWeight: FontWeight.w800, height: 1, color: ink)),
                      const SizedBox(height: 2),
                      _FitText(l.ob3StatGoal, size: 8, color: muted),
                    ],
                  ),
                ),
              ),
              // "Focus builds a better you".
              floating(
                2,
                const Offset(76, 214),
                const Size(94, 90),
                -8,
                _Card(
                  dark: dark,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const _Bars(heights: [8, 12, 17, 26], colors: [Color(0xFFC9BCFF), Color(0xFFB3A2FF), Color(0xFF8B8BFF), AppPalette.blue]),
                        const SizedBox(height: 6),
                        SizedBox(
                          width: 74,
                          height: 30,
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            alignment: AlignmentDirectional.centerStart,
                            child: Text(
                              l.ob3RingTagline,
                              style: TextStyle(fontFamily: AppText.fontFamily, fontSize: 9.5, fontWeight: FontWeight.w700, height: 1.15, color: dark ? const Color(0xFFC4BFE8) : const Color(0xFF4E4A7A)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // Leaf badge.
              floating(3, const Offset(338, 194), const Size(46, 46), 0, _LeafBadge(dark: dark)),
            ],
          ),
        ),
      ),
    );
  }
}

/// Text that shrinks to fit its card instead of wrapping.
class _FitText extends StatelessWidget {
  const _FitText(this.text, {required this.size, required this.color});
  final String text;
  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(text, maxLines: 1, style: TextStyle(fontFamily: AppText.fontFamily, fontSize: size, fontWeight: FontWeight.w600, color: color)),
        ),
      );
}

/// Frosted white (light) / deep violet (dark) card.
class _Card extends StatelessWidget {
  const _Card({required this.dark, required this.child});
  final bool dark;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: dark ? const [Color(0xFF26214F), Color(0xFF1B1740)] : const [Colors.white, Color(0xFFF3F0FF)],
        ),
        border: Border.all(color: dark ? Colors.white.withValues(alpha: 0.08) : Colors.white),
        boxShadow: [BoxShadow(color: AppPalette.accent.withValues(alpha: dark ? 0.30 : 0.16), blurRadius: 16, offset: const Offset(0, 6))],
      ),
      child: child,
    );
  }
}

/// Little rising bar chart.
class _Bars extends StatelessWidget {
  const _Bars({required this.heights, required this.colors});
  final List<double> heights;
  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        for (var i = 0; i < heights.length; i++)
          Container(
            width: 8,
            height: heights[i],
            margin: const EdgeInsets.symmetric(horizontal: 1.5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2.5),
              gradient: LinearGradient(begin: Alignment.bottomCenter, end: Alignment.topCenter, colors: [colors[i].withValues(alpha: 0.85), colors[i]]),
            ),
          ),
      ],
    );
  }
}

/// Mint circle with a green leaf.
class _LeafBadge extends StatelessWidget {
  const _LeafBadge({required this.dark});
  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(colors: dark ? const [Color(0xFF1F4A44), Color(0xFF173A3A)] : const [Color(0xFFE6FFF6), Color(0xFFB8F2DF)]),
        border: Border.all(color: dark ? const Color(0xFF2DD4BF).withValues(alpha: 0.3) : Colors.white, width: 1.5),
        boxShadow: [BoxShadow(color: const Color(0xFF34D399).withValues(alpha: dark ? 0.35 : 0.45), blurRadius: 16)],
      ),
      alignment: Alignment.center,
      child: Transform.rotate(angle: -0.5, child: const Icon(Icons.eco_rounded, size: 24, color: Color(0xFF22B07D))),
    );
  }
}

/// Lavender shapes behind the dial, the plates and the tick marks.
class _BackdropPainter extends CustomPainter {
  _BackdropPainter({required this.dark});
  final bool dark;

  @override
  void paint(Canvas canvas, Size size) {
    final lilac = dark ? const Color(0xFF6C5CE0) : const Color(0xFFC7B8FF);

    // Long soft capsule crossing behind the dial (bottom-left → top-right).
    canvas.save();
    canvas.translate(_c.dx + 2, _c.dy + 2);
    canvas.rotate(-0.62);
    final capsule = RRect.fromRectAndRadius(Rect.fromCenter(center: Offset.zero, width: 340, height: 120), const Radius.circular(60));
    canvas.drawRRect(
      capsule,
      Paint()
        ..shader = LinearGradient(colors: [lilac.withValues(alpha: dark ? 0.16 : 0.34), lilac.withValues(alpha: dark ? 0.10 : 0.22)]).createShader(capsule.outerRect),
    );
    canvas.restore();

    // Soft halo.
    canvas.drawCircle(
      _c,
      140,
      Paint()
        ..shader = RadialGradient(colors: [
          AppPalette.violet.withValues(alpha: dark ? 0.22 : 0.20),
          AppPalette.violet.withValues(alpha: 0),
        ]).createShader(Rect.fromCircle(center: _c, radius: 140)),
    );

    // Outer plate.
    canvas.drawCircle(_c, _dialR + 6, Paint()..color = (dark ? const Color(0xFF1E1A44) : Colors.white).withValues(alpha: dark ? 0.75 : 0.55));
    canvas.drawCircle(
      _c,
      _dialR,
      Paint()
        ..shader = RadialGradient(
          colors: dark ? const [Color(0xFF2A2458), Color(0xFF211C4A)] : const [Color(0xFFFFFFFF), Color(0xFFEDE8FF)],
        ).createShader(Rect.fromCircle(center: _c, radius: _dialR)),
    );

    // Ticks: small every 6°, bigger at 12 / 3 / 6 / 9.
    final tick = Paint()
      ..strokeCap = StrokeCap.round
      ..color = (dark ? const Color(0xFFB7A6FF) : const Color(0xFF9A93C6)).withValues(alpha: dark ? 0.35 : 0.45);
    for (var i = 0; i < 60; i++) {
      final a = i * math.pi * 2 / 60 - math.pi / 2;
      final major = i % 15 == 0;
      final dir = Offset(math.cos(a), math.sin(a));
      tick.strokeWidth = major ? 2 : 0.9;
      final r1 = _dialR - 3, r2 = _dialR - (major ? 12 : (i % 5 == 0 ? 7 : 5));
      canvas.drawLine(_c + dir * r1, _c + dir * r2, tick);
    }

    // Ring track (where the progress arc runs).
    canvas.drawCircle(
      _c,
      _arcR,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = _arcStroke + 4
        ..color = (dark ? const Color(0xFF6C5CE0) : const Color(0xFFDCD3FF)).withValues(alpha: dark ? 0.22 : 0.55),
    );

    // Inner plate.
    canvas.drawCircle(_c, _discR + 2, Paint()..color = AppPalette.accent.withValues(alpha: dark ? 0.25 : 0.10)..maskFilter = const MaskFilter.blur(BlurStyle.normal, 6));
    canvas.drawCircle(
      _c,
      _discR,
      Paint()
        ..shader = RadialGradient(
          center: const Alignment(0, -0.3),
          colors: dark ? const [Color(0xFF2E2860), Color(0xFF221D4C)] : const [Color(0xFFFFFFFF), Color(0xFFF1EDFF)],
        ).createShader(Rect.fromCircle(center: _c, radius: _discR)),
    );
  }

  @override
  bool shouldRepaint(_BackdropPainter old) => old.dark != dark;
}

/// Floating bubbles (blue, cyan, lilac), drifting gently.
class _BubblesPainter extends CustomPainter {
  _BubblesPainter({required this.t, required this.dark});
  final double t;
  final bool dark;

  static const _bubbles = <(Offset, double, Color)>[
    (Offset(140, 36), 8, Color(0xFFD9D0FF)),
    (Offset(116, 50), 11, Color(0xFF6CC8FF)),
    (Offset(298, 46), 7, Color(0xFF6E8BFF)),
    (Offset(334, 63), 6, Color(0xFFA9C7FF)),
    (Offset(58, 152), 10, Color(0xFF6EE7E0)),
    (Offset(26, 160), 5, Color(0xFFD9D0FF)),
    (Offset(387, 152), 4, Color(0xFFD9D0FF)),
    (Offset(370, 166), 5, Color(0xFFB9A8FF)),
    (Offset(296, 243), 9, Color(0xFF6CC8FF)),
    (Offset(126, 268), 5, Color(0xFFD9D0FF)),
    (Offset(134, 240), 4, Color(0xFF8FA6FF)),
  ];

  @override
  void paint(Canvas canvas, Size size) {
    for (final (i, (p, r, color)) in _bubbles.indexed) {
      final drift = Offset(math.sin(t * 0.7 + i) * 2, math.cos(t * 0.9 + i * 1.3) * 3);
      final at = p + drift;
      final col = dark ? Color.lerp(color, const Color(0xFF2A2366), 0.25)! : color;
      canvas.drawCircle(at, r * 1.6, Paint()..color = col.withValues(alpha: 0.25)..maskFilter = MaskFilter.blur(BlurStyle.normal, r * 0.6));
      canvas.drawCircle(
        at,
        r,
        Paint()
          ..shader = RadialGradient(center: const Alignment(-0.35, -0.4), colors: [Color.lerp(col, Colors.white, 0.55)!, col]).createShader(Rect.fromCircle(center: at, radius: r)),
      );
    }
  }

  @override
  bool shouldRepaint(_BubblesPainter old) => old.t != t || old.dark != dark;
}

/// Gradient progress arc from just left of 6 o'clock, clockwise, with a white knob at its tip.
class _ArcPainter extends CustomPainter {
  _ArcPainter({required this.progress, required this.dark});
  final double progress; // 0…1 of the full sweep
  final bool dark;

  static const _start = 100 * math.pi / 180; // just left of the bottom
  static const _fullSweep = 300 * math.pi / 180;

  @override
  void paint(Canvas canvas, Size size) {
    final p = progress.clamp(0.0, 1.0);
    if (p <= 0.001) return;
    final sweep = _fullSweep * p;
    final rect = Rect.fromCircle(center: _c, radius: _arcR);
    final shader = SweepGradient(
      startAngle: 0,
      endAngle: math.pi * 2,
      transform: const GradientRotation(_start),
      colors: const [Color(0xFF8B5CF6), Color(0xFFA78BFA), Color(0xFF8E7CFF), Color(0xFF2DD4BF), Color(0xFF22B8E0), Color(0xFF6E7BFF), Color(0xFF8B5CF6)],
      stops: const [0, 0.18, 0.36, 0.58, 0.72, 0.86, 1],
    ).createShader(rect);
    canvas.drawArc(
      rect,
      _start,
      sweep,
      false,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = _arcStroke
        ..strokeCap = StrokeCap.round
        ..shader = shader,
    );
    // Knob at the tip.
    final a = _start + sweep;
    final tip = _c + Offset(math.cos(a), math.sin(a)) * _arcR;
    canvas.drawCircle(tip, 9, Paint()..color = AppPalette.accent.withValues(alpha: 0.30)..maskFilter = const MaskFilter.blur(BlurStyle.normal, 4));
    canvas.drawCircle(tip, 8.5, Paint()..color = Colors.white);
    canvas.drawCircle(
      tip,
      8.5,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1
        ..color = const Color(0xFFDCD3FF),
    );
  }

  @override
  bool shouldRepaint(_ArcPainter old) => old.progress != progress || old.dark != dark;
}

class _PlayButton extends StatelessWidget {
  const _PlayButton({required this.running, required this.onTap});

  final bool running;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final dark = context.isDark;
    final glyph = dark ? Colors.white : const Color(0xFF1E1B4B);
    return Semantics(
      button: true,
      label: running ? context.l10n.ob3PauseTimer : context.l10n.ob3StartTimer,
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppPalette.violet.withValues(alpha: running ? (dark ? 0.40 : 0.30) : (dark ? 0.30 : 0.20)),
          ),
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            transitionBuilder: (child, a) => ScaleTransition(scale: a, child: child),
            child: CustomPaint(
              key: ValueKey(running),
              size: const Size(30, 30),
              painter: _GlyphPainter(running: running, color: glyph),
            ),
          ),
        ),
      ),
    );
  }
}

/// Play triangle or pause bars, centred in a 30×30 box.
class _GlyphPainter extends CustomPainter {
  _GlyphPainter({required this.running, required this.color});

  final bool running;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final p = Paint()..color = color;
    if (running) {
      const r = Radius.circular(1);
      canvas.drawRRect(RRect.fromRectAndRadius(const Rect.fromLTWH(10.5, 10, 3, 10), r), p);
      canvas.drawRRect(RRect.fromRectAndRadius(const Rect.fromLTWH(16.5, 10, 3, 10), r), p);
    } else {
      canvas.drawPath(
        Path()
          ..moveTo(12, 9.5)
          ..lineTo(21, 15)
          ..lineTo(12, 20.5)
          ..close(),
        p,
      );
    }
  }

  @override
  bool shouldRepaint(_GlyphPainter old) => old.running != running || old.color != color;
}
