import 'dart:math' as math;

import 'package:flutter/foundation.dart' show listEquals;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../../../utils/app_theme.dart';
import '../onboarding_state.dart';

// Top illustrations ("heroes") of the onboarding question screens.
//
// Every hero fits a box of at most 360 × 190 (it scales down to ~280 wide),
// fades + scales in on first build, eases smoothly when its input changes and
// shows a still frame (no loops) when the phone's "Remove animations" is on.
// No words inside the artwork — only plain numbers; units come in as parameters.

const _maxW = 360.0;
const _maxH = 190.0;
const _tau = math.pi * 2;
const _brand = [AppPalette.blue, AppPalette.violet, AppPalette.accent];

bool _reduced(BuildContext context) => MediaQuery.maybeDisableAnimationsOf(context) ?? false;

Duration _dur(BuildContext context, int ms) => _reduced(context) ? Duration.zero : Duration(milliseconds: ms);

/// Theme-aware colours shared by the heroes.
class _Ink {
  _Ink(BuildContext context) : dark = context.isDark, c = context.colors;

  final bool dark;
  final AppColors c;

  /// Solid white card (light) / deep purple card (dark).
  Color get card => dark ? const Color(0xFF1D1940) : Colors.white;
  Color get cardBorder => dark ? Colors.white.withValues(alpha: 0.10) : const Color(0x121B1838);

  /// Frosted, see-through bubble.
  Color get glass => dark ? Colors.white.withValues(alpha: 0.06) : Colors.white.withValues(alpha: 0.66);
  Color get glassBorder => dark ? Colors.white.withValues(alpha: 0.12) : AppPalette.violet.withValues(alpha: 0.22);
  Color get ink => dark ? Colors.white.withValues(alpha: 0.94) : c.textPrimary;
  Color get muted => dark ? Colors.white.withValues(alpha: 0.42) : const Color(0xFF9A93C4);
  Color get track => dark ? Colors.white.withValues(alpha: 0.09) : AppPalette.accent.withValues(alpha: 0.10);
  Color get tick => dark ? Colors.white.withValues(alpha: 0.22) : const Color(0xFF1B1838).withValues(alpha: 0.16);

  List<BoxShadow> shadow([double strength = 1]) => [
    BoxShadow(
      color: AppPalette.accent.withValues(alpha: (dark ? 0.32 : 0.15) * strength),
      blurRadius: 16,
      offset: const Offset(0, 6),
    ),
  ];
}

/// Sizes the hero (max 360 × 190), runs the entrance and hands the builder the
/// final size plus a scale factor [k] (1 at ≥320 wide, ~0.88 at 280).
class _HeroBox extends StatelessWidget {
  const _HeroBox({required this.builder});

  final Widget Function(BuildContext context, Size size, double k) builder;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, box) {
        final w = box.hasBoundedWidth ? math.min(box.maxWidth, _maxW) : _maxW;
        final h = box.hasBoundedHeight ? math.min(box.maxHeight, _maxH) : _maxH;
        final k = math.min(1.0, math.min(w / 320, h / _maxH));
        final size = Size(w, h);
        return Center(
          child: ExcludeSemantics(
            child: _Entrance(
              child: SizedBox.fromSize(size: size, child: builder(context, size, k)),
            ),
          ),
        );
      },
    );
  }
}

/// Fade + scale 0.94 → 1 over 500 ms, once.
class _Entrance extends StatelessWidget {
  const _Entrance({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    if (_reduced(context)) return child;
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: 1),
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeOutCubic,
      builder: (_, v, c) => Opacity(
        opacity: v.clamp(0.0, 1.0),
        child: Transform.scale(scale: 0.94 + 0.06 * v, child: c),
      ),
      child: child,
    );
  }
}

/// A State with a running clock (seconds) for the endless loops.
/// With reduced motion the clock stops at [stillTime].
abstract class _LoopState<T extends StatefulWidget> extends State<T> with SingleTickerProviderStateMixin<T> {
  late final Ticker _ticker = createTicker(_tick);
  final ValueNotifier<double> clock = ValueNotifier(0);
  Duration _last = Duration.zero;
  bool still = false;

  /// Clock value used for the still frame.
  double get stillTime => 0.8;

  /// Called every frame with the time step (seconds), before [clock] updates.
  void onFrame(double dt) {}

  /// Called when motion turns off.
  void onStill() {}

  void _tick(Duration elapsed) {
    final dt = ((elapsed - _last).inMicroseconds / 1e6).clamp(0.0, 0.1);
    _last = elapsed;
    onFrame(dt);
    clock.value += dt;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    still = _reduced(context);
    if (still) {
      if (_ticker.isActive) _ticker.stop();
      onStill();
      clock.value = stillTime;
    } else if (!_ticker.isActive) {
      _last = Duration.zero;
      _ticker.start();
    }
  }

  @override
  void dispose() {
    _ticker.dispose();
    clock.dispose();
    super.dispose();
  }
}

/// Soft radial glow (no blur filter needed).
class _Glow extends StatelessWidget {
  const _Glow({required this.size, required this.color, this.alpha = 0.3});

  final double size;
  final Color color;
  final double alpha;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: RadialGradient(
            colors: [
              color.withValues(alpha: alpha),
              color.withValues(alpha: alpha * 0.45),
              color.withValues(alpha: 0),
            ],
            stops: const [0, 0.42, 1],
          ),
        ),
      ),
    );
  }
}

/// Places [child] centred on [at].
Widget _at(Offset at, double w, double h, Widget child) => Positioned(left: at.dx - w / 2, top: at.dy - h / 2, width: w, height: h, child: child);

/// Gentle float offset for decoration number [i].
Offset _drift(double t, int i, double k, {double amp = 1}) =>
    Offset(math.sin(t * _tau / 6.5 + i * 1.7) * 3.5 * k * amp, math.cos(t * _tau / 5.2 + i * 2.1) * 4.5 * k * amp);

/// 0 → 1.15 → 1 "pop" for badges (t in 0..1).
double _pop(double t) {
  if (t <= 0) return 0;
  if (t < 0.6) return 1.15 * Curves.easeOutCubic.transform(t / 0.6);
  return 1.15 - 0.15 * Curves.easeInOut.transform(((t - 0.6) / 0.4).clamp(0.0, 1.0));
}

/// Badge that pops on when [on] turns true and shrinks away when false.
class _PopBadge extends StatelessWidget {
  const _PopBadge({required this.on, required this.child});

  final bool on;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(end: on ? 1 : 0),
      duration: _dur(context, on ? 460 : 260),
      curve: Curves.linear,
      builder: (_, v, c) {
        final s = on ? _pop(v) : Curves.easeInCubic.transform(v);
        if (s <= 0.001) return const SizedBox.shrink();
        return Transform.scale(scale: s, child: c);
      },
      child: child,
    );
  }
}

/// Small round badge with a white glyph.
class _Badge extends StatelessWidget {
  const _Badge({required this.size, required this.icon, required this.colors, required this.ring});

  final double size;
  final IconData icon;
  final List<Color> colors;
  final Color ring;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: colors),
        border: Border.all(color: ring, width: size * 0.12),
        boxShadow: [BoxShadow(color: colors.last.withValues(alpha: 0.35), blurRadius: 6, offset: const Offset(0, 2))],
      ),
      alignment: Alignment.center,
      child: Icon(icon, size: size * 0.58, color: Colors.white),
    );
  }
}

/// Four-point sparkle.
void _sparkle(Canvas canvas, Offset c, double r, Paint p) {
  final q = r * 0.28;
  canvas.drawPath(
    Path()
      ..moveTo(c.dx, c.dy - r)
      ..quadraticBezierTo(c.dx + q, c.dy - q, c.dx + r, c.dy)
      ..quadraticBezierTo(c.dx + q, c.dy + q, c.dx, c.dy + r)
      ..quadraticBezierTo(c.dx - q, c.dy + q, c.dx - r, c.dy)
      ..quadraticBezierTo(c.dx - q, c.dy - q, c.dx, c.dy - r)
      ..close(),
    p,
  );
}

