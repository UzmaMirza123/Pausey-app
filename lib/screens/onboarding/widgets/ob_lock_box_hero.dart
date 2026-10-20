import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../utils/app_theme.dart';

// "Lock Distracting Apps" hero: a soft purple lock-box. The distracting apps
// float around it, fly in one by one (each gets a red "blocked" badge), sink
// inside, the lid shuts and the lock clicks. After a moment the lid opens and
// the apps float back out, and it plays again. A ribbon wraps around the box
// and faded tiles (games, time, chat, more) sit in the background.

const _tau = math.pi * 2;

/// Design space; everything is laid out on this box and scaled to the width.
const _w = 360.0, _h = 290.0;

/// Box geometry.
const _boxL = 112.0, _boxR = 248.0; // front face left/right
const _rimY = 152.0; // front top edge of the box
const _boxB = 256.0; // bottom of the front face
const _backY = 120.0; // back edge of the opening
const _backInset = 13.0; // the back edge is a little narrower (perspective)

const _tile = 36.0;

/// One loop of the story, in seconds.
const _loop = 7.4;

/// Apps: asset (or built-in id), where they float outside, and where they peek out of the box.
const _apps = <(String, Offset, Offset, double)>[
  ('assets/svg/ob2_instagram.svg', Offset(62, 92), Offset(146, 118), -14),
  ('tiktok', Offset(96, 40), Offset(176, 106), -3),
  ('assets/svg/ob2_youtube.svg', Offset(154, 18), Offset(206, 114), 10),
  ('assets/svg/ob2_facebook.svg', Offset(208, 18), Offset(160, 136), -6),
  ('assets/svg/ob2_snapchat.svg', Offset(266, 40), Offset(192, 134), 6),
  ('x', Offset(300, 92), Offset(222, 138), 15),
];

/// Faded background tiles: icon, centre, tilt (degrees).
const _ghosts = <(IconData, Offset, double)>[
  (Icons.sports_esports_rounded, Offset(36, 178), -12),
  (Icons.schedule_rounded, Offset(326, 176), 10),
  (Icons.chat_bubble_rounded, Offset(52, 246), -8),
  (Icons.more_horiz_rounded, Offset(310, 248), 8),
];

double _ease(double t, double from, double len, [Curve curve = Curves.easeInOutCubic]) =>
    curve.transform(((t - from) / len).clamp(0.0, 1.0));

/// Where we are in the loop for app [i]: 0 = floating outside, 1 = peeking in the box,
/// plus how far it has sunk inside (0…1).
({double fly, double sink}) _appState(int i, double t) {
  final arrive = 0.6 + i * 0.3; // fly in, one after another
  final fly = _ease(t, arrive, 0.8, Curves.easeInOutCubic);
  final sink = _ease(t, 3.3, 0.45, Curves.easeInCubic);
  final rise = _ease(t, 6.15, 0.35, Curves.easeOutCubic); // pop back up when the lid opens
  final out = _ease(t, 6.45 + i * 0.05, 0.75, Curves.easeInOutCubic); // fly back out
  return (fly: fly * (1 - out), sink: sink * (1 - rise));
}

/// Lid openness: 1 = open, 0 = shut.
double _lid(double t) {
  final close = _ease(t, 3.8, 0.5, Curves.easeOutBack);
  final open = _ease(t, 5.9, 0.45, Curves.easeOutCubic);
  return (1 - close + open).clamp(0.0, 1.0);
}

/// The lock's click (0 = open shackle, 1 = shut) and a glow pulse right after.
double _lockShut(double t) => _ease(t, 4.25, 0.18, Curves.easeOutBack) * (1 - _ease(t, 5.75, 0.2));
double _pulse(double t) => math.sin(_ease(t, 4.3, 0.8, Curves.linear) * math.pi);

class ObLockBoxHero extends StatefulWidget {
  const ObLockBoxHero({super.key});

  @override
  State<ObLockBoxHero> createState() => _ObLockBoxHeroState();
}

class _ObLockBoxHeroState extends State<ObLockBoxHero> with SingleTickerProviderStateMixin {
  late final Ticker _ticker = createTicker(_tick);
  final ValueNotifier<double> _clock = ValueNotifier(0);
  Duration _last = Duration.zero;
  double _all = 0; // total time (for floating)

