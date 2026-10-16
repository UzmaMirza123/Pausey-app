import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utils/app_theme.dart';
import '../../utils/l10n.dart';
import '../../widgets/common.dart';
import 'widgets/ob_text_motion.dart';
import 'widgets/intro_motion.dart';

/// Figma: OnBoarding 1 — "Reduce Screen Addiction" (727:41056).
class Onboarding1Screen extends StatelessWidget {
  const Onboarding1Screen({super.key, required this.onNext, required this.onSkip});

  final VoidCallback onNext;
  final VoidCallback onSkip;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final l = context.l10n;
    return OnboardingScaffold(
      onSkip: onSkip,
      dotsIndex: 0,
      starsAsset: 'assets/svg/ob1_stars.svg',
      button: PrimaryButton(label: l.continueLabel, onPressed: onNext),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.gutter),
        child: Column(
          children: [
            const SizedBox(height: 24),
            const IntroEnter(scale: true, child: IntroFloat(child: _Illustration())),
            const SizedBox(height: 6),
            IntroEnter(
              index: 1,
              child: ObRevealText(l.ob1Title, style: AppText.h1.copyWith(color: c.textPrimary)),
            ),
            const SizedBox(height: 13),
            IntroEnter(
              index: 2,
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 295),
                child: Text(
                  l.ob1Body,
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
                        child: _StatCard(value: '4h 12m', caption: l.ob1StatAvg, color: AppPalette.accent),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: IntroEnter(
                        index: 4,
                        child: _StatCard(value: '73%', caption: l.ob1StatSocial, color: AppPalette.gold),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}

/// 300×300 hero: soft blue glow, violet disc and the phone/lock illustration.
class _Illustration extends StatelessWidget {
  const _Illustration();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 300,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned.fill(
            child: ImageFiltered(
              imageFilter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    center: const Alignment(0, 0.1),
                    colors: [AppPalette.blue.withValues(alpha: 0.22), AppPalette.blue.withValues(alpha: 0)],
                    stops: const [0, 0.68],
                  ),
                ),
              ),
            ),
          ),
          Container(
            width: 224,
            height: 224,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [AppPalette.accent.withValues(alpha: 0.16), AppPalette.violet.withValues(alpha: 0.07)],
              ),
            ),
          ),
          SvgPicture.asset('assets/svg/ob1_illustration.svg', width: 240, height: 280),
        ],
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  const _StatCard({required this.value, required this.caption, required this.color});

  final String value;
  final String caption;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 11),
      color: color.withValues(alpha: 0.1),
      borderColor: color.withValues(alpha: 0.22),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(value, style: AppText.stat.copyWith(color: color)),
          ),
          const SizedBox(height: 2),
          Text(
            caption,
            textAlign: TextAlign.center,
            style: AppText.caption.copyWith(color: context.colors.textMuted),
          ),
        ],
      ),
    );
  }
}