/// Arc stroke with a sweep gradient that starts at [start] and spans [sweep] (radians, clockwise).
void _gradientArc(Canvas canvas, Offset c, double r, double start, double sweep, List<Color> colors, double width) {
  if (sweep <= 0.002) return;
  final rect = Rect.fromCircle(center: c, radius: r);
  // Leave room for the round cap so the gradient's seam never shows.
  final cap = math.min(width / 2 / r, 0.3);
  canvas.drawArc(
    rect,
    start,
    sweep,
    false,
    Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = width
      ..strokeCap = StrokeCap.round
      ..shader = SweepGradient(
        startAngle: 0,
        endAngle: math.min(_tau, sweep + cap),
        colors: colors,
        transform: GradientRotation(start - cap / 2),
      ).createShader(rect),
  );
}

// =============================================================================
// 1. "Lose track of time?" — a clock whose minute hand races
// =============================================================================

/// Big soft clock whose minute hand spins — fast for [ObRelate.often], calm for
/// [ObRelate.rarely] — with notification bubbles drifting around it.
class RelateHero extends StatefulWidget {
  const RelateHero({super.key, this.answer});

  final ObRelate? answer;

  @override
  State<RelateHero> createState() => _RelateHeroState();
}

class _RelateHeroState extends _LoopState<RelateHero> {
  static double _speedOf(ObRelate? a) =>
      _tau /
      switch (a) {
        ObRelate.often => 1.2,
        ObRelate.rarely => 9.0,
        _ => 3.2,
      };

  static final _fastest = _speedOf(ObRelate.often);

  late double _from = _speedOf(widget.answer);
  late double _to = _from;
  double _blend = 1;

  /// Minute hand angle, clockwise from 12 o'clock.
  double _angle = math.pi * 0.36;

  double get _speed => _from + (_to - _from) * Curves.easeInOutCubic.transform(_blend);

  @override
  void onFrame(double dt) {
    if (_blend < 1) _blend = math.min(1, _blend + dt / 0.6);
    _angle = (_angle + _speed * dt) % (_tau * 12);
  }

  @override
  void onStill() {
    _from = _to;
    _blend = 1;
  }

