import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../services/local_store.dart';
import 'onboarding_state.dart';
import '../../utils/app_theme.dart';
import '../../utils/l10n.dart';
import '../../widgets/common.dart';
import '../../widgets/glow_background.dart';
import 'widgets/ob_art.dart';
import 'widgets/ob_text_motion.dart';

// Colours used only on this screen (from the Figma frame).
const _amber = Color(0xFFF59E0B);
const _amberLight = Color(0xFFFCD34D);
const _captionPurple = Color(0xFF6B5E9B);

/// Figma: OnBoarding 9 — context.l10n.ob9Title (727:41625).
///
/// Last onboarding page. The button calls [onNext], which the flow treats as
/// "finish onboarding". On first show the check circle pops in, the orbit ring
/// draws itself clockwise and the stats around it fade in; the resting state
/// is the Figma design.
class Onboarding9Screen extends StatefulWidget {
  const Onboarding9Screen({super.key, required this.onNext, required this.onSkip});

  final VoidCallback onNext;
  final VoidCallback onSkip;

  @override
  State<Onboarding9Screen> createState() => _Onboarding9ScreenState();
}

class _Onboarding9ScreenState extends State<Onboarding9Screen> with SingleTickerProviderStateMixin {
  late final AnimationController _intro = AnimationController(vsync: this, duration: const Duration(milliseconds: 1700))
    ..forward();

  @override
  void dispose() {
    _intro.dispose();
    super.dispose();
  }

  Animation<double> _interval(double begin, double end) => CurvedAnimation(
    parent: _intro,
    curve: Interval(begin, end, curve: Curves.easeOutCubic),
  );

