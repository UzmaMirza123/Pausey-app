import 'dart:math' as math;
import 'dart:ui' show FontFeature, lerpDouble;

import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:flutter/services.dart';

import '../../../utils/app_theme.dart';

bool _reducedMotion(BuildContext context) => MediaQuery.maybeDisableAnimationsOf(context) ?? false;

// =============================================================================
// TimeRuler — "Your daily screen time"
// =============================================================================

/// A huge centred value over a tick ruler the user drags / flings under a fixed
/// centre needle. Snaps to [step] minutes, clamps to 0..[max].
class TimeRuler extends StatefulWidget {
  const TimeRuler({super.key, required this.minutes, required this.onChanged, required this.format, this.max = 720, this.step = 30, this.semanticsLabel});

  /// Current value (minutes). The ruler follows it when it changes from outside.
  final int minutes;

  /// Called with the snapped value (a multiple of [step]) whenever it changes.
  final ValueChanged<int> onChanged;

  /// Turns minutes into the big label, e.g. "4h 30m".
  final String Function(int minutes) format;
  final int max;
  final int step;

  /// Optional screen-reader label (e.g. "Daily screen time").
  final String? semanticsLabel;

  @override
  State<TimeRuler> createState() => _TimeRulerState();
}

class _TimeRulerState extends State<TimeRuler> with SingleTickerProviderStateMixin {
  /// Pixels between two ticks.
  static const double _gap = 24;
  static const double _rulerHeight = 112;

  late final AnimationController _anim = AnimationController.unbounded(vsync: this)
    ..addListener(_onAnim)
    ..addStatusListener(_onAnimStatus);

  late double _pos;
  late int _value;
  late int _emitted;
  late int _hour;
  double? _target;
  bool _dragging = false;
  int _dir = 1; // +1 when the value went up last time (for the label slide)

  double get _ppm => _gap / widget.step;

  int _snap(double v) => ((v / widget.step).round() * widget.step).clamp(0, widget.max ~/ widget.step * widget.step);

  @override
  void initState() {
    super.initState();
    _pos = widget.minutes.clamp(0, widget.max).toDouble();
    _value = _emitted = _snap(_pos);
    _hour = (_pos / 60).floor();
  }

  @override
  void didUpdateWidget(TimeRuler old) {
    super.didUpdateWidget(old);
    final m = widget.minutes.clamp(0, widget.max);
    if (!_dragging && !_anim.isAnimating && m != _value) {
      _dir = m > _value ? 1 : -1;
      _pos = m.toDouble();
      _value = _emitted = m;
      _hour = (_pos / 60).floor();
    }
  }

  @override
  void dispose() {
    _anim.dispose();
    super.dispose();
  }

  void _setPos(double v) {
    v = v.clamp(0, widget.max.toDouble());
    final h = (v / 60).floor();
    if (h != _hour) {
      _hour = h;
      HapticFeedback.selectionClick();
    }
    final s = _snap(v);
    setState(() {
      _pos = v;
      if (s != _value) {
        _dir = s > _value ? 1 : -1;
        _value = s;
      }
    });
    if (s != _emitted) {
      _emitted = s;
      widget.onChanged(s);
    }
  }

  void _onAnim() => _setPos(_anim.value);

  void _onAnimStatus(AnimationStatus s) {
    if (s == AnimationStatus.completed && _target != null) {
      final t = _target!;
      _target = null;
      _setPos(t);
      HapticFeedback.lightImpact();
    }
  }

  int get _axis => Directionality.of(context) == TextDirection.rtl ? -1 : 1;

  /// Glide (or jump, in reduced motion) to [target] minutes.
  void _settleTo(double target, {double velocity = 0}) {
    final t = _snap(target).toDouble();
    if (_reducedMotion(context)) {
      _anim.stop();
      _setPos(t);
      HapticFeedback.lightImpact();
      return;
    }
    _target = t;
    _anim.value = _pos; // fires a no-op _setPos
    final spring = SpringDescription.withDampingRatio(mass: 1, stiffness: 170, ratio: 1.0);
    _anim.animateWith(SpringSimulation(spring, _pos, t, velocity, tolerance: const Tolerance(distance: 0.5, velocity: 2)));
  }