  @override
  void didUpdateWidget(RelateHero old) {
    super.didUpdateWidget(old);
    if (old.answer != widget.answer) {
      _from = still ? _speedOf(widget.answer) : _speed;
      _to = _speedOf(widget.answer);
      _blend = still ? 1 : 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    final ink = _Ink(context);
    return _HeroBox(
      builder: (context, size, k) {
        final r = math.min(size.height * 0.38, 72.0);
        final c = Offset(size.width / 2, size.height / 2 + 2 * k);
        final room = size.width / 2 - r;
        return ValueListenableBuilder<double>(
          valueListenable: clock,
          builder: (context, t, _) {
            final pulse = 1 + 0.06 * (0.5 - 0.5 * math.cos(t * _tau / 3));
            Offset p(double dx, double dy, int i) => c + Offset(dx, dy) + _drift(t, i, k);
            final calm = (_speed / _fastest).clamp(0.0, 1.0);
            return Stack(
              clipBehavior: Clip.none,
              children: [
                _at(
                  c,
                  r * 3.3,
                  r * 3.3,
                  Transform.scale(
                    scale: pulse,
                    child: _Glow(size: r * 3.3, color: ink.dark ? AppPalette.accent : AppPalette.violet, alpha: ink.dark ? 0.30 : 0.34),
                  ),
                ),
                // Far decorations only when there is room beside the clock.
                if (room > 100 * k)
                  _at(p(-r - 88 * k, 8 * k, 4), 24 * k, 24 * k, _IconBubble(icon: Icons.play_arrow_rounded, size: 24 * k, color: AppPalette.teal, ink: ink)),
                if (room > 100 * k)
                  _at(p(r + 92 * k, 2 * k, 5), 16 * k, 16 * k, CustomPaint(painter: _SparklePainter(color: AppPalette.gold.withValues(alpha: 0.9)))),
                _at(
                  p(-r - 34 * k, -r * 0.42, 0),
                  28 * k,
                  46 * k,
                  Transform.rotate(
                    angle: -0.24 + math.sin(t * _tau / 5) * 0.05,
                    child: _MiniPhone(k: k, ink: ink),
                  ),
                ),
                _at(p(r + 38 * k, -r * 0.5, 1), 60 * k, 32 * k, _NotifPill(k: k, ink: ink)),
                _at(p(-r - 22 * k, r * 0.62, 2), 32 * k, 32 * k, _IconBubble(icon: Icons.chat_bubble_rounded, size: 32 * k, color: AppPalette.blue, ink: ink)),
                _at(p(r + 26 * k, r * 0.56, 3), 30 * k, 30 * k, _IconBubble(icon: Icons.favorite_rounded, size: 30 * k, color: AppPalette.coral, ink: ink)),
                Positioned.fill(
                  child: CustomPaint(
                    painter: _ClockPainter(
                      center: c,
                      radius: r,
                      minute: _angle,
                      trail: (0.25 + 0.75 * calm) * math.pi * 0.62,
                      dark: ink.dark,
                      ink: ink.ink,
                      tick: ink.tick,
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}

class _ClockPainter extends CustomPainter {
  _ClockPainter({
    required this.center,
    required this.radius,
    required this.minute,
    required this.trail,
    required this.dark,
    required this.ink,
    required this.tick,
  });

  final Offset center;
  final double radius, minute, trail;
  final bool dark;
  final Color ink, tick;

  @override
  void paint(Canvas canvas, Size size) {
    final c = center, r = radius;
    final face = Rect.fromCircle(center: c, radius: r);
    // Soft coloured shadow.
    canvas.drawCircle(
      c + Offset(0, r * 0.12),
      r * 0.96,
      Paint()
        ..color = AppPalette.accent.withValues(alpha: dark ? 0.45 : 0.22)
        ..maskFilter = MaskFilter.blur(BlurStyle.normal, r * 0.18),
    );
    // Glass face.
    canvas.drawCircle(
      c,
      r,
      Paint()
        ..shader = RadialGradient(
          center: const Alignment(-0.3, -0.4),
          radius: 1.1,
          colors: dark ? const [Color(0xFF2A2456), Color(0xFF16132F)] : const [Colors.white, Color(0xFFEDE8FF)],
        ).createShader(face),
    );
    // Gradient rim.
    final rimW = r * 0.085;
    canvas.drawCircle(
      c,
      r - rimW / 2,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = rimW
        ..shader = const SweepGradient(
          colors: [AppPalette.blue, AppPalette.violet, AppPalette.accent, AppPalette.blue],
          transform: GradientRotation(-math.pi / 2),
        ).createShader(face),
    );
    // Glass highlight (top-left).
    canvas.drawArc(
      Rect.fromCircle(center: c, radius: r * 0.8),
      math.pi * 1.08,
      math.pi * 0.32,
      false,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = r * 0.05
        ..strokeCap = StrokeCap.round
        ..color = Colors.white.withValues(alpha: dark ? 0.16 : 0.95),
    );
    // Ticks.
    for (var i = 0; i < 12; i++) {
      final a = i * _tau / 12 - math.pi / 2;
      final major = i % 3 == 0;
      final d = Offset(math.cos(a), math.sin(a));
      canvas.drawLine(
        c + d * (r * (major ? 0.70 : 0.75)),
        c + d * (r * 0.82),
        Paint()
          ..strokeWidth = r * (major ? 0.05 : 0.03)
          ..strokeCap = StrokeCap.round
          ..color = major ? AppPalette.accent.withValues(alpha: dark ? 0.75 : 0.55) : tick,
      );
    }
    // Motion trail behind the minute hand — time slipping away.
    final hand = minute - math.pi / 2;
    final inner = Rect.fromCircle(center: c, radius: r * 0.68);
    canvas.drawArc(
      inner,
      hand - trail,
      trail,
      true,
      Paint()
        ..shader = SweepGradient(
          startAngle: 0,
          endAngle: trail,
          colors: [
            AppPalette.violet.withValues(alpha: 0),
            AppPalette.accent.withValues(alpha: dark ? 0.42 : 0.30),
          ],
          transform: GradientRotation(hand - trail),
        ).createShader(inner),
    );
    // Hour hand (moves 12× slower).
    final hour = minute / 12 + math.pi * 1.62 - math.pi / 2;
    canvas.drawLine(
      c,
      c + Offset(math.cos(hour), math.sin(hour)) * r * 0.40,
      Paint()
        ..strokeWidth = r * 0.075
        ..strokeCap = StrokeCap.round
        ..color = ink.withValues(alpha: 0.85),
    );
    // Minute hand.
    final tip = c + Offset(math.cos(hand), math.sin(hand)) * r * 0.64;
    canvas.drawLine(
      c,
      tip,
      Paint()
        ..strokeWidth = r * 0.052
        ..strokeCap = StrokeCap.round
        ..shader = LinearGradient(colors: const [AppPalette.blue, AppPalette.accent]).createShader(Rect.fromPoints(c, tip)),
    );
    canvas.drawCircle(c, r * 0.085, Paint()..color = AppPalette.accent);
    canvas.drawCircle(c, r * 0.035, Paint()..color = Colors.white);
  }

  @override
  bool shouldRepaint(_ClockPainter old) =>
      old.minute != minute || old.trail != trail || old.center != center || old.radius != radius || old.dark != dark || old.ink != ink;
}

class _SparklePainter extends CustomPainter {
  _SparklePainter({required this.color});

  final Color color;

  @override
  void paint(Canvas canvas, Size size) => _sparkle(canvas, size.center(Offset.zero), size.shortestSide / 2, Paint()..color = color);

  @override
  bool shouldRepaint(_SparklePainter old) => old.color != color;
}

/// Round card with one coloured glyph.
class _IconBubble extends StatelessWidget {
  const _IconBubble({required this.icon, required this.size, required this.color, required this.ink});

  final IconData icon;
  final double size;
  final Color color;
  final _Ink ink;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: ink.card,
        border: Border.all(color: ink.cardBorder),
        boxShadow: ink.shadow(0.8),
      ),
      alignment: Alignment.center,
      child: Icon(icon, size: size * 0.52, color: color),
    );
  }
}

/// Tiny phone with a glowing screen.
class _MiniPhone extends StatelessWidget {
  const _MiniPhone({required this.k, required this.ink});

  final double k;
  final _Ink ink;

  @override
  Widget build(BuildContext context) {
    final line = Colors.white.withValues(alpha: 0.75);
    Widget bar(double w) => Container(
      width: w * k,
      height: 3 * k,
      margin: EdgeInsets.only(top: 3 * k),
      decoration: BoxDecoration(color: line, borderRadius: BorderRadius.circular(2)),
    );
    return Container(
      padding: EdgeInsets.all(2.6 * k),
      decoration: BoxDecoration(
        color: ink.card,
        borderRadius: BorderRadius.circular(8 * k),
        border: Border.all(color: ink.cardBorder),
        boxShadow: ink.shadow(),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.5 * k),
          gradient: const LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: _brand),
        ),
        padding: EdgeInsets.fromLTRB(4 * k, 6 * k, 4 * k, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 9 * k,
              height: 9 * k,
              decoration: BoxDecoration(shape: BoxShape.circle, color: line),
            ),
            bar(14),
            bar(9),
          ],
        ),
      ),
    );
  }
}

/// Notification pill: bell + two text lines + a coral count badge.
class _NotifPill extends StatelessWidget {
  const _NotifPill({required this.k, required this.ink});

  final double k;
  final _Ink ink;

  @override
  Widget build(BuildContext context) {
    Widget line(double w, double a) => Container(
      width: w * k,
      height: 3.5 * k,
      margin: EdgeInsets.symmetric(vertical: 1.5 * k),
      decoration: BoxDecoration(
        color: ink.muted.withValues(alpha: a),
        borderRadius: BorderRadius.circular(2),
      ),
    );
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              color: ink.card,
              borderRadius: BorderRadius.circular(16 * k),
              border: Border.all(color: ink.cardBorder),
              boxShadow: ink.shadow(),
            ),
            padding: EdgeInsets.symmetric(horizontal: 7 * k),
            child: Row(
              children: [
                Container(
                  width: 18 * k,
                  height: 18 * k,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(colors: [AppPalette.violet, AppPalette.accent]),
                  ),
                  child: Icon(Icons.notifications_rounded, size: 11 * k, color: Colors.white),
                ),
                SizedBox(width: 5 * k),
                Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.start, children: [line(18, 0.8), line(12, 0.5)]),
              ],
            ),
          ),
        ),
        Positioned(
          right: -4 * k,
          top: -5 * k,
          child: Container(
            width: 15 * k,
            height: 15 * k,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppPalette.coral,
              border: Border.all(color: ink.card, width: 1.6 * k),
            ),
            alignment: Alignment.center,
            child: Text(
              '3',
              textScaler: TextScaler.noScaling,
              style: TextStyle(fontFamily: AppText.fontFamily, fontSize: 8 * k, height: 1, fontWeight: FontWeight.w800, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}

// =============================================================================
// 2. "More time for what?" — hourglass with goal bubbles
// =============================================================================

/// Hourglass with six goal bubbles around it; the chosen [goal] pops forward.
class GoalHero extends StatefulWidget {
  const GoalHero({super.key, this.goal});

  final ObGoal? goal;

  @override
  State<GoalHero> createState() => _GoalHeroState();
}

class _GoalHeroState extends _LoopState<GoalHero> {
  static const _icons = {
    ObGoal.focus: Icons.center_focus_strong_rounded,
    ObGoal.sleep: Icons.bedtime_rounded,
    ObGoal.scrolling: Icons.swipe_vertical_rounded,
    ObGoal.me: Icons.self_improvement_rounded,
    ObGoal.habits: Icons.eco_rounded,
    ObGoal.other: Icons.edit_rounded,
  };

  /// Where each bubble sits on the ellipse (degrees, 0 = right, clockwise).
  static const _angles = {ObGoal.focus: -142.0, ObGoal.sleep: 180.0, ObGoal.scrolling: 142.0, ObGoal.me: -38.0, ObGoal.habits: 0.0, ObGoal.other: 38.0};

  @override
  double get stillTime => 1.4;

  @override
  Widget build(BuildContext context) {
    final ink = _Ink(context);
    final goal = widget.goal;
    return _HeroBox(
      builder: (context, size, k) {
        final c = Offset(size.width / 2, size.height / 2);
        final hh = size.height * 0.66;
        final hw = hh * 0.56;
        final bubble = 38 * k;
        final rx = size.width / 2 - bubble * 0.72;
        final ry = size.height / 2 - bubble * 0.66;
        // Selected bubble last so it sits on top.
        final order = [...ObGoal.values.where((g) => g != goal), ?goal];
        return ValueListenableBuilder<double>(
          valueListenable: clock,
          builder: (context, t, _) {
            return Stack(
              clipBehavior: Clip.none,
              children: [
                _at(c, hh * 1.9, hh * 1.9, _Glow(size: hh * 1.9, color: ink.dark ? AppPalette.accent : AppPalette.violet, alpha: ink.dark ? 0.28 : 0.30)),
                Positioned.fill(
                  child: CustomPaint(
                    painter: _GoalBackdropPainter(center: c, radius: size.height * 0.43, t: t, dark: ink.dark, k: k, sandHeight: hh),
                  ),
                ),
                _at(
                  c,
                  hw,
                  hh,
                  Transform.rotate(
                    angle: math.sin(t * _tau / 7) * 0.035,
                    child: CustomPaint(
                      painter: _HourglassPainter(t: t, dark: ink.dark, k: k),
                    ),
                  ),
                ),
                for (final g in order)
                  () {
                    final a = _angles[g]! * math.pi / 180;
                    final i = g.index;
                    final pos = c + Offset(math.cos(a) * rx, math.sin(a) * ry) + Offset(0, math.sin(t * _tau / 4.2 + i * 1.1) * 2.6 * k);
                    return _at(
                      pos,
                      bubble * 1.5,
                      bubble * 1.5,
                      _GoalBubble(icon: _icons[g]!, size: bubble, selected: g == goal, anySelected: goal != null, ink: ink),
                    );
                  }(),
              ],
            );
          },
        );
      },
    );
  }
}

class _GoalBubble extends StatelessWidget {
  const _GoalBubble({required this.icon, required this.size, required this.selected, required this.anySelected, required this.ink});

  final IconData icon;
  final double size;
  final bool selected, anySelected;
  final _Ink ink;

  @override
  Widget build(BuildContext context) {
    final idle = anySelected ? ink.muted : Color.lerp(ink.muted, AppPalette.accent, 0.45)!;
    return Center(
      child: TweenAnimationBuilder<double>(
        tween: Tween(end: selected ? 1 : 0),
        duration: _dur(context, 520),
        curve: Curves.easeOutBack,
        builder: (context, v, _) {
          final f = v.clamp(0.0, 1.0);
          return Transform.scale(
            scale: 1 + 0.35 * v,
            child: Container(
              width: size,
              height: size,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color.lerp(ink.dark ? ink.glass : ink.card.withValues(alpha: 0.82), AppPalette.accent, f),
                gradient: f > 0.01
                    ? LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [for (final col in _brand) Color.lerp(ink.dark ? const Color(0xFF221D45) : Colors.white, col, f)!],
                      )
                    : null,
                border: Border.all(color: Color.lerp(ink.glassBorder, Colors.white.withValues(alpha: 0.35), f)!, width: 1),
                boxShadow: [
                  BoxShadow(
                    color: AppPalette.accent.withValues(alpha: (ink.dark ? 0.18 : 0.10) + f * 0.26),
                    blurRadius: 10 + 14 * f,
                    offset: Offset(0, 3 + f),
                  ),
                ],
              ),
              alignment: Alignment.center,
              child: Icon(icon, size: size * 0.5, color: Color.lerp(idle, Colors.white, f)),
            ),
          );
        },
      ),
    );
  }
}

