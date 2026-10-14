import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../../utils/app_theme.dart';
import '../../../widgets/ui_kit.dart';

/// Two-option segmented control (Analytics | Screen Time).
class InsightsSegment extends StatelessWidget {
  const InsightsSegment({super.key, required this.labels, required this.index, required this.onChanged});

  final List<String> labels;
  final int index;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    return Container(
      height: 44,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: c.glassFill,
        borderRadius: BorderRadius.circular(AppRadius.chip),
        border: Border.all(color: c.glassBorder),
      ),
      child: LayoutBuilder(
        builder: (context, box) {
          final w = box.maxWidth / labels.length;
          return Stack(
            children: [
              AnimatedPositionedDirectional(
                duration: const Duration(milliseconds: 260),
                curve: Curves.easeOutCubic,
                start: w * index,
                top: 0,
                bottom: 0,
                width: w,
                child: DecoratedBox(
                  decoration: BoxDecoration(gradient: heroGradient, borderRadius: BorderRadius.circular(AppRadius.chip)),
                ),
              ),
              Row(
                children: [
                  for (var i = 0; i < labels.length; i++)
                    Expanded(
                      child: Semantics(
                        button: true,
                        selected: i == index,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(AppRadius.chip),
                          onTap: () => onChanged(i),
                          child: Center(
                            child: AnimatedDefaultTextStyle(
                              duration: const Duration(milliseconds: 200),
                              style: AppText.rowSub.copyWith(fontWeight: FontWeight.w700, color: i == index ? Colors.white : c.textSecondary),
                              child: Text(labels[i], maxLines: 1, overflow: TextOverflow.ellipsis),
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
      ),
    );
  }
}

/// Fades + slides a child in, with a small delay per [index].
class FadeSlideIn extends StatelessWidget {
  const FadeSlideIn({super.key, required this.index, required this.child});

  final int index;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: 1),
      duration: Duration(milliseconds: 380 + index * 70),
      curve: Curves.easeOutCubic,
      builder: (_, t, child) => Opacity(
        opacity: t,
        child: Transform.translate(offset: Offset(0, 18 * (1 - t)), child: child),
      ),
      child: child,
    );
  }
}

/// Number that counts up when it changes.
class CountUp extends StatelessWidget {
  const CountUp({super.key, required this.value, required this.style, this.format});

  final int value;
  final TextStyle style;
  final String Function(int v)? format;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: value.toDouble()),
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeOutCubic,
      builder: (_, v, _) => Text(format?.call(v.round()) ?? '${v.round()}', style: style, maxLines: 1),
    );
  }
}

/// Small up/down change chip ("↗ +9 pts").
class DeltaText extends StatelessWidget {
  const DeltaText({super.key, required this.text, required this.up, required this.good, this.onDark = false});

  final String text;
  final bool up;

  /// Is this change good news? (green vs red)
  final bool good;
  final bool onDark;

  @override
  Widget build(BuildContext context) {
    final color = onDark ? Colors.white : (good ? Tone.green : Tone.red);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(up ? Icons.trending_up_rounded : Icons.trending_down_rounded, size: 15, color: color),
        const SizedBox(width: 4),
        Flexible(
          child: Text(
            text,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppText.rowSub.copyWith(fontWeight: FontWeight.w700, color: color),
          ),
        ),
      ],
    );
  }
}

/// Coloured dot + label (chart legends).
class LegendDot extends StatelessWidget {
  const LegendDot({super.key, required this.color, required this.label, this.hollow = false});

  final Color color;
  final String label;
  final bool hollow;

  @override
  Widget build(BuildContext context) => Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Container(
        width: 8,
        height: 8,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: hollow ? null : color,
          border: hollow ? Border.all(color: color, width: 1.4) : null,
        ),
      ),
      const SizedBox(width: 5),
      Text(label, style: AppText.small.copyWith(color: context.colors.textMuted)),
    ],
  );
}

/// Thin bars for many values (30-day view); labels every [labelEvery] bars.
class ThinBars extends StatelessWidget {
  const ThinBars({super.key, required this.values, required this.labelFor, this.highlight, this.height = 110, this.labelEvery = 7});

  final List<int> values;
  final String Function(int i) labelFor;
  final int? highlight;
  final double height;
  final int labelEvery;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final maxV = math.max(1, values.fold<int>(0, math.max));
    return Column(
      children: [
        SizedBox(
          height: height,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              for (var i = 0; i < values.length; i++)
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 1.5),
                    child: TweenAnimationBuilder<double>(
                      tween: Tween(begin: 0, end: values[i] / maxV),
                      duration: Duration(milliseconds: 500 + i * 15),
                      curve: Curves.easeOutCubic,
                      builder: (_, f, _) => Container(
                        height: math.max(4, height * f),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: i == highlight ? Tone.violet : Tone.violet.withValues(alpha: context.isDark ? 0.32 : 0.24),
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
        const SizedBox(height: 6),
        Row(
          children: [
            for (var i = 0; i < values.length; i++)
              Expanded(
                child: (values.length - 1 - i) % labelEvery == 0
                    ? SizedBox(
                        height: 14,
                        child: OverflowBox(
                          maxWidth: 60,
                          maxHeight: 14,
                          child: Text(
                            labelFor(i),
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            style: AppText.small.copyWith(color: i == highlight ? Tone.violet : c.textMuted),
                          ),
                        ),
                      )
                    : const SizedBox(height: 14),
              ),
          ],
        ),
      ],
    );
  }
}

/// Stacked bars: [a] (bottom, violet) + [b] (top, green) per column.
class StackedBars extends StatelessWidget {
  const StackedBars({super.key, required this.a, required this.b, required this.labels, this.highlight, this.height = 120});

