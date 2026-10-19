import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../../../utils/app_theme.dart';
import '../../../utils/l10n.dart';

// "Track Your Progress" hero: a phone showing Pausey's weekly focus chart and
// stats, with floating cards around it (this week's bars, score, day streak),
// a rising progress line ending in "Keep going!" and three rings on the right
// (focus, goals, productivity).
//
// Motion: everything rises in, the bars grow, the line draws itself and its
// points pop, the rings fill; then the cards float gently.

const _w = 400.0, _h = 340.0;

double _ease(double t, double from, double len, [Curve curve = Curves.easeOutCubic]) =>
    curve.transform(((t - from) / len).clamp(0.0, 1.0));

class Ob4ProgressHero extends StatefulWidget {
  const Ob4ProgressHero({super.key, this.width = _w});
  final double width;

  static double heightFor(double width) => width * _h / _w;

  @override
  State<Ob4ProgressHero> createState() => _Ob4ProgressHeroState();
}

class _Ob4ProgressHeroState extends State<Ob4ProgressHero> with SingleTickerProviderStateMixin {
  late final Ticker _ticker = createTicker((e) => _clock.value = e.inMicroseconds / 1e6);
  final ValueNotifier<double> _clock = ValueNotifier(0);

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (MediaQuery.maybeDisableAnimationsOf(context) ?? false) {
      if (_ticker.isActive) _ticker.stop();
      _clock.value = 6; // finished, still
    } else if (!_ticker.isActive) {
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
    final l = context.l10n;
    final c = context.colors;
    final ink = dark ? Colors.white : c.textPrimary;
    final muted = dark ? const Color(0xFFA9A3D6) : const Color(0xFF6E6A93);
    // Monday-first one-letter day names in the phone's language.
    final nd = MaterialLocalizations.of(context).narrowWeekdays;
    final days = [for (var i = 1; i <= 7; i++) nd[i % 7]];

    return ExcludeSemantics(
      child: SizedBox(
        width: widget.width,
        height: Ob4ProgressHero.heightFor(widget.width),
        child: FittedBox(
          child: SizedBox(
            width: _w,
            height: _h,
            child: ValueListenableBuilder<double>(
              valueListenable: _clock,
              builder: (context, t, _) {
                // Fade + rise in, one after another; then a gentle float.
                Widget part(int i, Rect r, Widget child, {double delay = 0, bool float = true}) {
                  final a = _ease(t, delay, 0.6);
                  final dy = (1 - a) * 14 + (float ? math.sin(t * math.pi * 2 / 4.4 + i * 1.3) * 2.6 * a : 0);
                  return Positioned.fromRect(
                    rect: r.shift(Offset(0, dy)),
                    child: Opacity(opacity: a, child: child),
                  );
                }

                return Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned.fill(child: CustomPaint(painter: _BackPainter(t: t, dark: dark))),
                    // This week.
                    part(
                      0,
                      const Rect.fromLTWH(88, 22, 120, 76),
                      _Card(
                        dark: dark,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 8, 10, 6),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: FittedBox(
                                      fit: BoxFit.scaleDown,
                                      alignment: AlignmentDirectional.centerStart,
                                      child: Text(l.profileThisWeek, style: TextStyle(fontFamily: AppText.fontFamily, fontSize: 9, fontWeight: FontWeight.w800, color: ink)),
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                                    decoration: BoxDecoration(color: const Color(0xFF2DD4BF).withValues(alpha: 0.18), borderRadius: BorderRadius.circular(6)),
                                    child: const Text('↑ 14%', style: TextStyle(fontFamily: AppText.fontFamily, fontSize: 7, fontWeight: FontWeight.w800, color: Color(0xFF14A38B))),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 4),
                              Expanded(child: _Bars(values: const [0.55, 0.38, 0.72, 0.45, 0.85, 0.58, 1], grow: _ease(t, 0.5, 0.9), days: days, muted: muted, dark: dark, barWidth: 8)),
                            ],
                          ),
                        ),
                      ),
                      delay: 0.15,
                    ),
                    // Score.
                    part(
                      1,
                      const Rect.fromLTWH(24, 134, 96, 58),
                      _Card(
                        dark: dark,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 7, 10, 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text('${(94 * _ease(t, 0.5, 1.2)).round()}',
                                              style: const TextStyle(fontFamily: AppText.fontFamily, fontSize: 17, fontWeight: FontWeight.w900, height: 1, color: Color(0xFF4F46E5))),
                                          FittedBox(
                                            fit: BoxFit.scaleDown,
                                            child: Text(l.ob4ArtScore, style: TextStyle(fontFamily: AppText.fontFamily, fontSize: 8, fontWeight: FontWeight.w600, color: muted)),
                                          ),
                                        ],
                                      ),
                                    ),
                                    _MiniBars(grow: _ease(t, 0.6, 0.8), colors: const [Color(0xFFC9BCFF), Color(0xFFB3A2FF), Color(0xFF9F8CFF), Color(0xFF8B7BFF)]),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 4),
                              _Progress(value: 0.72 * _ease(t, 0.6, 1.0), color: const Color(0xFF8B7BFF), dark: dark),
                            ],
                          ),
                        ),
                      ),
                      delay: 0.25,
                    ),
                    // Day streak.
                    part(
                      2,
                      const Rect.fromLTWH(44, 228, 80, 56),
                      _Card(
                        dark: dark,
                        tint: const Color(0xFFFFB020),
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
                                  child: const Icon(Icons.local_fire_department_rounded, size: 20, color: Colors.white),
                                ),
                                Text('7', style: TextStyle(fontFamily: AppText.fontFamily, fontSize: 17, fontWeight: FontWeight.w900, height: 1, color: ink)),
                              ],
                            ),
                            const SizedBox(height: 2),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 6),
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(l.ob3RingStreak, style: TextStyle(fontFamily: AppText.fontFamily, fontSize: 8.5, fontWeight: FontWeight.w600, color: muted)),
                              ),
                            ),
                          ],
                        ),
                      ),
                      delay: 0.35,
                    ),
                    // Phone.
                    part(
                      3,
                      const Rect.fromLTWH(136, 100, 128, 238),
                      _Phone(t: t, dark: dark, days: days, ink: ink, muted: muted),
                      float: false,
                    ),
                    // "Keep going!"
                    part(
                      4,
                      const Rect.fromLTWH(250, 8, 82, 26),
                      Transform.scale(
                        scale: 0.6 + 0.4 * _ease(t, 1.4, 0.5, Curves.easeOutBack),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(13),
                            color: (dark ? const Color(0xFF2A2458) : const Color(0xFFEDE8FF)).withValues(alpha: dark ? 0.75 : 0.85),
                            border: Border.all(color: AppPalette.violet.withValues(alpha: 0.25)),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          alignment: Alignment.center,
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text('${l.homeKeepGoing}!',
                                    style: TextStyle(fontFamily: AppText.fontFamily, fontSize: 9, fontWeight: FontWeight.w800, color: dark ? const Color(0xFFC6B8FF) : const Color(0xFF5B3FE0))),
                                const SizedBox(width: 3),
                                Icon(Icons.auto_awesome_rounded, size: 11, color: dark ? const Color(0xFFC6B8FF) : const Color(0xFF5B3FE0)),
                              ],
                            ),
                          ),
                        ),
                      ),
                      delay: 1.3,
                      float: false,
                    ),
                    // Rings.
                    for (final (i, r) in [
                      (85, l.ob1BookFocus, const [Color(0xFF8B7BFF), Color(0xFF5B6CFF)], Icons.psychology_rounded, 122.0),
                      (72, l.ob4Goals, const [Color(0xFF2DD4BF), Color(0xFF14A3B8)], Icons.track_changes_rounded, 204.0),
                      (94, l.ob4ArtProductivity, const [Color(0xFFFFB020), Color(0xFFFF8A00)], Icons.bar_chart_rounded, 286.0),
                    ].indexed)
                      part(
                        5 + i,
                        Rect.fromCenter(center: Offset(326, r.$5), width: 88, height: 80),
                        _Ring(
                          value: r.$1,
                          label: r.$2,
                          colors: r.$3,
                          icon: r.$4,
                          fill: _ease(t, 0.6 + i * 0.15, 1.1),
                          dark: dark,
                          ink: ink,
                          muted: muted,
                        ),
                        delay: 0.3 + i * 0.12,
                      ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

/// Soft glow, sparkles, dots, the rising progress line with its points, and dashed links.
class _BackPainter extends CustomPainter {
  _BackPainter({required this.t, required this.dark});
  final double t;
  final bool dark;

  static const _points = [Offset(64, 134), Offset(78, 126), Offset(118, 110), Offset(176, 104), Offset(231, 75), Offset(258, 66), Offset(284, 50), Offset(320, 58), Offset(356, 72)];
  static const _nodes = [1, 2, 4, 6];

  @override
  void paint(Canvas canvas, Size size) {
    const c = Offset(_w / 2, _h / 2 + 10);
    canvas.drawCircle(
      c,
      190,
      Paint()
        ..shader = RadialGradient(colors: [
          AppPalette.violet.withValues(alpha: dark ? 0.22 : 0.18),
          AppPalette.violet.withValues(alpha: 0),
        ]).createShader(Rect.fromCircle(center: c, radius: 190)),
    );

    // Rising line (smooth through the points), drawn in from the left.
    final path = Path()..moveTo(_points.first.dx, _points.first.dy);
    for (var i = 1; i < _points.length; i++) {
      final p0 = _points[i - 1], p1 = _points[i];
      final mid = Offset((p0.dx + p1.dx) / 2, (p0.dy + p1.dy) / 2);
      path.quadraticBezierTo(p0.dx, p0.dy, mid.dx, mid.dy);
    }
    path.lineTo(_points.last.dx, _points.last.dy);
    final draw = _ease(t, 0.7, 1.2, Curves.easeInOut);
    final line = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.6
      ..strokeCap = StrokeCap.round
      ..shader = const LinearGradient(colors: [Color(0xFF9F8CFF), Color(0xFF7C5CFF), Color(0xFFB9A8FF)]).createShader(const Rect.fromLTWH(60, 40, 300, 100));
    for (final m in path.computeMetrics()) {
      canvas.drawPath(m.extractPath(0, m.length * draw), line);
    }

    // Very light dashed links down to the phone and the rings.
    final dash = Paint()
      ..strokeWidth = 1.1
      ..strokeCap = StrokeCap.round
      ..color = AppPalette.violet.withValues(alpha: (dark ? 0.25 : 0.30) * _ease(t, 1.5, 0.6));
    void dashed(Offset a, Offset b) {
      final d = (b - a).distance, dir = (b - a) / d;
      for (var s = 0.0; s < d; s += 6) {
        canvas.drawLine(a + dir * s, a + dir * math.min(s + 3, d), dash);
      }
    }

    dashed(const Offset(231, 79), const Offset(231, 100));
    dashed(const Offset(284, 54), const Offset(284, 96));

    // Points pop in as the line reaches them.
    for (final (i, n) in _nodes.indexed) {
      final p = _points[n];
      final pop = _ease(t, 0.8 + i * 0.25, 0.4, Curves.easeOutBack);
      if (pop <= 0) continue;
      canvas.drawCircle(p, 7 * pop, Paint()..color = AppPalette.violet.withValues(alpha: 0.18));
      canvas.drawCircle(p, 5 * pop, Paint()..color = const Color(0xFF7C5CFF));
      canvas.drawCircle(p, 2.4 * pop, Paint()..color = Colors.white);
    }

    // Sparkles and dots.
    final tw = 0.6 + 0.4 * math.sin(t * 2.2);
    for (final (p, s, col) in const [
      (Offset(58, 72), 7.0, Color(0xFFB9A8FF)),
      (Offset(46, 210), 6.0, Color(0xFF9F8CFF)),
      (Offset(124, 216), 5.0, Color(0xFFC6B8FF)),
      (Offset(286, 248), 6.0, Color(0xFF2DD4BF)),
      (Offset(276, 314), 5.0, Color(0xFFB9A8FF)),
    ]) {
      _sparkle(canvas, p, s * (0.85 + 0.15 * tw), col.withValues(alpha: 0.75 * tw + 0.15));
    }
    for (final (p, r, col) in const [
      (Offset(66, 40), 2.6, Color(0xFF8FA6FF)),
      (Offset(228, 41), 3.4, Color(0xFFFFB020)),
      (Offset(340, 50), 3.0, Color(0xFF2DD4BF)),
      (Offset(130, 134), 3.0, Color(0xFF2DD4BF)),
      (Offset(122, 204), 3.4, Color(0xFFFFB020)),
      (Offset(75, 222), 2.6, Color(0xFFFFB020)),
      (Offset(34, 282), 3.0, Color(0xFF2DD4BF)),
      (Offset(116, 302), 3.0, Color(0xFF8FA6FF)),
      (Offset(272, 274), 3.0, Color(0xFFFFB020)),
      (Offset(275, 148), 3.0, Color(0xFF2DD4BF)),
    ]) {
      canvas.drawCircle(p, r, Paint()..color = col.withValues(alpha: dark ? 0.7 : 0.8));
    }
  }

  void _sparkle(Canvas canvas, Offset c, double s, Color color) {
    final p = Path()
      ..moveTo(c.dx, c.dy - s)
      ..quadraticBezierTo(c.dx, c.dy, c.dx + s, c.dy)
      ..quadraticBezierTo(c.dx, c.dy, c.dx, c.dy + s)
      ..quadraticBezierTo(c.dx, c.dy, c.dx - s, c.dy)
      ..quadraticBezierTo(c.dx, c.dy, c.dx, c.dy - s)
      ..close();
    canvas.drawPath(p, Paint()..color = color);
  }

  @override
  bool shouldRepaint(_BackPainter old) => old.t != t || old.dark != dark;
}

/// Frosted, see-through card (optionally tinted).
class _Card extends StatelessWidget {
  const _Card({required this.dark, required this.child, this.tint});
  final bool dark;
  final Widget child;
  final Color? tint;

  @override
  Widget build(BuildContext context) {
    final base = dark ? const Color(0xFF26214F) : Colors.white;
    final top = tint == null ? base : Color.lerp(base, tint, dark ? 0.12 : 0.10)!;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [top.withValues(alpha: dark ? 0.62 : 0.66), base.withValues(alpha: dark ? 0.45 : 0.48)],
        ),
        border: Border.all(color: (tint ?? (dark ? Colors.white : Colors.white)).withValues(alpha: dark ? 0.10 : (tint == null ? 0.85 : 0.35))),
        boxShadow: [BoxShadow(color: AppPalette.accent.withValues(alpha: dark ? 0.22 : 0.10), blurRadius: 14, offset: const Offset(0, 5))],
      ),
      child: child,
    );
  }
}