/// Dashed ring + rising sparkles behind the hourglass.
class _GoalBackdropPainter extends CustomPainter {
  _GoalBackdropPainter({required this.center, required this.radius, required this.t, required this.dark, required this.k, required this.sandHeight});

  final Offset center;
  final double radius, t, k, sandHeight;
  final bool dark;

  @override
  void paint(Canvas canvas, Size size) {
    const dashes = 56;
    final rot = t * _tau / 60;
    final ring = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.6 * k
      ..strokeCap = StrokeCap.round
      ..color = AppPalette.violet.withValues(alpha: dark ? 0.30 : 0.32);
    final rect = Rect.fromCircle(center: center, radius: radius);
    for (var i = 0; i < dashes; i++) {
      canvas.drawArc(rect, rot + i * _tau / dashes, _tau / dashes * 0.42, false, ring);
    }
    // Rising sparkles.
    for (var i = 0; i < 6; i++) {
      final p = (t / 7 + i / 6) % 1;
      final side = i.isEven ? -1 : 1;
      final x = center.dx + side * (sandHeight * 0.38 + (i % 3) * 7 * k) + math.sin(t * 1.3 + i) * 4 * k;
      final y = center.dy + sandHeight * 0.45 - p * sandHeight * 0.95;
      final a = math.sin(p * math.pi);
      _sparkle(canvas, Offset(x, y), (2.5 + (i % 3)) * k, Paint()..color = (i % 3 == 0 ? AppPalette.gold : AppPalette.violet).withValues(alpha: 0.85 * a));
    }
  }

  @override
  bool shouldRepaint(_GoalBackdropPainter old) => old.t != t || old.center != center || old.dark != dark;
}

class _HourglassPainter extends CustomPainter {
  _HourglassPainter({required this.t, required this.dark, required this.k});

  final double t, k;
  final bool dark;

  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width, h = size.height;
    final cap = h * 0.08;
    final top = cap * 0.8, bottom = h - cap * 0.8;
    final cx = w / 2, mid = (top + bottom) / 2, g = bottom - top;
    final l = w * 0.13, r = w * 0.87, neck = w * 0.045;
    final glass = Path()
      ..moveTo(l, top)
      ..cubicTo(l, top + g * 0.30, cx - neck, mid - g * 0.15, cx - neck, mid)
      ..cubicTo(cx - neck, mid + g * 0.15, l, bottom - g * 0.30, l, bottom)
      ..lineTo(r, bottom)
      ..cubicTo(r, bottom - g * 0.30, cx + neck, mid + g * 0.15, cx + neck, mid)
      ..cubicTo(cx + neck, mid - g * 0.15, r, top + g * 0.30, r, top)
      ..close();
    final box = Offset.zero & size;

    // Rods behind the glass.
    final rod = Paint()
      ..strokeWidth = 3 * k
      ..strokeCap = StrokeCap.round
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [AppPalette.blue.withValues(alpha: 0.8), AppPalette.accent.withValues(alpha: 0.8)],
      ).createShader(box);
    canvas.drawLine(Offset(w * 0.05, cap), Offset(w * 0.05, h - cap), rod);
    canvas.drawLine(Offset(w * 0.95, cap), Offset(w * 0.95, h - cap), rod);

    canvas.drawPath(
      glass,
      Paint()
        ..shader = LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: dark ? [Colors.white.withValues(alpha: 0.12), Colors.white.withValues(alpha: 0.04)] : const [Colors.white, Color(0xFFEFEAFF)],
        ).createShader(box),
    );

    // Sand.
    canvas.save();
    canvas.clipPath(glass);
    final sand = Paint()
      ..shader = const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [AppPalette.violet, AppPalette.accent],
      ).createShader(Rect.fromLTWH(0, top, w, g));
    final topLevel = top + (mid - top) * 0.40;
    canvas.drawPath(
      Path()
        ..moveTo(0, topLevel)
        ..quadraticBezierTo(cx, topLevel + g * 0.08, w, topLevel)
        ..lineTo(w, mid)
        ..lineTo(0, mid)
        ..close(),
      sand,
    );
    final pileTop = bottom - (bottom - mid) * 0.5;
    canvas.drawPath(
      Path()
        ..moveTo(0, bottom)
        ..lineTo(0, pileTop + g * 0.12)
        ..quadraticBezierTo(cx, pileTop - g * 0.08, w, pileTop + g * 0.12)
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
        ..strokeWidth = 1.4 * k
        ..color = AppPalette.accent.withValues(alpha: 0.55),
    );
    for (var i = 0; i < 6; i++) {
      final p = (t * 0.8 + i / 6) % 1;
      canvas.drawCircle(
        Offset(cx + math.sin(i * 2.3 + t * 3) * 1.4 * k, mid + p * (peak - mid)),
        1.5 * k,
        Paint()..color = AppPalette.violet.withValues(alpha: 1 - p * 0.5),
      );
    }
    canvas.restore();

    // Highlight + outline.
    canvas.drawPath(
      Path()
        ..moveTo(l + w * 0.09, top + g * 0.07)
        ..quadraticBezierTo(l + w * 0.07, top + g * 0.22, cx - neck * 3.2, mid - g * 0.13),
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2.2 * k
        ..strokeCap = StrokeCap.round
        ..color = Colors.white.withValues(alpha: dark ? 0.28 : 0.95),
    );
    canvas.drawPath(
      glass,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.4 * k
        ..color = dark ? Colors.white.withValues(alpha: 0.24) : AppPalette.violet.withValues(alpha: 0.5),
    );

    // Caps.
    for (final y in [0.0, h - cap]) {
      final rr = RRect.fromRectAndRadius(Rect.fromLTWH(0, y, w, cap), Radius.circular(cap / 2));
      canvas.drawRRect(
        rr.shift(Offset(0, 2 * k)),
        Paint()
          ..color = AppPalette.accent.withValues(alpha: dark ? 0.45 : 0.25)
          ..maskFilter = MaskFilter.blur(BlurStyle.normal, 3 * k),
      );
      canvas.drawRRect(rr, Paint()..shader = const LinearGradient(colors: _brand).createShader(rr.outerRect));
      canvas.drawRRect(
        RRect.fromRectAndRadius(Rect.fromLTWH(w * 0.12, y + cap * 0.22, w * 0.3, cap * 0.22), Radius.circular(cap)),
        Paint()..color = Colors.white.withValues(alpha: 0.45),
      );
    }
  }

  @override
  bool shouldRepaint(_HourglassPainter old) => old.t != t || old.dark != dark || old.k != k;
}

// =============================================================================
// 3. "Which apps distract you?" — app icons orbiting the Pausey shield
// =============================================================================