  void _tick(Duration elapsed) {
    final dt = ((elapsed - _last).inMicroseconds / 1e6).clamp(0.0, 0.1);
    _last = elapsed;
    _all += dt;
    _clock.value = _all;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (MediaQuery.maybeDisableAnimationsOf(context) ?? false) {
      if (_ticker.isActive) _ticker.stop();
      _clock.value = 3.0; // still frame: apps sitting in the open box
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
        final w = math.min(box.maxWidth, 430.0);
        return SizedBox(
          width: w,
          height: w * _h / _w,
          child: FittedBox(
            child: SizedBox(
              width: _w,
              height: _h,
              child: ValueListenableBuilder<double>(
                valueListenable: _clock,
                builder: (context, total, _) {
                  final t = total % _loop; // where we are in the story
                  final appear = _ease(total, 0, 0.6, Curves.easeOutCubic); // first entrance only
                  final lid = _lid(t);
                  return Opacity(
                    opacity: appear,
                    child: Transform.translate(
                      offset: Offset(0, 12 * (1 - appear)),
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Positioned.fill(child: CustomPaint(painter: _BackPainter(t: total, dark: dark))),
                          for (final (i, g) in _ghosts.indexed) _ghost(g, i, total, dark),
                          Positioned.fill(child: CustomPaint(painter: _BoxBackPainter(dark: dark, glow: _pulse(t)))),
                          Positioned.fill(child: CustomPaint(painter: _LidPainter(open: lid, dark: dark))),
                          for (var i = 0; i < _apps.length; i++) _app(i, t, total, dark),
                          Positioned.fill(child: CustomPaint(painter: _BoxFrontPainter(dark: dark, shut: _lockShut(t), pulse: _pulse(t)))),
                          Positioned.fill(child: CustomPaint(painter: _RibbonPainter(t: total, dark: dark, front: true))),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget _ghost((IconData, Offset, double) g, int i, double total, bool dark) {
    const s = 42.0;
    final p = g.$2 + Offset(math.sin(total * 0.8 + i) * 2, math.cos(total * 0.7 + i * 2) * 2.5);
    return Positioned(
      left: p.dx - s / 2,
      top: p.dy - s / 2,
      width: s,
      height: s,
      child: Opacity(
        opacity: dark ? 0.4 : 0.85,
        child: Transform.rotate(
          angle: g.$3 * math.pi / 180,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: dark ? const Color(0xFF2A2458) : const Color(0xFFE6E0FF),
              boxShadow: [BoxShadow(color: AppPalette.violet.withValues(alpha: 0.12), blurRadius: 10, offset: const Offset(0, 4))],
            ),
            alignment: Alignment.center,
            child: Icon(g.$1, size: 21, color: AppPalette.violet.withValues(alpha: dark ? 0.7 : 0.6)),
          ),
        ),
      ),
    );
  }

  Widget _app(int i, double t, double total, bool dark) {
    final (id, outer, peek, tilt) = _apps[i];
    final st = _appState(i, t);
    final f = st.fly;
    // Curved flight: up and over into the box.
    final ctrl = Offset((outer.dx + peek.dx) / 2, math.min(outer.dy, peek.dy) - 46);
    final p = _quad(outer, ctrl, peek, f);
    final bob = math.sin(total * _tau / 3.4 + i * 1.1) * 3 * (1 - f);
    final sunk = st.sink * 60; // slide down inside the box
    final pos = p + Offset(0, bob + sunk);
    final angle = ui.lerpDouble(i.isEven ? -8 : 8, tilt, f)! * math.pi / 180;
    final scale = ui.lerpDouble(1.0, 0.92, f)!;
    // Red "blocked" badge pops on as the app lands.
    final badge = _ease(t, 0.6 + i * 0.3 + 0.7, 0.4, Curves.elasticOut) * (1 - _ease(t, 6.4, 0.2)) * (1 - st.sink);
    const s = _tile;
    return Positioned(
      left: pos.dx - s / 2,
      top: pos.dy - s / 2,
      width: s,
      height: s,
      child: Transform.rotate(
        angle: angle,
        child: Transform.scale(
          scale: scale,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned.fill(child: _AppIcon(id: id, dark: dark)),
              Positioned(right: -6, top: -6, child: Transform.scale(scale: badge, child: _MinusBadge(dark: dark))),
            ],
          ),
        ),
      ),
    );
  }

  static Offset _quad(Offset a, Offset c, Offset b, double t) {
    final u = 1 - t;
    return a * (u * u) + c * (2 * u * t) + b * (t * t);
  }
}

/// Glow behind everything and the back half of the ribbon.
class _BackPainter extends CustomPainter {
  _BackPainter({required this.t, required this.dark});
  final double t;
  final bool dark;

  @override
  void paint(Canvas canvas, Size size) {
    const c = Offset(_w / 2, 168);
    canvas.drawCircle(
      c,
      170,
      Paint()
        ..shader = RadialGradient(colors: [
          AppPalette.violet.withValues(alpha: dark ? 0.30 : 0.26),
          AppPalette.violet.withValues(alpha: dark ? 0.10 : 0.08),
          AppPalette.violet.withValues(alpha: 0),
        ], stops: const [0, 0.5, 1]).createShader(Rect.fromCircle(center: c, radius: 170)),
    );
    _RibbonPainter(t: t, dark: dark, front: false).paint(canvas, size);
  }

  @override
  bool shouldRepaint(_BackPainter old) => old.t != t || old.dark != dark;
}

/// A soft ribbon looping around the box (back half behind it, front half in front),
/// with a few dots travelling along it.
class _RibbonPainter extends CustomPainter {
  _RibbonPainter({required this.t, required this.dark, required this.front});
  final double t;
  final bool dark;
  final bool front;

  static const _c = Offset(_w / 2, 196);
  static const _rx = 164.0, _ry = 44.0, _tilt = -0.14;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.save();
    canvas.translate(_c.dx, _c.dy);
    canvas.rotate(_tilt);
    final rect = Rect.fromCenter(center: Offset.zero, width: _rx * 2, height: _ry * 2);
    // Front half = lower arc (0…π), back half = upper arc (π…2π).
    final start = front ? 0.12 : math.pi + 0.12;
    final band = Paint()
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 11
      ..shader = LinearGradient(colors: [
        (dark ? const Color(0xFF6C5CE0) : const Color(0xFFCFC4FF)).withValues(alpha: dark ? 0.35 : 0.55),
        (dark ? const Color(0xFF9F8CFF) : Colors.white).withValues(alpha: dark ? 0.30 : 0.75),
        (dark ? const Color(0xFF6C5CE0) : const Color(0xFFCFC4FF)).withValues(alpha: dark ? 0.35 : 0.55),
      ]).createShader(rect);
    canvas.drawArc(rect, start, math.pi - 0.24, false, band);
    // Dots on this half.
    for (var k = 0; k < 3; k++) {
      final a = (t / 9 + k / 3) * _tau % _tau;
      final onFront = a < math.pi;
      if (onFront != front) continue;
      final p = Offset(math.cos(a) * _rx, math.sin(a) * _ry);
      canvas.drawCircle(p, 4.2, Paint()..color = AppPalette.violet.withValues(alpha: 0.18)..maskFilter = const MaskFilter.blur(BlurStyle.normal, 3));
      canvas.drawCircle(p, 3.2, Paint()..color = k == 1 ? const Color(0xFF8FA6FF) : const Color(0xFFB9A8FF));
    }
    canvas.restore();
  }

  @override
  bool shouldRepaint(_RibbonPainter old) => old.t != t || old.dark != dark || old.front != front;
}

Path _opening() => Path()
  ..moveTo(_boxL + _backInset, _backY)
  ..lineTo(_boxR - _backInset, _backY)
  ..lineTo(_boxR, _rimY)
  ..lineTo(_boxL, _rimY)
  ..close();

/// Shadow under the box and the dark inside of the opening.
class _BoxBackPainter extends CustomPainter {
  _BoxBackPainter({required this.dark, required this.glow});
  final bool dark;
  final double glow;

  @override
  void paint(Canvas canvas, Size size) {
    // Soft floor shadow.
    canvas.drawOval(
      Rect.fromCenter(center: const Offset(_w / 2, _boxB + 6), width: 170, height: 22),
      Paint()
        ..color = AppPalette.accent.withValues(alpha: dark ? 0.35 : 0.22)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 8),
    );
    // Back wall rising a little above the opening (gives depth).
    final back = RRect.fromRectAndCorners(
      const Rect.fromLTRB(_boxL + _backInset, _backY - 6, _boxR - _backInset, _backY + 8),
      topLeft: const Radius.circular(8),
      topRight: const Radius.circular(8),
    );
    canvas.drawRRect(back, Paint()..color = dark ? const Color(0xFF6E5CE6) : const Color(0xFFB9ADFF));
    // Inside of the box.
    final inside = _opening();
    canvas.drawPath(
      inside,
      Paint()
        ..shader = const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF3A2C9E), Color(0xFF5B46D8)],
        ).createShader(const Rect.fromLTRB(_boxL, _backY, _boxR, _rimY)),
    );
    // Light glowing up from inside when the lock clicks.
    if (glow > 0) {
      canvas.drawPath(inside, Paint()..color = const Color(0xFFC9BEFF).withValues(alpha: 0.25 * glow));
    }
  }

