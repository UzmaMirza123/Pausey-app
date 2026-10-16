import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

import '../../../utils/app_theme.dart';

/// The body shapes of the little answer characters.
enum ObBlobShape { round, triangle, wobble, squircle, cloud, drop, star, pill }

const Color _ink = Color(0xFF1B1838);

bool _reducedMotion(BuildContext context) => MediaQuery.maybeDisableAnimationsOf(context) ?? false;

/// A cute blob character with a face, drawn with a CustomPainter.
///
/// Idle: blinks every few seconds (staggered per shape and [seed]) and bobs 2px.
/// [happy]: the eyes turn into ^ ^ arcs, the mouth opens into a smile and the body
/// does a squash-and-stretch bounce. [onFill]: lighter body + white outline so it
/// stays visible on a row filled with its own colour. Everything is static when the
/// phone's "Remove animations" setting is on. The face looks toward the start side
/// (the label) and mirrors in RTL.
class ObBlob extends StatefulWidget {
  const ObBlob({super.key, required this.shape, required this.color, this.size = 40, this.happy = false, this.onFill = false, this.seed = 0});

  final ObBlobShape shape;
  final Color color;
  final double size;
  final bool happy;
  final bool onFill;

  /// Shifts the blink/bob timing so several characters don't move in sync.
  final int seed;

  /// Default colour per shape: brand tints that read on light and dark backgrounds.
  static const Map<ObBlobShape, Color> palette = {
    ObBlobShape.round: AppPalette.accent, // purple
    ObBlobShape.triangle: Color(0xFF14A38E), // deep teal-green
    ObBlobShape.wobble: AppPalette.coral,
    ObBlobShape.squircle: AppPalette.gold,
    ObBlobShape.cloud: AppPalette.blue,
    ObBlobShape.drop: AppPalette.violet,
    ObBlobShape.star: Color(0xFFF28B3C), // amber (coral × gold)
    ObBlobShape.pill: Color(0xFF3FA9D9), // sky (blue × teal)
  };

  static Color colorFor(ObBlobShape shape) => palette[shape] ?? AppPalette.accent;

  /// Text/icon colour to use on top of [fill]: white, or dark ink on light fills (gold).
  static Color onColor(Color fill) => fill.computeLuminance() > 0.45 ? _ink : Colors.white;

  @override
  State<ObBlob> createState() => _ObBlobState();
}

class _ObBlobState extends State<ObBlob> with TickerProviderStateMixin {
  late final AnimationController _idle = AnimationController(
    vsync: this,
    duration: Duration(milliseconds: 3300 + widget.shape.index * 140 + (widget.seed % 5) * 90),
  );
  late final AnimationController _happy = AnimationController(vsync: this, duration: const Duration(milliseconds: 240), value: widget.happy ? 1 : 0);
  late final AnimationController _bounce = AnimationController(vsync: this, duration: const Duration(milliseconds: 560));
  late final AnimationController _fill = AnimationController(vsync: this, duration: const Duration(milliseconds: 200), value: widget.onFill ? 1 : 0);
  bool _reduced = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _reduced = _reducedMotion(context);
    if (_reduced) {
      _idle.stop();
      _idle.value = 0;
      _bounce.value = 0;
    } else if (!_idle.isAnimating) {
      _idle.repeat();
    }
  }

  @override
  void didUpdateWidget(ObBlob old) {
    super.didUpdateWidget(old);
    if (old.happy != widget.happy) {
      if (_reduced) {
        _happy.value = widget.happy ? 1 : 0;
      } else if (widget.happy) {
        _happy.forward();
        _bounce.forward(from: 0);
      } else {
        _happy.reverse();
      }
    }
    if (old.onFill != widget.onFill) {
      if (_reduced) {
        _fill.value = widget.onFill ? 1 : 0;
      } else {
        widget.onFill ? _fill.forward() : _fill.reverse();
      }
    }
  }

  @override
  void dispose() {
    _idle.dispose();
    _happy.dispose();
    _bounce.dispose();
    _fill.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: CustomPaint(
        size: Size.square(widget.size),
        painter: _BlobPainter(
          shape: widget.shape,
          color: widget.color,
          seed: widget.seed,
          rtl: Directionality.maybeOf(context) == TextDirection.rtl,
          animate: !_reduced,
          idle: _idle,
          happy: _happy,
          bounce: _bounce,
          fill: _fill,
        ),
      ),
    );
  }
}