/// Weekly bars with day letters; the last (today) is the strong one.
class _Bars extends StatelessWidget {
  const _Bars({required this.values, required this.grow, required this.days, required this.muted, required this.dark, required this.barWidth});
  final List<double> values;
  final double grow;
  final List<String> days;
  final Color muted;
  final bool dark;
  final double barWidth;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        for (var i = 0; i < values.length; i++)
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: FractionallySizedBox(
                    heightFactor: (values[i] * grow).clamp(0.02, 1.0),
                    child: Container(
                      width: barWidth,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2.5),
                        color: i == values.length - 1 ? const Color(0xFF6D4FF2) : const Color(0xFFB9A8FF).withValues(alpha: dark ? 0.55 : 0.6),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 2),
              Text(days[i], style: TextStyle(fontFamily: AppText.fontFamily, fontSize: 5.5, fontWeight: FontWeight.w600, height: 1, color: muted)),
            ],
          ),
      ],
    );
  }
}

/// Four rising bars (score card).
class _MiniBars extends StatelessWidget {
  const _MiniBars({required this.grow, required this.colors});
  final double grow;
  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    const hs = [10.0, 15.0, 20.0, 27.0];
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        for (var i = 0; i < 4; i++)
          Container(
            width: 5,
            height: math.max(1, hs[i] * grow),
            margin: const EdgeInsets.symmetric(horizontal: 1.2),
            decoration: BoxDecoration(color: colors[i], borderRadius: BorderRadius.circular(2)),
          ),
      ],
    );
  }
}