  @override
  bool shouldRepaint(_BoxBackPainter old) => old.dark != dark || old.glow != glow;
}

/// The lid, hinged at the back edge. [open] 1 = standing up behind the box, 0 = shut.
class _LidPainter extends CustomPainter {
  _LidPainter({required this.open, required this.dark});
  final double open;
  final bool dark;

  @override
  void paint(Canvas canvas, Size size) {
    final o = open.clamp(-0.08, 1.0); // a little overshoot when it shuts
    // Front edge of the lid: on the rim when shut, high up behind when open.
    final frontY = ui.lerpDouble(_rimY + 2, _backY - 50, o)!;
    final narrow = ui.lerpDouble(-4, _backInset - 2, o)!; // narrower as it tips away
    final backL = _boxL + _backInset - 4, backR = _boxR - _backInset + 4;
    final frontL = _boxL + narrow, frontR = _boxR - narrow;
    final lid = Path()
      ..moveTo(backL, _backY - 2)
      ..lineTo(backR, _backY - 2)
      ..lineTo(frontR, frontY)
      ..lineTo(frontL, frontY)
      ..close();
    // Seen from the top when shut, from underneath when open.
    final top = dark ? const [Color(0xFFB3A6FF), Color(0xFF8E7CFF)] : const [Color(0xFFD9D2FF), Color(0xFFB4A7FF)];
    final under = dark ? const [Color(0xFF5A48C8), Color(0xFF7462E8)] : const [Color(0xFF8F7EF5), Color(0xFFA899FF)];
    final colors = o > 0.5 ? under : top;
    final bounds = Rect.fromLTRB(_boxL, math.min(frontY, _backY), _boxR, math.max(frontY, _rimY));
    final shader = LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: colors).createShader(bounds);
    canvas.drawPath(lid, Paint()..shader = shader);
    // Same colour traced with a thick round stroke: soft, rounded corners.
    canvas.drawPath(
      lid,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 10
        ..strokeJoin = StrokeJoin.round
        ..shader = shader,
    );
    // A light line across the open lid, like a soft edge catching the light.
    if (o > 0.5) {
      canvas.drawLine(
        Offset(frontL + 10, frontY + 6),
        Offset(frontR - 10, frontY + 6),
        Paint()
          ..strokeWidth = 3
          ..strokeCap = StrokeCap.round
          ..color = Colors.white.withValues(alpha: (dark ? 0.25 : 0.45) * (o - 0.5) * 2),
      );
    }
    // Thickness along the front edge (visible when shut / nearly shut).
    final thick = 9 * (1 - o.clamp(0.0, 1.0));
    if (thick > 0.5) {
      canvas.drawRRect(
        RRect.fromRectAndRadius(Rect.fromLTRB(frontL, frontY - 1, frontR, frontY + thick), const Radius.circular(5)),
        Paint()..color = dark ? const Color(0xFF7A68F0) : const Color(0xFF9D8EFF),
      );
      // Little handle on top.
      final hc = Offset(_w / 2, (frontY + _backY) / 2);
      canvas.drawRRect(
        RRect.fromRectAndRadius(Rect.fromCenter(center: hc, width: 34, height: 7 * (1 - o.clamp(0.0, 1.0)) + 1), const Radius.circular(4)),
        Paint()..color = Colors.white.withValues(alpha: dark ? 0.35 : 0.6),
      );
    }
  }

  @override
  bool shouldRepaint(_LidPainter old) => old.open != open || old.dark != dark;
}