/// Up to 8 app [icons] slowly orbiting a Pausey shield on two rings. The first
/// [selectedCount] get a lock badge, and the shield glows brighter as it grows.
/// [icons] are built by the caller (any size; they are fitted into ~26 px inside
/// 34 px white tiles). With no icons, placeholder tiles are shown.
class AppsHero extends StatefulWidget {
  const AppsHero({super.key, required this.icons, required this.selectedCount});

  final List<Widget> icons;
  final int selectedCount;

  @override
  State<AppsHero> createState() => _AppsHeroState();
}

class _AppsHeroState extends _LoopState<AppsHero> {
  static const _placeholderColors = [AppPalette.blue, AppPalette.coral, AppPalette.teal, AppPalette.gold, AppPalette.violet, AppPalette.accent];

  @override
  double get stillTime => 2;

  @override
  Widget build(BuildContext context) {
    final ink = _Ink(context);
    final n = widget.icons.isEmpty ? 6 : math.min(widget.icons.length, 8);
    // How many tiles ride the inner ring, and its phase (in 72ths of a turn), per tile count —
    // picked so no two tiles touch at any point of the shared rotation.
    final innerN = const {3: 1, 4: 2, 5: 1, 6: 3, 7: 1, 8: 2}[n] ?? 0;
    final phase = (const {3: 18, 4: 54, 5: 27, 6: 36, 7: 54, 8: 54}[n] ?? 0) / 72 * _tau;
    final outerN = n - innerN;
    final locked = widget.selectedCount.clamp(0, n);
    return _HeroBox(
      builder: (context, size, k) {
        final c = Offset(size.width / 2, size.height / 2);
        final tile = 34 * k;
        final orx = size.width / 2 - tile * 0.72, ory = size.height / 2 - tile * 0.62;
        final irx = math.min(orx * 0.6, 100 * k), iry = ory * 0.7;
        final shield = 58 * k;
        final tiles = [
          for (var i = 0; i < n; i++)
            _AppTile(
              key: ValueKey(i),
              size: tile,
              locked: i < locked,
              ink: ink,
              child: widget.icons.isEmpty ? _PlaceholderApp(color: _placeholderColors[i % _placeholderColors.length]) : widget.icons[i],
            ),
        ];
        return TweenAnimationBuilder<double>(
          tween: Tween(end: math.min(widget.selectedCount, 8) / 8),
          duration: _dur(context, 600),
          curve: Curves.easeOutCubic,
          builder: (context, g, _) => ValueListenableBuilder<double>(
            valueListenable: clock,
            builder: (context, t, _) {
              final rot = t * _tau / 40;
              final placed = <({Offset pos, double depth, Widget w})>[];
              for (var i = 0; i < n; i++) {
                final inner = i >= outerN;
                final j = inner ? i - outerN : i;
                final count = inner ? innerN : outerN;
                final a = rot + (inner ? phase : 0) + j * _tau / count - math.pi / 2 + 0.35;
                final pos = c + Offset(math.cos(a) * (inner ? irx : orx), math.sin(a) * (inner ? iry : ory));
                placed.add((pos: pos, depth: (math.sin(a) + 1) / 2, w: tiles[i]));
              }
              placed.sort((a, b) => a.pos.dy.compareTo(b.pos.dy));
              Widget place(({Offset pos, double depth, Widget w}) p) => _at(
                p.pos,
                tile * 1.4,
                tile * 1.4,
                Center(
                  child: Transform.scale(scale: 0.84 + 0.16 * p.depth, child: p.w),
                ),
              );
              final breathe = 1 + 0.03 * math.sin(t * _tau / 3);
              return Stack(
                clipBehavior: Clip.none,
                children: [
                  _at(c, size.height * 1.5, size.height * 1.5, _Glow(size: size.height * 1.5, color: AppPalette.violet, alpha: ink.dark ? 0.16 : 0.22)),
                  Positioned.fill(
                    child: CustomPaint(
                      painter: _OrbitPainter(center: c, outer: Size(orx, ory), inner: Size(irx, iry), t: t, dark: ink.dark, k: k),
                    ),
                  ),
                  for (final p in placed)
                    if (p.pos.dy < c.dy) place(p),
                  _at(
                    c,
                    shield * 3,
                    shield * 3,
                    Transform.scale(
                      scale: breathe,
                      child: _Glow(size: shield * 3, color: AppPalette.accent, alpha: (ink.dark ? 0.30 : 0.22) + 0.38 * g),
                    ),
                  ),
                  _at(c, shield, shield, _PauseShield(size: shield, glow: g, ink: ink)),
                  for (final p in placed)
                    if (p.pos.dy >= c.dy) place(p),
                ],
              );
            },
          ),
        );
      },
    );
  }
}

class _OrbitPainter extends CustomPainter {
  _OrbitPainter({required this.center, required this.outer, required this.inner, required this.t, required this.dark, required this.k});

  final Offset center;
  final Size outer, inner;
  final double t, k;
  final bool dark;

  @override
  void paint(Canvas canvas, Size size) {
    for (final (radii, alpha) in [(outer, 0.30), (inner, 0.40)]) {
      final rect = Rect.fromCenter(center: center, width: radii.width * 2, height: radii.height * 2);
      canvas.drawOval(
        rect,
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1.3 * k
          ..shader = SweepGradient(
            colors: [
              AppPalette.blue.withValues(alpha: alpha * 0.4),
              AppPalette.violet.withValues(alpha: alpha),
              AppPalette.accent.withValues(alpha: alpha * 1.2),
              AppPalette.blue.withValues(alpha: alpha * 0.4),
            ],
          ).createShader(rect),
      );
    }
    // Two little comets riding the rings.
    for (final (radii, speed, phase) in [(outer, 1 / 14, 0.0), (inner, -1 / 10, 2.0)]) {
      final a = t * _tau * speed + phase;
      final p = center + Offset(math.cos(a) * radii.width, math.sin(a) * radii.height);
      canvas.drawCircle(p, 2.4 * k, Paint()..color = AppPalette.violet.withValues(alpha: dark ? 0.9 : 0.75));
      canvas.drawCircle(
        p,
        5 * k,
        Paint()
          ..color = AppPalette.violet.withValues(alpha: 0.25)
          ..maskFilter = MaskFilter.blur(BlurStyle.normal, 3 * k),
      );
    }
  }

  @override
  bool shouldRepaint(_OrbitPainter old) => old.t != t || old.center != center || old.outer != outer || old.dark != dark;
}

class _PauseShield extends StatelessWidget {
  const _PauseShield({required this.size, required this.glow, required this.ink});

  final double size, glow;
  final _Ink ink;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: const LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: _brand),
        border: Border.all(
          color: Colors.white.withValues(alpha: ink.dark ? 0.25 : 0.9),
          width: size * 0.05,
        ),
        boxShadow: [
          BoxShadow(
            color: AppPalette.accent.withValues(alpha: 0.35 + 0.3 * glow),
            blurRadius: 16 + 14 * glow,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      alignment: Alignment.center,
      child: Icon(Icons.pause_rounded, size: size * 0.52, color: Colors.white),
    );
  }
}

class _AppTile extends StatelessWidget {
  const _AppTile({super.key, required this.size, required this.locked, required this.ink, required this.child});

  final double size;
  final bool locked;
  final _Ink ink;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final inner = size * 0.76;
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                color: ink.card,
                borderRadius: BorderRadius.circular(size * 0.3),
                border: Border.all(color: ink.cardBorder),
                boxShadow: ink.shadow(0.9),
              ),
              alignment: Alignment.center,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(inner * 0.28),
                child: SizedBox.square(
                  dimension: inner,
                  child: FittedBox(child: child),
                ),
              ),
            ),
          ),
          Positioned(
            right: -size * 0.16,
            top: -size * 0.16,
            child: _PopBadge(
              on: locked,
              child: _Badge(size: size * 0.48, icon: Icons.lock_rounded, colors: const [AppPalette.violet, AppPalette.accent], ring: ink.card),
            ),
          ),
        ],
      ),
    );
  }
}

class _PlaceholderApp extends StatelessWidget {
  const _PlaceholderApp({required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 26,
      height: 26,
      decoration: BoxDecoration(color: color.withValues(alpha: 0.16)),
      alignment: Alignment.center,
      child: Icon(Icons.apps_rounded, size: 16, color: color),
    );
  }
}

// =============================================================================
// 4. "Your daily screen time" — phone with a gauge
// =============================================================================