enum _Eye { big, sleepy, wink, normal, dot, oval }

/// Face layout for a shape, in unit coordinates (0..1 of the box).
class _Face {
  const _Face(this.left, this.right, this.r, this.eye, this.mouth, this.mouthW, this.gloss, this.bottom);
  final Offset left, right;
  final double r;
  final _Eye eye;
  final Offset mouth;
  final double mouthW;
  final Offset gloss;
  final double bottom;
}

const Map<ObBlobShape, _Face> _faces = {
  ObBlobShape.round: _Face(Offset(0.355, 0.52), Offset(0.635, 0.52), 0.125, _Eye.big, Offset(0.5, 0.735), 0.17, Offset(0.27, 0.31), 0.93),
  ObBlobShape.triangle: _Face(Offset(0.405, 0.635), Offset(0.595, 0.635), 0.085, _Eye.sleepy, Offset(0.5, 0.775), 0.12, Offset(0.42, 0.33), 0.91),
  ObBlobShape.wobble: _Face(Offset(0.375, 0.5), Offset(0.625, 0.5), 0.105, _Eye.wink, Offset(0.51, 0.69), 0.16, Offset(0.28, 0.3), 0.94),
  ObBlobShape.squircle: _Face(Offset(0.36, 0.5), Offset(0.64, 0.5), 0.1, _Eye.normal, Offset(0.5, 0.7), 0.15, Offset(0.25, 0.3), 0.92),
  ObBlobShape.cloud: _Face(Offset(0.405, 0.605), Offset(0.595, 0.605), 0.062, _Eye.dot, Offset(0.5, 0.725), 0.11, Offset(0.42, 0.33), 0.87),
  ObBlobShape.drop: _Face(Offset(0.405, 0.62), Offset(0.595, 0.62), 0.085, _Eye.normal, Offset(0.5, 0.77), 0.11, Offset(0.37, 0.43), 0.92),
  ObBlobShape.star: _Face(Offset(0.42, 0.56), Offset(0.58, 0.56), 0.068, _Eye.normal, Offset(0.5, 0.685), 0.1, Offset(0.41, 0.35), 0.92),
  ObBlobShape.pill: _Face(Offset(0.385, 0.565), Offset(0.615, 0.565), 0.06, _Eye.oval, Offset(0.5, 0.71), 0.12, Offset(0.2, 0.43), 0.86),
};

class _BlobPainter extends CustomPainter {
  _BlobPainter({
    required this.shape,
    required this.color,
    required this.seed,
    required this.rtl,
    required this.animate,
    required this.idle,
    required this.happy,
    required this.bounce,
    required this.fill,
  }) : super(repaint: Listenable.merge([idle, happy, bounce, fill]));

  final ObBlobShape shape;
  final Color color;
  final int seed;
  final bool rtl;
  final bool animate;
  final Animation<double> idle, happy, bounce, fill;

  static double _easeOut(double t) => 1 - math.pow(1 - t, 3).toDouble();
  static double _easeInOut(double t) => t < 0.5 ? 4 * t * t * t : 1 - math.pow(-2 * t + 2, 3) / 2;

  /// Vertical squash for the "happy" bounce: 1 → 0.85 → 1.07 → 1.
  static double _squash(double b) {
    if (b <= 0 || b >= 1) return 1;
    if (b < 0.22) return 1 - 0.15 * _easeOut(b / 0.22);
    if (b < 0.55) return 0.85 + 0.22 * _easeInOut((b - 0.22) / 0.33);
    return 1.07 - 0.07 * _easeOut((b - 0.55) / 0.45);
  }