  void _onDragStart(DragStartDetails d) {
    _anim.stop();
    _target = null;
    _dragging = true;
  }

  void _onDragUpdate(DragUpdateDetails d) => _setPos(_pos - d.delta.dx * _axis / _ppm);

  void _onDragEnd(DragEndDetails d) {
    _dragging = false;
    // minutes per second
    final v = -d.velocity.pixelsPerSecond.dx * _axis / _ppm;
    // Where friction would bring it, then snap there with a spring that keeps the fling's speed.
    final projected = FrictionSimulation(0.06, _pos, v).finalX;
    final clamped = projected.clamp(0.0, widget.max.toDouble());
    _settleTo(clamped, velocity: projected == clamped ? v : v * 0.25);
  }

  void _onTapUp(TapUpDetails d, double width) {
    final delta = (d.localPosition.dx - width / 2) * _axis / _ppm;
    _settleTo((_pos + delta).clamp(0.0, widget.max.toDouble()));
  }

  static Color colorFor(double minutes) {
    final h = minutes / 60;
    if (h <= 2) return AppPalette.teal;
    if (h <= 5) return Color.lerp(AppPalette.teal, AppPalette.accent, Curves.easeInOut.transform((h - 2) / 3))!;
    if (h < 8) return Color.lerp(AppPalette.accent, AppPalette.coral, Curves.easeInOut.transform((h - 5) / 3))!;
    return AppPalette.coral;
  }

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final reduced = _reducedMotion(context);
    final color = colorFor(_pos);
    final text = widget.format(_value);
    final style = AppText.heroValue.copyWith(fontSize: 56, height: 1.1, letterSpacing: -2, color: color, fontFeatures: const [FontFeature.tabularFigures()]);

    final label = SizedBox(
      height: 66,
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: AnimatedSwitcher(
          duration: reduced ? Duration.zero : const Duration(milliseconds: 220),
          switchInCurve: Curves.easeOutCubic,
          switchOutCurve: Curves.easeInCubic,
          layoutBuilder: (cur, prev) => Stack(alignment: Alignment.center, children: [...prev, ?cur]),
          transitionBuilder: (child, a) {
            final incoming = child.key == ValueKey(text);
            final dy = (incoming ? 0.35 : -0.35) * _dir;
            return FadeTransition(
              opacity: a,
              child: SlideTransition(
                position: Tween(begin: Offset(0, dy), end: Offset.zero).animate(a),
                child: child,
              ),
            );
          },
          child: Text(text, key: ValueKey(text), maxLines: 1, style: style),
        ),
      ),
    );

    final ruler = LayoutBuilder(
      builder: (context, box) {
        final w = box.maxWidth;
        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onHorizontalDragStart: _onDragStart,
          onHorizontalDragUpdate: _onDragUpdate,
          onHorizontalDragEnd: _onDragEnd,
          onHorizontalDragCancel: () => _dragging = false,
          onTapUp: (d) => _onTapUp(d, w),
          child: ShaderMask(
            blendMode: BlendMode.dstIn,
            shaderCallback: (r) => const LinearGradient(
              colors: [Color(0x00FFFFFF), Color(0xFFFFFFFF), Color(0xFFFFFFFF), Color(0x00FFFFFF)],
              stops: [0, 0.24, 0.76, 1],
            ).createShader(r),
            child: CustomPaint(
              size: Size(w, _rulerHeight),
              painter: _RulerPainter(
                pos: _pos,
                max: widget.max,
                step: widget.step,
                ppm: _ppm,
                axis: _axis,
                tick: c.textMuted,
                tickFaint: c.dotInactive,
                fill: color,
                number: c.textSecondary,
                isDark: context.isDark,
              ),
            ),
          ),
        );
      },
    );

    return Semantics(
      slider: true,
      label: widget.semanticsLabel,
      value: text,
      increasedValue: widget.format(math.min(_value + widget.step, widget.max)),
      decreasedValue: widget.format(math.max(_value - widget.step, 0)),
      onIncrease: _value < widget.max ? () => _settleTo((_value + widget.step).toDouble()) : null,
      onDecrease: _value > 0 ? () => _settleTo((_value - widget.step).toDouble()) : null,
      child: ExcludeSemantics(
        child: SizedBox(
          height: 200,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [label, const SizedBox(height: 18), ruler]),
        ),
      ),
    );
  }
}