/// Front of the box with its rim and the lock (shackle clicks shut, glow pulse).
class _BoxFrontPainter extends CustomPainter {
  _BoxFrontPainter({required this.dark, required this.shut, required this.pulse});
  final bool dark;
  final double shut;
  final double pulse;

  @override
  void paint(Canvas canvas, Size size) {
    const face = Rect.fromLTRB(_boxL, _rimY, _boxR, _boxB);
    final rr = RRect.fromRectAndCorners(face, bottomLeft: const Radius.circular(22), bottomRight: const Radius.circular(22), topLeft: const Radius.circular(4), topRight: const Radius.circular(4));
    canvas.drawRRect(
      rr,
      Paint()
        ..shader = LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: dark ? const [Color(0xFF9483FF), Color(0xFF5E47DC)] : const [Color(0xFFB7ACFF), Color(0xFF7A62F2)],
        ).createShader(face),
    );
    // Soft sheen down the left side.
    canvas.drawRRect(
      RRect.fromRectAndRadius(const Rect.fromLTRB(_boxL + 10, _rimY + 12, _boxL + 22, _boxB - 18), const Radius.circular(6)),
      Paint()..color = Colors.white.withValues(alpha: dark ? 0.10 : 0.22),
    );
    // Rim.
    canvas.drawRRect(
      RRect.fromRectAndRadius(const Rect.fromLTRB(_boxL - 3, _rimY - 4, _boxR + 3, _rimY + 7), const Radius.circular(6)),
      Paint()..color = dark ? const Color(0xFFB9ADFF) : const Color(0xFFDCD5FF),
    );