  /// Eye openness for the idle blink (1 = open).
  double _blink(double t) {
    if (!animate) return 1;
    final p = 0.06 + ((shape.index * 0.137 + seed * 0.291) % 1.0) * 0.8;
    const w = 0.055;
    final d = t - p;
    if (d < 0 || d > w) return 1;
    return 1 - math.sin(math.pi * d / w);
  }

  Path _body(double s) {
    Offset u(double x, double y) => Offset(x * s, y * s);
    switch (shape) {
      case ObBlobShape.round:
        return _smoothClosed(
          List.generate(64, (i) {
            final a = i / 64 * 2 * math.pi;
            final sy = math.sin(a);
            return u(0.5 + 0.43 * math.cos(a), 0.555 + 0.385 * sy * (sy > 0 ? 0.97 : 1.0));
          }),
        );
      case ObBlobShape.triangle:
        return _roundedPoly([u(0.5, 0.1), u(0.95, 0.91), u(0.05, 0.91)], 0.17 * s);
      case ObBlobShape.wobble:
        return _smoothClosed(
          List.generate(72, (i) {
            final a = i / 72 * 2 * math.pi;
            final r = 0.405 * (1 + 0.065 * math.sin(3 * a + 0.5) + 0.035 * math.sin(5 * a + 1.3));
            return u(0.5 + r * math.cos(a), 0.545 + r * 0.95 * math.sin(a));
          }),
        );
      case ObBlobShape.squircle:
        return Path()..addRRect(RRect.fromLTRBR(0.1 * s, 0.16 * s, 0.9 * s, 0.92 * s, Radius.circular(0.27 * s)));
      case ObBlobShape.cloud:
        var p = Path()..addRRect(RRect.fromLTRBR(0.08 * s, 0.52 * s, 0.92 * s, 0.87 * s, Radius.circular(0.175 * s)));
        for (final c in [(0.31, 0.56, 0.2), (0.53, 0.43, 0.25), (0.73, 0.58, 0.19)]) {
          p = Path.combine(PathOperation.union, p, Path()..addOval(Rect.fromCircle(center: u(c.$1, c.$2), radius: c.$3 * s)));
        }
        return p;
      case ObBlobShape.drop:
        final c = u(0.5, 0.62);
        final r = 0.3 * s;
        return Path()
          ..moveTo(0.5 * s, 0.07 * s)
          ..cubicTo(0.6 * s, 0.24 * s, 0.8 * s, 0.4 * s, 0.8 * s, 0.62 * s)
          ..arcTo(Rect.fromCircle(center: c, radius: r), 0, math.pi, false)
          ..cubicTo(0.2 * s, 0.4 * s, 0.4 * s, 0.24 * s, 0.5 * s, 0.07 * s)
          ..close();
      case ObBlobShape.star:
        final pts = <Offset>[];
        for (var i = 0; i < 10; i++) {
          final a = -math.pi / 2 + i * math.pi / 5;
          final r = i.isEven ? 0.45 : 0.27;
          pts.add(u(0.5 + r * math.cos(a), 0.555 + r * math.sin(a)));
        }
        return _roundedPoly(pts, 0.075 * s);
      case ObBlobShape.pill:
        return Path()..addRRect(RRect.fromLTRBR(0.04 * s, 0.3 * s, 0.96 * s, 0.86 * s, Radius.circular(0.28 * s)));
    }
  }

  /// Closed smooth curve through sampled points (quadratic midpoints).
  static Path _smoothClosed(List<Offset> p) {
    final n = p.length;
    Offset mid(int i) => (p[i % n] + p[(i + 1) % n]) / 2;
    final path = Path()..moveTo(mid(0).dx, mid(0).dy);
    for (var i = 1; i <= n; i++) {
      final m = mid(i);
      path.quadraticBezierTo(p[i % n].dx, p[i % n].dy, m.dx, m.dy);
    }
    return path..close();
  }

