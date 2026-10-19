import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../utils/app_theme.dart';

// Top illustration of "Lock Distracting Apps": a glowing lock in soft rings,
// six popular apps around it (each with a red "blocked" badge), very light
// dashed lines from the lock to every app, a beaded orbit with travelling dots
// and faded tiles (games, time, chat, more) in the background.
//
// Motion: rings, apps and badges pop in one after another, the lock's shackle
// clicks shut; then the apps float, the dashes flow towards the lock, a soft
// ripple leaves the lock now and then and the orbit dots travel round.

const _tau = math.pi * 2;

/// Design space: everything below is laid out on a 360×250 box and scaled.
const _w = 360.0, _h = 272.0;
const _c = Offset(_w / 2, _h / 2);

/// Apps around the lock: (asset, angle in degrees from straight up, clockwise).
const _apps = <(String, double)>[
  ('assets/svg/ob2_instagram.svg', 0),
  ('tiktok', 62),
  ('x', 116),
  ('assets/svg/ob2_youtube.svg', 180),
  ('assets/svg/ob2_facebook.svg', 244),
  ('assets/svg/ob2_snapchat.svg', 298),
];

/// Faded background tiles: (icon, centre, rotation in degrees).
const _ghosts = <(IconData, Offset, double)>[
  (Icons.sports_esports_rounded, Offset(50, 42), -12),
  (Icons.schedule_rounded, Offset(314, 50), 10),
  (Icons.chat_bubble_rounded, Offset(36, 214), -10),
  (Icons.more_horiz_rounded, Offset(326, 210), 8),
];

const _rApps = 106.0; // apps sit on this circle
const _tile = 35.0; // app tile size
const _disc = 36.0; // lock disc radius

Offset _appPos(int i, double t) {
  final a = _apps[i].$2 * math.pi / 180;
  final bob = math.sin(t * _tau / 3.6 + i * 1.1) * 3; // gentle float
  return _c + Offset(math.sin(a) * _rApps * 1.02, -math.cos(a) * _rApps) + Offset(0, bob);
}

double _ease(double t, double from, double len, [Curve curve = Curves.easeOutCubic]) =>
    curve.transform(((t - from) / len).clamp(0.0, 1.0));

class ObLockOrbitHero extends StatefulWidget {
  const ObLockOrbitHero({super.key});

  @override
  State<ObLockOrbitHero> createState() => _ObLockOrbitHeroState();
}

class _ObLockOrbitHeroState extends State<ObLockOrbitHero> with SingleTickerProviderStateMixin {
  late final Ticker _ticker = createTicker(_tick);
  final ValueNotifier<double> _clock = ValueNotifier(0);
  Duration _last = Duration.zero;

  void _tick(Duration elapsed) {
    final dt = ((elapsed - _last).inMicroseconds / 1e6).clamp(0.0, 0.1);
    _last = elapsed;
    _clock.value += dt;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (MediaQuery.maybeDisableAnimationsOf(context) ?? false) {
      if (_ticker.isActive) _ticker.stop();
      _clock.value = 4; // a still, finished frame
    } else if (!_ticker.isActive) {
      _last = Duration.zero;
      _ticker.start();
    }
  }