/// Rounded progress bar on a light track.
class _Progress extends StatelessWidget {
  const _Progress({required this.value, required this.color, required this.dark, this.height = 4});
  final double value;
  final Color color;
  final bool dark;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(color: (dark ? Colors.white : const Color(0xFF6E6A93)).withValues(alpha: dark ? 0.10 : 0.10), borderRadius: BorderRadius.circular(height)),
      alignment: AlignmentDirectional.centerStart,
      child: FractionallySizedBox(
        widthFactor: value.clamp(0.0, 1.0),
        child: Container(decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(height))),
      ),
    );
  }
}

/// A progress ring with value, label and a small icon badge.
class _Ring extends StatelessWidget {
  const _Ring({required this.value, required this.label, required this.colors, required this.icon, required this.fill, required this.dark, required this.ink, required this.muted});
  final int value;
  final String label;
  final List<Color> colors;
  final IconData icon;
  final double fill;
  final bool dark;
  final Color ink, muted;

  @override
  Widget build(BuildContext context) {
    const d = 70.0;
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          width: d,
          height: d,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: (dark ? const Color(0xFF26214F) : Colors.white).withValues(alpha: dark ? 0.6 : 0.62),
            boxShadow: [BoxShadow(color: colors.first.withValues(alpha: dark ? 0.25 : 0.18), blurRadius: 14)],
          ),
          child: CustomPaint(
            painter: _RingPainter(fraction: value / 100 * fill, colors: colors, dark: dark),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('${(value * fill).round()}%', style: TextStyle(fontFamily: AppText.fontFamily, fontSize: 14, fontWeight: FontWeight.w900, height: 1, color: ink)),
                      const SizedBox(height: 2),
                      Text(label, style: TextStyle(fontFamily: AppText.fontFamily, fontSize: 7.5, fontWeight: FontWeight.w600, color: muted)),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        // Icon badge at the top-right.
        PositionedDirectional(
          top: 0,
          end: 0,
          child: Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: (dark ? const Color(0xFF2A2458) : Colors.white).withValues(alpha: 0.9),
              boxShadow: [BoxShadow(color: colors.first.withValues(alpha: 0.25), blurRadius: 8)],
            ),
            alignment: Alignment.center,
            child: Icon(icon, size: 14, color: colors.last),
          ),
        ),
      ],
    );
  }
}