  /// Polygon with every corner rounded by [r].
  static Path _roundedPoly(List<Offset> p, double r) {
    final n = p.length;
    final path = Path();
    for (var i = 0; i < n; i++) {
      final prev = p[(i - 1 + n) % n], cur = p[i], next = p[(i + 1) % n];
      final d1 = prev - cur, d2 = next - cur;
      final a = cur + d1 / d1.distance * math.min(r, d1.distance / 2);
      final b = cur + d2 / d2.distance * math.min(r, d2.distance / 2);
      if (i == 0) {
        path.moveTo(a.dx, a.dy);
      } else {
        path.lineTo(a.dx, a.dy);
      }
      path.conicTo(cur.dx, cur.dy, b.dx, b.dy, 0.9);
    }
    return path..close();
  }

  @override
  void paint(Canvas canvas, Size size) {
    final s = size.shortestSide;
    final face = _faces[shape]!;
    final t = idle.value;
    final h = Curves.easeOut.transform(happy.value.clamp(0.0, 1.0));
    final f = fill.value.clamp(0.0, 1.0);
    final open = _blink(t);
    final bob = animate ? math.sin(2 * math.pi * (t * 2 + seed * 0.37)) : 0.0;
    final sy = animate ? _squash(bounce.value) : 1.0;
    final sx = 1 + (1 - sy) * 0.7;
    final line = math.max(1.4, s * 0.046);

    canvas.save();
    canvas.translate((size.width - s) / 2, (size.height - s) / 2);
    if (rtl) {
      canvas.translate(s, 0);
      canvas.scale(-1, 1);
    }
    final base = face.bottom * s;
    canvas.translate(s / 2, base + bob);
    canvas.scale(sx, sy);
    canvas.translate(-s / 2, -base);

    final body = _body(s);
    final bounds = body.getBounds();
    if (f > 0) {
      // Lift it off its own colour with a soft shadow.
      canvas.drawPath(
        body.shift(Offset(0, s * 0.045)),
        Paint()
          ..color = _ink.withValues(alpha: 0.2 * f)
          ..maskFilter = MaskFilter.blur(BlurStyle.normal, s * 0.04),
      );
    }
    final tone = Color.lerp(color, Colors.white, 0.14 * f)!;
    canvas.drawPath(
      body,
      Paint()
        ..shader = LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color.lerp(tone, Colors.white, 0.2)!, tone, Color.lerp(tone, _ink, 0.08)!],
          stops: const [0, 0.55, 1],
        ).createShader(bounds),
    );
    if (f > 0) {
      canvas.drawPath(
        body,
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = math.max(1.4, s * 0.04)
          ..strokeJoin = StrokeJoin.round
          ..color = Colors.white.withValues(alpha: 0.95 * f),
      );
    }
    // Soft gloss highlight, top-start.
    canvas.save();
    canvas.clipPath(body);
    final g = Offset(face.gloss.dx * s, face.gloss.dy * s);
    canvas.translate(g.dx, g.dy);
    canvas.rotate(-0.55);
    canvas.drawOval(Rect.fromCenter(center: Offset.zero, width: s * 0.15, height: s * 0.075), Paint()..color = Colors.white.withValues(alpha: 0.38));
    canvas.restore();

    // Eyes.
    final l = Offset(face.left.dx * s, face.left.dy * s);
    final r = Offset(face.right.dx * s, face.right.dy * s);
    final er = face.r * s;
    final eyesOpen = (1 - h * 1.6).clamp(0.0, 1.0);
    if (eyesOpen > 0) {
      final o = open * eyesOpen;
      _eye(canvas, l, er, o, face.eye, line, tone, isRight: false);
      _eye(canvas, r, er, o, face.eye, line, tone, isRight: true, eyesOpen: eyesOpen);
    }
    if (h > 0.35) {
      final a = ((h - 0.35) / 0.5).clamp(0.0, 1.0);
      final p = Paint()
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round
        ..strokeWidth = line * 1.05
        ..color = _ink.withValues(alpha: a);
      final w = math.max(er, s * 0.075);
      for (final c in [l, r]) {
        canvas.drawPath(
          Path()
            ..moveTo(c.dx - w * 0.85, c.dy + w * 0.3)
            ..quadraticBezierTo(c.dx, c.dy - w * 0.95, c.dx + w * 0.85, c.dy + w * 0.3),
          p,
        );
      }
    }

    // Mouth: a small smile that opens up when happy.
    final m = Offset(face.mouth.dx * s, face.mouth.dy * s);
    final mw = face.mouthW * s * (0.62 + 0.38 * h);
    final depth = mw * (0.32 + 0.38 * h);
    final mouth = Path()
      ..moveTo(m.dx - mw / 2, m.dy - depth * 0.3)
      ..quadraticBezierTo(m.dx, m.dy + depth * 1.3, m.dx + mw / 2, m.dy - depth * 0.3);
    if (h > 0) {
      final filled = Path.from(mouth)
        ..quadraticBezierTo(m.dx, m.dy - depth * 0.05, m.dx - mw / 2, m.dy - depth * 0.3)
        ..close();
      canvas.drawPath(filled, Paint()..color = _ink.withValues(alpha: h));
    }
    canvas.drawPath(
      mouth,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round
        ..strokeJoin = StrokeJoin.round
        ..strokeWidth = line
        ..color = _ink,
    );
    canvas.restore();
  }

  void _eye(Canvas canvas, Offset c, double r, double open, _Eye style, double line, Color body, {required bool isRight, double eyesOpen = 1}) {
    final stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..strokeWidth = line
      ..color = _ink;
    // Wink: the end-side eye is a squeezed "<".
    if (style == _Eye.wink && isRight) {
      if (eyesOpen <= 0) return;
      stroke.color = _ink.withValues(alpha: eyesOpen);
      canvas.drawPath(
        Path()
          ..moveTo(c.dx + r * 0.65, c.dy - r * 0.65)
          ..lineTo(c.dx - r * 0.55, c.dy + r * 0.02)
          ..lineTo(c.dx + r * 0.65, c.dy + r * 0.65),
        stroke,
      );
      return;
    }
    final hScale = switch (style) {
      _Eye.oval => 1.55,
      _Eye.big => 1.08,
      _Eye.dot => 1.1,
      _ => 1.12,
    };
    final eh = r * hScale * open;
    if (eh < r * 0.2) {
      // Closed (mid-blink): a gentle downward curve.
      canvas.drawPath(
        Path()
          ..moveTo(c.dx - r * 0.8, c.dy)
          ..quadraticBezierTo(c.dx, c.dy + r * 0.45, c.dx + r * 0.8, c.dy),
        stroke,
      );
      return;
    }
    final look = Offset(-r * 0.3, r * 0.08);
    if (style == _Eye.dot || style == _Eye.oval) {
      // Ink-only eyes with a catchlight.
      canvas.drawOval(Rect.fromCenter(center: c, width: r * 2, height: eh * 2), Paint()..color = _ink);
      canvas.drawCircle(c + Offset(-r * 0.3, -eh * 0.4), r * 0.36, Paint()..color = Colors.white.withValues(alpha: 0.95));
      return;
    }
    final sclera = Rect.fromCenter(center: c, width: r * 2, height: eh * 2);
    canvas.save();
    canvas.clipPath(Path()..addOval(sclera));
    canvas.drawOval(sclera, Paint()..color = Colors.white);
    final pr = style == _Eye.big ? r * 0.6 : r * 0.58;
    final pc = c + look;
    canvas.drawCircle(pc, pr, Paint()..color = _ink);
    canvas.drawCircle(pc + Offset(-pr * 0.38, -pr * 0.4), pr * 0.34, Paint()..color = Colors.white);
    if (style == _Eye.big) canvas.drawCircle(pc + Offset(pr * 0.4, pr * 0.38), pr * 0.16, Paint()..color = Colors.white.withValues(alpha: 0.85));
    if (style == _Eye.sleepy) {
      // Heavy upper lid in a deeper body tone, with a lid line.
      final lidY = sclera.top + sclera.height * 0.48;
      canvas.drawRect(Rect.fromLTRB(sclera.left - 1, sclera.top - 1, sclera.right + 1, lidY), Paint()..color = Color.lerp(body, _ink, 0.12)!);
      canvas.drawLine(Offset(sclera.left - 1, lidY), Offset(sclera.right + 1, lidY), stroke..strokeWidth = line * 0.9);
    }
    canvas.restore();
  }

  @override
  bool shouldRepaint(_BlobPainter old) =>
      old.shape != shape || old.color != color || old.seed != seed || old.rtl != rtl || old.animate != animate || old.idle != idle;
}

