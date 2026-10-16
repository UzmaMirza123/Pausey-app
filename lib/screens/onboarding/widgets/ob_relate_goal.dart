import 'dart:math' as math;
import 'dart:ui' show lerpDouble;

import 'package:flutter/foundation.dart' show ValueListenable;
import 'package:flutter/physics.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

import '../../../utils/app_theme.dart';

// =============================================================================
// RelateDial — "Lose track of time?" (0 = rarely, 1 = sometimes, 2 = all the time)
// =============================================================================

/// One calm, breathing orb that answers with the slider under it: the more
/// often you lose track of time, the bigger, faster and warmer it pulses.
class RelateDial extends StatefulWidget {
  const RelateDial({super.key, required this.value, required this.onChanged, required this.labels}) : assert(labels.length == 3);

  /// Selected stop, 0..2.
  final int value;
  final ValueChanged<int> onChanged;

  /// Exactly three labels, in order (rarely, sometimes, all the time).
  final List<String> labels;

  @override
  State<RelateDial> createState() => _RelateDialState();
}

class _RelateDialState extends State<RelateDial> with TickerProviderStateMixin {
  static const _spring = SpringDescription(mass: 1, stiffness: 420, damping: 30);

  /// Continuous slider position 0..2 (springs between stops).
  late final AnimationController _pos = AnimationController.unbounded(vsync: this, value: widget.value.toDouble());

  /// Pulse phase, advanced by a ticker at a speed that follows [_pos].
  final _phase = ValueNotifier<double>(0);
  late final Ticker _ticker = createTicker(_tick);
  Duration _last = Duration.zero;

  bool _dragging = false;
  int _liveStop = 0;
  bool _reduce = false;

  @override
  void initState() {
    super.initState();
    _liveStop = widget.value.clamp(0, 2);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _reduce = MediaQuery.maybeDisableAnimationsOf(context) ?? false;
    if (_reduce) {
      if (_ticker.isActive) _ticker.stop();
    } else if (!_ticker.isActive) {
      _last = Duration.zero;
      _ticker.start();
    }
  }

  @override
  void didUpdateWidget(RelateDial old) {
    super.didUpdateWidget(old);
    if (old.value != widget.value && !_dragging) {
      _liveStop = widget.value.clamp(0, 2);
      _springTo(_liveStop.toDouble());
    }
  }

  void _tick(Duration elapsed) {
    final dt = (elapsed - _last).inMicroseconds / 1e6;
    _last = elapsed;
    final t = (_pos.value / 2).clamp(0.0, 1.0);
    // cycles per second: calm 0.22 → restless 0.75
    _phase.value = (_phase.value + dt * lerpDouble(0.22, 0.75, t)!) % 1000;
  }

  void _springTo(double target, [double velocity = 0]) {
    if (_reduce) {
      _pos.value = target;
      return;
    }
    _pos.animateWith(SpringSimulation(_spring, _pos.value, target, velocity));
  }

  void _select(int stop, {bool haptic = true}) {
    stop = stop.clamp(0, 2);
    if (haptic && stop != _liveStop) HapticFeedback.selectionClick();
    setState(() => _liveStop = stop);
    _springTo(stop.toDouble());
    if (stop != widget.value) widget.onChanged(stop);
  }

