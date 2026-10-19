import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../../../utils/app_theme.dart';
import '../onboarding_state.dart';

// Top illustration of "Lose track of time?": a big clock whose hands keep
// running, a phone tilted behind it, swoosh rings around them and app icons
// gently floating on the sides. The minute hand runs faster for "All the time"
// and slower for "Rarely". Animations off: one still frame.

const _tau = math.pi * 2;

class ObClockHero extends StatefulWidget {
  const ObClockHero({super.key, this.answer});
  final ObRelate? answer;

  @override
  State<ObClockHero> createState() => _ObClockHeroState();
}

class _ObClockHeroState extends State<ObClockHero> with SingleTickerProviderStateMixin {
  late final Ticker _ticker = createTicker(_tick);
  final ValueNotifier<double> _t = ValueNotifier(0); // seconds of animation
  final ValueNotifier<double> _hands = ValueNotifier(0); // clock time, in minutes
  Duration _last = Duration.zero;
  double _speed = 1; // eased towards the answer's speed

  double get _target => switch (widget.answer) {
        ObRelate.often => 2.4,
        ObRelate.rarely => 0.45,
        _ => 1.0,
      };

  void _tick(Duration elapsed) {
    final dt = ((elapsed - _last).inMicroseconds / 1e6).clamp(0.0, 0.1);
    _last = elapsed;
    _speed += (_target - _speed) * math.min(1, dt * 3);
    _t.value += dt;
    // 1x = the minute hand goes round once every 8 seconds.
    _hands.value += dt * 60 / 8 * _speed;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (MediaQuery.maybeDisableAnimationsOf(context) ?? false) {
      if (_ticker.isActive) _ticker.stop();
      _t.value = 1.2;
      _hands.value = 10 * 60 + 8; // 10:08
    } else if (!_ticker.isActive) {
      if (_hands.value == 0) _hands.value = 10 * 60 + 8;
      _last = Duration.zero;
      _ticker.start();
    }
  }

