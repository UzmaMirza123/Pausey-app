import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../data/app_repo.dart';
import '../../utils/app_theme.dart';
import '../../utils/l10n.dart';
import '../../widgets/common.dart';
import '../../widgets/ui_kit.dart';
import '../block/widgets/applock_ui.dart' show AppIcon;

bool _reduced(BuildContext context) => MediaQuery.maybeDisableAnimationsOf(context) ?? false;

/// Auto-advancing feature carousel at the top of the paywall: a plan curve, the user's
/// locked apps around a lock, and their real weekly focus. Swipeable; holding a finger
/// on it pauses it; with "Remove animations" on it stays still and only moves on swipe.
class PaywallCarousel extends StatefulWidget {
  const PaywallCarousel({super.key});

  static const slideDuration = Duration(seconds: 4);

  @override
  State<PaywallCarousel> createState() => _PaywallCarouselState();
}

class _PaywallCarouselState extends State<PaywallCarousel> {
  static const _count = 3;
  static const _start = _count * 1000; // "endless" in both directions
  final _pc = PageController(initialPage: _start);
  int _page = _start;
  Timer? _timer;
  bool _held = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _schedule();
  }

  void _schedule() {
    _timer?.cancel();
    if (_held || _reduced(context)) return;
    _timer = Timer(PaywallCarousel.slideDuration, () {
      if (!mounted || !_pc.hasClients) return;
      _pc.nextPage(duration: const Duration(milliseconds: 650), curve: Curves.easeInOutCubic);
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pc.dispose();
    super.dispose();
  }

  void _hold(bool v) {
    _held = v;
    v ? _timer?.cancel() : _schedule();
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final titles = [l.stPw1, l.stPw2, l.stPw3];
    return Column(children: [
      Listener(
        onPointerDown: (_) => _hold(true),
        onPointerUp: (_) => _hold(false),
        onPointerCancel: (_) => _hold(false),
        child: SizedBox(
          height: 262,
          child: PageView.builder(
            controller: _pc,
            onPageChanged: (i) {
              setState(() => _page = i);
              _schedule();
            },
            itemBuilder: (context, i) {
              final k = i % _count;
              final active = i == _page;
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Column(children: [
                  SizedBox(
                    height: 62,
                    child: Center(
                      child: Text(
                        titles[k],
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: AppText.cardTitle.copyWith(fontSize: 22, height: 1.25, fontWeight: FontWeight.w800, letterSpacing: -0.4, color: context.colors.textPrimary),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Expanded(
                    child: switch (k) {
                      0 => _CurveArt(active: active),
                      1 => _OrbitArt(active: active),
                      _ => _BarsArt(active: active),
                    },
                  ),
                ]),
              );
            },
          ),
        ),
      ),
      const SizedBox(height: 12),
      PageDots(count: _count, index: _page % _count),
    ]);
  }
}

/// Plays a one-shot intro (0 → 1) each time its slide becomes [active].
mixin _Intro<T extends StatefulWidget> on State<T>, SingleTickerProviderStateMixin<T> {
  late final AnimationController intro = AnimationController(vsync: this, duration: introDuration);
  Duration get introDuration;
  bool get active;

  void syncIntro({bool restart = false}) {
    if (_reduced(context)) {
      intro.value = 1;
    } else if (active && (restart || intro.value == 0)) {
      intro.forward(from: 0);
    } else if (!active) {
      intro.value = 0;
    }
  }

  @override
  void dispose() {
    intro.dispose();
    super.dispose();
  }
}

// -----------------------------------------------------------------------------
// 1 — a curve from "Today" down to "Your goal" (no made-up numbers)
// -----------------------------------------------------------------------------

class _CurveArt extends StatefulWidget {
  const _CurveArt({required this.active});
  final bool active;

  @override
  State<_CurveArt> createState() => _CurveArtState();
}

class _CurveArtState extends State<_CurveArt> with SingleTickerProviderStateMixin, _Intro {
  @override
  Duration get introDuration => const Duration(milliseconds: 1500);
  @override
  bool get active => widget.active;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    syncIntro();
  }

  @override
  void didUpdateWidget(_CurveArt old) {
    super.didUpdateWidget(old);
    if (old.active != widget.active) syncIntro(restart: true);
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final rtl = Directionality.of(context) == TextDirection.rtl;
    return LayoutBuilder(builder: (context, box) {
      final w = box.maxWidth, h = box.maxHeight;
      // Start-edge coordinates; the painter is mirrored for right-to-left.
      final a = Offset(w * 0.12, h * 0.16), b = Offset(w * 0.84, h * 0.74);
      return AnimatedBuilder(
        animation: intro,
        builder: (context, _) {
          final t = Curves.easeInOutCubic.transform(intro.value);
          final star = Curves.easeOutBack.transform(((intro.value - 0.78) / 0.22).clamp(0.0, 1.0));
          return Stack(clipBehavior: Clip.none, children: [
            Positioned.fill(
              child: Transform.flip(
                flipX: rtl,
                child: CustomPaint(painter: _CurvePainter(a: a, b: b, t: t, dark: context.isDark)),
              ),
            ),
            PositionedDirectional(start: a.dx - 12, top: a.dy + 14, child: _Label(l.stPwToday, muted: true)),
            PositionedDirectional(
              end: w - b.dx + 24,
              top: b.dy - 46,
              child: Opacity(opacity: star.clamp(0.0, 1.0), child: _Label(l.stPwGoal)),
            ),
            PositionedDirectional(
              start: b.dx - 17,
              top: b.dy - 17,
              child: Transform.scale(
                scale: star,
                child: Container(
                  width: 34,
                  height: 34,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: const LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [AppPalette.violet, AppPalette.accent]),
                    boxShadow: [BoxShadow(color: AppPalette.accent.withValues(alpha: 0.5), blurRadius: 16)],
                  ),
                  child: const Icon(Icons.star_rounded, size: 20, color: Colors.white),
                ),
              ),
            ),
          ]);
        },
      );
    });
  }
}