/// Phone with a gauge on its screen that sweeps to the chosen range and counts
/// the hours up; colour shifts teal → violet → coral. [unit] is the short,
/// already-translated hour unit shown after the number (e.g. "h").
/// "Not sure" (or no answer) shows a gently pulsing "?" instead.
class ScreenTimeHero extends StatefulWidget {
  const ScreenTimeHero({super.key, this.value, required this.unit});

  final ObScreenTime? value;
  final String unit;

  @override
  State<ScreenTimeHero> createState() => _ScreenTimeHeroState();
}

class _ScreenTimeHeroState extends _LoopState<ScreenTimeHero> {
  static const _max = 10.0;

  static double? _hours(ObScreenTime? v) => switch (v) {
    ObScreenTime.under2 => 2,
    ObScreenTime.h2to4 => 4,
    ObScreenTime.h4to6 => 6,
    ObScreenTime.over6 => 8,
    _ => null,
  };

  @override
  double get stillTime => 0.75;

  @override
  Widget build(BuildContext context) {
    final ink = _Ink(context);
    final hours = _hours(widget.value);
    final unknown = hours == null;
    return _HeroBox(
      builder: (context, size, k) {
        final c = Offset(size.width / 2, size.height / 2);
        final pw = 132 * k;
        final phoneTop = 6 * k;
        final gauge = 108 * k;
        final gaugeCenter = Offset(c.dx, phoneTop + 72 * k);
        return TweenAnimationBuilder<double>(
          tween: Tween(end: hours ?? 0),
          duration: _dur(context, 650),
          curve: Curves.easeOutCubic,
          builder: (context, v, _) {
            final heat = _heat(v);
            return ValueListenableBuilder<double>(
              valueListenable: clock,
              builder: (context, t, _) {
                final sideRoom = size.width / 2 - pw / 2;
                return Stack(
                  clipBehavior: Clip.none,
                  children: [
                    _at(
                      gaugeCenter,
                      size.height * 1.7,
                      size.height * 1.7,
                      _Glow(size: size.height * 1.7, color: Color.lerp(AppPalette.violet, heat, 0.35)!, alpha: ink.dark ? 0.24 : 0.28),
                    ),
                    if (sideRoom > 76 * k) ...[
                      _at(c + Offset(-pw / 2 - 46 * k, -14 * k) + _drift(t, 0, k), 64 * k, 50 * k, _MiniChart(k: k, ink: ink, value: v / _max, color: heat)),
                      _at(
                        c + Offset(pw / 2 + 40 * k, -34 * k) + _drift(t, 1, k),
                        40 * k,
                        40 * k,
                        _IconBubble(icon: Icons.hourglass_bottom_rounded, size: 40 * k, color: AppPalette.accent, ink: ink),
                      ),
                      _at(c + Offset(pw / 2 + 46 * k, 30 * k) + _drift(t, 2, k), 56 * k, 22 * k, _MiniBar(k: k, ink: ink, value: v / _max, color: heat)),
                    ],
                    // Phone (the bottom fades out).
                    Positioned(
                      left: c.dx - pw / 2 - 24 * k,
                      width: pw + 48 * k,
                      top: phoneTop - 4 * k,
                      bottom: 0,
                      child: ShaderMask(
                        blendMode: BlendMode.dstIn,
                        shaderCallback: (r) => const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: [0, 0.74, 1],
                          colors: [Colors.white, Colors.white, Color(0x00FFFFFF)],
                        ).createShader(r),
                        child: ClipRect(
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(24 * k, 4 * k, 24 * k, 0),
                            child: OverflowBox(
                              alignment: Alignment.topCenter,
                              maxHeight: size.height + 40 * k,
                              child: _PhoneFrame(width: pw, height: size.height + 40 * k, ink: ink, k: k),
                            ),
                          ),
                        ),
                      ),
                    ),
                    _at(
                      gaugeCenter,
                      gauge,
                      gauge,
                      CustomPaint(
                        painter: _GaugePainter(value: v / _max, heat: heat, unknown: unknown, t: t, dark: ink.dark, k: k, track: ink.track, tick: ink.tick),
                      ),
                    ),
                    _at(
                      gaugeCenter,
                      gauge,
                      gauge,
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          AnimatedOpacity(
                            opacity: unknown ? 0 : 1,
                            duration: _dur(context, 300),
                            child: _Readout(value: v.round(), unit: widget.unit, k: k, ink: ink),
                          ),
                          AnimatedOpacity(
                            opacity: unknown ? 1 : 0,
                            duration: _dur(context, 300),
                            child: Transform.scale(
                              scale: still ? 1 : 1 + 0.07 * math.sin(t * _tau / 2.2),
                              child: Text(
                                '?',
                                textScaler: TextScaler.noScaling,
                                style: TextStyle(
                                  fontFamily: AppText.fontFamily,
                                  fontSize: 38 * k,
                                  height: 1,
                                  fontWeight: FontWeight.w800,
                                  color: AppPalette.accent.withValues(alpha: 0.65 + 0.35 * (still ? 1 : 0.5 + 0.5 * math.sin(t * _tau / 2.2))),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            );
          },
        );
      },
    );
  }
}

/// Teal (low) → accent (middle) → coral (high), for hours 0..10.
Color _heat(double v) {
  if (v <= 2) return AppPalette.teal;
  if (v <= 5) return Color.lerp(AppPalette.teal, AppPalette.accent, (v - 2) / 3)!;
  if (v <= 8) return Color.lerp(AppPalette.accent, AppPalette.coral, (v - 5) / 3)!;
  return AppPalette.coral;
}

class _Readout extends StatelessWidget {
  const _Readout({required this.value, required this.unit, required this.k, required this.ink});

  final int value;
  final String unit;
  final double k;
  final _Ink ink;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 4 * k),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,
        children: [
          Text(
            '$value',
            textScaler: TextScaler.noScaling,
            style: TextStyle(
              fontFamily: AppText.fontFamily,
              fontSize: 34 * k,
              height: 1,
              fontWeight: FontWeight.w800,
              letterSpacing: -1,
              color: ink.ink,
              fontFeatures: const [FontFeature.tabularFigures()],
            ),
          ),
          SizedBox(width: 1.5 * k),
          Flexible(
            child: Text(
              unit,
              maxLines: 1,
              overflow: TextOverflow.clip,
              textScaler: TextScaler.noScaling,
              style: TextStyle(fontFamily: AppText.fontFamily, fontSize: 13 * k, height: 1, fontWeight: FontWeight.w700, color: ink.muted),
            ),
          ),
        ],
      ),
    );
  }
}

class _PhoneFrame extends StatelessWidget {
  const _PhoneFrame({required this.width, required this.height, required this.ink, required this.k});

  final double width, height, k;
  final _Ink ink;

  @override
  Widget build(BuildContext context) {
    final radius = width * 0.2;
    final bezel = 6 * k;
    final ph = ink.dark ? Colors.white.withValues(alpha: 0.07) : const Color(0xFF1B1838).withValues(alpha: 0.06);
    Widget bar(double w) => Container(
      width: w,
      height: 7 * k,
      margin: EdgeInsets.only(bottom: 6 * k),
      decoration: BoxDecoration(color: ph, borderRadius: BorderRadius.circular(4)),
    );
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(bezel),
      decoration: BoxDecoration(
        color: ink.card,
        borderRadius: BorderRadius.circular(radius),
        border: Border.all(color: ink.dark ? Colors.white.withValues(alpha: 0.10) : ink.c.glassBorder),
        boxShadow: [
          BoxShadow(
            color: AppPalette.accent.withValues(alpha: ink.dark ? 0.24 : 0.14),
            blurRadius: 24,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius - bezel),
        child: DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: ink.dark ? const [Color(0xFF15122E), Color(0xFF0E0C22)] : const [Color(0xFFF7F5FF), Color(0xFFEFEBFF)],
            ),
          ),
          child: Column(
            children: [
              SizedBox(height: 7 * k),
              Container(
                width: 28 * k,
                height: 7 * k,
                decoration: BoxDecoration(color: ink.dark ? const Color(0xFF2A2650) : const Color(0xFFDCD5F7), borderRadius: BorderRadius.circular(5)),
              ),
              SizedBox(height: 118 * k),
              bar(width * 0.6),
              bar(width * 0.42),
            ],
          ),
        ),
      ),
    );
  }
}