  @override
  void dispose() {
    _ticker.dispose();
    _t.dispose();
    _hands.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final dark = context.isDark;
    final screenH = MediaQuery.sizeOf(context).height;
    final h = (screenH * 0.29).clamp(190.0, 260.0);
    return ExcludeSemantics(
      child: LayoutBuilder(
        builder: (context, box) {
          final w = math.min(box.maxWidth, 400.0);
          final k = math.min(w / 400, h / 260);
          return Center(
            child: _Entrance(
              child: SizedBox(
                width: w,
                height: h,
                child: ValueListenableBuilder<double>(
                  valueListenable: _t,
                  builder: (context, t, _) {
                    final c = Offset(w * 0.52, h * 0.55);
                    final clockR = 66 * k;
                    Offset bob(int i, [double amp = 5]) => Offset(math.sin(t * _tau / 4.2 + i * 1.3) * 1.5 * k, math.cos(t * _tau / 3.6 + i * 1.9) * amp * k);
                    Widget tile(int i, Offset at, double size, Widget child) {
                      final p = at + bob(i);
                      return Positioned(left: p.dx - size / 2, top: p.dy - size / 2, width: size, height: size, child: child);
                    }

                    final ts = 38 * k;
                    return Stack(
                      clipBehavior: Clip.none,
                      children: [
                        // Soft glow and the swoosh rings.
                        Positioned.fill(child: CustomPaint(painter: _BackdropPainter(center: c, k: k, t: t, dark: dark))),
                        // Phone tilted behind the clock (left).
                        Positioned(
                          left: c.dx - 140 * k,
                          top: c.dy - 108 * k + bob(9, 3).dy,
                          child: Transform.rotate(angle: -0.20, child: _Phone(k: k, dark: dark)),
                        ),
                        // Floating app icons around.
                        tile(0, Offset(c.dx - 6 * k, c.dy - 96 * k), ts, _IconTile(icon: Icons.favorite_rounded, bg: const Color(0xFFFF6B81), fg: Colors.white, dark: dark)),
                        tile(1, Offset(c.dx + 92 * k, c.dy - 92 * k), ts, _IconTile(icon: Icons.notifications_rounded, bg: AppPalette.violet, fg: Colors.white, dark: dark, badge: true)),
                        tile(2, Offset(c.dx + 152 * k, c.dy - 42 * k), ts * 0.92, _IconTile(icon: Icons.chat_bubble_rounded, bg: Colors.white, fg: AppPalette.accent, dark: dark)),
                        tile(3, Offset(c.dx + 118 * k, c.dy + 44 * k), ts, _IconTile(icon: Icons.sms_rounded, bg: const Color(0xFF2ECC8F), fg: Colors.white, dark: dark)),
                        tile(4, Offset(c.dx - 150 * k, c.dy + 38 * k), ts * 0.9, _IconTile(icon: Icons.more_horiz_rounded, bg: Colors.white, fg: AppPalette.violet, dark: dark)),
                        tile(5, Offset(c.dx - 92 * k, c.dy + 86 * k), ts * 0.88, _IconTile(icon: Icons.play_arrow_rounded, bg: Colors.white, fg: AppPalette.accent, dark: dark)),
                        // The clock.
                        Positioned(
                          left: c.dx - clockR,
                          top: c.dy - clockR + bob(7, 2.5).dy,
                          width: clockR * 2,
                          height: clockR * 2,
                          child: ValueListenableBuilder<double>(
                            valueListenable: _hands,
                            builder: (context, minutes, _) => CustomPaint(painter: _ClockPainter(minutes: minutes, dark: dark)),
                          ),
                        ),
                        // A few sparkle dots.
                        for (final (i, (dx, dy, r)) in const [(-170.0, -60.0, 3.0), (176.0, 70.0, 3.5), (-30.0, -118.0, 2.5), (58.0, 108.0, 3.0)].indexed)
                          Positioned(
                            left: c.dx + dx * k - r * k,
                            top: c.dy + dy * k - r * k + bob(20 + i, 3).dy,
                            child: Opacity(
                              opacity: 0.45 + 0.35 * (0.5 + 0.5 * math.sin(t * _tau / 2.6 + i)),
                              child: Container(
                                width: r * 2 * k,
                                height: r * 2 * k,
                                decoration: const BoxDecoration(shape: BoxShape.circle, color: AppPalette.violet),
                              ),
                            ),
                          ),
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

class _BackdropPainter extends CustomPainter {
  _BackdropPainter({required this.center, required this.k, required this.t, required this.dark});
  final Offset center;
  final double k, t;
  final bool dark;

  @override
  void paint(Canvas canvas, Size size) {
    // Glow behind everything.
    final glowR = 170 * k;
    canvas.drawCircle(
      center,
      glowR,
      Paint()
        ..shader = RadialGradient(colors: [
          AppPalette.violet.withValues(alpha: dark ? 0.22 : 0.20),
          AppPalette.violet.withValues(alpha: 0),
        ]).createShader(Rect.fromCircle(center: center, radius: glowR)),
    );
    // Two tilted swoosh rings that slowly breathe.
    for (final (i, (rx, ry, tilt, alpha)) in const [(178.0, 62.0, -0.16, 0.55), (140.0, 46.0, -0.10, 0.40)].indexed) {
      final breathe = 1 + 0.015 * math.sin(t * _tau / 5 + i);
      canvas.save();
      canvas.translate(center.dx, center.dy + 18 * k);
      canvas.rotate(tilt);
      final rect = Rect.fromCenter(center: Offset.zero, width: rx * 2 * k * breathe, height: ry * 2 * k * breathe);
      canvas.drawOval(
        rect,
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = (i == 0 ? 10 : 6) * k
          ..shader = SweepGradient(colors: [
            Colors.white.withValues(alpha: dark ? 0.04 : alpha),
            AppPalette.violet.withValues(alpha: dark ? 0.22 : 0.16),
            Colors.white.withValues(alpha: dark ? 0.02 : alpha * 0.4),
            AppPalette.accent.withValues(alpha: dark ? 0.18 : 0.12),
            Colors.white.withValues(alpha: dark ? 0.04 : alpha),
          ]).createShader(rect)
          ..maskFilter = MaskFilter.blur(BlurStyle.normal, 1.2 * k),
      );
      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(_BackdropPainter old) => old.t != t || old.center != center || old.dark != dark || old.k != k;
}

/// Light phone with a few list rows, behind the clock.
class _Phone extends StatelessWidget {
  const _Phone({required this.k, required this.dark});
  final double k;
  final bool dark;

  @override
  Widget build(BuildContext context) {
    final body = dark ? const Color(0xFF2A2556) : const Color(0xFFF1EDFF);
    final edge = dark ? const Color(0xFF4A3FA0) : const Color(0xFFC9BEFF);
    final line = dark ? Colors.white.withValues(alpha: 0.14) : const Color(0xFFDCD5FA);
    Widget row(Color c) => Padding(
          padding: EdgeInsets.only(bottom: 10 * k),
          child: Row(children: [
            Container(width: 14 * k, height: 14 * k, decoration: BoxDecoration(color: c, borderRadius: BorderRadius.circular(4 * k))),
            SizedBox(width: 8 * k),
            Expanded(child: Container(height: 6 * k, decoration: BoxDecoration(color: line, borderRadius: BorderRadius.circular(3 * k)))),
          ]),
        );
    return Container(
      width: 92 * k,
      height: 170 * k,
      padding: EdgeInsets.fromLTRB(12 * k, 22 * k, 14 * k, 12 * k),
      decoration: BoxDecoration(
        color: body,
        borderRadius: BorderRadius.circular(18 * k),
        border: Border.all(color: edge, width: 3 * k),
        boxShadow: [BoxShadow(color: AppPalette.accent.withValues(alpha: dark ? 0.25 : 0.16), blurRadius: 18 * k, offset: Offset(6 * k, 10 * k))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          row(const Color(0xFFFF8FA3)),
          row(AppPalette.violet),
          row(const Color(0xFF7EDCC4)),
          row(const Color(0xFF8EC5FF)),
          row(const Color(0xFFB9A8FF)),
        ],
      ),
    );
  }
}

/// Rounded app-icon tile with a soft shadow; [badge] adds a small red dot.
class _IconTile extends StatelessWidget {
  const _IconTile({required this.icon, required this.bg, required this.fg, required this.dark, this.badge = false});
  final IconData icon;
  final Color bg, fg;
  final bool dark, badge;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, box) {
      final s = box.maxWidth;
      final fill = bg == Colors.white && dark ? const Color(0xFF241F48) : bg;
      return Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: s,
            height: s,
            decoration: BoxDecoration(
              color: fill,
              borderRadius: BorderRadius.circular(s * 0.3),
              boxShadow: [BoxShadow(color: (bg == Colors.white ? AppPalette.accent : bg).withValues(alpha: dark ? 0.35 : 0.28), blurRadius: s * 0.4, offset: Offset(0, s * 0.14))],
            ),
            child: Icon(icon, size: s * 0.52, color: fg),
          ),
          if (badge)
            Positioned(
              right: -s * 0.1,
              top: -s * 0.1,
              child: Container(
                width: s * 0.34,
                height: s * 0.34,
                decoration: BoxDecoration(shape: BoxShape.circle, color: const Color(0xFFFF5A6E), border: Border.all(color: Colors.white, width: s * 0.06)),
              ),
            ),
        ],
      );
    });
  }
}

/// White clock face, thick purple ring, tick marks and running hands.
class _ClockPainter extends CustomPainter {
  _ClockPainter({required this.minutes, required this.dark});
  final double minutes;
  final bool dark;

  @override
  void paint(Canvas canvas, Size size) {
    final c = size.center(Offset.zero);
    final r = size.width / 2;
    final ring = r * 0.13;
    // Shadow.
    canvas.drawCircle(
      c + Offset(0, r * 0.08),
      r,
      Paint()
        ..color = AppPalette.accent.withValues(alpha: dark ? 0.45 : 0.30)
        ..maskFilter = MaskFilter.blur(BlurStyle.normal, r * 0.22),
    );
    // Ring.
    final ringRect = Rect.fromCircle(center: c, radius: r);
    canvas.drawCircle(
      c,
      r,
      Paint()
        ..shader = const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFFB7A6FF), AppPalette.violet, AppPalette.accent],
        ).createShader(ringRect),
    );
    // Face.
    final faceR = r - ring;
    canvas.drawCircle(
      c,
      faceR,
      Paint()
        ..shader = RadialGradient(
          center: const Alignment(-0.3, -0.4),
          colors: dark ? [const Color(0xFF2E2860), const Color(0xFF1C1840)] : [Colors.white, const Color(0xFFF1EDFF)],
        ).createShader(Rect.fromCircle(center: c, radius: faceR)),
    );
    // Tick marks: 60 small, 12 bold.
    for (var i = 0; i < 60; i++) {
      final a = i / 60 * _tau;
      final major = i % 5 == 0;
      final len = major ? faceR * 0.14 : faceR * 0.06;
      final outer = c + Offset(math.sin(a), -math.cos(a)) * (faceR * 0.90);
      final inner = c + Offset(math.sin(a), -math.cos(a)) * (faceR * 0.90 - len);
      canvas.drawLine(
        inner,
        outer,
        Paint()
          ..strokeCap = StrokeCap.round
          ..strokeWidth = major ? faceR * 0.045 : faceR * 0.02
          ..color = (dark ? Colors.white : const Color(0xFF9C95C9)).withValues(alpha: major ? 0.75 : 0.35),
      );
    }
    final hourA = (minutes / 720) * _tau;
    final minA = (minutes % 60) / 60 * _tau;
    void hand(double a, double len, double width, Color color) {
      canvas.drawLine(
        c - Offset(math.sin(a), -math.cos(a)) * (len * 0.16),
        c + Offset(math.sin(a), -math.cos(a)) * len,
        Paint()
          ..strokeCap = StrokeCap.round
          ..strokeWidth = width
          ..color = color,
      );
    }

    hand(hourA, faceR * 0.48, faceR * 0.11, dark ? Colors.white : const Color(0xFF1F1B4D));
    hand(minA, faceR * 0.72, faceR * 0.075, AppPalette.accent);
    canvas.drawCircle(c, faceR * 0.09, Paint()..color = AppPalette.accent);
    canvas.drawCircle(c, faceR * 0.04, Paint()..color = Colors.white);
  }

  @override
  bool shouldRepaint(_ClockPainter old) => old.minutes != minutes || old.dark != dark;
}
