import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../../utils/app_theme.dart';
import '../../../utils/l10n.dart';
import '../../../widgets/ui_kit.dart';
import 'ob_kit.dart';

/// Stylised phone for the "How it works" story. Its screen changes per [beat]:
/// 0 home screen (arrow + tap on the app), 1 a feed scrolling by itself while a
/// time-left badge counts down (then [onCountdownDone]), 2 a limit nudge dropping
/// in from the top, 3 Pausey's "blocked" screen sliding up.
///
class StoryPhone extends StatelessWidget {
  const StoryPhone({
    super.key,
    required this.beat,
    required this.width,
    required this.appIcon,
    required this.pausedTitle,
    required this.nudgeTitle,
    required this.nudgeText,
    required this.nudgeProgress,
    required this.timerFromSeconds,
    required this.timerToSeconds,
    this.onCountdownDone,
  });

  final int beat;
  final double width;

  /// The user's app icon (real launcher icon when known), built at the size asked.
  final Widget Function(double size) appIcon;
  final String pausedTitle, nudgeTitle, nudgeText;
  final double nudgeProgress;

  /// Time left shown on the badge: counts from [timerFromSeconds] down to [timerToSeconds] on beat 1.
  final int timerFromSeconds, timerToSeconds;
  final VoidCallback? onCountdownDone;

  /// Visible height / width (the bottom of the phone fades out).
  static const aspect = 1.5;

  /// Extra space on each side (shadow), included in the widget's size.
  static const _shadowRoom = 28.0;
  static const extraWidth = _shadowRoom * 2;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final c = context.colors;
    final dark = context.isDark;
    final reduced = ObMotion.reduced(context);
    final height = width * aspect;
    final radius = width * 0.15;
    const bezel = 7.0;
    final frame = dark ? const Color(0xFF1A1733) : Colors.white;
    final screen = dark ? const Color(0xFF0E0C22) : const Color(0xFFF3F0FF);
    Duration d(int ms) => reduced ? Duration.zero : Duration(milliseconds: ms);

    final screenContent = Stack(
      children: [
        Positioned.fill(
          child: AnimatedSwitcher(
            duration: d(480),
            switchInCurve: Curves.easeOutCubic,
            switchOutCurve: Curves.easeInCubic,
            transitionBuilder: (child, a) => FadeTransition(
              opacity: a,
              child: ScaleTransition(scale: Tween(begin: 0.9, end: 1.0).animate(a), child: child),
            ),
            child: beat == 0 ? _HomeGrid(key: const ValueKey('home'), appIcon: appIcon) : _Feed(key: const ValueKey('feed'), scrolling: beat == 1 || beat == 2),
          ),
        ),
        // 2 — time left ticks down at the top while scrolling.
        Positioned(
          top: 34,
          left: 0,
          right: 0,
          child: Center(
            child: AnimatedScale(
              scale: beat == 1 || beat == 2 ? 1 : 0.6,
              duration: d(320),
              curve: Curves.easeOutBack,
              child: AnimatedOpacity(
                opacity: beat == 1 || beat == 2 ? 1 : 0,
                duration: d(260),
                child: _TimerBadge(
                  running: beat == 1,
                  finished: beat >= 2,
                  fromSeconds: timerFromSeconds,
                  toSeconds: timerToSeconds,
                  onDone: onCountdownDone,
                ),
              ),
            ),
          ),
        ),
        // 3 — the nudge drops in from the top.
        PositionedDirectional(
          top: 66,
          start: 10,
          end: 10,
          child: AnimatedSlide(
            offset: beat == 2 ? Offset.zero : const Offset(0, -2.6),
            duration: d(560),
            curve: Curves.easeOutBack,
            child: AnimatedOpacity(
              opacity: beat == 2 ? 1 : 0,
              duration: d(300),
              child: _Nudge(title: nudgeTitle, text: nudgeText, progress: nudgeProgress),
            ),
          ),
        ),
        // 4 — Pausey's "blocked" screen slides up over everything.
        Positioned.fill(
          child: IgnorePointer(
            child: AnimatedSlide(
              offset: beat == 3 ? Offset.zero : const Offset(0, 1),
              duration: d(620),
              curve: Curves.easeOutCubic,
              child: AnimatedOpacity(
                opacity: beat == 3 ? 1 : 0,
                duration: d(380),
                child: _PauseScreen(title: pausedTitle, close: l.nativeClose, active: beat == 3),
              ),
            ),
          ),
        ),
        // Camera on top of everything.
        Positioned(
          top: 10,
          left: 0,
          right: 0,
          child: Center(
            child: Container(
              width: 9,
              height: 9,
              decoration: BoxDecoration(shape: BoxShape.circle, color: dark ? const Color(0xFF2A2650) : const Color(0xFFD9D3F5)),
            ),
          ),
        ),
      ],
    );