  @override
  void dispose() {
    _ticker.dispose();
    _pos.dispose();
    _phase.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final labels = widget.labels;
    final shown = _liveStop.clamp(0, 2);
    return SizedBox(
      height: 360,
      child: Column(
        children: [
          SizedBox(
            height: 200,
            width: double.infinity,
            child: ExcludeSemantics(
              child: RepaintBoundary(
                child: CustomPaint(
                  painter: _OrbPainter(pos: _pos, phase: _phase, dark: context.isDark, reduce: _reduce),
                ),
              ),
            ),
          ),
          const SizedBox(height: 4),
          SizedBox(
            height: 54,
            child: Center(
              child: ExcludeSemantics(
                child: AnimatedSwitcher(
                  duration: _reduce ? Duration.zero : const Duration(milliseconds: 320),
                  switchInCurve: Curves.easeOutCubic,
                  switchOutCurve: Curves.easeInCubic,
                  transitionBuilder: (child, a) => FadeTransition(
                    opacity: a,
                    child: SlideTransition(
                      position: Tween(begin: const Offset(0, 0.28), end: Offset.zero).animate(a),
                      child: child,
                    ),
                  ),
                  child: Padding(
                    key: ValueKey(shown),
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Text(
                      labels[shown],
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: AppText.cardTitle.copyWith(fontSize: 22, height: 1.25, fontWeight: FontWeight.w800, letterSpacing: -0.4, color: c.textPrimary),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Semantics(
            slider: true,
            label: labels[shown],
            value: labels[shown],
            increasedValue: shown < 2 ? labels[shown + 1] : null,
            decreasedValue: shown > 0 ? labels[shown - 1] : null,
            onIncrease: shown < 2 ? () => _select(shown + 1) : null,
            onDecrease: shown > 0 ? () => _select(shown - 1) : null,
            child: ExcludeSemantics(child: _slider(context, shown)),
          ),
        ],
      ),
    );
  }

  Widget _slider(BuildContext context, int shown) {
    final c = context.colors;
    final rtl = Directionality.of(context) == TextDirection.rtl;
    const inset = 22.0;
    return LayoutBuilder(
      builder: (context, box) {
        final w = box.maxWidth;
        final span = math.max(1.0, w - inset * 2);
        double toPos(double dx) {
          var f = ((dx - inset) / span).clamp(0.0, 1.0);
          if (rtl) f = 1 - f;
          return f * 2;
        }

        void dragTo(double dx) {
          _pos.value = toPos(dx);
          final stop = _pos.value.round();
          if (stop != _liveStop) {
            HapticFeedback.selectionClick();
            setState(() => _liveStop = stop);
          }
        }

        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onHorizontalDragStart: (d) {
                _pos.stop();
                setState(() => _dragging = true);
                dragTo(d.localPosition.dx);
              },
              onHorizontalDragUpdate: (d) => dragTo(d.localPosition.dx),
              onHorizontalDragEnd: (d) {
                final v = d.velocity.pixelsPerSecond.dx / span * 2 * (rtl ? -1 : 1);
                final stop = _pos.value.round().clamp(0, 2);
                setState(() => _dragging = false);
                if (stop != _liveStop) HapticFeedback.selectionClick();
                _liveStop = stop;
                if (_reduce) {
                  _pos.value = stop.toDouble();
                } else {
                  _pos.animateWith(SpringSimulation(_spring, _pos.value, stop.toDouble(), v.clamp(-12.0, 12.0)));
                }
                if (stop != widget.value) widget.onChanged(stop);
              },
              onHorizontalDragCancel: () {
                setState(() => _dragging = false);
                _select(_pos.value.round());
              },
              onTapUp: (d) => _select(toPos(d.localPosition.dx).round()),
              child: SizedBox(
                height: 48,
                width: w,
                child: AnimatedBuilder(
                  animation: _pos,
                  builder: (context, _) => CustomPaint(
                    painter: _TrackPainter(pos: _pos.value.clamp(0.0, 2.0), rtl: rtl, inset: inset, track: c.dotInactive, dark: context.isDark),
                    child: _thumb(w, inset, span, rtl),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 4),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (var i = 0; i < 3; i++)
                  Expanded(
                    child: GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () => _select(i),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 2),
                        child: AnimatedDefaultTextStyle(
                          duration: _reduce ? Duration.zero : const Duration(milliseconds: 220),
                          curve: Curves.easeOutCubic,
                          style: AppText.rowSub.copyWith(
                            fontSize: 12.5,
                            height: 1.25,
                            fontWeight: i == shown ? FontWeight.w800 : FontWeight.w600,
                            color: i == shown ? AppPalette.accent : c.textMuted,
                          ),
                          child: Text(
                            widget.labels[i],
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            textAlign: i == 0
                                ? TextAlign.start
                                : i == 2
                                ? TextAlign.end
                                : TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ],
        );
      },
    );
  }

  Widget _thumb(double w, double inset, double span, bool rtl) {
    final f = (_pos.value / 2).clamp(0.0, 1.0);
    final x = inset + span * (rtl ? 1 - f : f);
    const size = 30.0;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          left: x - size,
          top: 24 - size + 3,
          width: size * 2,
          height: size * 2,
          child: IgnorePointer(
            child: AnimatedOpacity(
              opacity: _dragging ? 1 : 0.7,
              duration: _reduce ? Duration.zero : const Duration(milliseconds: 220),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(colors: [AppPalette.accent.withValues(alpha: 0.45), AppPalette.accent.withValues(alpha: 0)], stops: const [0.3, 1]),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          left: x - size / 2,
          top: 24 - size / 2,
          child: AnimatedScale(
            scale: _dragging ? 1.14 : 1,
            duration: _reduce ? Duration.zero : const Duration(milliseconds: 220),
            curve: Curves.easeOutCubic,
            child: Container(
              width: size,
              height: size,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                border: Border.all(color: AppPalette.accent, width: 3.5),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _TrackPainter extends CustomPainter {
  _TrackPainter({required this.pos, required this.rtl, required this.inset, required this.track, required this.dark});

  final double pos;
  final bool rtl;
  final double inset;
  final Color track;
  final bool dark;

  @override
  void paint(Canvas canvas, Size size) {
    const h = 8.0;
    final cy = size.height / 2;
    final left = inset - 10;
    final right = size.width - inset + 10;
    final full = RRect.fromLTRBR(left, cy - h / 2, right, cy + h / 2, const Radius.circular(h));
    canvas.drawRRect(full, Paint()..color = track);

    final span = size.width - inset * 2;
    final f = pos / 2;
    final thumbX = inset + span * (rtl ? 1 - f : f);
    final fillRect = rtl ? Rect.fromLTRB(thumbX, cy - h / 2, right, cy + h / 2) : Rect.fromLTRB(left, cy - h / 2, thumbX, cy + h / 2);
    final colors = [AppPalette.blue, Color.lerp(AppPalette.accent, AppPalette.coral, f * 0.25)!];
    canvas.drawRRect(
      RRect.fromRectAndRadius(fillRect, const Radius.circular(h)),
      Paint()..shader = LinearGradient(colors: rtl ? colors.reversed.toList() : colors).createShader(Rect.fromLTRB(left, 0, right, size.height)),
    );

    for (var i = 0; i < 3; i++) {
      final sf = i / 2;
      final x = inset + span * (rtl ? 1 - sf : sf);
      final filled = sf <= f + 0.001;
      canvas.drawCircle(
        Offset(x, cy),
        2.6,
        Paint()..color = filled ? Colors.white.withValues(alpha: 0.85) : (dark ? Colors.white.withValues(alpha: 0.35) : const Color(0x401B1838)),
      );
    }
  }

  @override
  bool shouldRepaint(_TrackPainter o) => o.pos != pos || o.rtl != rtl || o.track != track || o.dark != dark;
}

class _OrbPainter extends CustomPainter {
  _OrbPainter({required this.pos, required this.phase, required this.dark, required this.reduce}) : super(repaint: Listenable.merge([pos, phase]));

  final ValueListenable<double> pos;
  final ValueListenable<double> phase;
  final bool dark;
  final bool reduce;

  @override
  void paint(Canvas canvas, Size size) {
    final t = (pos.value / 2).clamp(0.0, 1.0);
    final ph = phase.value;
    final center = Offset(size.width / 2, size.height / 2);
    final breath = reduce ? 0.0 : math.sin(ph * math.pi * 2) * lerpDouble(0.012, 0.03, t)!;
    final r = lerpDouble(62, 78, t)! * (1 + breath);
    final warm = t * t; // warms only near "all the time"

    final ringColor = Color.lerp(AppPalette.violet, AppPalette.coral, warm * 0.3)!;
    final glowColor = Color.lerp(AppPalette.accent, AppPalette.coral, warm * 0.2)!;

    // Soft glow.
    final glowR = r * lerpDouble(1.55, 1.75, t)!;
    canvas.drawCircle(
      center,
      glowR,
      Paint()
        ..shader = RadialGradient(
          colors: [
            glowColor.withValues(alpha: (dark ? 0.38 : 0.26) * lerpDouble(0.8, 1.15, t)!),
            glowColor.withValues(alpha: 0),
          ],
          stops: const [0.45, 1],
        ).createShader(Rect.fromCircle(center: center, radius: glowR)),
    );

    // Ripple rings travelling outward.
    const rings = 3;
    final reach = lerpDouble(18, 24, t)!; // how far a ring travels (px)
    for (var i = 0; i < rings; i++) {
      final p = reduce ? (0.2 + i * 0.3) : (ph + i / rings) % 1.0;
      final rr = r + 6 + p * reach;
      final fade = math.sin(p * math.pi); // fade in and out
      final a = fade * lerpDouble(0.30, 0.55, t)! * (dark ? 1 : 0.85);
      canvas.drawCircle(
        center,
        rr,
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = lerpDouble(1.4, 1.1, p)!
          ..color = ringColor.withValues(alpha: a),
      );
    }

    final orbRect = Rect.fromCircle(center: center, radius: r);

    // Soft shadow under the orb so it floats (light only — dark relies on the glow).
    if (!dark) {
      final sh = Rect.fromCenter(center: center.translate(0, r * 0.32), width: r * 2.1, height: r * 1.7);
      canvas.drawOval(
        sh,
        Paint()..shader = RadialGradient(colors: [AppPalette.accent.withValues(alpha: 0.22), AppPalette.accent.withValues(alpha: 0)]).createShader(sh),
      );
    }

    // Body: blue → violet → accent (warming toward coral).
    canvas.drawCircle(
      center,
      r,
      Paint()
        ..shader = LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color.lerp(AppPalette.blue, AppPalette.violet, warm * 0.3)!,
            Color.lerp(AppPalette.blue, AppPalette.violet, 0.55 + 0.45 * t)!,
            Color.lerp(AppPalette.accent, AppPalette.coral, warm * 0.22)!,
          ],
          stops: const [0.0, 0.42, 1.0],
        ).createShader(orbRect),
    );

    // Depth: darker rim at the lower right.
    canvas.drawCircle(
      center,
      r,
      Paint()
        ..shader = RadialGradient(
          center: const Alignment(-0.3, -0.35),
          radius: 1.05,
          colors: [Colors.transparent, const Color(0xFF2A1A7A).withValues(alpha: 0.36)],
          stops: const [0.55, 1],
        ).createShader(orbRect),
    );

    // Glassy highlight.
    final hl = Rect.fromCircle(center: center.translate(-r * 0.32, -r * 0.38), radius: r * 0.62);
    canvas.drawOval(hl, Paint()..shader = RadialGradient(colors: [Colors.white.withValues(alpha: 0.55), Colors.white.withValues(alpha: 0)]).createShader(hl));
    // Small crisp specular.
    canvas.drawCircle(
      center.translate(-r * 0.38, -r * 0.44),
      r * 0.09,
      Paint()
        ..color = Colors.white.withValues(alpha: 0.55)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 3),
    );

    // Thin glass rim.
    canvas.drawCircle(
      center,
      r - 0.75,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.5
        ..shader = LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.white.withValues(alpha: 0.55), Colors.white.withValues(alpha: 0.05)],
        ).createShader(orbRect),
    );
  }

  @override
  bool shouldRepaint(_OrbPainter o) => o.dark != dark || o.reduce != reduce || o.pos != pos || o.phase != phase;
}

// =============================================================================
// BubblePicker — "More time for what?"
// =============================================================================

/// One answer in [BubblePicker].
class BubbleOption {
  const BubbleOption({required this.icon, required this.label});

  final IconData icon;
  final String label;
}

/// A calm cluster of glass bubbles; tap one to choose it.
/// Laid out for exactly six options (extra options are ignored).
class BubblePicker extends StatefulWidget {
  const BubblePicker({super.key, required this.options, required this.selected, required this.onSelect});

  final List<BubbleOption> options;
  final int? selected;
  final ValueChanged<int> onSelect;

  @override
  State<BubblePicker> createState() => _BubblePickerState();
}

class _BubblePickerState extends State<BubblePicker> with TickerProviderStateMixin {
  /// Normalized layout in a 340 × 330 reference box: centre x, centre y, diameter.
  static const _layout = <(double, double, double)>[(100, 64, 114), (244, 70, 100), (74, 182, 94), (204, 184, 112), (112, 280, 96), (266, 282, 92)];
  static const _refW = 340.0;
  static const _height = 330.0;

  late final AnimationController _drift = AnimationController(vsync: this, duration: const Duration(seconds: 7));
  late final AnimationController _enter = AnimationController(vsync: this, duration: const Duration(milliseconds: 720));
  bool _reduce = false;
  int? _pressed;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _reduce = MediaQuery.maybeDisableAnimationsOf(context) ?? false;
    if (_reduce) {
      _drift.stop();
      _enter.value = 1;
    } else {
      if (!_drift.isAnimating) _drift.repeat();
      if (_enter.value == 0 && !_enter.isAnimating) _enter.forward();
    }
  }

  @override
  void dispose() {
    _drift.dispose();
    _enter.dispose();
    super.dispose();
  }

  void _tap(int i) {
    HapticFeedback.selectionClick();
    widget.onSelect(i);
  }

  @override
  Widget build(BuildContext context) {
    final rtl = Directionality.of(context) == TextDirection.rtl;
    final n = math.min(widget.options.length, _layout.length);
    return LayoutBuilder(
      builder: (context, box) {
        final w = math.min(box.maxWidth.isFinite ? box.maxWidth : 380.0, 380.0);
        final sizeScale = math.min(1.0, w / _refW);
        final xScale = w / _refW;
        return Center(
          child: SizedBox(
            width: w,
            height: _height,
            child: AnimatedBuilder(
              animation: Listenable.merge([_drift, _enter]),
              builder: (context, _) => Stack(clipBehavior: Clip.none, children: [for (var i = 0; i < n; i++) _bubble(context, i, w, xScale, sizeScale, rtl)]),
            ),
          ),
        );
      },
    );
  }

  Widget _bubble(BuildContext context, int i, double w, double xScale, double sizeScale, bool rtl) {
    final (rx, ry, rd) = _layout[i];
    final d = rd * sizeScale;
    var cx = rx * xScale;
    if (rtl) cx = w - cx;
    final cy = _height / 2 + (ry - _height / 2) * (0.5 + sizeScale * 0.5);

    final sel = widget.selected;
    final isSel = sel == i;
    final dimmed = sel != null && !isSel;

    // Gentle drift on its own phase (skipped with reduced motion).
    var dx = 0.0, dy = 0.0;
    if (!_reduce) {
      final a = (_drift.value + i * 0.173) * math.pi * 2;
      final amp = isSel ? 1.2 : 2.6;
      dx = math.sin(a) * amp;
      dy = math.cos(a * 2 + i) * amp * 0.9;
    }

    // Staggered pop-in.
    final start = (i * 60) / _enter.duration!.inMilliseconds;
    final local = ((_enter.value - start) / (1 - 5 * 60 / _enter.duration!.inMilliseconds)).clamp(0.0, 1.0);
    final pop = _reduce ? 1.0 : lerpDouble(0.6, 1, Curves.easeOutBack.transform(local))!;
    final popOpacity = _reduce ? 1.0 : Curves.easeOut.transform(local);

    final scale = (isSel ? 1.18 : (dimmed ? 0.94 : 1.0)) * (_pressed == i ? 0.95 : 1.0);
    final dur = _reduce ? Duration.zero : const Duration(milliseconds: 420);

    return Positioned(
      left: cx - d / 2 + dx,
      top: cy - d / 2 + dy,
      width: d,
      height: d,
      child: Opacity(
        opacity: popOpacity,
        child: Transform.scale(
          scale: pop,
          child: Semantics(
            container: true,
            button: true,
            selected: isSel,
            inMutuallyExclusiveGroup: true,
            label: widget.options[i].label,
            onTap: () => _tap(i),
            child: ExcludeSemantics(
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTapDown: (_) => setState(() => _pressed = i),
                onTapCancel: () => setState(() => _pressed = null),
                onTapUp: (_) => setState(() => _pressed = null),
                onTap: () => _tap(i),
                child: AnimatedScale(
                  scale: scale,
                  duration: _pressed == i ? (_reduce ? Duration.zero : const Duration(milliseconds: 110)) : dur,
                  curve: _pressed == i ? Curves.easeOut : Curves.easeOutBack,
                  child: AnimatedOpacity(
                    opacity: dimmed ? 0.7 : 1,
                    duration: _reduce ? Duration.zero : const Duration(milliseconds: 300),
                    curve: Curves.easeOutCubic,
                    child: _BubbleFace(option: widget.options[i], diameter: d, selected: isSel, reduce: _reduce),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _BubbleFace extends StatelessWidget {
  const _BubbleFace({required this.option, required this.diameter, required this.selected, required this.reduce});

  final BubbleOption option;
  final double diameter;
  final bool selected;
  final bool reduce;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final dark = context.isDark;
    final dur = reduce ? Duration.zero : const Duration(milliseconds: 320);
    final textW = diameter * 0.78;
    final baseStyle = AppText.rowTitle.copyWith(fontWeight: FontWeight.w700, height: 1.18, letterSpacing: -0.1);
    final fontSize = _fitFont(option.label, baseStyle, textW, Directionality.of(context), MediaQuery.textScalerOf(context));

    final face = AnimatedContainer(
      duration: dur,
      curve: Curves.easeOutCubic,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: selected ? null : (dark ? Colors.white.withValues(alpha: 0.055) : Colors.white.withValues(alpha: 0.82)),
        gradient: selected ? const LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [AppPalette.blue, AppPalette.accent]) : null,
        border: Border.all(
          color: selected
              ? Colors.white.withValues(alpha: 0.35)
              : (dark ? Colors.white.withValues(alpha: 0.13) : const Color(0xFF1B1838).withValues(alpha: 0.06)),
          width: 1.2,
        ),
      ),
      child: Stack(
        children: [
          // Faint glass sheen on the upper-left.
          Positioned.fill(
            child: IgnorePointer(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    center: const Alignment(-0.45, -0.55),
                    radius: 0.9,
                    colors: [
                      Colors.white.withValues(alpha: selected ? 0.22 : (dark ? 0.07 : 0.5)),
                      Colors.white.withValues(alpha: 0),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TweenAnimationBuilder<Color?>(
                  tween: ColorTween(end: selected ? Colors.white : AppPalette.accent),
                  duration: dur,
                  builder: (context, col, _) => Icon(option.icon, size: diameter * 0.25, color: col),
                ),
                SizedBox(height: diameter * 0.045),
                SizedBox(
                  width: textW,
                  child: AnimatedDefaultTextStyle(
                    duration: dur,
                    curve: Curves.easeOutCubic,
                    style: baseStyle.copyWith(fontSize: fontSize, color: selected ? Colors.white : c.textPrimary),
                    child: Text(option.label, textAlign: TextAlign.center, maxLines: 2, overflow: TextOverflow.ellipsis),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );

    // Glow (selected) or soft drop shadow (light, idle) drawn as gradients so they stay soft everywhere.
    final halo = selected ? AppPalette.accent.withValues(alpha: dark ? 0.5 : 0.38) : const Color(0xFF3B2E8A).withValues(alpha: dark ? 0 : 0.07);
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          left: -diameter * 0.32,
          right: -diameter * 0.32,
          top: -diameter * (selected ? 0.24 : 0.2),
          bottom: -diameter * (selected ? 0.4 : 0.36),
          child: IgnorePointer(
            child: TweenAnimationBuilder<Color?>(
              tween: ColorTween(end: halo),
              duration: dur,
              curve: Curves.easeOutCubic,
              builder: (context, col, _) => DecoratedBox(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(colors: [col!, col.withValues(alpha: 0)], stops: const [0.45, 1]),
                ),
              ),
            ),
          ),
        ),
        Positioned.fill(child: face),
      ],
    );
  }

  /// Largest font (13 → 9.5) at which the label fits two lines and no single word is cut.
  static double _fitFont(String text, TextStyle style, double width, TextDirection dir, TextScaler scaler) {
    final words = text.split(RegExp(r'\s+'));
    for (var size = 13.0; size > 9.5; size -= 0.5) {
      final s = style.copyWith(fontSize: size);
      var ok = true;
      for (final word in words) {
        final tp = TextPainter(
          text: TextSpan(text: word, style: s),
          textDirection: dir,
          textScaler: scaler,
          maxLines: 1,
        )..layout();
        final wordW = tp.width;
        tp.dispose();
        if (wordW > width) {
          ok = false;
          break;
        }
      }
      if (ok) {
        final tp = TextPainter(
          text: TextSpan(text: text, style: s),
          textDirection: dir,
          textScaler: scaler,
          maxLines: 2,
        )..layout(maxWidth: width);
        final exceeded = tp.didExceedMaxLines;
        tp.dispose();
        if (!exceeded) return size;
      }
    }
    return 9.5;
  }
}
