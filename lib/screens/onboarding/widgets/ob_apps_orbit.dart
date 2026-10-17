import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../utils/app_theme.dart';

// Top illustration of "Which apps distract you the most?": popular app icons
// slowly orbiting Pausey's pause button on two rings. The icons are fixed
// (the same on every phone); they only illustrate the idea.

const _tau = math.pi * 2;

/// Fixed app icons shown on the rings.
const _icons = <String>[
  'assets/svg/sheet_instagram.png',
  'assets/svg/sheet_tiktok.png',
  'assets/svg/sheet_youtube.png',
  'assets/svg/sheet_x.png',
  'assets/svg/sheet_facebook.png',
  'assets/svg/ob2_snapchat.svg',
  'assets/svg/sheet_netflix.png',
];

bool _reduced(BuildContext context) => MediaQuery.maybeDisableAnimationsOf(context) ?? false;

/// The orbit. [lockedCount] icons get a small lock badge (the apps that will be paused).
class ObAppsOrbit extends StatefulWidget {
  const ObAppsOrbit({super.key, this.lockedCount = 0});
  final int lockedCount;

  @override
  State<ObAppsOrbit> createState() => _ObAppsOrbitState();
}

class _ObAppsOrbitState extends State<ObAppsOrbit> with SingleTickerProviderStateMixin {
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
    if (_reduced(context)) {
      if (_ticker.isActive) _ticker.stop();
      _clock.value = 2; // a still frame
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
    final n = _icons.length;
    // 2 tiles on the inner ring, the rest on the outer one; phase picked so tiles never touch.
    const innerN = 2;
    const phase = 54 / 72 * _tau;
    final outerN = n - innerN;
    final locked = widget.lockedCount.clamp(0, n);
    // Taller on tall phones, never more than 260.
    final h = (MediaQuery.sizeOf(context).height * 0.28).clamp(180.0, 260.0);

    return ExcludeSemantics(
      child: LayoutBuilder(
        builder: (context, box) {
          final w = math.min(box.maxWidth, 380.0);
          final k = math.min(1.0, math.min(w / 340, h / 240));
          final size = Size(w, h);
          final c = Offset(w / 2, h / 2);
          final tile = 42 * k;
          final orx = w / 2 - tile * 0.72, ory = h / 2 - tile * 0.66;
          final irx = math.min(orx * 0.58, 110 * k), iry = ory * 0.66;
          final pause = 70 * k;
          final tiles = [
            for (var i = 0; i < n; i++) _AppTile(key: ValueKey(i), size: tile, locked: i < locked, dark: dark, asset: _icons[i]),
          ];
          return Center(
            child: _Entrance(
              child: SizedBox.fromSize(
                size: size,
                child: ValueListenableBuilder<double>(
                  valueListenable: _clock,
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
                    Widget place(({Offset pos, double depth, Widget w}) p) =>
                        _at(p.pos, tile * 1.4, tile * 1.4, Center(child: Transform.scale(scale: 0.84 + 0.16 * p.depth, child: p.w)));
                    final breathe = 1 + 0.03 * math.sin(t * _tau / 3);
                    return Stack(
                      clipBehavior: Clip.none,
                      children: [
                        _at(c, h * 1.5, h * 1.5, _Glow(size: h * 1.5, color: AppPalette.violet, alpha: dark ? 0.16 : 0.22)),
                        Positioned.fill(
                          child: CustomPaint(
                            painter: _OrbitPainter(center: c, outer: Size(orx, ory), inner: Size(irx, iry), t: t, dark: dark, k: k),
                          ),
                        ),
                        for (final p in placed)
                          if (p.pos.dy < c.dy) place(p),
                        _at(
                          c,
                          pause * 3,
                          pause * 3,
                          Transform.scale(scale: breathe, child: _Glow(size: pause * 3, color: AppPalette.accent, alpha: dark ? 0.34 : 0.28)),
                        ),
                        _at(c, pause, pause, _PauseButton(size: pause, dark: dark)),
                        for (final p in placed)
                          if (p.pos.dy >= c.dy) place(p),
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

/// Places [child] centred on [at].
Widget _at(Offset at, double w, double h, Widget child) => Positioned(left: at.dx - w / 2, top: at.dy - h / 2, width: w, height: h, child: child);

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
      builder: (_, v, c) => Opacity(opacity: v.clamp(0.0, 1.0), child: Transform.scale(scale: 0.94 + 0.06 * v, child: c)),
      child: child,
    );
  }
}

/// Soft radial glow.
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
            colors: [color.withValues(alpha: alpha), color.withValues(alpha: alpha * 0.45), color.withValues(alpha: 0)],
            stops: const [0, 0.42, 1],
          ),
        ),
      ),
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

/// Pausey's round pause button in the middle.
class _PauseButton extends StatelessWidget {
  const _PauseButton({required this.size, required this.dark});
  final double size;
  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: const LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [AppPalette.blue, AppPalette.violet, AppPalette.accent]),
        border: Border.all(color: Colors.white.withValues(alpha: dark ? 0.25 : 0.9), width: size * 0.05),
        boxShadow: [BoxShadow(color: AppPalette.accent.withValues(alpha: 0.45), blurRadius: 22, offset: const Offset(0, 6))],
      ),
      alignment: Alignment.center,
      child: Icon(Icons.pause_rounded, size: size * 0.52, color: Colors.white),
    );
  }
}

/// White (light) / deep purple (dark) tile holding one app icon, with an optional lock badge.
class _AppTile extends StatelessWidget {
  const _AppTile({super.key, required this.size, required this.locked, required this.dark, required this.asset});

  final double size;
  final bool locked, dark;
  final String asset;

  @override
  Widget build(BuildContext context) {
    final inner = size * 0.74;
    final card = dark ? const Color(0xFF1D1940) : Colors.white;
    final icon = asset.endsWith('.svg')
        ? SvgPicture.asset(asset, width: inner, height: inner)
        : Image.asset(asset, width: inner, height: inner, fit: BoxFit.cover, filterQuality: FilterQuality.medium);
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                color: card,
                borderRadius: BorderRadius.circular(size * 0.3),
                border: Border.all(color: dark ? Colors.white.withValues(alpha: 0.10) : const Color(0x121B1838)),
                boxShadow: [BoxShadow(color: AppPalette.accent.withValues(alpha: dark ? 0.29 : 0.14), blurRadius: 16, offset: const Offset(0, 6))],
              ),
              alignment: Alignment.center,
              child: ClipRRect(borderRadius: BorderRadius.circular(inner * 0.26), child: icon),
            ),
          ),
          if (locked)
            Positioned(
              right: -size * 0.14,
              top: -size * 0.14,
              child: Container(
                width: size * 0.44,
                height: size * 0.44,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: const LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [AppPalette.violet, AppPalette.accent]),
                  border: Border.all(color: card, width: size * 0.05),
                ),
                alignment: Alignment.center,
                child: Icon(Icons.lock_rounded, size: size * 0.24, color: Colors.white),
              ),
            ),
        ],
      ),
    );
  }
}