class _GaugePainter extends CustomPainter {
  _GaugePainter({
    required this.value,
    required this.heat,
    required this.unknown,
    required this.t,
    required this.dark,
    required this.k,
    required this.track,
    required this.tick,
  });

  final double value, t, k;
  final Color heat, track, tick;
  final bool unknown, dark;

  static const _start = math.pi * 0.75;
  static const _sweep = math.pi * 1.5;

  @override
  void paint(Canvas canvas, Size size) {
    final c = size.center(Offset.zero);
    final r = size.width / 2 - 13 * k;
    final w = 8 * k;
    // Ticks outside the track.
    for (var i = 0; i <= 20; i++) {
      final a = _start + _sweep * i / 20;
      final major = i % 5 == 0;
      final d = Offset(math.cos(a), math.sin(a));
      final lit = !unknown && i / 20 <= value + 0.001;
      canvas.drawLine(
        c + d * (r + w / 2 + 3 * k),
        c + d * (r + w / 2 + (major ? 8 : 5.5) * k),
        Paint()
          ..strokeWidth = (major ? 1.8 : 1.2) * k
          ..strokeCap = StrokeCap.round
          ..color = lit ? _heat(i / 2).withValues(alpha: major ? 0.9 : 0.65) : tick,
      );
    }
    canvas.drawArc(
      Rect.fromCircle(center: c, radius: r),
      _start,
      _sweep,
      false,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = w
        ..strokeCap = StrokeCap.round
        ..color = track,
    );
    if (unknown) {
      // A soft segment drifting round the track.
      final head = _start + ((t / 4) % 1) * _sweep;
      final len = math.pi * 0.42;
      final from = math.max(_start, head - len);
      _gradientArc(canvas, c, r, from, head - from, [AppPalette.violet.withValues(alpha: 0), AppPalette.accent.withValues(alpha: 0.7)], w);
      return;
    }
    final sweep = _sweep * value.clamp(0.0, 1.0);
    if (sweep <= 0.002) return;
    // Glow under the arc.
    canvas.drawArc(
      Rect.fromCircle(center: c, radius: r),
      _start,
      sweep,
      false,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = w * 1.4
        ..strokeCap = StrokeCap.round
        ..color = heat.withValues(alpha: dark ? 0.35 : 0.25)
        ..maskFilter = MaskFilter.blur(BlurStyle.normal, 5 * k),
    );
    _gradientArc(canvas, c, r, _start, sweep, [AppPalette.teal, heat], w);
    // Knob at the end.
    final end = _start + sweep;
    final p = c + Offset(math.cos(end), math.sin(end)) * r;
    canvas.drawCircle(p, w * 0.82, Paint()..color = Colors.white);
    canvas.drawCircle(p, w * 0.42, Paint()..color = heat);
  }

  @override
  bool shouldRepaint(_GaugePainter old) =>
      old.value != value || old.heat != heat || old.unknown != unknown || (unknown && old.t != t) || old.dark != dark || old.k != k;
}

class _MiniChart extends StatelessWidget {
  const _MiniChart({required this.k, required this.ink, required this.value, required this.color});

  final double k, value;
  final _Ink ink;
  final Color color;

  static const _shape = [0.45, 0.72, 0.55, 0.95, 0.66];

  @override
  Widget build(BuildContext context) {
    final f = 0.3 + 0.7 * value.clamp(0.0, 1.0);
    return Container(
      padding: EdgeInsets.fromLTRB(9 * k, 9 * k, 9 * k, 9 * k),
      decoration: BoxDecoration(
        color: ink.card,
        borderRadius: BorderRadius.circular(14 * k),
        border: Border.all(color: ink.cardBorder),
        boxShadow: ink.shadow(),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          for (var i = 0; i < _shape.length; i++)
            Container(
              width: 6 * k,
              height: 32 * k * _shape[i] * f,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3 * k),
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: i == 3 ? [AppPalette.violet, color] : [ink.track, Color.lerp(ink.track, AppPalette.violet, 0.35)!],
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _MiniBar extends StatelessWidget {
  const _MiniBar({required this.k, required this.ink, required this.value, required this.color});

  final double k, value;
  final _Ink ink;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8 * k),
      decoration: BoxDecoration(
        color: ink.card,
        borderRadius: BorderRadius.circular(11 * k),
        border: Border.all(color: ink.cardBorder),
        boxShadow: ink.shadow(),
      ),
      alignment: Alignment.centerLeft,
      child: Container(
        height: 6 * k,
        decoration: BoxDecoration(color: ink.track, borderRadius: BorderRadius.circular(3 * k)),
        alignment: Alignment.centerLeft,
        child: FractionallySizedBox(
          widthFactor: value.clamp(0.0, 1.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3 * k),
              gradient: LinearGradient(colors: [AppPalette.teal, color]),
            ),
          ),
        ),
      ),
    );
  }
}

// =============================================================================
// 5. Permissions — shield with a progress ring and permission bubbles
// =============================================================================

/// Shield inside a progress ring that fills to [granted] / [total], with
/// [total] permission bubbles around it (usage, overlay, notifications,
/// accessibility, battery — in that order). Granted ones get a check badge;
/// the bell bubble rings now and then.
class PermissionsHero extends StatefulWidget {
  const PermissionsHero({super.key, required this.granted, required this.total, this.states});

  final int granted;
  final int total;

  /// Which permissions are on, in bubble order. When given, each bubble shows its
  /// own state (not just the first [granted] ones).
  final List<bool>? states;

  @override
  State<PermissionsHero> createState() => _PermissionsHeroState();
}

class _PermissionsHeroState extends _LoopState<PermissionsHero> {
  static const _icons = [
    Icons.hourglass_bottom_rounded,
    Icons.layers_rounded,
    Icons.notifications_none_rounded,
    Icons.accessibility_new_rounded,
    Icons.battery_saver_rounded,
  ];

  @override
  double get stillTime => 3;

  /// Short bell wobble every 2.8 s.
  static double _ring(double t) {
    final p = t % 2.8;
    if (p > 0.9) return 0;
    return math.sin(p * _tau * 4.5) * 0.32 * (1 - p / 0.9);
  }

