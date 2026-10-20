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

/// Box geometry: a box turned a little (three-quarter view). Top rim corners:
/// left, back (behind the apps), right, front; then the bottom corners.
const _pL = Offset(82, 130), _pB = Offset(134, 86), _pR = Offset(284, 116), _pF = Offset(232, 162);
const _bL = Offset(102, 232), _bF = Offset(224, 264), _bR = Offset(272, 214);
const _tile = 38.0;

/// One loop of the story, in seconds.
const _loop = 7.4;

/// Apps: asset (or built-in id), where they float outside, and where they peek out of the box.
const _apps = <(String, Offset, Offset, double)>[
  ('assets/svg/ob2_instagram.svg', Offset(70, 70), Offset(132, 120), -12),
  ('tiktok', Offset(118, 30), Offset(172, 98), -4),
  ('assets/svg/ob2_youtube.svg', Offset(180, 16), Offset(214, 108), 10),
  ('assets/svg/ob2_facebook.svg', Offset(242, 30), Offset(238, 132), 12),
  ('assets/svg/ob2_snapchat.svg', Offset(290, 70), Offset(198, 138), 4),
  ('x', Offset(312, 116), Offset(160, 142), -8),
];

/// Faded background tiles: icon, centre, tilt (degrees).
const _ghosts = <(IconData, Offset, double)>[
  (Icons.sports_esports_rounded, Offset(36, 140), -10),
  (Icons.schedule_rounded, Offset(326, 176), 8),
  (Icons.chat_bubble_rounded, Offset(44, 236), -8),
  (Icons.more_horiz_rounded, Offset(318, 248), 6),
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
    const s = 44.0;
    final p = g.$2 + Offset(math.sin(total * 0.8 + i) * 2, math.cos(total * 0.7 + i * 2) * 2.5);
    return Positioned(
      left: p.dx - s / 2,
      top: p.dy - s / 2,
      width: s,
      height: s,
      child: Opacity(
        opacity: dark ? 0.55 : 0.95,
        child: Transform.rotate(
          angle: g.$3 * math.pi / 180,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(13),
              color: dark ? const Color(0xFF2E2860) : const Color(0xFFF7F5FF),
              boxShadow: [BoxShadow(color: AppPalette.violet.withValues(alpha: dark ? 0.25 : 0.22), blurRadius: 14, offset: const Offset(0, 4))],
            ),
            alignment: Alignment.center,
            child: Icon(g.$1, size: 23, color: dark ? const Color(0xFFB9A8FF) : const Color(0xFF7C5CFF)),
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
    final sunk = st.sink * 96; // slide down inside the box
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
          (dark ? const Color(0xFF8B7BFF) : const Color(0xFFB9A8FF)).withValues(alpha: dark ? 0.38 : 0.45),
          AppPalette.violet.withValues(alpha: dark ? 0.12 : 0.12),
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

  static const _c = Offset(_w / 2, 192);
  static const _rx = 172.0, _ry = 52.0, _tilt = -0.26;

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
      ..strokeWidth = 15
      ..shader = LinearGradient(colors: [
        (dark ? const Color(0xFF6C5CE0) : const Color(0xFFDCD4FF)).withValues(alpha: dark ? 0.35 : 0.70),
        (dark ? const Color(0xFFB7A6FF) : Colors.white).withValues(alpha: dark ? 0.32 : 0.90),
        (dark ? const Color(0xFF6C5CE0) : const Color(0xFFDCD4FF)).withValues(alpha: dark ? 0.35 : 0.70),
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

Path _quadPath(Offset a, Offset b, Offset c, Offset d) => Path()
  ..moveTo(a.dx, a.dy)
  ..lineTo(b.dx, b.dy)
  ..lineTo(c.dx, c.dy)
  ..lineTo(d.dx, d.dy)
  ..close();

Path _opening() => _quadPath(_pL, _pB, _pR, _pF);

/// Fills [path] and traces it with a thick round stroke of the same paint: soft, rounded corners.
void _soft(Canvas canvas, Path path, Paint fill, [double round = 8]) {
  canvas.drawPath(path, fill);
  canvas.drawPath(
    path,
    Paint()
      ..shader = fill.shader
      ..color = fill.color
      ..style = PaintingStyle.stroke
      ..strokeWidth = round
      ..strokeJoin = StrokeJoin.round,
  );
}

/// Shadow under the box and the purple inside of the opening.
class _BoxBackPainter extends CustomPainter {
  _BoxBackPainter({required this.dark, required this.glow});
  final bool dark;
  final double glow;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawOval(
      Rect.fromCenter(center: const Offset(190, 262), width: 210, height: 28),
      Paint()
        ..color = AppPalette.accent.withValues(alpha: dark ? 0.40 : 0.28)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 10),
    );
    final inside = _opening();
    final bounds = inside.getBounds();
    _soft(
      canvas,
      inside,
      Paint()
        ..shader = LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: dark ? const [Color(0xFF3B2C9E), Color(0xFF6A54E8)] : const [Color(0xFF5B43DC), Color(0xFF9580FF)],
        ).createShader(bounds),
    );
    // The inner back walls, a touch darker.
    final wall = Path()
      ..moveTo(_pL.dx, _pL.dy)
      ..lineTo(_pB.dx, _pB.dy)
      ..lineTo(_pR.dx, _pR.dy)
      ..lineTo(_pR.dx - 8, _pR.dy + 16)
      ..lineTo(_pB.dx + 4, _pB.dy + 18)
      ..lineTo(_pL.dx + 12, _pL.dy + 4)
      ..close();
    canvas.drawPath(wall, Paint()..color = const Color(0xFF2E1F8F).withValues(alpha: dark ? 0.45 : 0.28));
    if (glow > 0) {
      canvas.drawPath(inside, Paint()..color = const Color(0xFFC9BEFF).withValues(alpha: 0.30 * glow));
    }
  }

  @override
  bool shouldRepaint(_BoxBackPainter old) => old.dark != dark || old.glow != glow;
}

/// The lid, hinged along the back edges. [open] 1 = tipped up behind the box, 0 = shut.
class _LidPainter extends CustomPainter {
  _LidPainter({required this.open, required this.dark});
  final double open;
  final bool dark;

  @override
  void paint(Canvas canvas, Size size) {
    final o = open.clamp(-0.08, 1.0); // a little overshoot when it shuts
    // Hinge B→R stays put; the free edge (L→F) swings up and back as it opens.
    const shut = Offset(-52, 44); // from the hinge to the free edge when shut (B→L)
    const up = Offset(-10, -46); // the same when open (tipped up)
    final d = Offset.lerp(shut, up, o)!;
    final l = _pB + d, f = _pR + d;
    final lid = _quadPath(l, _pB, _pR, f);
    final top = dark ? const [Color(0xFFB3A6FF), Color(0xFF8E7CFF)] : const [Color(0xFFE4DCFF), Color(0xFFC3B5FF)];
    final under = dark ? const [Color(0xFF5A48C8), Color(0xFF7462E8)] : const [Color(0xFFA897FF), Color(0xFFC0B2FF)];
    final bounds = lid.getBounds();
    _soft(
      canvas,
      lid,
      Paint()..shader = LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: o > 0.5 ? under : top).createShader(bounds),
      10,
    );
    // Thickness along the free edge when shut / nearly shut, and a little handle.
    final k = 1 - o.clamp(0.0, 1.0);
    if (k > 0.05) {
      final edge = Path()
        ..moveTo(l.dx, l.dy)
        ..lineTo(f.dx, f.dy)
        ..lineTo(f.dx, f.dy + 9 * k)
        ..lineTo(l.dx, l.dy + 9 * k)
        ..close();
      _soft(canvas, edge, Paint()..color = dark ? const Color(0xFF7A68F0) : const Color(0xFFA996FF), 6);
      final mid = Offset.lerp(Offset.lerp(l, f, 0.5)!, Offset.lerp(_pB, _pR, 0.5)!, 0.5)!;
      canvas.save();
      canvas.translate(mid.dx, mid.dy);
      canvas.rotate(math.atan2(f.dy - l.dy, f.dx - l.dx));
      canvas.drawRRect(
        RRect.fromRectAndRadius(Rect.fromCenter(center: Offset.zero, width: 36, height: 7 * k), const Radius.circular(4)),
        Paint()..color = Colors.white.withValues(alpha: dark ? 0.35 : 0.7),
      );
      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(_LidPainter old) => old.open != open || old.dark != dark;
}

/// The front and right sides of the box, its rim, and the lock (shackle clicks shut, glow pulse).
class _BoxFrontPainter extends CustomPainter {
  _BoxFrontPainter({required this.dark, required this.shut, required this.pulse});
  final bool dark;
  final double shut;
  final double pulse;

  @override
  void paint(Canvas canvas, Size size) {
    // Front (wide) side.
    final front = _quadPath(_pL, _pF, _bF, _bL);
    final fb = front.getBounds();
    _soft(
      canvas,
      front,
      Paint()
        ..shader = LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: dark ? const [Color(0xFF8A78F5), Color(0xFF5B48D0)] : const [Color(0xFFD9CFFF), Color(0xFFA996FF)],
        ).createShader(fb),
      14,
    );
    // Right (narrow) side, a shade darker.
    final right = _quadPath(_pF, _pR, _bR, _bF);
    _soft(
      canvas,
      right,
      Paint()
        ..shader = LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: dark ? const [Color(0xFF6E5CE0), Color(0xFF4A39B4)] : const [Color(0xFFB8A8FF), Color(0xFF8C76F5)],
        ).createShader(right.getBounds()),
      14,
    );
    // Soft sheen along the front.
    canvas.drawPath(
      _quadPath(_pL + const Offset(14, 14), _pL + const Offset(30, 18), _bL + const Offset(22, -14), _bL + const Offset(8, -18)),
      Paint()..color = Colors.white.withValues(alpha: dark ? 0.10 : 0.30),
    );
    // Rim all round the opening.
    canvas.drawPath(
      _opening(),
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 7
        ..strokeJoin = StrokeJoin.round
        ..color = dark ? const Color(0xFFC4B8FF) : const Color(0xFFF1EDFF),
    );

    // Lock badge on the front side, turned with it.
    final c = Offset.lerp(Offset.lerp(_pL, _pF, 0.5)!, Offset.lerp(_bL, _bF, 0.5)!, 0.52)!;
    final tilt = math.atan2(_pF.dy - _pL.dy, _pF.dx - _pL.dx) * 0.6;
    canvas.save();
    canvas.translate(c.dx, c.dy);
    canvas.rotate(tilt);
    canvas.translate(-c.dx, -c.dy);
    if (pulse > 0) {
      canvas.drawCircle(c, 36 + 10 * pulse, Paint()..color = Colors.white.withValues(alpha: 0.40 * pulse)..maskFilter = const MaskFilter.blur(BlurStyle.normal, 8));
    }
    canvas.drawCircle(c, 33, Paint()..color = Colors.white.withValues(alpha: dark ? 0.16 : 0.28));
    canvas.drawCircle(c, 29, Paint()..color = (dark ? const Color(0xFFF1EDFF) : const Color(0xFFF7F4FF)));
    const bodyW = 26.0, bodyH = 21.0;
    final bodyTop = c.dy - 3;
    final lift = (1 - shut) * 6;
    final shackle = Path()
      ..moveTo(c.dx - 8, bodyTop + 1 - lift)
      ..lineTo(c.dx - 8, bodyTop - 7 - lift)
      ..arcToPoint(Offset(c.dx + 8, bodyTop - 7 - lift), radius: const Radius.circular(8))
      ..lineTo(c.dx + 8, bodyTop + 1 - lift);
    canvas.drawPath(
      shackle,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 5
        ..strokeCap = StrokeCap.round
        ..color = const Color(0xFF7C5CFF),
    );
    final body = RRect.fromRectAndRadius(Rect.fromLTWH(c.dx - bodyW / 2, bodyTop, bodyW, bodyH), const Radius.circular(6));
    canvas.drawRRect(body, Paint()..color = const Color(0xFF7C5CFF));
    canvas.drawCircle(Offset(c.dx, bodyTop + 8), 3, Paint()..color = Colors.white);
    canvas.drawRRect(RRect.fromRectAndRadius(Rect.fromCenter(center: Offset(c.dx, bodyTop + 12.5), width: 2.6, height: 6), const Radius.circular(1.3)), Paint()..color = Colors.white);

    // Little sparkles when it clicks.
    if (pulse > 0) {
      final sp = Paint()
        ..strokeWidth = 2
        ..strokeCap = StrokeCap.round
        ..color = (dark ? Colors.white : const Color(0xFF8F7BFF)).withValues(alpha: pulse);
      for (final deg in [-140.0, -40.0, 180.0, 0.0]) {
        final a = deg * math.pi / 180;
        final d = Offset(math.cos(a), math.sin(a));
        canvas.drawLine(c + d * (38 + 4 * pulse), c + d * (44 + 4 * pulse), sp);
      }
    }
    canvas.restore();
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