/// An onboarding answer row with an optional blob character on the end side.
///
/// Tapping floods the row with the character's colour (a circular reveal from the
/// end side, 280ms easeOutCubic); the label turns white exactly where the colour
/// has reached it, and the character turns happy with a little bounce.
class ObChoiceTile extends StatefulWidget {
  const ObChoiceTile({
    super.key,
    required this.label,
    required this.selected,
    required this.onTap,
    this.character,
    this.color,
    this.leading,
    this.multi = false,
    this.index = 0,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  /// Blob character on the end side; null shows a check (round, or square when [multi]).
  final ObBlobShape? character;

  /// Fill colour; defaults to the character's palette colour or [AppPalette.accent].
  final Color? color;

  /// Optional start-side widget, e.g. an app icon or an icon in a rounded box.
  final Widget? leading;
  final bool multi;

  /// Position in the list; staggers the characters' idle blinks.
  final int index;

  @override
  State<ObChoiceTile> createState() => _ObChoiceTileState();
}

class _ObChoiceTileState extends State<ObChoiceTile> with TickerProviderStateMixin {
  static const _sweep = Duration(milliseconds: 280);
  static const _hPad = 14.0;
  static const _blobSize = 40.0;
  static const _checkSize = 22.0;

  late final AnimationController _fill = AnimationController(vsync: this, duration: _sweep, value: widget.selected ? 1 : 0);
  late final Animation<double> _t = CurvedAnimation(parent: _fill, curve: Curves.easeOutCubic, reverseCurve: Curves.easeOutCubic.flipped);
  late final AnimationController _press = AnimationController(vsync: this, lowerBound: -0.6, upperBound: 1, value: 0);
  final _tileKey = GlobalKey();
  bool _reduced = false;
  bool _focused = false;

  Color get _color => widget.color ?? (widget.character != null ? ObBlob.colorFor(widget.character!) : AppPalette.accent);
  double get _endWidth => widget.character != null ? _blobSize : _checkSize;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _reduced = _reducedMotion(context);
    if (_reduced) {
      _fill.value = widget.selected ? 1 : 0;
      _press.value = 0;
    }
  }

  @override
  void didUpdateWidget(ObChoiceTile old) {
    super.didUpdateWidget(old);
    if (old.selected != widget.selected) {
      if (_reduced) {
        _fill.value = widget.selected ? 1 : 0;
      } else {
        widget.selected ? _fill.forward() : _fill.reverse();
      }
    }
  }

  @override
  void dispose() {
    _fill.dispose();
    _press.dispose();
    super.dispose();
  }

  void _down() {
    if (_reduced) return;
    _press.animateTo(1, duration: const Duration(milliseconds: 80), curve: Curves.easeOut);
  }

  void _up() {
    if (_reduced) return;
    _press.animateWith(SpringSimulation(const SpringDescription(mass: 1, stiffness: 520, damping: 20), _press.value, 0, 0));
  }

  void _tap() {
    HapticFeedback.selectionClick();
    widget.onTap();
  }

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final dark = context.isDark;
    final dir = Directionality.of(context);
    final color = _color;
    final onColor = ObBlob.onColor(color);
    final style = AppText.rowTitle;
    final ch = widget.character;

    final baseStyle = DefaultTextStyle.of(context).style.merge(style);
    final label = Text(
      widget.label,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: baseStyle.copyWith(color: c.textPrimary),
    );
    // The on-colour copy is a RichText laid out exactly like [label], so finders
    // (and tests) still see a single "label" Text widget.
    final onLabel = RichText(
      text: TextSpan(
        text: widget.label,
        // Text applies the phone's "bold text" setting itself; RichText doesn't, so match it.
        style: baseStyle.copyWith(color: onColor, fontWeight: MediaQuery.boldTextOf(context) ? FontWeight.bold : null),
      ),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      textScaler: MediaQuery.textScalerOf(context),
      textDirection: dir,
    );

    final end = ch != null
        ? ObBlob(shape: ch, color: color, size: _blobSize, happy: widget.selected, onFill: widget.selected, seed: widget.index)
        : _Check(t: _t, multi: widget.multi, color: color, onColor: onColor, idle: c.textMuted);

    final tile = CustomPaint(
      key: _tileKey,
      painter: _TilePainter(
        t: _t,
        color: color,
        base: dark ? c.glassFill : Colors.white,
        border: c.glassBorder,
        focus: _focused,
        dir: dir,
        endCenter: _hPad + _endWidth / 2,
      ),
      child: ConstrainedBox(
        constraints: const BoxConstraints(minHeight: 58),
        child: Padding(
          padding: const EdgeInsetsDirectional.symmetric(horizontal: _hPad, vertical: 10),
          child: Row(
            children: [
              if (widget.leading != null) ...[widget.leading!, const SizedBox(width: 12)],
              Expanded(
                child: Stack(
                  children: [
                    label,
                    _SweepClip(t: _t, tileKey: _tileKey, dir: dir, endCenter: _hPad + _endWidth / 2, child: onLabel),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              end,
            ],
          ),
        ),
      ),
    );

    final shadowed = AnimatedBuilder(
      animation: _t,
      builder: (context, child) => DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppRadius.tile),
          boxShadow: [
            if (_t.value > 0)
              BoxShadow(
                color: color.withValues(alpha: (dark ? 0.4 : 0.3) * _t.value),
                blurRadius: 24,
                spreadRadius: -6,
                offset: const Offset(0, 9),
              ),
          ],
        ),
        child: child,
      ),
      child: tile,
    );

    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Semantics(
        button: true,
        selected: widget.selected,
        label: widget.label,
        onTap: _tap,
        excludeSemantics: true,
        child: FocusableActionDetector(
          mouseCursor: SystemMouseCursors.click,
          onShowFocusHighlight: (v) => setState(() => _focused = v),
          actions: {ActivateIntent: CallbackAction<ActivateIntent>(onInvoke: (_) => _tap())},
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTapDown: (_) => _down(),
            onTapUp: (_) => _up(),
            onTapCancel: _up,
            onTap: _tap,
            child: AnimatedBuilder(
              animation: _press,
              builder: (context, child) => Transform.scale(scale: 1 - 0.03 * _press.value, child: child),
              child: shadowed,
            ),
          ),
        ),
      ),
    );
  }
}