class _Label extends StatelessWidget {
  const _Label(this.text, {this.muted = false});
  final String text;
  final bool muted;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final dark = context.isDark;
    return Container(
      constraints: const BoxConstraints(maxWidth: 150),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: dark ? const Color(0xFF231F45) : Colors.white,
        borderRadius: BorderRadius.circular(AppRadius.chip),
        border: Border.all(color: muted ? c.glassBorder : AppPalette.violet.withValues(alpha: 0.5)),
        boxShadow: dark ? null : [BoxShadow(color: const Color(0xFF1B1838).withValues(alpha: 0.06), blurRadius: 10, offset: const Offset(0, 3))],
      ),
      child: Text(text, maxLines: 1, overflow: TextOverflow.ellipsis, style: AppText.rowSub.copyWith(fontWeight: FontWeight.w700, color: muted ? c.textSecondary : c.textPrimary)),
    );
  }
}

class _CurvePainter extends CustomPainter {
  _CurvePainter({required this.a, required this.b, required this.t, required this.dark});
  final Offset a, b;
  final double t;
  final bool dark;

  @override
  void paint(Canvas canvas, Size size) {
    final path = Path()
      ..moveTo(a.dx, a.dy)
      ..cubicTo(a.dx + (b.dx - a.dx) * 0.45, a.dy - 6, a.dx + (b.dx - a.dx) * 0.5, b.dy + 4, b.dx, b.dy);
    final metric = path.computeMetrics().first;
    final shown = metric.extractPath(0, metric.length * t);

    // Soft fill under the drawn part.
    final tip = metric.getTangentForOffset(metric.length * t)?.position ?? a;
    final fill = Path.from(shown)
      ..lineTo(tip.dx, size.height)
      ..lineTo(a.dx, size.height)
      ..close();
    canvas.drawPath(
      fill,
      Paint()
        ..shader = LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [AppPalette.accent.withValues(alpha: dark ? 0.22 : 0.14), AppPalette.accent.withValues(alpha: 0)],
        ).createShader(Offset.zero & size),
    );
    // Faint full track, then the drawn line.
    canvas.drawPath(
      path,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2
        ..color = AppPalette.violet.withValues(alpha: 0.18),
    );
    canvas.drawPath(
      shown,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 4
        ..strokeCap = StrokeCap.round
        ..shader = const LinearGradient(colors: [AppPalette.blue, AppPalette.accent]).createShader(Rect.fromPoints(a, b)),
    );
    // Start dot and the moving tip.
    canvas.drawCircle(a, 9, Paint()..color = dark ? const Color(0xFF231F45) : Colors.white);
    canvas.drawCircle(
      a,
      9,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 3
        ..color = AppPalette.blue,
    );
    if (t > 0 && t < 1) {
      canvas.drawCircle(tip, 10, Paint()..color = AppPalette.accent.withValues(alpha: 0.25));
      canvas.drawCircle(tip, 5, Paint()..color = AppPalette.accent);
    }
  }

  @override
  bool shouldRepaint(_CurvePainter old) => old.t != t || old.a != a || old.b != b || old.dark != dark;
}

// -----------------------------------------------------------------------------
// 2 — the user's locked apps floating around a lock, soft particles drifting up
// -----------------------------------------------------------------------------

class _OrbitArt extends StatefulWidget {
  const _OrbitArt({required this.active});
  final bool active;

