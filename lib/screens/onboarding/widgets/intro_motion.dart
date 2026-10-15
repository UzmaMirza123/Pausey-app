import 'dart:math' as math;

import 'package:flutter/material.dart';

bool _reduced(BuildContext context) => MediaQuery.maybeDisableAnimationsOf(context) ?? false;

/// Fade + rise (+ slight scale) when a piece first appears; [index] staggers it.
/// Instant when the phone's "Remove animations" setting is on.
class IntroEnter extends StatelessWidget {
  const IntroEnter({super.key, required this.child, this.index = 0, this.rise = 18, this.scale = false});
  final Widget child;
  final int index;
  final double rise;
  final bool scale;

  @override
  Widget build(BuildContext context) {
    if (_reduced(context)) return child;
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: 1),
      duration: Duration(milliseconds: 520 + index * 110),
      curve: Interval(math.min(0.6, index * 0.12), 1, curve: Curves.easeOutCubic),
      builder: (_, t, c) => Opacity(
        opacity: t,
        child: Transform.translate(
          offset: Offset(0, rise * (1 - t)),
          child: scale ? Transform.scale(scale: 0.9 + 0.1 * t, child: c) : c,
        ),
      ),
      child: child,
    );
  }
}

/// Gentle endless up-and-down float (for hero illustrations). Still when animations are off.
class IntroFloat extends StatefulWidget {
  const IntroFloat({super.key, required this.child, this.amplitude = 6, this.period = const Duration(milliseconds: 3200)});
  final Widget child;
  final double amplitude;
  final Duration period;

  @override
  State<IntroFloat> createState() => _IntroFloatState();
}

class _IntroFloatState extends State<IntroFloat> with SingleTickerProviderStateMixin {
  late final _c = AnimationController(vsync: this, duration: widget.period);

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _reduced(context) ? _c.stop() : _c.repeat();
  }

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
        animation: _c,
        builder: (_, child) => Transform.translate(offset: Offset(0, math.sin(_c.value * 2 * math.pi) * widget.amplitude), child: child),
        child: widget.child,
      );
}