/// The reveal circle in tile coordinates: centred on the end-side widget and growing
/// until it covers the farthest corner.
(Offset, double) _sweepCircle(Size tile, TextDirection dir, double endCenter, double t) {
  final cx = dir == TextDirection.rtl ? endCenter : tile.width - endCenter;
  final center = Offset(cx, tile.height / 2);
  final far = math.max(cx, tile.width - cx);
  final maxR = math.sqrt(far * far + tile.height * tile.height / 4) + 2;
  return (center, maxR * t);
}

class _TilePainter extends CustomPainter {
  _TilePainter({
    required this.t,
    required this.color,
    required this.base,
    required this.border,
    required this.focus,
    required this.dir,
    required this.endCenter,
  }) : super(repaint: t);

  final Animation<double> t;
  final Color color, base, border;
  final bool focus;
  final TextDirection dir;
  final double endCenter;

  @override
  void paint(Canvas canvas, Size size) {
    final v = t.value.clamp(0.0, 1.0);
    final rr = RRect.fromRectAndRadius(Offset.zero & size, const Radius.circular(AppRadius.tile));
    canvas.drawRRect(rr, Paint()..color = base);
    if (v > 0) {
      canvas.save();
      canvas.clipRRect(rr);
      if (v >= 1) {
        canvas.drawRect(Offset.zero & size, Paint()..color = color);
      } else {
        final (center, radius) = _sweepCircle(size, dir, endCenter, v);
        canvas.drawCircle(center, radius, Paint()..color = color);
      }
      canvas.restore();
    }
    canvas.drawRRect(
      rr.deflate(0.5),
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1
        ..color = Color.lerp(border, color, v)!,
    );
    if (focus) {
      canvas.drawRRect(
        rr.inflate(3),
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2
          ..color = AppPalette.accent,
      );
    }
  }

