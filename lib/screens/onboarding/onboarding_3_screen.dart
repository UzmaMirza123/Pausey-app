import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utils/app_theme.dart';
import '../../widgets/common.dart';
import 'widgets/ob_text_motion.dart';
import 'widgets/intro_motion.dart';
import '../../widgets/glow_background.dart';
import '../../utils/l10n.dart';
import 'widgets/ob3_timer_ring.dart';

/// Figma: OnBoarding 3 — "Stay Focused Every Day" (727:41202).
class Onboarding3Screen extends StatefulWidget {
  const Onboarding3Screen({super.key, required this.onNext, required this.onSkip});

  final VoidCallback onNext;
  final VoidCallback onSkip;

  @override
  State<Onboarding3Screen> createState() => _Onboarding3ScreenState();
}

/// Orange used only by the "+40%" tile.
const _orange = AppPalette.accent; // brand purple (follows the app theme)

class _Onboarding3ScreenState extends State<Onboarding3Screen> {
  /// Which session type drives the timer: Pomodoro (25 min) or Deep Focus (90 min).
  bool _deep = false;

  static const _blobs = [
    Blob(left: -130, top: -120, size: 420, color: AppPalette.blue, opacity: 0.13, blur: 55),
    Blob(right: -100, top: 190, size: 300, color: AppPalette.violet, opacity: 0.10, blur: 45),
    Blob(left: -50, bottom: 80, size: 200, color: AppPalette.teal, opacity: 0.08, blur: 35),
  ];

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final dark = context.isDark;
    return OnboardingScaffold(
      onSkip: widget.onSkip,
      dotsIndex: 0,
      blobs: _blobs,
      starsAsset: 'assets/svg/ob3_stars.svg',
      // Sits near the top (less empty space under the header).
      bodyAlign: 0.15,
      button: PrimaryButton(label: context.l10n.continueLabel, onPressed: widget.onNext),
      // Figma gap button→caption is 18; the scaffold adds 12.
      footerExtra: Padding(
        padding: const EdgeInsets.only(top: 6),
        child: Text(
          context.l10n.freeToStart,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: AppText.fontFamily,
            fontSize: 12,
            height: 18 / 12,
            letterSpacing: 0.24,
            color: dark ? const Color(0x42FFFFFF) : c.textMuted,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.gutter),
        child: Column(
          children: [
            // Hero spans a little past the side margins (like before).
            LayoutBuilder(builder: (context, box) {
              final w = math.min(box.maxWidth + 40, 440.0);
              return SizedBox(
                height: Ob3TimerRing.heightFor(w),
                child: OverflowBox(
                  maxWidth: w,
                  maxHeight: Ob3TimerRing.heightFor(w),
                  alignment: Alignment.bottomCenter,
                  child: IntroEnter(
                    scale: true,
                    child: Ob3TimerRing(total: Duration(minutes: _deep ? 90 : 25), width: w),
                  ),
                ),
              );
            }),
            const SizedBox(height: 4),
            IntroEnter(
              index: 1,
              child: ObRevealText(context.l10n.ob3Title, style: AppText.h1.copyWith(color: c.textPrimary)),
            ),
            const SizedBox(height: 13),
            IntroEnter(
              index: 2,
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 295),
                child: Text(
                  context.l10n.ob3Body,
                  textAlign: TextAlign.center,
                  style: AppText.body.copyWith(color: c.textSecondary),
                ),
              ),
            ),
            const SizedBox(height: 22),
            SizedBox(
              width: double.infinity,
              child: IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: IntroEnter(
                        index: 3,
                        child: _ModeTile(
                          color: AppPalette.violet,
                          icon: 'assets/svg/ob3_icon_pomodoro.svg',
                          iconSize: const Size(12.6667, 15.3333),
                          title: context.l10n.ob3Pomodoro,
                          subtitle: context.l10n.ob3PomodoroSub(25),
                          onTap: () => setState(() => _deep = false),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: IntroEnter(
                        index: 4,
                        child: _ModeTile(
                          color: AppPalette.blue,
                          icon: 'assets/svg/ob3_icon_deep_focus.svg',
                          iconSize: const Size(14.3339, 15.3364),
                          title: context.l10n.ob3DeepFocus,
                          subtitle: context.l10n.ob3DeepFocusSub(90),
                          onTap: () => setState(() => _deep = true),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: IntroEnter(
                        index: 5,
                        child: _StatTile(
                          color: _orange,
                          icon: 'assets/svg/ob3_icon_flame.svg',
                          iconSize: Size(14, 14),
                          value: '+40%',
                          caption: context.l10n.ob3StatBoost,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: IntroEnter(
                        index: 6,
                        child: _StatTile(
                          color: AppPalette.teal,
                          icon: 'assets/svg/ob3_icon_trend.svg',
                          iconSize: Size(13.6667, 7.83333),
                          value: context.l10n.ob3StatStreakValue(7),
                          caption: context.l10n.ob3StatStreak,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: IntroEnter(
                        index: 7,
                        child: _StatTile(
                          color: AppPalette.blue,
                          icon: 'assets/svg/ob3_icon_target.svg',
                          iconSize: Size(13.6667, 13.6667),
                          value: '94%',
                          caption: context.l10n.ob3StatGoal,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 6),
          ],
        ),
      ),
    );
  }
}

/// Pomodoro / Deep Focus card. Tapping it sets the timer above to that session length.
class _ModeTile extends StatefulWidget {
  const _ModeTile({required this.color, required this.icon, required this.iconSize, required this.title, required this.subtitle, required this.onTap});

  final Color color;
  final String icon;
  final Size iconSize;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  @override
  State<_ModeTile> createState() => _ModeTileState();
}

class _ModeTileState extends State<_ModeTile> {
  bool _down = false;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final dark = context.isDark;
    return Semantics(
      button: true,
      label: '${widget.title}, ${widget.subtitle}',
      child: GestureDetector(
        onTapDown: (_) => setState(() => _down = true),
        onTapCancel: () => setState(() => _down = false),
        onTapUp: (_) => setState(() => _down = false),
        onTap: widget.onTap,
        child: AnimatedScale(
          scale: _down ? 0.96 : 1,
          duration: const Duration(milliseconds: 120),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 13),
            decoration: BoxDecoration(
              color: widget.color.withValues(alpha: 0.09),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: widget.color.withValues(alpha: 0.22)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 34,
                  height: 34,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: widget.color.withValues(alpha: 0.18),
                    borderRadius: BorderRadius.circular(11),
                    border: Border.all(color: widget.color.withValues(alpha: 0.3)),
                  ),
                  child: SvgPicture.asset(widget.icon, width: widget.iconSize.width, height: widget.iconSize.height),
                ),
                const SizedBox(height: 7),
                Text(
                  widget.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontFamily: AppText.fontFamily,
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    height: 19.5 / 13,
                    letterSpacing: -0.13,
                    color: dark ? const Color(0xE0FFFFFF) : c.textPrimary,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  widget.subtitle,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontFamily: AppText.fontFamily, fontSize: 11, height: 16.5 / 11, color: dark ? const Color(0x66FFFFFF) : c.textMuted),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _StatTile extends StatelessWidget {
  const _StatTile({required this.color, required this.icon, required this.iconSize, required this.value, required this.caption});

  final Color color;
  final String icon;
  final Size iconSize;
  final String value;
  final String caption;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final dark = context.isDark;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 9),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withValues(alpha: 0.18)),
      ),
      child: Column(
        children: [
          SizedBox(
            width: 14,
            height: 14,
            child: Center(
              child: SvgPicture.asset(icon, width: iconSize.width, height: iconSize.height),
            ),
          ),
          const SizedBox(height: 2.5),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              value,
              maxLines: 1,
              style: TextStyle(
                fontFamily: AppText.fontFamily,
                fontSize: 13,
                fontWeight: FontWeight.w800,
                height: 1,
                letterSpacing: -0.26,
                color: dark ? const Color(0xD9FFFFFF) : c.textPrimary,
              ),
            ),
          ),
          const SizedBox(height: 2.5),
          Text(
            caption,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: TextStyle(fontFamily: AppText.fontFamily, fontSize: 9, height: 11.7 / 9, color: dark ? const Color(0x61FFFFFF) : c.textMuted),
          ),
        ],
      ),
    );
  }
}