  @override
  Widget build(BuildContext context) {
    final ink = _Ink(context);
    final n = widget.total.clamp(0, 8);
    final s = widget.states;
    final g = s == null ? widget.granted.clamp(0, n) : s.take(n).where((on) => on).length;
    final on = [for (var i = 0; i < n; i++) s == null ? i < g : (i < s.length && s[i])];
    final done = n > 0 && g >= n;
    return _HeroBox(
      builder: (context, size, k) {
        final c = Offset(size.width / 2, size.height / 2);
        final bubble = 36 * k;
        final ringR = 40 * k;
        final rx = size.width / 2 - bubble * 0.75, ry = size.height / 2 - bubble * 0.66;
        final start = n.isOdd ? -math.pi / 2 : -math.pi / 2 + math.pi / math.max(n, 1);
        final positions = [for (var i = 0; i < n; i++) c + Offset(math.cos(start + i * _tau / n) * rx, math.sin(start + i * _tau / n) * ry)];
        return TweenAnimationBuilder<double>(
          tween: Tween(end: n == 0 ? 0 : g / n),
          duration: _dur(context, 650),
          curve: Curves.easeOutCubic,
          builder: (context, f, _) => ValueListenableBuilder<double>(
            valueListenable: clock,
            builder: (context, t, _) {
              final breathe = 1 + 0.05 * (0.5 - 0.5 * math.cos(t * _tau / 3));
              return Stack(
                clipBehavior: Clip.none,
                children: [
                  _at(
                    c,
                    size.height * 1.4,
                    size.height * 1.4,
                    Transform.scale(
                      scale: breathe,
                      child: _Glow(
                        size: size.height * 1.4,
                        color: Color.lerp(AppPalette.violet, AppPalette.teal, done ? 0.5 : 0)!,
                        alpha: (ink.dark ? 0.24 : 0.28) + 0.1 * f,
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: CustomPaint(
                      painter: _PermRingPainter(
                        center: c,
                        radius: ringR,
                        progress: f,
                        bubbles: positions,
                        bubbleR: bubble / 2,
                        granted: on,
                        dark: ink.dark,
                        k: k,
                        track: ink.track,
                      ),
                    ),
                  ),
                  _at(c, 50 * k, 58 * k, _Shield(done: done, k: k, dark: ink.dark)),
                  for (var i = 0; i < n; i++)
                    _at(
                      positions[i] + Offset(0, math.sin(t * _tau / 4.4 + i * 1.3) * 2.2 * k),
                      bubble * 1.4,
                      bubble * 1.4,
                      _PermBubble(
                        icon: _icons[i % _icons.length],
                        size: bubble,
                        granted: on[i],
                        wobble: !still && _icons[i % _icons.length] == Icons.notifications_none_rounded ? _ring(t) : 0,
                        ink: ink,
                      ),
                    ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}

class _PermRingPainter extends CustomPainter {
  _PermRingPainter({
    required this.center,
    required this.radius,
    required this.progress,
    required this.bubbles,
    required this.bubbleR,
    required this.granted,
    required this.dark,
    required this.k,
    required this.track,
  });

  final Offset center;
  final double radius, progress, bubbleR, k;
  final List<Offset> bubbles;
  final List<bool> granted;
  final bool dark;
  final Color track;

  @override
  void paint(Canvas canvas, Size size) {
    final w = 5 * k;
    // Dotted connectors from the ring to each bubble.
    for (var i = 0; i < bubbles.length; i++) {
      final d = bubbles[i] - center;
      final dist = d.distance;
      if (dist <= radius + bubbleR + 6 * k) continue;
      final dir = d / dist;
      final from = center + dir * (radius + w + 4 * k);
      final to = bubbles[i] - dir * (bubbleR + 4 * k);
      final len = (to - from).distance;
      final dots = math.max(2, (len / (7 * k)).floor());
      final on = i < granted.length && granted[i];
      final paint = Paint()..color = on ? AppPalette.teal.withValues(alpha: 0.75) : track.withValues(alpha: dark ? 0.22 : 0.28);
      for (var j = 0; j <= dots; j++) {
        canvas.drawCircle(Offset.lerp(from, to, j / dots)!, (on ? 1.5 : 1.3) * k, paint);
      }
    }
    canvas.drawCircle(
      center,
      radius,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = w
        ..color = track,
    );
    final sweep = _tau * progress.clamp(0.0, 1.0);
    if (sweep > 0.002) {
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        -math.pi / 2,
        sweep,
        false,
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = w * 1.5
          ..strokeCap = StrokeCap.round
          ..color = AppPalette.accent.withValues(alpha: dark ? 0.35 : 0.22)
          ..maskFilter = MaskFilter.blur(BlurStyle.normal, 4 * k),
      );
      _gradientArc(canvas, center, radius, -math.pi / 2, math.min(sweep, _tau - 0.01), const [
        AppPalette.blue,
        AppPalette.violet,
        AppPalette.accent,
        AppPalette.teal,
      ], w);
    }
  }

  @override
  bool shouldRepaint(_PermRingPainter old) =>
      old.progress != progress ||
      old.center != center ||
      !listEquals(old.granted, granted) ||
      old.dark != dark ||
      old.bubbles.length != bubbles.length ||
      old.radius != radius;
}

class _Shield extends StatelessWidget {
  const _Shield({required this.done, required this.k, required this.dark});

  final bool done, dark;
  final double k;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _ShieldPainter(dark: dark, k: k),
      child: Padding(
        padding: EdgeInsets.only(bottom: 6 * k),
        child: Center(
          child: AnimatedSwitcher(
            duration: _dur(context, 380),
            switchInCurve: Curves.easeOutBack,
            transitionBuilder: (child, a) => ScaleTransition(
              scale: a,
              child: FadeTransition(opacity: a, child: child),
            ),
            child: Icon(done ? Icons.check_rounded : Icons.lock_rounded, key: ValueKey(done), size: 24 * k, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class _ShieldPainter extends CustomPainter {
  _ShieldPainter({required this.dark, required this.k});

  final bool dark;
  final double k;

  static Path shape(Rect r) {
    final w = r.width, h = r.height, l = r.left, t = r.top;
    return Path()
      ..moveTo(l + w * 0.5, t)
      ..cubicTo(l + w * 0.66, t + h * 0.09, l + w * 0.84, t + h * 0.12, l + w, t + h * 0.13)
      ..lineTo(l + w, t + h * 0.46)
      ..cubicTo(l + w, t + h * 0.74, l + w * 0.74, t + h * 0.91, l + w * 0.5, t + h)
      ..cubicTo(l + w * 0.26, t + h * 0.91, l, t + h * 0.74, l, t + h * 0.46)
      ..lineTo(l, t + h * 0.13)
      ..cubicTo(l + w * 0.16, t + h * 0.12, l + w * 0.34, t + h * 0.09, l + w * 0.5, t)
      ..close();
  }

  @override
  void paint(Canvas canvas, Size size) {
    final rect = (Offset.zero & size).deflate(2 * k);
    final path = shape(rect);
    canvas.drawPath(
      path.shift(Offset(0, 4 * k)),
      Paint()
        ..color = AppPalette.accent.withValues(alpha: dark ? 0.55 : 0.35)
        ..maskFilter = MaskFilter.blur(BlurStyle.normal, 6 * k),
    );
    final fill = Paint()..shader = const LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: _brand).createShader(rect);
    canvas.drawPath(path, fill);
    // Rounded corners: stroke the same gradient with round joins.
    canvas.drawPath(
      path,
      Paint()
        ..shader = fill.shader
        ..style = PaintingStyle.stroke
        ..strokeWidth = 3 * k
        ..strokeJoin = StrokeJoin.round,
    );
    // Inner sheen on the left half.
    canvas.save();
    canvas.clipPath(path);
    canvas.drawRect(Rect.fromLTWH(rect.left, rect.top, rect.width / 2, rect.height), Paint()..color = Colors.white.withValues(alpha: 0.12));
    canvas.restore();
    canvas.drawPath(
      shape(rect.deflate(5 * k)),
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.2 * k
        ..color = Colors.white.withValues(alpha: 0.35),
    );
  }

  @override
  bool shouldRepaint(_ShieldPainter old) => old.dark != dark || old.k != k;
}

class _PermBubble extends StatelessWidget {
  const _PermBubble({required this.icon, required this.size, required this.granted, required this.wobble, required this.ink});

  final IconData icon;
  final double size, wobble;
  final bool granted;
  final _Ink ink;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TweenAnimationBuilder<double>(
        tween: Tween(end: granted ? 1 : 0),
        duration: _dur(context, 420),
        curve: Curves.easeOutCubic,
        builder: (context, f, _) => SizedBox(
          width: size,
          height: size,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.lerp(ink.dark ? ink.glass : ink.card.withValues(alpha: 0.7), ink.card, f),
                    border: Border.all(color: Color.lerp(ink.glassBorder, AppPalette.teal.withValues(alpha: 0.55), f)!, width: 1 + 0.4 * f),
                    boxShadow: [
                      BoxShadow(
                        color: Color.lerp(AppPalette.accent, AppPalette.teal, f)!.withValues(alpha: (ink.dark ? 0.16 : 0.08) + 0.14 * f),
                        blurRadius: 10 + 6 * f,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  alignment: Alignment.center,
                  child: Transform.rotate(
                    angle: wobble,
                    alignment: const Alignment(0, -0.7),
                    child: Icon(icon, size: size * 0.5, color: Color.lerp(ink.muted, AppPalette.accent, f)),
                  ),
                ),
              ),
              Positioned(
                right: -size * 0.12,
                top: -size * 0.12,
                child: _PopBadge(
                  on: granted,
                  child: _Badge(size: size * 0.46, icon: Icons.check_rounded, colors: const [AppPalette.teal, Color(0xFF22C38E)], ring: ink.card),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Box for a hero on top of an onboarding screen: 172 high, smaller on short
/// phones (about a fifth of the screen) so the content below stays in view.
class ObHeroBox extends StatelessWidget {
  const ObHeroBox({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final h = (MediaQuery.sizeOf(context).height * 0.21).clamp(120.0, 172.0);
    // The hero animates every frame; its own layer keeps that from repainting the page.
    return SizedBox(height: h, child: Center(child: RepaintBoundary(child: child)));
  }
}