class _RulerPainter extends CustomPainter {
  _RulerPainter({
    required this.pos,
    required this.max,
    required this.step,
    required this.ppm,
    required this.axis,
    required this.tick,
    required this.tickFaint,
    required this.fill,
    required this.number,
    required this.isDark,
  });

  final double pos;
  final int max;
  final int step;
  final double ppm;
  final int axis;
  final Color tick;
  final Color tickFaint;
  final Color fill;
  final Color number;
  final bool isDark;

  static const double _base = 74; // ticks grow up from here

  @override
  void paint(Canvas canvas, Size size) {
    final cx = size.width / 2;
    final p = Paint()..strokeCap = StrokeCap.round;
    final count = max ~/ step;

    // Faint baseline across the whole range.
    final x0 = cx + (0 - pos) * ppm * axis;
    final x1 = cx + (count * step - pos) * ppm * axis;
    canvas.drawLine(
      Offset(math.min(x0, x1), _base + 0.5),
      Offset(math.max(x0, x1), _base + 0.5),
      Paint()
        ..color = tickFaint
        ..strokeWidth = 1,
    );

    // The part already "spent" glows in the value colour.
    final xp = cx + (0 - pos) * ppm * axis;
    if ((xp - cx).abs() > 0.5) {
      canvas.drawLine(
        Offset(math.min(xp, cx), _base + 0.5),
        Offset(math.max(xp, cx), _base + 0.5),
        Paint()
          ..color = fill
          ..strokeWidth = 2
          ..strokeCap = StrokeCap.round,
      );
    }

    for (var k = 0; k <= count; k++) {
      final m = k * step;
      final x = cx + (m - pos) * ppm * axis;
      if (x < -20 || x > size.width + 20) continue;
      final hour = m % 60 == 0;
      final d = (x - cx).abs();
      // A soft "magnifier" near the needle.
      final lift = math.exp(-math.pow(d / 70, 2));
      final h = (hour ? 34.0 : 16.0) * (1 + 0.5 * lift);
      final passed = m <= pos + 0.01;
      p
        ..strokeWidth = hour ? 3 : 1.8
        ..color = passed ? Color.lerp(Color.alphaBlend(tick.withValues(alpha: tick.a * 0.5), fill), fill, lift)! : (hour ? tick : tickFaint);
      canvas.drawLine(Offset(x, _base - h), Offset(x, _base), p);

      if (hour) {
        final tp = TextPainter(
          text: TextSpan(
            text: '${m ~/ 60}',
            style: AppText.small.copyWith(
              fontSize: 13,
              color: Color.lerp(number, fill, lift * 0.8)!.withValues(alpha: (0.55 + 0.45 * lift) * number.a),
              fontFeatures: const [FontFeature.tabularFigures()],
            ),
          ),
          textDirection: TextDirection.ltr,
        )..layout();
        tp.paint(canvas, Offset(x - tp.width / 2, _base + 11));
        tp.dispose();
      }
    }

    // Fixed centre needle with a small glowing dot on top.
    const top = 8.0;
    const bottom = _base + 6;
    canvas.drawLine(
      const Offset(0, top) + Offset(cx, 0),
      Offset(cx, bottom),
      Paint()
        ..color = AppPalette.accent.withValues(alpha: 0.28)
        ..strokeWidth = 10
        ..strokeCap = StrokeCap.round
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 6),
    );
    canvas.drawLine(
      Offset(cx, top),
      Offset(cx, bottom),
      Paint()
        ..color = AppPalette.accent
        ..strokeWidth = 4
        ..strokeCap = StrokeCap.round,
    );
    canvas.drawCircle(
      Offset(cx, top),
      9,
      Paint()
        ..color = AppPalette.accent.withValues(alpha: isDark ? 0.55 : 0.4)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 6),
    );
    canvas.drawCircle(Offset(cx, top), 5.5, Paint()..color = AppPalette.accent);
    canvas.drawCircle(Offset(cx, top), 2.2, Paint()..color = const Color(0xFFFFFFFF));
  }

  @override
  bool shouldRepaint(_RulerPainter o) =>
      o.pos != pos ||
      o.max != max ||
      o.step != step ||
      o.axis != axis ||
      o.fill != fill ||
      o.tick != tick ||
      o.tickFaint != tickFaint ||
      o.number != number ||
      o.isDark != isDark;
}