  @override
  bool shouldRepaint(_TilePainter old) =>
      old.t != t || old.color != color || old.base != base || old.border != border || old.focus != focus || old.dir != dir || old.endCenter != endCenter;
}

/// Clips its child to the part of the tile the reveal circle has covered, so the
/// on-colour label shows exactly where the fill has reached it.
class _SweepClip extends SingleChildRenderObjectWidget {
  const _SweepClip({required this.t, required this.tileKey, required this.dir, required this.endCenter, super.child});

  final Animation<double> t;
  final GlobalKey tileKey;
  final TextDirection dir;
  final double endCenter;

  @override
  _RenderSweepClip createRenderObject(BuildContext context) => _RenderSweepClip(t, tileKey, dir, endCenter);

  @override
  void updateRenderObject(BuildContext context, _RenderSweepClip r) {
    r
      ..t = t
      ..tileKey = tileKey
      ..dir = dir
      ..endCenter = endCenter;
  }
}

class _RenderSweepClip extends RenderProxyBox {
  _RenderSweepClip(this._t, this.tileKey, this._dir, this._endCenter);

  Animation<double> _t;
  GlobalKey tileKey;
  TextDirection _dir;
  double _endCenter;

  set t(Animation<double> v) {
    if (v == _t) return;
    if (attached) {
      _t.removeListener(markNeedsPaint);
      v.addListener(markNeedsPaint);
    }
    _t = v;
    markNeedsPaint();
  }