  /// "Replay Onboarding": scroll the surrounding onboarding PageView back to page 1.
  /// "Replay Onboarding" goes back to the first onboarding question.
  void _replay(BuildContext context) => widget.onSkip();

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final dark = context.isDark;
    return OnboardingScaffold(
      showSkip: false,
      onSkip: widget.onSkip,
      starsAsset: 'assets/svg/ob9_stars.svg',
      blobs: const [
        Blob(left: -130, top: -120, size: 420, color: AppPalette.blue, opacity: 0.13, blur: 55),
        Blob(right: -100, top: 200, size: 300, color: AppPalette.blue, opacity: 0.11, blur: 45),
        Blob(left: -50, bottom: 79.62, size: 200, color: AppPalette.violet, opacity: 0.08, blur: 35),
      ],
      button: PrimaryButton(
        label: context.l10n.ob9Enter,
        onPressed: widget.onNext,
        leading: SvgPicture.asset('assets/svg/ob9_sparkle.svg', width: 17.0036, height: 17.0036),
      ),
      footerExtra: Padding(
        // Scaffold adds 12; Figma gap between button and this text is 18.
        padding: const EdgeInsets.only(top: 6),
        child: Builder(
          builder: (ctx) => GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => _replay(ctx),
            child: Text(
              context.l10n.ob9Replay,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: AppText.fontFamily,
                fontSize: 12,
                fontWeight: FontWeight.w400,
                height: 18 / 12,
                letterSpacing: 0.24,
                color: dark ? const Color(0x42FFFFFF) : c.textMuted,
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          // A burst of confetti (Lottie) celebrates the finished setup.
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              _Hero(controller: _intro),
              const Positioned(top: -60, child: ObConfetti(size: 380)),
            ],
          ),
          _FadeUp(
            animation: _interval(0.55, 0.9),
            child: Column(
              children: [
                const SizedBox(height: 16),
                ObRevealText(
                  context.l10n.ob9Title,
                  style: TextStyle(
                    fontFamily: AppText.fontFamily,
                    fontSize: 28,
                    fontWeight: FontWeight.w800,
                    height: 42 / 28,
                    letterSpacing: -0.5,
                    color: dark ? const Color(0xFFF5F0FF) : c.textPrimary,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  context.l10n.ob9Subtitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: AppText.fontFamily,
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    height: 19.5 / 13,
                    color: dark ? const Color(0xFF7C6FA0) : c.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.gutter),
            child: _FadeUp(animation: _interval(0.65, 1), child: const _StreakCard()),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}

/// Fades a child in while sliding it up a few pixels.
class _FadeUp extends StatelessWidget {
  const _FadeUp({required this.animation, required this.child});

  final Animation<double> animation;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      child: child,
      builder: (context, child) => Opacity(
        opacity: animation.value.clamp(0, 1),
        child: Transform.translate(offset: Offset(0, 10 * (1 - animation.value)), child: child),
      ),
    );
  }
}

/// The daily screen-time goal picked earlier ("2" or "2.5"), default 2.
String _goalHours() {
  final v = LocalStore.instance.answers['dailyGoalHours'];
  if (v is num) return v == v.roundToDouble() ? '${v.toInt()}' : '$v';
  return '2';
}

/// Hero (top margin + 340 box): orbit ring, four stats around it and
/// the glowing "DONE" check circle.
class _Hero extends StatelessWidget {
  const _Hero({required this.controller});

  final AnimationController controller;

  @override
  Widget build(BuildContext context) {
    final dark = context.isDark;
    final pop = CurvedAnimation(
      parent: controller,
      curve: const Interval(0, 0.42, curve: Curves.easeOutBack),
    );
    final glow = CurvedAnimation(
      parent: controller,
      curve: const Interval(0.1, 0.55, curve: Curves.easeOut),
    );
    final tick = CurvedAnimation(
      parent: controller,
      curve: const Interval(0.22, 0.5, curve: Curves.easeOutCubic),
    );
    final ring = CurvedAnimation(
      parent: controller,
      curve: const Interval(0.12, 0.72, curve: Curves.easeInOutCubic),
    );
    Animation<double> label(int i) => CurvedAnimation(
      parent: controller,
      curve: Interval(0.42 + i * 0.07, 0.72 + i * 0.07, curve: Curves.easeOutCubic),
    );

    // Light theme uses deeper shades of the same hues so they read on white.
    final stats = [
      _Stat(
        context.l10n.ob7Hours(_goalHours()),
        context.l10n.ob9ScreenTime,
        dark ? const Color(0xFF60A5FA) : const Color(0xFF2563EB),
        'assets/svg/ob9_clock.svg',
        const Size(13.6667, 13.6667),
      ),
      _Stat(
        '${OnboardingState.instance.apps.length}',
        context.l10n.ob9AppsLocked,
        dark ? AppPalette.violet : AppPalette.accent, // brand purple (theme)
        'assets/svg/ob9_lock.svg',
        const Size(12.5, 13.6667),
      ),
      _Stat(
        context.l10n.ob9AllOk,
        context.l10n.ob9Permissions,
        dark ? const Color(0xFF34D399) : const Color(0xFF059669),
        'assets/svg/ob9_shield.svg',
        const Size(14, 14),
      ),
      _Stat(
        context.l10n.ob9On,
        context.l10n.ob9FocusMode,
        dark ? const Color(0xFFFBBF24) : const Color(0xFFD97706),
        'assets/svg/ob9_bolt.svg',
        const Size(14, 14),
      ),
    ];

    return Padding(
      // Figma: 20 top margin under a 69px status row; our header is 46px tall,
      // so 12 keeps the ring at the same height on screen.
      padding: const EdgeInsets.only(top: 12),
      child: SizedBox(
        width: 340,
        height: 340,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            // Orbit ring (Figma "Group 33" vector), revealed clockwise from 12 o'clock.
            Positioned(
              left: 14.5,
              top: 14.5,
              width: 313.5,
              height: 311,
              child: AnimatedBuilder(
                animation: ring,
                child: Stack(
                  children: [
                    SvgPicture.asset(
                      'assets/svg/ob9_ring_track.svg',
                      width: 313.5,
                      height: 311,
                      // Dark navy tracks would look heavy on the light background.
                      colorFilter: dark ? null : const ColorFilter.mode(Color(0x2E1B1838), BlendMode.srcIn),
                    ),
                    SvgPicture.asset('assets/svg/ob9_ring_arcs.svg', width: 313.5, height: 311),
                  ],
                ),
                builder: (context, child) {
                  final p = ring.value.clamp(0.0, 1.0);
                  if (p >= 1) return child!;
                  return ShaderMask(
                    blendMode: BlendMode.dstIn,
                    shaderCallback: (rect) => SweepGradient(
                      center: const FractionalOffset(155.5 / 313.5, 155.5 / 311),
                      transform: const GradientRotation(-math.pi / 2),
                      colors: const [Colors.white, Colors.white, Colors.transparent, Colors.transparent],
                      stops: [0, p, p, 1],
                    ).createShader(rect),
                    child: child,
                  );
                },
              ),
            ),
            // Top: 2h / Screen Time / clock
            Positioned(
              top: 4,
              left: 0,
              right: 0,
              child: _FadeUp(
                animation: label(0),
                child: _OrbitLabel(stat: stats[0]),
              ),
            ),
            // Right: 3 / Apps Locked / lock
            Positioned(
              top: 139.25,
              right: 2,
              width: 80,
              child: _FadeUp(
                animation: label(1),
                child: _OrbitLabel(stat: stats[1]),
              ),
            ),
            // Bottom: shield / All OK / Permissions
            Positioned(
              bottom: 4,
              left: 0,
              right: 0,
              child: _FadeUp(
                animation: label(2),
                child: _OrbitLabel(stat: stats[2], iconFirst: true),
              ),
            ),
            // Left: ON / Focus Mode / bolt
            Positioned(
              top: 139.25,
              left: 2,
              width: 80,
              child: _FadeUp(
                animation: label(3),
                child: _OrbitLabel(stat: stats[3]),
              ),
            ),
            // Centre check circle (Figma: 110×110, centred +0.5px).
            Positioned(
              left: 115.5,
              top: 115,
              width: 110,
              height: 110,
              child: AnimatedBuilder(
                animation: controller,
                builder: (context, _) => Transform.scale(
                  scale: pop.value,
                  child: _DoneCircle(glow: glow.value, tick: tick.value),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DoneCircle extends StatelessWidget {
  const _DoneCircle({required this.glow, required this.tick});

  final double glow;
  final double tick;

  @override
  Widget build(BuildContext context) {
    final t = tick.clamp(0.0, 1.0);
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        // CSS 145deg: #9333EA → #6D28D9
        gradient: const LinearGradient(
          begin: Alignment(-0.574, -0.819),
          end: Alignment(0.574, 0.819),
          colors: [Color(0xFF9333EA), Color(0xFF6D28D9)],
        ),
        boxShadow: [
          BoxShadow(color: const Color(0xFF7C3AED).withValues(alpha: 0.47 * glow.clamp(0.0, 1.0)), blurRadius: 30),
        ],
      ),
      child: Opacity(
        opacity: t,
        child: Transform.scale(
          scale: 0.6 + 0.4 * t,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/svg/ob9_check.svg', width: 42, height: 42),
              const SizedBox(height: 2),
              Text(
                context.l10n.ob9Done,
                maxLines: 1,
                style: const TextStyle(
                  fontFamily: AppText.fontFamily,
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                  height: 15 / 10,
                  letterSpacing: 0.5,
                  color: Color(0xFFE9D5FF),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Stat {
  const _Stat(this.value, this.caption, this.color, this.icon, this.iconSize);

  final String value;
  final String caption;
  final Color color;
  final String icon;
  final Size iconSize;
}

/// Value (18 / Black), caption (11 / SemiBold) and a 14px icon, centred.
class _OrbitLabel extends StatelessWidget {
  const _OrbitLabel({required this.stat, this.iconFirst = false});

  final _Stat stat;
  final bool iconFirst;

  @override
  Widget build(BuildContext context) {
    final icon = SizedBox(
      width: 14,
      height: 14,
      child: Center(
        child: SvgPicture.asset(
          stat.icon,
          width: stat.iconSize.width,
          height: stat.iconSize.height,
          colorFilter: context.isDark ? null : ColorFilter.mode(stat.color, BlendMode.srcIn),
        ),
      ),
    );
    final value = Text(
      stat.value,
      textAlign: TextAlign.center,
      maxLines: 1,
      style: TextStyle(
        fontFamily: AppText.fontFamily,
        fontSize: 18,
        fontWeight: FontWeight.w800,
        height: 27 / 18,
        color: stat.color,
      ),
    );
    final caption = Text(
      stat.caption,
      textAlign: TextAlign.center,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontFamily: AppText.fontFamily,
        fontSize: 11,
        fontWeight: FontWeight.w600,
        height: 16.5 / 11,
        color: context.isDark ? _captionPurple : context.colors.textMuted,
      ),
    );
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: iconFirst
          ? [icon, const SizedBox(height: 4), FittedBox(fit: BoxFit.scaleDown, child: value), caption]
          : [FittedBox(fit: BoxFit.scaleDown, child: value), caption, const SizedBox(height: 4), icon],
    );
  }
}

/// "Day 1 streak starts now" card with flame tile and ×1 badge (320 wide).
class _StreakCard extends StatelessWidget {
  const _StreakCard();

  @override
  Widget build(BuildContext context) {
    final dark = context.isDark;
    final c = context.colors;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: dark ? const Color(0xFF18142A) : c.glassFill,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: _amber.withValues(alpha: dark ? 0.16 : 0.3)),
      ),
      child: Row(
        children: [
          Container(
            width: 38,
            height: 38,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: _amber.withValues(alpha: dark ? 0.07 : 0.1),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: _amber.withValues(alpha: 0.22)),
            ),
            child: SvgPicture.asset('assets/svg/ob9_flame.svg', width: 17, height: 17),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.l10n.ob9StreakTitle,
                  style: TextStyle(
                    fontFamily: AppText.fontFamily,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    height: 21 / 14,
                    color: dark ? _amberLight : const Color(0xFFB45309),
                  ),
                ),
                const SizedBox(height: 1),
                Text(
                  context.l10n.ob9StreakSub,
                  style: TextStyle(
                    fontFamily: AppText.fontFamily,
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                    height: 16.5 / 11,
                    color: dark ? const Color(0xFF4A3F72) : c.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              color: _amber.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: _amber.withValues(alpha: 0.19)),
            ),
            child: Text(
              '×1',
              style: TextStyle(
                fontFamily: AppText.fontFamily,
                fontSize: 16,
                fontWeight: FontWeight.w800,
                height: 24 / 16,
                color: dark ? _amber : const Color(0xFFD97706),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