// =============================================================================
// LifeReclaim — "This is your life in dots" + hold to take them back
// =============================================================================

/// A dot grid of the user's remaining waking life. The last [phoneFraction] of the
/// dots are "time on your phone" (accent). Holding the button turns them teal one
/// by one; on completion [onReclaimed] is called once.
class LifeReclaim extends StatefulWidget {
  const LifeReclaim({
    super.key,
    required this.phoneFraction,
    required this.holdLabel,
    required this.doneLabel,
    required this.onReclaimed,
    this.reclaimed = false,
    this.semanticsHint,
    this.columns = 20,
    this.rows = 26,
  });

  /// 0..1 share of the dots that are phone time.
  final double phoneFraction;
  final String holdLabel;
  final String doneLabel;
  final VoidCallback onReclaimed;

  /// Start in the completed state.
  final bool reclaimed;

  /// Screen-reader hint for the hold button (e.g. "Double-tap to take your time back").
  final String? semanticsHint;
  final int columns;
  final int rows;

  @override
  State<LifeReclaim> createState() => _LifeReclaimState();
}

class _LifeReclaimState extends State<LifeReclaim> with TickerProviderStateMixin {
  static const _holdTime = Duration(milliseconds: 2200);
  static const double _buttonHeight = 64;
  static const double _gapBelowGrid = 32;
  static const int _hapticSteps = 14;

  late final AnimationController _entrance = AnimationController(vsync: this, duration: const Duration(milliseconds: 1500));
  late final AnimationController _shimmer = AnimationController(vsync: this, duration: const Duration(milliseconds: 2600));
  late final AnimationController _hold = AnimationController(vsync: this, duration: _holdTime);
  late final AnimationController _burst = AnimationController(vsync: this, duration: const Duration(milliseconds: 1100));

  bool _started = false;
  bool _done = false;
  bool _pressed = false;
  int _hapticAt = 0;

