import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utils/app_theme.dart';
import '../../utils/l10n.dart';
import '../../widgets/common.dart';
import 'widgets/ob_lock_orbit_hero.dart';
import 'widgets/ob_text_motion.dart';
import 'widgets/intro_motion.dart';

/// Figma: OnBoarding 2 — "Lock Distracting Apps" (727:42272).
///
/// "Next" goes straight to the next screen (apps are picked later in onboarding).
class Onboarding2Screen extends StatelessWidget {
  const Onboarding2Screen({super.key, required this.onNext, required this.onSkip});

  final VoidCallback onNext;
  final VoidCallback onSkip;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final dark = context.isDark;
    final l = context.l10n;
    return OnboardingScaffold(
      onSkip: onSkip,
      dotsIndex: 0,
      starsAsset: 'assets/svg/ob2_stars.svg',
      // Sits near the top (less empty space under the header).
      bodyAlign: 0.15,
      button: PrimaryButton(label: l.cvNext, onPressed: onNext),
      footerExtra: Text(
        l.freeToStart,
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
      body: Column(
        children: [
          const SizedBox(height: 8),
          const IntroEnter(scale: true, child: ObLockOrbitHero()),
          const SizedBox(height: 34),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.gutter),
            child: IntroEnter(
              index: 1,
              child: Column(
                children: [
                  ObRevealText(
                    l.ob2Title,
                    style: TextStyle(
                      fontFamily: AppText.fontFamily,
                      fontSize: 26,
                      fontWeight: FontWeight.w800,
                      height: 35.75 / 26,
                      letterSpacing: -0.4,
                      color: c.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 7),
                  Text(
                    l.ob2Body,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: AppText.fontFamily,
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      height: 21.13 / 13,
                      color: dark ? const Color(0xFF5A5278) : c.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                IntroEnter(
                  index: 2,
                  child: _FeatureRow(
                    icon: 'assets/svg/ob2_shield.svg',
                    iconWidth: 16,
                    iconHeight: 16,
                    tint: _green,
                    darkFill: const Color(0xFF0D2419),
                    text: l.ob2Feature1,
                  ),
                ),
                const SizedBox(height: 10),
                IntroEnter(
                  index: 3,
                  child: _FeatureRow(
                    icon: 'assets/svg/ob2_clock.svg',
                    iconWidth: 15.33,
                    iconHeight: 15.33,
                    tint: _sky,
                    darkFill: const Color(0xFF0A1628),
                    text: l.ob2Feature2,
                  ),
                ),
                const SizedBox(height: 10),
                IntroEnter(
                  index: 4,
                  child: _FeatureRow(
                    icon: 'assets/svg/ob2_padlock.svg',
                    iconWidth: 14,
                    iconHeight: 15.33,
                    tint: AppPalette.violet,
                    darkFill: const Color(0xFF1A1238),
                    text: l.ob2Feature3,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}

const _green = Color(0xFF34D399);
const _sky = Color(0xFF60A5FA);

/// One feature row: tinted round icon + text, on a dark-violet gradient card.
class _FeatureRow extends StatelessWidget {
  const _FeatureRow({required this.icon, required this.iconWidth, required this.iconHeight, required this.tint, required this.darkFill, required this.text});

  final String icon;
  final double iconWidth;
  final double iconHeight;
  final Color tint;
  final Color darkFill;
  final String text;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final dark = context.isDark;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: dark ? const Color(0xFF23204A) : c.glassBorder),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: dark ? const [Color(0xFF13112A), Color(0xFF1A1840)] : [c.glassFill, AppPalette.accent.withValues(alpha: 0.06)],
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: dark ? darkFill : tint.withValues(alpha: 0.12),
              border: Border.all(color: tint.withValues(alpha: dark ? 0.2 : 0.3)),
            ),
            child: SvgPicture.asset(icon, width: iconWidth, height: iconHeight),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontFamily: AppText.fontFamily,
                fontSize: 13,
                fontWeight: FontWeight.w600,
                height: 18.57 / 13,
                color: dark ? const Color(0xFFC4BFE8) : c.textPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