    return Semantics(
      label: l.cvPreview,
      container: true,
      // Room around the phone for its soft shadow; the bottom of the phone fades out.
      child: SizedBox(
        width: width + _shadowRoom * 2,
        height: height + _shadowRoom / 2,
        child: ClipRect(
          child: ShaderMask(
            blendMode: BlendMode.dstIn,
            shaderCallback: (r) => const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0, 0.78, 1],
              colors: [Colors.white, Colors.white, Color(0x00FFFFFF)],
            ).createShader(r),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(_shadowRoom, _shadowRoom / 2, _shadowRoom, 0),
              child: OverflowBox(
                alignment: Alignment.topCenter,
                maxHeight: height + radius,
                child: Container(
                  height: height + radius,
                  padding: const EdgeInsets.all(bezel),
                  decoration: BoxDecoration(
                    color: frame,
                    borderRadius: BorderRadius.circular(radius),
                    border: Border.all(color: dark ? Colors.white.withValues(alpha: 0.10) : c.glassBorder),
                    boxShadow: [
                      BoxShadow(
                        color: AppPalette.accent.withValues(alpha: dark ? 0.20 : 0.12),
                        blurRadius: 30,
                        offset: const Offset(0, 12),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(radius - bezel),
                    child: ColoredBox(color: screen, child: screenContent),
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

/// Neutral placeholder colour for the mock UI.
Color _ph(BuildContext context) => context.isDark ? Colors.white.withValues(alpha: 0.08) : const Color(0xFF1B1838).withValues(alpha: 0.07);

// -----------------------------------------------------------------------------
// Beat 1 — home screen, an arrow draws toward the user's app, then a tap ripple
// -----------------------------------------------------------------------------

class _HomeGrid extends StatefulWidget {
  const _HomeGrid({super.key, required this.appIcon});
  final Widget Function(double size) appIcon;

  @override
  State<_HomeGrid> createState() => _HomeGridState();
}

class _HomeGridState extends State<_HomeGrid> with TickerProviderStateMixin {
  late final _arrow = AnimationController(vsync: this, duration: const Duration(milliseconds: 900));
  late final _tap = AnimationController(vsync: this, duration: const Duration(milliseconds: 1500));
  bool _started = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (ObMotion.reduced(context)) {
      _arrow.value = 1;
      _tap.stop();
      _tap.value = 0.35;
      return;
    }
    if (_started) return;
    _started = true;
    Future.delayed(const Duration(milliseconds: 380), () {
      if (!mounted) return;
      _arrow.forward().whenComplete(() {
        if (mounted && !ObMotion.reduced(context)) _tap.repeat();
      });
    });
  }

  @override
  void dispose() {
    _arrow.dispose();
    _tap.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final rtl = Directionality.of(context) == TextDirection.rtl;
    final ph = _ph(context);
    return LayoutBuilder(
      builder: (context, box) {
        const pad = 16.0, gap = 10.0, top = 44.0;
        final cell = (box.maxWidth - pad * 2 - gap * 3) / 4;
        final dot = cell * 0.86;
        final rows = math.max(1, ((box.maxHeight - top) / (cell + gap)).floor());
        // Centre of the first slot (start side).
        final startX = pad + cell / 2;
        final iconCenter = Offset(rtl ? box.maxWidth - startX : startX, top + cell / 2);
        return Stack(
          children: [
            for (var r = 0; r < rows; r++)
              for (var col = 0; col < 4; col++)
                if (!(r == 0 && col == 0))
                  PositionedDirectional(
                    start: pad + col * (cell + gap) + (cell - dot) / 2,
                    top: top + r * (cell + gap) + (cell - dot) / 2,
                    child: Container(
                      width: dot,
                      height: dot,
                      decoration: BoxDecoration(shape: BoxShape.circle, color: ph),
                    ),
                  ),
            // Tap ripple behind the icon.
            Positioned.fill(
              child: AnimatedBuilder(
                animation: _tap,
                builder: (_, _) => CustomPaint(
                  painter: _RipplePainter(center: iconCenter, radius: dot / 2, t: _tap.value),
                ),
              ),
            ),
            PositionedDirectional(
              start: pad + (cell - dot) / 2,
              top: top + (cell - dot) / 2,
              child: AnimatedBuilder(
                animation: _tap,
                builder: (_, child) {
                  // A small press at the start of each tap.
                  final t = _tap.value;
                  final press = t < 0.18 ? 1 - 0.08 * math.sin(t / 0.18 * math.pi) : 1.0;
                  return Transform.scale(scale: press, child: child);
                },
                child: widget.appIcon(dot),
              ),
            ),
            Positioned.fill(
              child: AnimatedBuilder(
                animation: _arrow,
                builder: (_, _) => CustomPaint(
                  painter: _ArrowPainter(
                    from: Offset(iconCenter.dx + (rtl ? -1 : 1) * cell * 0.95, iconCenter.dy + (cell + gap) * 2.3),
                    to: Offset(iconCenter.dx + (rtl ? -1 : 1) * dot * 0.18, iconCenter.dy + dot / 2 + 6),
                    bend: rtl ? 1 : -1,
                    t: Curves.easeInOutCubic.transform(_arrow.value),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _ArrowPainter extends CustomPainter {
  _ArrowPainter({required this.from, required this.to, required this.bend, required this.t});
  final Offset from, to;
  final double bend, t;

  @override
  void paint(Canvas canvas, Size size) {
    if (t <= 0) return;
    final mid = Offset.lerp(from, to, 0.5)!;
    final ctrl = mid + Offset(bend * (from - to).distance * 0.35, 0);
    final path = Path()
      ..moveTo(from.dx, from.dy)
      ..quadraticBezierTo(ctrl.dx, ctrl.dy, to.dx, to.dy);
    final metric = path.computeMetrics().first;
    final drawn = metric.extractPath(0, metric.length * t);
    final paint = Paint()
      ..color = AppPalette.accent
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;
    canvas.drawPath(drawn, paint);
    // Arrow head at the moving tip.
    final tan = metric.getTangentForOffset(metric.length * t);
    if (tan == null || t < 0.15) return;
    final dir = tan.vector / tan.vector.distance;
    final normal = Offset(-dir.dy, dir.dx);
    const len = 10.0;
    final tip = tan.position;
    final head = Path()
      ..moveTo(tip.dx - dir.dx * len + normal.dx * len * 0.7, tip.dy - dir.dy * len + normal.dy * len * 0.7)
      ..lineTo(tip.dx, tip.dy)
      ..lineTo(tip.dx - dir.dx * len - normal.dx * len * 0.7, tip.dy - dir.dy * len - normal.dy * len * 0.7);
    canvas.drawPath(head, paint);
  }

  @override
  bool shouldRepaint(_ArrowPainter old) => old.t != t || old.from != from || old.to != to;
}

class _RipplePainter extends CustomPainter {
  _RipplePainter({required this.center, required this.radius, required this.t});
  final Offset center;
  final double radius, t;

  @override
  void paint(Canvas canvas, Size size) {
    if (t <= 0) return;
    // One ring growing and fading per tap, a second one a little behind.
    for (final lag in const [0.0, 0.22]) {
      final p = ((t - lag) / 0.7).clamp(0.0, 1.0);
      if (p <= 0 || p >= 1) continue;
      final e = Curves.easeOutCubic.transform(p);
      canvas.drawCircle(
        center,
        radius + 4 + e * radius * 0.9,
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2.5 * (1 - e) + 0.5
          ..color = AppPalette.accent.withValues(alpha: 0.55 * (1 - e)),
      );
    }
  }

  @override
  bool shouldRepaint(_RipplePainter old) => old.t != t || old.center != center;
}

// -----------------------------------------------------------------------------
// Beat 2 — skeleton feed that scrolls by itself (slowly)
// -----------------------------------------------------------------------------

class _Feed extends StatefulWidget {
  const _Feed({super.key, required this.scrolling});
  final bool scrolling;

  @override
  State<_Feed> createState() => _FeedState();
}

class _FeedState extends State<_Feed> with SingleTickerProviderStateMixin {
  late final _c = AnimationController(vsync: this, duration: const Duration(seconds: 9));

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _sync();
  }

  @override
  void didUpdateWidget(_Feed old) {
    super.didUpdateWidget(old);
    _sync();
  }

  void _sync() {
    if (widget.scrolling && !ObMotion.reduced(context)) {
      if (!_c.isAnimating) _c.repeat();
    } else {
      _c.stop();
    }
  }

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ph = _ph(context);
    return LayoutBuilder(
      builder: (context, box) {
        const pad = 12.0, barTop = 34.0, barH = 26.0;
        final w = box.maxWidth - pad * 2;
        final mediaH = w * 0.78;
        // One post: header 28 + 8 + media + 8 + actions 12 + 18 gap.
        final postH = 28 + 8 + mediaH + 8 + 12 + 18;
        const posts = 3;
        final setH = postH * posts;
        Widget post() => SizedBox(
          height: postH,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 28,
                    height: 28,
                    decoration: BoxDecoration(shape: BoxShape.circle, color: ph),
                  ),
                  const SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: w * 0.36,
                        height: 8,
                        decoration: BoxDecoration(color: ph, borderRadius: BorderRadius.circular(4)),
                      ),
                      const SizedBox(height: 5),
                      Container(
                        width: w * 0.22,
                        height: 6,
                        decoration: BoxDecoration(color: ph, borderRadius: BorderRadius.circular(3)),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Container(
                height: mediaH,
                decoration: BoxDecoration(color: ph, borderRadius: BorderRadius.circular(14)),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  for (var i = 0; i < 3; i++) ...[
                    Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(shape: BoxShape.circle, color: ph),
                    ),
                    const SizedBox(width: 8),
                  ],
                  const Spacer(),
                  Container(
                    width: w * 0.18,
                    height: 8,
                    decoration: BoxDecoration(color: ph, borderRadius: BorderRadius.circular(4)),
                  ),
                ],
              ),
            ],
          ),
        );
        return Stack(
          children: [
            Positioned.fill(
              top: barTop + barH + 10,
              child: ClipRect(
                child: AnimatedBuilder(
                  animation: _c,
                  builder: (_, child) => Transform.translate(offset: Offset(0, -setH * Curves.linear.transform(_c.value)), child: child),
                  child: OverflowBox(
                    alignment: Alignment.topCenter,
                    maxHeight: setH * 2,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: pad),
                      child: Column(children: [for (var i = 0; i < posts * 2; i++) post()]),
                    ),
                  ),
                ),
              ),
            ),
            // App bar of the "app" (fixed).
            Positioned(
              top: barTop,
              left: pad,
              right: pad,
              height: barH,
              child: Row(
                children: [
                  Container(
                    width: w * 0.32,
                    height: 16,
                    decoration: BoxDecoration(color: ph, borderRadius: BorderRadius.circular(8)),
                  ),
                  const Spacer(),
                  Container(
                    width: 18,
                    height: 18,
                    decoration: BoxDecoration(shape: BoxShape.circle, color: ph),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    width: 18,
                    height: 18,
                    decoration: BoxDecoration(shape: BoxShape.circle, color: ph),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

// -----------------------------------------------------------------------------
// Beat 4 — Pausey's "blocked" screen
// -----------------------------------------------------------------------------

class _PauseScreen extends StatelessWidget {
  const _PauseScreen({required this.title, required this.close, required this.active});
  final String title, close;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Color(0xF5151033), Color(0xFA0B0920)]),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(flex: 3),
          _Breath(
            active: active,
            child: Container(
              width: 58,
              height: 58,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppPalette.accent,
                boxShadow: [BoxShadow(color: AppPalette.accent.withValues(alpha: 0.55), blurRadius: 26)],
              ),
              child: const Icon(Icons.lock_rounded, color: Colors.white, size: 30),
            ),
          ),
          const SizedBox(height: 18),
          Text(
            title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: AppText.rowTitle.copyWith(fontWeight: FontWeight.w800, color: Colors.white),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
            decoration: BoxDecoration(color: AppPalette.accent, borderRadius: BorderRadius.circular(AppRadius.chip)),
            child: Text(
              close,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppText.rowSub.copyWith(fontWeight: FontWeight.w700, color: Colors.white),
            ),
          ),
          const Spacer(flex: 4),
        ],
      ),
    );
  }
}

/// Slow, calm scale loop (a breath) while [active]. Still when animations are off.
class _Breath extends StatefulWidget {
  const _Breath({required this.child, required this.active});
  final Widget child;
  final bool active;
  @override
  State<_Breath> createState() => _BreathState();
}

class _BreathState extends State<_Breath> with SingleTickerProviderStateMixin {
  late final _c = AnimationController(vsync: this, duration: const Duration(milliseconds: 2400), value: 0.5);

  void _sync() {
    if (widget.active && !ObMotion.reduced(context)) {
      if (!_c.isAnimating) _c.repeat(reverse: true);
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
  void didUpdateWidget(_Breath old) {
    super.didUpdateWidget(old);
    _sync();
  }

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => ScaleTransition(
    scale: Tween(begin: 0.9, end: 1.08).animate(CurvedAnimation(parent: _c, curve: Curves.easeInOut)),
    child: widget.child,
  );
}

// -----------------------------------------------------------------------------
// Beat 2 — time-left badge counting down
// -----------------------------------------------------------------------------

/// Pill with an hourglass and the time left (mm:ss). While [running] it counts
/// from [fromSeconds] down to [toSeconds] in half a second, then calls [onDone].
/// When [finished] it shows [toSeconds] and glows. Animations off: shows the end value.
class _TimerBadge extends StatefulWidget {
  const _TimerBadge({required this.running, required this.finished, required this.fromSeconds, required this.toSeconds, this.onDone});
  final bool running, finished;
  final int fromSeconds, toSeconds;
  final VoidCallback? onDone;

  @override
  State<_TimerBadge> createState() => _TimerBadgeState();
}

class _TimerBadgeState extends State<_TimerBadge> with TickerProviderStateMixin {
  late final _count = AnimationController(vsync: this, duration: const Duration(milliseconds: 500));
  late final _pulse = AnimationController(vsync: this, duration: const Duration(milliseconds: 900));

  @override
  void initState() {
    super.initState();
    _count.addStatusListener((s) {
      if (s == AnimationStatus.completed && widget.running && mounted) widget.onDone?.call();
    });
  }

  void _sync({bool restart = false}) {
    final reduced = ObMotion.reduced(context);
    if (widget.finished || reduced) {
      _count.stop();
      _count.value = widget.finished || reduced ? 1 : 0;
    } else if (widget.running) {
      if (restart || !_count.isAnimating) _count.forward(from: 0);
    } else {
      _count.stop();
      _count.value = 0;
    }
    if (widget.finished && !reduced) {
      if (!_pulse.isAnimating) _pulse.repeat(reverse: true);
    } else {
      _pulse.stop();
      _pulse.value = 0;
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _sync();
  }

  @override
  void didUpdateWidget(_TimerBadge old) {
    super.didUpdateWidget(old);
    _sync(restart: widget.running && !old.running);
  }

  @override
  void dispose() {
    _count.dispose();
    _pulse.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([_count, _pulse]),
      builder: (context, _) {
        final left = (widget.fromSeconds + (widget.toSeconds - widget.fromSeconds) * _count.value).round();
        final mm = (left ~/ 60).toString().padLeft(2, '0');
        final ss = (left % 60).toString().padLeft(2, '0');
        final glow = widget.finished ? 0.35 + 0.35 * _pulse.value : 0.0;
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            color: Color.lerp(const Color(0xE61B1838), AppPalette.accent, widget.finished ? 1 : 0),
            borderRadius: BorderRadius.circular(AppRadius.chip),
            boxShadow: [BoxShadow(color: AppPalette.accent.withValues(alpha: 0.25 + glow), blurRadius: 10 + 8 * glow, offset: const Offset(0, 3))],
          ),
          child: Directionality(
            textDirection: TextDirection.ltr,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.hourglass_bottom_rounded, size: 13, color: Colors.white),
                const SizedBox(width: 4),
                Text(
                  '$mm:$ss',
                  style: AppText.rowSub.copyWith(
                    fontSize: 12.5,
                    height: 1.1,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                    fontFeatures: const [FontFeature.tabularFigures()],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

// -----------------------------------------------------------------------------
// Beat 3 — "Almost at your limit" nudge
// -----------------------------------------------------------------------------

class _Nudge extends StatelessWidget {
  const _Nudge({required this.title, required this.text, required this.progress});
  final String title, text;
  final double progress;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final dark = context.isDark;
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 10, 12, 10),
      decoration: BoxDecoration(
        color: dark ? const Color(0xFF241F48) : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: dark ? Colors.white.withValues(alpha: 0.08) : c.glassBorder),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF1B1838).withValues(alpha: dark ? 0.5 : 0.14),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(9),
              gradient: const LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [AppPalette.violet, AppPalette.accent]),
            ),
            child: const Icon(Icons.pause_rounded, size: 18, color: Colors.white),
          ),
          const SizedBox(width: 9),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppText.rowSub.copyWith(fontSize: 12.5, height: 1.25, fontWeight: FontWeight.w800, color: c.textPrimary),
                ),
                const SizedBox(height: 2),
                Text(
                  text,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppText.rowSub.copyWith(fontSize: 11.5, height: 1.3, color: c.textSecondary),
                ),
                const SizedBox(height: 7),
                PBar(value: progress, color: Tone.violet, height: 4),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