class _RingPainter extends CustomPainter {
  _RingPainter({required this.fraction, required this.colors, required this.dark});
  final double fraction;
  final List<Color> colors;
  final bool dark;

  @override
  void paint(Canvas canvas, Size size) {
    final c = size.center(Offset.zero);
    final r = size.width / 2 - 7;
    final rect = Rect.fromCircle(center: c, radius: r);
    canvas.drawCircle(
      c,
      r,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 6
        ..color = colors.first.withValues(alpha: dark ? 0.18 : 0.14),
    );
    if (fraction <= 0) return;
    canvas.drawArc(
      rect,
      -math.pi / 2,
      math.pi * 2 * fraction,
      false,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 6
        ..strokeCap = StrokeCap.round
        ..shader = SweepGradient(
          startAngle: 0,
          endAngle: math.pi * 2,
          transform: const GradientRotation(-math.pi / 2),
          colors: [colors.first, colors.last, colors.first],
        ).createShader(rect),
    );
  }

  @override
  bool shouldRepaint(_RingPainter old) => old.fraction != fraction || old.dark != dark;
}

/// The phone: Pausey's weekly focus view.
class _Phone extends StatelessWidget {
  const _Phone({required this.t, required this.dark, required this.days, required this.ink, required this.muted});
  final double t;
  final bool dark;
  final List<String> days;
  final Color ink, muted;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final screen = dark ? const Color(0xFF17142F) : const Color(0xFFFAF9FF);
    final line = (dark ? Colors.white : const Color(0xFF6E6A93)).withValues(alpha: 0.08);
    TextStyle s(double size, {FontWeight w = FontWeight.w700, Color? color}) =>
        TextStyle(fontFamily: AppText.fontFamily, fontSize: size, fontWeight: w, height: 1.1, color: color ?? ink);