  @override
  void dispose() {
    _ticker.dispose();
    _clock.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final dark = context.isDark;
    return ExcludeSemantics(
      child: LayoutBuilder(builder: (context, box) {
        final w = math.min(box.maxWidth, 420.0);
        final k = w / _w;
        return SizedBox(
          width: w,
          height: _h * k,
          child: FittedBox(
            child: SizedBox(
              width: _w,
              height: _h,
              child: ValueListenableBuilder<double>(
                valueListenable: _clock,
                builder: (context, t, _) => Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned.fill(child: CustomPaint(painter: _BackPainter(t: t, dark: dark))),
                    for (final (i, g) in _ghosts.indexed) _ghost(g, i, t, dark),
                    Positioned.fill(child: CustomPaint(painter: _LinesPainter(t: t, dark: dark))),
                    _lock(t, dark),
                    for (var i = 0; i < _apps.length; i++) _app(i, t, dark),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget _ghost((IconData, Offset, double) g, int i, double t, bool dark) {
    final appear = _ease(t, 0.5 + i * 0.1, 0.6);
    final drift = Offset(math.sin(t * _tau / 7 + i) * 2.5, math.cos(t * _tau / 8 + i * 2) * 3);
    const s = 44.0;
    final p = g.$2 + drift;
    return Positioned(
      left: p.dx - s / 2,
      top: p.dy - s / 2,
      width: s,
      height: s,
      child: Opacity(
        opacity: appear * (dark ? 0.4 : 0.85),
        child: Transform.rotate(
          angle: g.$3 * math.pi / 180,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: dark ? const Color(0xFF2A2458) : const Color(0xFFE6E0FF),
              boxShadow: [BoxShadow(color: AppPalette.violet.withValues(alpha: 0.12), blurRadius: 10, offset: const Offset(0, 4))],
            ),
            alignment: Alignment.center,
            child: Icon(g.$1, size: 22, color: AppPalette.violet.withValues(alpha: dark ? 0.7 : 0.6)),
          ),
        ),
      ),
    );
  }

  Widget _lock(double t, bool dark) {
    final appear = _ease(t, 0.0, 0.7, Curves.easeOutBack);
    final breathe = 1 + 0.025 * math.sin(t * _tau / 3.2);
    const box = _disc * 2 + 16;
    return Positioned(
      left: _c.dx - box / 2,
      top: _c.dy - box / 2,
      width: box,
      height: box,
      child: Opacity(
        opacity: appear.clamp(0.0, 1.0),
        child: Transform.scale(
          scale: (0.6 + 0.4 * appear) * breathe,
          child: CustomPaint(painter: _LockPainter(t: t, dark: dark)),
        ),
      ),
    );
  }

  Widget _app(int i, double t, bool dark) {
    final start = 0.35 + i * 0.09;
    final pop = _ease(t, start, 0.55, Curves.easeOutBack);
    final badge = _ease(t, 1.05 + i * 0.08, 0.45, Curves.elasticOut);
    final p = _appPos(i, t);
    const s = _tile;
    return Positioned(
      left: p.dx - s / 2,
      top: p.dy - s / 2,
      width: s,
      height: s,
      child: Opacity(
        opacity: _ease(t, start, 0.3),
        child: Transform.scale(
          scale: 0.5 + 0.5 * pop,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned.fill(child: _AppIcon(id: _apps[i].$1, dark: dark)),
              Positioned(
                right: -6,
                bottom: -6,
                child: Transform.scale(scale: badge, child: _MinusBadge(dark: dark)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Glow, soft rings around the lock, the beaded orbit and its travelling dots.
class _BackPainter extends CustomPainter {
  _BackPainter({required this.t, required this.dark});
  final double t;
  final bool dark;

  @override
  void paint(Canvas canvas, Size size) {
    final rings = _ease(t, 0.0, 0.9);

    // Purple glow behind everything.
    canvas.drawCircle(
      _c,
      168,
      Paint()
        ..shader = RadialGradient(colors: [
          AppPalette.violet.withValues(alpha: dark ? 0.30 : 0.30),
          AppPalette.violet.withValues(alpha: dark ? 0.10 : 0.10),
          AppPalette.violet.withValues(alpha: 0),
        ], stops: const [0, 0.5, 1]).createShader(Rect.fromCircle(center: _c, radius: 168)),
    );

    // Filled soft disc with three thin rings (they open out on entrance).
    canvas.drawCircle(
      _c,
      94 * (0.7 + 0.3 * rings),
      Paint()..color = (dark ? const Color(0xFF6C5CE0) : const Color(0xFFB9A8FF)).withValues(alpha: (dark ? 0.16 : 0.22) * rings),
    );
    final ringPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.8
      ..color = (dark ? const Color(0xFFB7A6FF) : Colors.white).withValues(alpha: (dark ? 0.18 : 0.75) * rings);
    // Three thin rings with wide gaps between them.
    for (final r in [46.0, 67.0, 88.0]) {
      canvas.drawCircle(_c, r * (0.7 + 0.3 * rings), ringPaint);
    }

    // A soft ripple leaving the lock every 3 seconds.
    if (t > 1.4) {
      final ph = ((t - 1.4) % 3.0) / 3.0;
      canvas.drawCircle(
        _c,
        _disc + ph * 70,
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2 * (1 - ph) + 0.5
          ..color = (dark ? const Color(0xFFC6B8FF) : Colors.white).withValues(alpha: (1 - ph) * (dark ? 0.25 : 0.7)),
      );
    }

    // Beaded orbit: a wide, slightly tilted ellipse of tiny, very light dots.
    final orbit = _ease(t, 0.3, 1.0);
    canvas.save();
    canvas.translate(_c.dx, _c.dy);
    canvas.rotate(-0.12);
    const rx = 164.0, ry = 114.0;
    final bead = Paint()..color = (dark ? const Color(0xFFB7A6FF) : const Color(0xFFC9BEFF)).withValues(alpha: (dark ? 0.30 : 0.55) * orbit);
    const n = 120;
    final shift = t * 0.02;
    for (var j = 0; j < n; j++) {
      final a = (j / n + shift) * _tau;
      canvas.drawCircle(Offset(math.cos(a) * rx, math.sin(a) * ry), 1.1, bead);
    }
    // Travelling dots on the orbit.
    for (final (i, (phase, r)) in [(0.08, 4.6), (0.42, 3.6), (0.63, 4.2), (0.86, 3.4)].indexed) {
      final a = (phase + t / 26 * (i.isEven ? 1 : 0.8)) * _tau;
      final p = Offset(math.cos(a) * rx, math.sin(a) * ry);
      canvas.drawCircle(
        p,
        r * 1.8,
        Paint()
          ..color = AppPalette.violet.withValues(alpha: 0.18 * orbit)
          ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 3),
      );
      canvas.drawCircle(
        p,
        r,
        Paint()
          ..shader = ui.Gradient.linear(p - Offset(r, r), p + Offset(r, r), [const Color(0xFFC6B8FF).withValues(alpha: orbit), AppPalette.violet.withValues(alpha: orbit)]),
      );
    }
    canvas.restore();
  }

  @override
  bool shouldRepaint(_BackPainter old) => old.t != t || old.dark != dark;
}

/// Very light dashed lines from the lock to every app; the dashes flow inwards.
class _LinesPainter extends CustomPainter {
  _LinesPainter({required this.t, required this.dark});
  final double t;
  final bool dark;

  @override
  void paint(Canvas canvas, Size size) {
    const dash = 4.0, gap = 4.0;
    final flow = (t * 10) % (dash + gap);
    for (var i = 0; i < _apps.length; i++) {
      final grow = _ease(t, 0.55 + i * 0.09, 0.6);
      if (grow <= 0) continue;
      final to = _appPos(i, t);
      final dir = (to - _c) / (to - _c).distance;
      final from = _c + dir * (_disc + 6);
      final end = to - dir * (_tile * 0.62);
      final full = (end - from).distance;
      final len = full * grow;
      final paint = Paint()
        ..strokeWidth = 1.3
        ..strokeCap = StrokeCap.round
        ..color = (dark ? const Color(0xFFB7A6FF) : Colors.white).withValues(alpha: dark ? 0.22 : 0.85);
      // Dashes measured from the app end, moving towards the lock.
      for (var d = -flow; d < len; d += dash + gap) {
        final a = d.clamp(0.0, len), b = (d + dash).clamp(0.0, len);
        if (b <= a) continue;
        canvas.drawLine(end - dir * a, end - dir * b, paint);
      }
    }
  }

  @override
  bool shouldRepaint(_LinesPainter old) => old.t != t || old.dark != dark;
}

/// White disc with a purple lock; the shackle clicks shut on entrance and
/// little light rays twinkle beside it.
class _LockPainter extends CustomPainter {
  _LockPainter({required this.t, required this.dark});
  final double t;
  final bool dark;

  @override
  void paint(Canvas canvas, Size size) {
    final c = size.center(Offset.zero);
    const r = _disc;
    canvas.drawCircle(c, r + 4, Paint()..color = AppPalette.accent.withValues(alpha: dark ? 0.45 : 0.28)..maskFilter = const MaskFilter.blur(BlurStyle.normal, 10));
    canvas.drawCircle(
      c,
      r,
      Paint()
        ..shader = RadialGradient(
          colors: dark ? const [Color(0xFF2A2458), Color(0xFF1D1940)] : const [Colors.white, Color(0xFFF1EDFF)],
        ).createShader(Rect.fromCircle(center: c, radius: r)),
    );
    canvas.drawCircle(
      c,
      r,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2
        ..color = const Color(0xFFC4B5FF).withValues(alpha: dark ? 0.35 : 0.8),
    );

    // Shackle: starts open (raised) and clicks down.
    final close = _ease(t, 0.85, 0.35, Curves.easeOutBack);
    final lift = (1 - close) * 7;
    const bw = 30.0, bh = 22.0;
    final bodyTop = c.dy - 2;
    final shackle = Path()
      ..moveTo(c.dx - 9, bodyTop + 2 - lift)
      ..lineTo(c.dx - 9, bodyTop - 9 - lift)
      ..arcToPoint(Offset(c.dx + 9, bodyTop - 9 - lift), radius: const Radius.circular(9))
      ..lineTo(c.dx + 9, bodyTop + 2 - lift);
    canvas.drawPath(
      shackle,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 5
        ..strokeCap = StrokeCap.round
        ..color = const Color(0xFF8F7DFF),
    );
    final body = RRect.fromRectAndRadius(Rect.fromLTWH(c.dx - bw / 2, bodyTop, bw, bh), const Radius.circular(7));
    canvas.drawRRect(
      body,
      Paint()..shader = ui.Gradient.linear(body.outerRect.topCenter, body.outerRect.bottomCenter, const [Color(0xFFA796FF), AppPalette.accent]),
    );
    final key = Paint()..color = Colors.white;
    canvas.drawCircle(Offset(c.dx, bodyTop + 9), 3.2, key);
    canvas.drawRRect(RRect.fromRectAndRadius(Rect.fromCenter(center: Offset(c.dx, bodyTop + 13.5), width: 2.6, height: 6), const Radius.circular(1.3)), key);

    // Rays: flash when the shackle closes, then twinkle softly.
    final flash = _ease(t, 1.05, 0.3);
    final ray = Paint()
      ..strokeWidth = 2.2
      ..strokeCap = StrokeCap.round;
    for (final (i, deg) in [-150.0, -30.0, 180.0, 0.0].indexed) {
      final tw = 0.55 + 0.45 * math.sin(t * _tau / 1.8 + i * 1.3);
      ray.color = const Color(0xFF8F7DFF).withValues(alpha: flash * tw);
      final a = deg * math.pi / 180;
      final o = Offset(c.dx, bodyTop - 7);
      final dir = Offset(math.cos(a), math.sin(a));
      canvas.drawLine(o + dir * 19, o + dir * 24, ray);
    }
  }

  @override
  bool shouldRepaint(_LockPainter old) => old.t != t || old.dark != dark;
}

/// One app tile (full-colour rounded square) with a soft coloured shadow.
class _AppIcon extends StatelessWidget {
  const _AppIcon({required this.id, required this.dark});
  final String id;
  final bool dark;

  static const _glow = {
    'tiktok': Color(0xFF25F4EE),
    'x': Color(0xFF4B4B6B),
    'assets/svg/ob2_instagram.svg': Color(0xFFE1306C),
    'assets/svg/ob2_youtube.svg': Color(0xFFFF2D2D),
    'assets/svg/ob2_facebook.svg': Color(0xFF1877F2),
    'assets/svg/ob2_snapchat.svg': Color(0xFFFFD400),
  };

  @override
  Widget build(BuildContext context) {
    final glow = _glow[id] ?? AppPalette.violet;
    final Widget art = switch (id) {
      'tiktok' => SvgPicture.string(_tiktokSvg),
      'x' => SvgPicture.string(_xSvg),
      _ => SvgPicture.asset(id),
    };
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(_tile * 0.28),
        boxShadow: [BoxShadow(color: glow.withValues(alpha: dark ? 0.45 : 0.35), blurRadius: 14, offset: const Offset(0, 5))],
      ),
      child: ClipRRect(borderRadius: BorderRadius.circular(_tile * 0.28), child: art),
    );
  }
}

/// Red circle with a white minus: "this app is blocked".
class _MinusBadge extends StatelessWidget {
  const _MinusBadge({required this.dark});
  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 15,
      height: 15,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: const LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [Color(0xFFFF6B7D), Color(0xFFE5304B)]),
        border: Border.all(color: dark ? const Color(0xFF1D1940) : Colors.white, width: 2),
        boxShadow: [BoxShadow(color: const Color(0xFFE5304B).withValues(alpha: 0.4), blurRadius: 6, offset: const Offset(0, 2))],
      ),
      alignment: Alignment.center,
      child: Container(width: 6, height: 2, decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(2))),
    );
  }
}

const _tiktokNote =
    'M17.6 6h3.3c.3 2.4 1.9 4.1 4.4 4.3v3.4c-1.6 0-3.1-.5-4.4-1.3v6.8c0 3.6-2.9 6.4-6.4 6.4s-6.3-2.8-6.3-6.3c0-3.7 3.2-6.5 7-6.1v3.5c-1.8-.4-3.6.9-3.6 2.7 0 1.5 1.3 2.8 2.9 2.8 1.6 0 3.1-1.2 3.1-3.1z';

const _tiktokSvg = '''
<svg width="32" height="32" viewBox="0 0 32 32" xmlns="http://www.w3.org/2000/svg">
<rect width="32" height="32" rx="9" fill="#14141F"/>
<path transform="translate(-0.9,-0.9)" d="$_tiktokNote" fill="#25F4EE"/>
<path transform="translate(0.9,0.9)" d="$_tiktokNote" fill="#FE2C55"/>
<path d="$_tiktokNote" fill="#FFFFFF"/>
</svg>''';

const _xSvg = '''
<svg width="32" height="32" viewBox="0 0 32 32" xmlns="http://www.w3.org/2000/svg">
<rect width="32" height="32" rx="9" fill="#14141F"/>
<path transform="translate(7.5,7.5) scale(0.7)" d="M18.901 1.153h3.68l-8.04 9.19L24 22.846h-7.406l-5.8-7.584-6.638 7.584H.474l8.6-9.83L0 1.154h7.594l5.243 6.932ZM17.61 20.644h2.039L6.486 3.24H4.298Z" fill="#FFFFFF"/>
</svg>''';