    // Lock badge.
    const c = Offset(_w / 2, 208);
    if (pulse > 0) {
      canvas.drawCircle(c, 30 + 10 * pulse, Paint()..color = Colors.white.withValues(alpha: 0.28 * pulse)..maskFilter = const MaskFilter.blur(BlurStyle.normal, 8));
    }
    canvas.drawCircle(c, 27, Paint()..color = Colors.white.withValues(alpha: dark ? 0.22 : 0.38));
    canvas.drawCircle(c, 21, Paint()..color = Colors.white.withValues(alpha: dark ? 0.85 : 0.95));
    const bodyW = 18.0, bodyH = 14.0;
    final bodyTop = c.dy - 2;
    final lift = (1 - shut) * 5;
    final shackle = Path()
      ..moveTo(c.dx - 5.5, bodyTop + 1 - lift)
      ..lineTo(c.dx - 5.5, bodyTop - 5 - lift)
      ..arcToPoint(Offset(c.dx + 5.5, bodyTop - 5 - lift), radius: const Radius.circular(5.5))
      ..lineTo(c.dx + 5.5, bodyTop + 1 - lift);
    canvas.drawPath(
      shackle,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 3.4
        ..strokeCap = StrokeCap.round
        ..color = const Color(0xFF8F7DFF),
    );
    final body = RRect.fromRectAndRadius(Rect.fromLTWH(c.dx - bodyW / 2, bodyTop, bodyW, bodyH), const Radius.circular(4.5));
    canvas.drawRRect(body, Paint()..shader = ui.Gradient.linear(body.outerRect.topCenter, body.outerRect.bottomCenter, const [Color(0xFFA796FF), AppPalette.accent]));
    canvas.drawCircle(Offset(c.dx, bodyTop + 5.5), 2, Paint()..color = Colors.white);
    canvas.drawRRect(RRect.fromRectAndRadius(Rect.fromCenter(center: Offset(c.dx, bodyTop + 8.5), width: 1.8, height: 4), const Radius.circular(1)), Paint()..color = Colors.white);

    // Little sparkles when it clicks.
    if (pulse > 0) {
      final sp = Paint()
        ..strokeWidth = 2
        ..strokeCap = StrokeCap.round
        ..color = Colors.white.withValues(alpha: pulse);
      for (final deg in [-140.0, -40.0, 180.0, 0.0]) {
        final a = deg * math.pi / 180;
        final d = Offset(math.cos(a), math.sin(a));
        canvas.drawLine(c + d * (30 + 4 * pulse), c + d * (36 + 4 * pulse), sp);
      }
    }
  }

  @override
  bool shouldRepaint(_BoxFrontPainter old) => old.dark != dark || old.shut != shut || old.pulse != pulse;
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
        boxShadow: [BoxShadow(color: glow.withValues(alpha: dark ? 0.45 : 0.35), blurRadius: 12, offset: const Offset(0, 4))],
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
      width: 16,
      height: 16,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: const LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [Color(0xFFFF6B7D), Color(0xFFE5304B)]),
        border: Border.all(color: dark ? const Color(0xFF1D1940) : Colors.white, width: 2),
        boxShadow: [BoxShadow(color: const Color(0xFFE5304B).withValues(alpha: 0.4), blurRadius: 6, offset: const Offset(0, 2))],
      ),
      alignment: Alignment.center,
      child: Container(width: 6.5, height: 2, decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(2))),
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