  @override
  void initState() {
    super.initState();
    _done = widget.reclaimed;
    if (_done) {
      _entrance.value = 1;
      _hold.value = 1;
    }
    _hold.addListener(_onHold);
    _hold.addStatusListener(_onHoldStatus);
    _entrance.addStatusListener((s) {
      if (s == AnimationStatus.completed && mounted && !_done && !_reducedMotion(context)) _shimmer.repeat();
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final reduced = _reducedMotion(context);
    if (!_started) {
      _started = true;
      if (reduced) {
        _entrance.value = 1;
      } else if (!_done) {
        _entrance.forward();
      }
    } else if (reduced) {
      _shimmer.stop();
      _shimmer.value = 0;
      if (_entrance.isAnimating) _entrance.value = 1;
    }
  }

  @override
  void didUpdateWidget(LifeReclaim old) {
    super.didUpdateWidget(old);
    if (widget.reclaimed && !_done) {
      setState(() => _done = true);
      _entrance.value = 1;
      _shimmer.stop();
      _hold.value = 1;
    }
  }

  @override
  void dispose() {
    _entrance.dispose();
    _shimmer.dispose();
    _hold.dispose();
    _burst.dispose();
    super.dispose();
  }

  void _onHold() {
    if (_done) return;
    final s = (_hold.value * _hapticSteps).floor();
    if (_hold.status == AnimationStatus.forward && s > _hapticAt) {
      HapticFeedback.lightImpact();
    }
    _hapticAt = s;
  }

  void _onHoldStatus(AnimationStatus s) {
    if (s != AnimationStatus.completed || _done) return;
    HapticFeedback.heavyImpact();
    _shimmer.stop();
    setState(() {
      _done = true;
      _pressed = false;
    });
    if (!_reducedMotion(context)) _burst.forward(from: 0);
    widget.onReclaimed();
  }

  void _down() {
    if (_done) return;
    setState(() => _pressed = true);
    if (_entrance.isAnimating) _entrance.value = 1;
    HapticFeedback.selectionClick();
    _hold.forward();
  }

  void _up() {
    if (_done) return;
    setState(() => _pressed = false);
    if (_hold.isCompleted) return;
    if (_reducedMotion(context)) {
      _hold.value = 0;
    } else {
      final ms = (500 * _hold.value).round().clamp(120, 500);
      _hold.animateBack(
        0,
        duration: Duration(milliseconds: ms),
        curve: Curves.easeOutCubic,
      );
    }
  }

  /// Screen readers: one activation completes the gesture.
  void _activate() {
    if (_done) return;
    if (_reducedMotion(context)) {
      _hold.value = 1;
    } else {
      _hold.animateTo(
        1,
        duration: Duration(milliseconds: (600 * (1 - _hold.value)).round().clamp(1, 600)),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final reduced = _reducedMotion(context);
    final rtl = Directionality.of(context) == TextDirection.rtl;
    final total = widget.columns * widget.rows;
    final phone = (total * widget.phoneFraction.clamp(0.0, 1.0)).round().clamp(0, total);

    return LayoutBuilder(
      builder: (context, box) {
        final w = math.min(box.maxWidth.isFinite ? box.maxWidth : 360.0, 360.0);
        var cell = w / widget.columns;
        if (box.maxHeight.isFinite) {
          cell = math.min(cell, (box.maxHeight - _gapBelowGrid - _buttonHeight) / widget.rows);
        }
        cell = math.max(cell, 4);
        final gridW = cell * widget.columns;
        final gridH = cell * widget.rows;

        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ExcludeSemantics(
              child: RepaintBoundary(
                child: CustomPaint(
                  size: Size(gridW, gridH),
                  painter: _LifeGridPainter(
                    entrance: _entrance,
                    shimmer: _shimmer,
                    hold: _hold,
                    burst: _burst,
                    columns: widget.columns,
                    rows: widget.rows,
                    phone: phone,
                    rtl: rtl,
                    muted: c.dotInactive,
                    reduced: reduced,
                    isDark: context.isDark,
                  ),
                ),
              ),
            ),
            const SizedBox(height: _gapBelowGrid),
            SizedBox(width: w, child: _holdButton(context)),
          ],
        );
      },
    );
  }

  Widget _holdButton(BuildContext context) {
    final c = context.colors;
    final reduced = _reducedMotion(context);
    final labelStyle = AppText.button.copyWith(fontSize: 17);

    Widget label(Color color, {required bool done}) => Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(done ? Icons.check_rounded : Icons.fingerprint_rounded, size: 22, color: color),
        const SizedBox(width: 10),
        Flexible(
          child: Text(
            done ? widget.doneLabel : widget.holdLabel,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: labelStyle.copyWith(color: color),
          ),
        ),
      ],
    );

    final body = AnimatedBuilder(
      animation: Listenable.merge([_hold, _burst]),
      builder: (context, _) {
        final h = _done ? 1.0 : _hold.value;
        final b = _burst.value;
        final pop = _done && !reduced ? 1 + 0.05 * math.sin(math.pi * Curves.easeOut.transform(b)) : 1.0;
        return Transform.scale(
          scale: pop,
          child: AnimatedScale(
            scale: _pressed ? 0.975 : 1,
            duration: reduced ? Duration.zero : const Duration(milliseconds: 160),
            curve: Curves.easeOut,
            child: Container(
              height: _buttonHeight,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(_buttonHeight / 2),
                color: _done ? AppPalette.teal : Color.alphaBlend(c.glassFill, c.background[1]),
                border: Border.all(color: _done ? AppPalette.teal : AppPalette.accent.withValues(alpha: 0.45), width: 1.4),
                boxShadow: [
                  BoxShadow(
                    color: (_done ? AppPalette.teal : AppPalette.accent).withValues(alpha: _done ? 0.32 : 0.08 + 0.24 * h),
                    blurRadius: 28,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(_buttonHeight / 2),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    if (!_done) ...[
                      // The sweep.
                      Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: FractionallySizedBox(
                          widthFactor: h,
                          heightFactor: 1,
                          child: const DecoratedBox(
                            decoration: BoxDecoration(gradient: LinearGradient(colors: [AppPalette.accent, AppPalette.violet])),
                          ),
                        ),
                      ),
                      Center(
                        child: Padding(padding: const EdgeInsets.symmetric(horizontal: 20), child: label(c.textPrimary, done: false)),
                      ),
                      // Same label in white, revealed by the sweep.
                      ClipRect(
                        clipper: _SweepClipper(h, Directionality.of(context)),
                        child: Center(
                          child: Padding(padding: const EdgeInsets.symmetric(horizontal: 20), child: label(Colors.white, done: false)),
                        ),
                      ),
                    ] else
                      Center(
                        child: Padding(padding: const EdgeInsets.symmetric(horizontal: 20), child: label(Colors.white, done: true)),
                      ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );

    return Semantics(
      button: true,
      enabled: !_done,
      label: _done ? widget.doneLabel : widget.holdLabel,
      hint: _done ? null : widget.semanticsHint,
      onTap: _done ? null : _activate,
      excludeSemantics: true,
      child: GestureDetector(behavior: HitTestBehavior.opaque, onTapDown: (_) => _down(), onTapUp: (_) => _up(), onTapCancel: _up, child: body),
    );
  }
}

class _SweepClipper extends CustomClipper<Rect> {
  _SweepClipper(this.t, this.dir);
  final double t;
  final TextDirection dir;

  @override
  Rect getClip(Size size) {
    final w = size.width * t;
    return dir == TextDirection.rtl ? Rect.fromLTWH(size.width - w, 0, w, size.height) : Rect.fromLTWH(0, 0, w, size.height);
  }

  @override
  bool shouldReclip(_SweepClipper o) => o.t != t || o.dir != dir;
}

class _LifeGridPainter extends CustomPainter {
  _LifeGridPainter({
    required this.entrance,
    required this.shimmer,
    required this.hold,
    required this.burst,
    required this.columns,
    required this.rows,
    required this.phone,
    required this.rtl,
    required this.muted,
    required this.reduced,
    required this.isDark,
  }) : super(repaint: Listenable.merge([entrance, shimmer, hold, burst]));

  final Animation<double> entrance;
  final Animation<double> shimmer;
  final Animation<double> hold;
  final Animation<double> burst;
  final int columns;
  final int rows;
  final int phone;
  final bool rtl;
  final Color muted;
  final bool reduced;
  final bool isDark;

  static const _rowsEnd = 0.6; // share of the entrance used by the row fade-in

  @override
  void paint(Canvas canvas, Size size) {
    final cell = size.width / columns;
    final r = cell * 0.27;
    final total = columns * rows;
    final first = total - phone;
    final e = entrance.value;
    final s = shimmer.value;
    final h = hold.value;
    final b = burst.value;
    final dot = Paint()..isAntiAlias = true;
    final halo = Paint()..isAntiAlias = true;

    // Phone section geometry (for the burst).
    final firstRow = first ~/ columns;
    final center = Offset(size.width / 2, (firstRow * cell + size.height) / 2);
    final maxD = math.max(1.0, (Offset(size.width, size.height) - center).distance);

    // Hold sweep: a short window of dots in transition at any moment.
    final win = math.max(3.0, phone * 0.07);
    final reach = h * (phone + win);

    final shimmerOn = !reduced && shimmer.isAnimating;

    for (var i = 0; i < total; i++) {
      final row = i ~/ columns;
      final col = i % columns;
      final x = ((rtl ? columns - 1 - col : col) + 0.5) * cell;
      final y = (row + 0.5) * cell;

      // Row-by-row fade in.
      final rt = ((e / _rowsEnd) * (rows + 3) - row) / 3;
      final appear = Curves.easeOut.transform(rt.clamp(0.0, 1.0));
      if (appear <= 0) continue;
      var scale = 0.55 + 0.45 * appear;
      var color = muted.withValues(alpha: muted.a * appear);

      if (i >= first && phone > 0) {
        final j = i - first;
        // Light up after the rows are in, from the top of the phone section.
        final lt = ((e - _rowsEnd) / (1 - _rowsEnd)).clamp(0.0, 1.0);
        final on = Curves.easeOutCubic.transform((lt * 1.6 - (j / phone) * 0.6).clamp(0.0, 1.0));
        var accent = AppPalette.accent;
        if (shimmerOn) {
          final phase = ((row - firstRow) * 0.6 + col * 0.35) / ((rows - firstRow) * 0.6 + columns * 0.35);
          var d = (phase - s).abs();
          d = math.min(d, 1 - d);
          final glow = math.exp(-math.pow(d * 7, 2)) * 0.55;
          accent = Color.lerp(AppPalette.accent, AppPalette.violet, glow)!;
        }
        // Hold: accent → teal with a tiny pop.
        final tj = ((reach - j) / win).clamp(0.0, 1.0);
        final target = Color.lerp(accent, AppPalette.teal, Curves.easeInOut.transform(tj))!;
        color = Color.lerp(color, target, on)!;
        if (!reduced) scale *= 1 + 0.55 * math.sin(math.pi * tj) * (tj < 1 ? 1 : 0);
        scale *= lerpDouble(1, 1.08, on)!;

        // Completion burst: a ripple travelling out from the middle of the section.
        if (b > 0 && b < 1) {
          final dist = (Offset(x, y) - center).distance;
          final front = Curves.easeOut.transform(b) * maxD * 1.25;
          final k = (dist - front) / (cell * 2.2);
          final bump = math.exp(-k * k) * (1 - b);
          scale *= 1 + 0.75 * bump;
          color = Color.lerp(color, const Color(0xFFFFFFFF), 0.45 * bump)!;
        }

        if (on > 0) {
          halo.color = color.withValues(alpha: (isDark ? 0.16 : 0.09) * on);
          canvas.drawCircle(Offset(x, y), r * scale * 1.6, halo);
        }
      }

      dot.color = color;
      canvas.drawCircle(Offset(x, y), r * scale, dot);
    }
  }

  @override
  bool shouldRepaint(_LifeGridPainter o) =>
      o.columns != columns || o.rows != rows || o.phone != phone || o.rtl != rtl || o.muted != muted || o.reduced != reduced || o.isDark != isDark;
}