  final List<int> a, b;
  final List<String> labels;
  final int? highlight;
  final double height;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    var maxV = 1;
    for (var i = 0; i < a.length; i++) {
      maxV = math.max(maxV, a[i] + b[i]);
    }
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        for (var i = 0; i < a.length; i++) ...[
          if (i > 0) const SizedBox(width: 8),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TweenAnimationBuilder<double>(
                  tween: Tween(begin: 0, end: 1),
                  duration: Duration(milliseconds: 500 + i * 60),
                  curve: Curves.easeOutCubic,
                  builder: (_, t, _) {
                    // Leave room for the 2px gap and the 4px minimum bar so the stack never overflows.
                    final room = height - 6;
                    final ha = room * a[i] / maxV * t, hb = room * b[i] / maxV * t;
                    return SizedBox(
                      height: height,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          if (b[i] > 0)
                            Container(
                              height: math.max(4, hb),
                              decoration: BoxDecoration(
                                color: Tone.green,
                                borderRadius: BorderRadius.vertical(top: const Radius.circular(8), bottom: Radius.circular(a[i] > 0 ? 2 : 8)),
                              ),
                            ),
                          if (a[i] > 0 && b[i] > 0) const SizedBox(height: 2),
                          Container(
                            height: math.max(4, ha),
                            decoration: BoxDecoration(
                              color: i == highlight ? Tone.violet : Tone.violet.withValues(alpha: context.isDark ? 0.38 : 0.28),
                              borderRadius: BorderRadius.vertical(top: Radius.circular(b[i] > 0 ? 2 : 8), bottom: const Radius.circular(8)),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                const SizedBox(height: 6),
                Text(
                  labels[i],
                  maxLines: 1,
                  overflow: TextOverflow.clip,
                  style: AppText.small.copyWith(color: i == highlight ? Tone.violet : c.textMuted),
                ),
              ],
            ),
          ),
        ],
      ],
    );
  }
}

/// Donut chart with a centred label.
class Donut extends StatelessWidget {
  const Donut({super.key, required this.values, required this.colors, this.size = 110, this.child});

  final List<double> values;
  final List<Color> colors;
  final double size;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: 1),
      duration: const Duration(milliseconds: 900),
      curve: Curves.easeOutCubic,
      builder: (_, t, _) => SizedBox.square(
        dimension: size,
        child: CustomPaint(
          painter: _DonutPainter(values, colors, context.colors.dotInactive, t),
          child: Center(child: child),
        ),
      ),
    );
  }
}

class _DonutPainter extends CustomPainter {
  _DonutPainter(this.v, this.colors, this.track, this.t);
  final List<double> v;
  final List<Color> colors;
  final Color track;
  final double t;

  @override
  void paint(Canvas canvas, Size size) {
    const stroke = 14.0;
    final r = Rect.fromLTWH(stroke / 2, stroke / 2, size.width - stroke, size.height - stroke);
    canvas.drawArc(
      r,
      0,
      math.pi * 2,
      false,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = stroke
        ..color = track,
    );
    final sum = v.fold<double>(0, (a, b) => a + b);
    if (sum <= 0) return;
    var start = -math.pi / 2;
    const gap = 0.06;
    for (var i = 0; i < v.length; i++) {
      final sweep = math.pi * 2 * v[i] / sum * t;
      if (sweep > gap) {
        canvas.drawArc(
          r,
          start + gap / 2,
          sweep - gap,
          false,
          Paint()
            ..style = PaintingStyle.stroke
            ..strokeWidth = stroke
            ..strokeCap = StrokeCap.round
            ..color = colors[i % colors.length],
        );
      }
      start += sweep;
    }
  }

  @override
  bool shouldRepaint(_DonutPainter o) => o.t != t || o.v != v || o.track != track;
}

/// Four week tiles: actual vs goal (dashed outline = goal height).
class WeekTiles extends StatelessWidget {
  const WeekTiles({super.key, required this.values, required this.goal, required this.labels, this.height = 90});

  final List<int> values;
  final int goal;
  final List<String> labels;
  final double height;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final maxV = math.max(goal, values.fold<int>(0, math.max)).clamp(1, 1 << 30);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        for (var i = 0; i < values.length; i++) ...[
          if (i > 0) const SizedBox(width: 10),
          Expanded(
            child: Column(
              children: [
                SizedBox(
                  height: height,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Positioned(
                        left: 0,
                        right: 0,
                        bottom: 0,
                        height: height * goal / maxV,
                        child: CustomPaint(painter: _DashedRRect(c.textMuted.withValues(alpha: 0.6))),
                      ),
                      TweenAnimationBuilder<double>(
                        tween: Tween(begin: 0, end: values[i] / maxV),
                        duration: Duration(milliseconds: 600 + i * 80),
                        curve: Curves.easeOutCubic,
                        builder: (_, f, _) => Container(
                          height: math.max(8, height * f),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(AppRadius.tile),
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: values[i] >= goal ? [Tone.green.withValues(alpha: 0.85), Tone.green] : [Tone.violet.withValues(alpha: 0.75), Tone.violet],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  labels[i],
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppText.small.copyWith(color: c.textMuted),
                ),
              ],
            ),
          ),
        ],
      ],
    );
  }
}

class _DashedRRect extends CustomPainter {
  _DashedRRect(this.color);
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final path = Path()..addRRect(RRect.fromRectAndRadius(Offset.zero & size, const Radius.circular(AppRadius.tile)));
    final p = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.2
      ..color = color;
    for (final m in path.computeMetrics()) {
      for (var d = 0.0; d < m.length; d += 9) {
        canvas.drawPath(m.extractPath(d, math.min(d + 5, m.length)), p);
      }
    }
  }

  @override
  bool shouldRepaint(_DashedRRect o) => o.color != color;
}