  set dir(TextDirection v) {
    if (v == _dir) return;
    _dir = v;
    markNeedsPaint();
  }

  set endCenter(double v) {
    if (v == _endCenter) return;
    _endCenter = v;
    markNeedsPaint();
  }

  @override
  void attach(PipelineOwner owner) {
    super.attach(owner);
    _t.addListener(markNeedsPaint);
  }

  @override
  void detach() {
    _t.removeListener(markNeedsPaint);
    super.detach();
  }

  @override
  bool hitTest(BoxHitTestResult result, {required Offset position}) => false;

  @override
  void paint(PaintingContext context, Offset offset) {
    final v = _t.value.clamp(0.0, 1.0);
    if (child == null || v <= 0) {
      layer = null;
      return;
    }
    if (v >= 1) {
      layer = null;
      context.paintChild(child!, offset);
      return;
    }
    final tile = tileKey.currentContext?.findRenderObject();
    if (tile is! RenderBox || !tile.hasSize) {
      layer = null;
      return;
    }
    final origin = MatrixUtils.transformPoint(getTransformTo(tile), Offset.zero);
    final (center, radius) = _sweepCircle(tile.size, _dir, _endCenter, v);
    final clip = Path()..addOval(Rect.fromCircle(center: center - origin, radius: radius));
    layer = context.pushClipPath(needsCompositing, offset, Offset.zero & size, clip, super.paint, oldLayer: layer as ClipPathLayer?);
  }
}

/// Round (single) or square (multi) check, filled white on the coloured row.
class _Check extends StatelessWidget {
  const _Check({required this.t, required this.multi, required this.color, required this.onColor, required this.idle});

  final Animation<double> t;
  final bool multi;
  final Color color, onColor, idle;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: t,
      builder: (context, _) {
        final v = t.value.clamp(0.0, 1.0);
        return Container(
          width: 22,
          height: 22,
          decoration: BoxDecoration(
            shape: multi ? BoxShape.rectangle : BoxShape.circle,
            borderRadius: multi ? BorderRadius.circular(6) : null,
            color: onColor.withValues(alpha: v),
            border: Border.all(color: Color.lerp(idle, onColor, v)!, width: 1.5),
          ),
          child: v <= 0
              ? null
              : Transform.scale(
                  scale: 0.6 + 0.4 * v,
                  child: Icon(Icons.check_rounded, size: 15, color: color.withValues(alpha: v)),
                ),
        );
      },
    );
  }
}