    Widget row(IconData icon, Color color, String label, String value, double v, double delay) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Row(
            children: [
              Icon(icon, size: 13, color: color),
              const SizedBox(width: 6),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        Expanded(child: FittedBox(fit: BoxFit.scaleDown, alignment: AlignmentDirectional.centerStart, child: Text(label, style: s(6.5)))),
                        const SizedBox(width: 3),
                        Text(value, style: s(6.5, w: FontWeight.w600)),
                      ],
                    ),
                    const SizedBox(height: 3),
                    _Progress(value: v * _ease(t, delay, 0.9), color: color, dark: dark, height: 3.5),
                  ],
                ),
              ),
            ],
          ),
        );

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        color: screen,
        border: Border.all(color: dark ? const Color(0xFF5B4FB0) : const Color(0xFFC9BCFF), width: 3.5),
        boxShadow: [BoxShadow(color: AppPalette.accent.withValues(alpha: dark ? 0.35 : 0.22), blurRadius: 22, offset: const Offset(0, 8))],
      ),
      padding: const EdgeInsets.fromLTRB(9, 6, 9, 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(child: Container(width: 26, height: 5, decoration: BoxDecoration(color: (dark ? Colors.white : const Color(0xFF6E6A93)).withValues(alpha: 0.25), borderRadius: BorderRadius.circular(3)))),
          const SizedBox(height: 8),
          Row(
            children: [
              const Expanded(child: Text('Pausey', style: TextStyle(fontFamily: AppText.fontFamily, fontSize: 11, fontWeight: FontWeight.w900, color: Color(0xFF6D4FF2)))),
              Icon(Icons.more_vert_rounded, size: 11, color: ink),
            ],
          ),
          const SizedBox(height: 6),
          // Day / Week / Month.
          Container(
            height: 15,
            padding: const EdgeInsets.all(1.5),
            decoration: BoxDecoration(color: (dark ? Colors.white : const Color(0xFF6E6A93)).withValues(alpha: 0.08), borderRadius: BorderRadius.circular(8)),
            child: Row(
              children: [
                for (final (i, label) in [l.insightsToday, l.insightsWeek, l.insightsMonth].indexed)
                  Expanded(
                    child: Container(
                      decoration: i == 1 ? BoxDecoration(color: const Color(0xFF7C5CFF), borderRadius: BorderRadius.circular(7)) : null,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(horizontal: 2),
                      child: FittedBox(fit: BoxFit.scaleDown, child: Text(label, style: s(5.5, w: FontWeight.w600, color: i == 1 ? Colors.white : muted))),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 7),
          Row(
            children: [
              Expanded(child: FittedBox(fit: BoxFit.scaleDown, alignment: AlignmentDirectional.centerStart, child: Text(l.insightsFocusHours, style: s(7)))),
              Text(l.insightsThisWeek, style: s(5.5, w: FontWeight.w500, color: muted)),
            ],
          ),
          const SizedBox(height: 4),
          SizedBox(
            height: 42,
            child: _Bars(values: const [0.42, 0.66, 0.52, 0.8, 0.62, 0.76, 1], grow: _ease(t, 0.55, 0.9), days: days, muted: muted, dark: dark, barWidth: 8.5),
          ),
          const SizedBox(height: 5),
          Container(height: 1, color: line),
          row(Icons.schedule_rounded, const Color(0xFF2DD4BF), l.insightsScreenTime, '2h 24m', 0.6, 0.7),
          Container(height: 1, color: line),
          row(Icons.track_changes_rounded, const Color(0xFF7C5CFF), l.insightsFocusHours, '5h 16m', 0.68, 0.8),
          Container(height: 1, color: line),
          row(Icons.flag_rounded, const Color(0xFF4F7BFF), l.insightsGoals, '3/4', 0.75, 0.9),
          const Spacer(),
          Container(height: 1, color: line),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Icon(Icons.home_rounded, size: 13, color: Color(0xFF6D4FF2)),
              Icon(Icons.bar_chart_rounded, size: 13, color: muted),
              Icon(Icons.person_outline_rounded, size: 13, color: muted),
            ],
          ),
          const SizedBox(height: 5),
          Center(child: Container(width: 40, height: 2.5, decoration: BoxDecoration(color: (dark ? Colors.white : const Color(0xFF6E6A93)).withValues(alpha: 0.3), borderRadius: BorderRadius.circular(2)))),
        ],
      ),
    );
  }
}