  @override
  State<_OrbitArt> createState() => _OrbitArtState();
}

class _OrbitArtState extends State<_OrbitArt> with SingleTickerProviderStateMixin {
  // One slow revolution; only ticks while this slide is on screen and animations are allowed.
  late final _c = AnimationController(vsync: this, duration: const Duration(seconds: 20));

  void _sync() {
    if (widget.active && !_reduced(context)) {
      if (!_c.isAnimating) _c.repeat();
    } else {
      _c.stop();
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _sync();
  }

  @override
  void didUpdateWidget(_OrbitArt old) {
    super.didUpdateWidget(old);
    _sync();
  }

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final apps = AppRepo.instance.apps.where((a) => a.locked).take(5).toList();
    final dark = context.isDark;
    const generic = [Icons.chat_bubble_rounded, Icons.play_arrow_rounded, Icons.photo_camera_rounded, Icons.sports_esports_rounded];
    final n = apps.isEmpty ? generic.length : apps.length;
    const iconSize = 44.0;
    Widget item(int i) {
      if (apps.isNotEmpty) return _Floating(child: AppIcon(apps[i], size: iconSize));
      return _Floating(
        child: Container(
          width: iconSize,
          height: iconSize,
          decoration: BoxDecoration(shape: BoxShape.circle, color: dark ? const Color(0xFF231F45) : Colors.white),
          child: Icon(generic[i], size: 20, color: AppPalette.violet.withValues(alpha: 0.8)),
        ),
      );
    }

    final items = [for (var i = 0; i < n; i++) RepaintBoundary(child: item(i))];
    return LayoutBuilder(builder: (context, box) {
      final w = box.maxWidth, h = box.maxHeight;
      final center = Offset(w / 2, h / 2);
      final rx = math.min(w * 0.36, 150.0), ry = h * 0.36;
      return AnimatedBuilder(
        animation: _c,
        builder: (context, _) {
          final t = _c.value;
          return Stack(clipBehavior: Clip.none, children: [
            Positioned.fill(child: CustomPaint(painter: _ParticlesPainter(t: t, dark: dark))),
            // Halo + lock.
            Positioned(
              left: center.dx - 60,
              top: center.dy - 60,
              child: Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: AppPalette.violet.withValues(alpha: 0.18), width: 1.5)),
              ),
            ),
            Positioned(
              left: center.dx - 36,
              top: center.dy - 36,
              child: Container(
                width: 72,
                height: 72,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: const LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [AppPalette.violet, AppPalette.accent]),
                  boxShadow: [BoxShadow(color: AppPalette.accent.withValues(alpha: 0.45), blurRadius: 30, spreadRadius: 2)],
                ),
                child: const Icon(Icons.lock_rounded, size: 32, color: Colors.white),
              ),
            ),
            for (var i = 0; i < n; i++)
              () {
                final ang = -math.pi / 2 + 2 * math.pi * (i / n + t);
                final bob = math.sin(2 * math.pi * (t * 3) + i * 1.7) * 4;
                final p = center + Offset(math.cos(ang) * rx, math.sin(ang) * ry + bob);
                return Positioned(left: p.dx - iconSize / 2, top: p.dy - iconSize / 2, child: items[i]);
              }(),
          ]);
        },
      );
    });
  }
}

/// Icon with a soft shadow so it reads as floating.
class _Floating extends StatelessWidget {
  const _Floating({required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) => DecoratedBox(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [BoxShadow(color: const Color(0xFF1B1838).withValues(alpha: context.isDark ? 0.45 : 0.12), blurRadius: 14, offset: const Offset(0, 6))],
        ),
        child: child,
      );
}

class _ParticlesPainter extends CustomPainter {
  _ParticlesPainter({required this.t, required this.dark});
  final double t;
  final bool dark;

  static final _seeds = () {
    final r = math.Random(7);
    return [for (var i = 0; i < 26; i++) (r.nextDouble(), r.nextDouble(), 0.6 + r.nextDouble() * 1.4, 1.2 + r.nextDouble() * 2.8, r.nextDouble() * math.pi * 2)];
  }();

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..maskFilter = const MaskFilter.blur(BlurStyle.normal, 1.2);
    for (final (x0, y0, speed, radius, phase) in _seeds) {
      // Drift upward and sway; wrap around at the top.
      final y = (y0 - t * speed) % 1.0;
      final x = x0 + math.sin(t * math.pi * 2 * 2 + phase) * 0.025;
      final twinkle = 0.5 + 0.5 * math.sin(t * math.pi * 2 * 5 + phase);
      // Fade near the edges so particles appear and vanish softly.
      final edge = math.min(1.0, math.min(y, 1 - y) * 6);
      paint.color = (radius > 2.6 ? AppPalette.blue : AppPalette.violet).withValues(alpha: (dark ? 0.55 : 0.45) * (0.4 + 0.6 * twinkle) * edge);
      canvas.drawCircle(Offset(x * size.width, y * size.height), radius, paint);
    }
  }

  @override
  bool shouldRepaint(_ParticlesPainter old) => old.t != t || old.dark != dark;
}

