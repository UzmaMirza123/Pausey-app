import 'dart:math' as math;
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utils/app_theme.dart';
import '../../widgets/common.dart';
import 'widgets/ob_text_motion.dart';
import 'widgets/intro_motion.dart';
import '../../widgets/glow_background.dart';
import '../../utils/l10n.dart';
import 'widgets/ob3_svg_light_mapper.dart';

/// Figma: OnBoarding 4 — "Track Your Progress" (727:41995).
class Onboarding4Screen extends StatelessWidget {
  const Onboarding4Screen({super.key, required this.onNext, required this.onSkip});

  final VoidCallback onNext;
  final VoidCallback onSkip;

  static const _blobs = [
    Blob(left: -130, top: -120, size: 420, color: AppPalette.blue, opacity: 0.13, blur: 55),
    Blob(right: -100, top: 200, size: 300, color: AppPalette.blue, opacity: 0.11, blur: 45),
    Blob(left: -50, bottom: 79, size: 200, color: AppPalette.violet, opacity: 0.08, blur: 35),
  ];

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final dark = context.isDark;
    return OnboardingScaffold(
      onSkip: onSkip,
      dotsIndex: 0,
      blobs: _blobs,
      starsAsset: 'assets/svg/ob4_stars.svg',
      button: PrimaryButton(label: context.l10n.continueLabel, onPressed: onNext),
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
            const SizedBox(height: 8),
            const IntroEnter(scale: true, child: _Illustration()),
            IntroEnter(
              index: 1,
              child: ObRevealText(context.l10n.ob4Title, style: AppText.h1.copyWith(color: c.textPrimary)),
            ),
            const SizedBox(height: 12),
            IntroEnter(
              index: 2,
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 295),
                child: Text(
                  context.l10n.ob4Body,
                  textAlign: TextAlign.center,
                  style: AppText.body.copyWith(color: c.textSecondary),
                ),
              ),
            ),
            const SizedBox(height: 18),
            SizedBox(
              width: double.infinity,
              child: IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: IntroEnter(
                        index: 3,
                        child: _FeatureTile(
                          color: AppPalette.blue,
                          icon: 'assets/svg/ob4_icon_weekly.svg',
                          title: context.l10n.ob4Weekly,
                          subtitle: context.l10n.ob4WeeklySub,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: IntroEnter(
                        index: 4,
                        child: _FeatureTile(
                          color: AppPalette.teal,
                          icon: 'assets/svg/ob4_icon_goals.svg',
                          iconSize: 14.5,
                          title: context.l10n.ob4Goals,
                          subtitle: context.l10n.ob4GoalsSub,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: IntroEnter(
                        index: 5,
                        child: _FeatureTile(
                          color: AppPalette.violet,
                          icon: 'assets/svg/ob4_icon_insights.svg',
                          title: context.l10n.ob4Insights,
                          subtitle: context.l10n.ob4InsightsSub,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: IntroEnter(
                        index: 6,
                        child: _FeatureTile(
                          color: AppPalette.gold,
                          icon: 'assets/svg/ob4_icon_streaks.svg',
                          iconSize: 14.5,
                          title: context.l10n.ob4Streaks,
                          subtitle: context.l10n.ob4StreaksSub,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 4),
          ],
        ),
      ),
    );
  }
}

/// 320×320 analytics hero (phone, chart, score cards and three progress rings),
/// exported from Figma as one SVG. It fades/rises in and then floats gently.
class _Illustration extends StatefulWidget {
  const _Illustration();

  @override
  State<_Illustration> createState() => _IllustrationState();
}

class _IllustrationState extends State<_Illustration> with TickerProviderStateMixin {
  late final AnimationController _intro = AnimationController(vsync: this, duration: const Duration(milliseconds: 700))..forward();
  late final AnimationController _float = AnimationController(vsync: this, duration: const Duration(seconds: 4))..repeat();

  @override
  void dispose() {
    _intro.dispose();
    _float.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final dark = context.isDark;
    final intro = CurvedAnimation(parent: _intro, curve: Curves.easeOutCubic);
    return SizedBox(
      width: 320,
      height: 320,
      child: OverflowBox(
        maxWidth: 320,
        child: Stack(
          alignment: Alignment.center,
          children: [
            AnimatedBuilder(
              animation: Listenable.merge([intro, _float]),
              builder: (context, child) => Opacity(
                opacity: intro.value,
                child: Transform.translate(offset: Offset(0, 14 * (1 - intro.value) + 2.5 * math.sin(_float.value * 2 * math.pi)), child: child),
              ),
              child: ob3ThemedSvg(context, 'assets/svg/ob4_illustration.svg', width: 320, height: 320, dark: dark),
            ),
            // Figma "Gradient+Blur" (270×240, blur 21) centred over the hero.
            IgnorePointer(
              child: ImageFiltered(
                imageFilter: ImageFilter.blur(sigmaX: 10.5, sigmaY: 10.5),
                child: Container(
                  width: 270,
                  height: 240,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(127.5),
                    gradient: RadialGradient(
                      center: const Alignment(0, 0.04),
                      radius: 0.8,
                      colors: [AppPalette.blue.withValues(alpha: 0.22), AppPalette.blue.withValues(alpha: 0)],
                      stops: const [0, 0.72],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FeatureTile extends StatelessWidget {
  const _FeatureTile({required this.color, required this.icon, required this.title, required this.subtitle, this.iconSize = 15});

  final Color color;
  final String icon;
  final double iconSize;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final dark = context.isDark;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 11),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withValues(alpha: 0.2)),
      ),
      child: Column(
        children: [
          SizedBox(
            width: 15,
            height: 15,
            child: Center(
              child: SvgPicture.asset(icon, width: iconSize, height: iconSize),
            ),
          ),
          const SizedBox(height: 5),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              title,
              maxLines: 1,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontFamily: AppText.fontFamily,
                fontSize: 11,
                fontWeight: FontWeight.w700,
                height: 1,
                letterSpacing: -0.11,
                color: dark ? const Color(0xD1FFFFFF) : c.textPrimary,
              ),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            subtitle,
            maxLines: 2,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontFamily: AppText.fontFamily, fontSize: 9, height: 1, color: dark ? const Color(0x5CFFFFFF) : c.textMuted),
          ),
        ],
      ),
    );
  }
}