// -----------------------------------------------------------------------------
// 3 — real focus minutes for the last 4 weeks
// -----------------------------------------------------------------------------

class _BarsArt extends StatefulWidget {
  const _BarsArt({required this.active});
  final bool active;

  @override
  State<_BarsArt> createState() => _BarsArtState();
}

class _BarsArtState extends State<_BarsArt> with SingleTickerProviderStateMixin, _Intro {
  @override
  Duration get introDuration => const Duration(milliseconds: 1100);
  @override
  bool get active => widget.active;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    syncIntro();
  }

  @override
  void didUpdateWidget(_BarsArt old) {
    super.didUpdateWidget(old);
    if (old.active != widget.active) syncIntro(restart: true);
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final c = context.colors;
    final dark = context.isDark;
    final weeks = AppRepo.instance.last4WeeksFocus;
    final empty = weeks.every((m) => m == 0);
    final maxV = weeks.fold<int>(1, (a, b) => math.max(a, b));
    String fmt(int m) => fmtMinutes(m, h: l.unitH, m: l.unitM);
    const placeholder = [0.38, 0.52, 0.66, 0.84];
    final semantics = empty ? l.stPwFirstWeek : [for (var i = 0; i < 4; i++) '${l.stPwWeek(i + 1)} ${fmt(weeks[i])}'].join(', ');

    return Semantics(
      label: '${l.stPwFocusWeek}: $semantics',
      excludeSemantics: true,
      child: LayoutBuilder(builder: (context, box) {
        const labelH = 20.0, valueH = 22.0;
        final barMax = box.maxHeight - labelH - valueH - 6;
        return AnimatedBuilder(
          animation: intro,
          builder: (context, _) => Stack(children: [
            Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
              for (var i = 0; i < 4; i++) ...[
                if (i > 0) const SizedBox(width: 14),
                Expanded(
                  child: () {
                    final p = Curves.easeOutCubic.transform(((intro.value - i * 0.12) / 0.6).clamp(0.0, 1.0));
                    final frac = empty ? placeholder[i] : math.max(0.05, weeks[i] / maxV);
                    final last = i == 3;
                    return Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                      SizedBox(
                        height: valueH,
                        child: empty
                            ? null
                            : Opacity(
                                opacity: p,
                                child: FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Text(fmt(weeks[i]), style: AppText.small.copyWith(letterSpacing: 0, color: last ? c.textPrimary : c.textSecondary)),
                                ),
                              ),
                      ),
                      Container(
                        height: math.max(2.0, barMax * frac * p),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          gradient: !empty && last ? const LinearGradient(begin: Alignment.bottomCenter, end: Alignment.topCenter, colors: [AppPalette.accent, AppPalette.violet]) : null,
                          color: empty ? Colors.transparent : (last ? null : AppPalette.accent.withValues(alpha: dark ? 0.28 : 0.18)),
                          border: empty ? Border.all(color: c.glassBorder, width: 1.5) : null,
                          boxShadow: !empty && last ? [BoxShadow(color: AppPalette.accent.withValues(alpha: 0.35), blurRadius: 16, offset: const Offset(0, 6))] : null,
                        ),
                      ),
                      const SizedBox(height: 6),
                      SizedBox(
                        height: labelH,
                        child: Text(l.stPwWeek(i + 1), maxLines: 1, style: AppText.small.copyWith(letterSpacing: 0, color: c.textMuted)),
                      ),
                    ]);
                  }(),
                ),
              ],
            ]),
            if (empty)
              Positioned.fill(
                bottom: labelH + 6,
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                    decoration: BoxDecoration(
                      color: dark ? const Color(0xFF231F45) : Colors.white,
                      borderRadius: BorderRadius.circular(AppRadius.chip),
                      border: Border.all(color: AppPalette.violet.withValues(alpha: 0.4)),
                    ),
                    child: Row(mainAxisSize: MainAxisSize.min, children: [
                      const Icon(Icons.flag_rounded, size: 15, color: AppPalette.accent),
                      const SizedBox(width: 6),
                      Flexible(child: Text(l.stPwFirstWeek, textAlign: TextAlign.center, style: AppText.rowSub.copyWith(fontWeight: FontWeight.w700, color: c.textPrimary))),
                    ]),
                  ),
                ),
              ),
          ]),
        );
      }),
    );
  }
}
