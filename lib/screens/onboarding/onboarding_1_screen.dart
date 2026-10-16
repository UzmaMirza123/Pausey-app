import 'package:flutter/material.dart';

import '../../utils/app_theme.dart';
import '../../utils/l10n.dart';
import '../../widgets/common.dart';
import '../../widgets/pausey_logo.dart';
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
      headerLeading: IntroEnter(
        rise: 8,
        // The brand name always reads left to right, also in Urdu / Arabic.
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: PauseyWordmark(t: 1, style: AppText.logo.copyWith(fontSize: 22, height: 1.1, letterSpacing: -0.6, color: c.textPrimary)),
        ),
      ),
      dotsIndex: 0,
      starsAsset: 'assets/svg/ob1_stars.svg',
      button: PrimaryButton(label: l.continueLabel, onPressed: onNext),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.gutter),
        child: Column(
          children: [
            const SizedBox(height: 8),
            const _Illustration(),
            const SizedBox(height: 14),
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
                        child: _StatCard(to: 252, format: (v) => '${v ~/ 60}h ${(v % 60).floor()}m', caption: l.ob1StatAvg, color: AppPalette.accent),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: IntroEnter(
                        index: 4,
                        child: _StatCard(to: 73, format: (v) => '${v.round()}%', caption: l.ob1StatSocial, color: AppPalette.gold, delay: 0.1),
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

/// Hero: the girl on the bean bag with her robot buddy. A soft purple glow
/// breathes behind her while she rises in and then floats gently.
class _Illustration extends StatefulWidget {
  const _Illustration();

  @override
  State<_Illustration> createState() => _IllustrationState();
}

class _IllustrationState extends State<_Illustration> with SingleTickerProviderStateMixin {
  late final _glow = AnimationController(vsync: this, duration: const Duration(milliseconds: 4200));

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final still = MediaQuery.maybeDisableAnimationsOf(context) ?? false;
    if (still) {
      _glow.value = 0.5;
    } else if (!_glow.isAnimating) {
      _glow.repeat(reverse: true);
    }
  }

  @override
  void dispose() {
    _glow.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Smaller on short phones so the text and stats stay in view.
    final h = (MediaQuery.sizeOf(context).height * 0.34).clamp(200.0, 300.0);
    return ExcludeSemantics(
      child: SizedBox(
        height: h,
        width: double.infinity,
        child: Stack(
          alignment: Alignment.center,
          children: [
            AnimatedBuilder(
              animation: _glow,
              builder: (_, _) {
                final t = Curves.easeInOut.transform(_glow.value);
                return Transform.scale(
                  scale: 0.92 + 0.08 * t,
                  child: Container(
                    width: h * 0.95,
                    height: h * 0.95,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: RadialGradient(
                        colors: [
                          AppPalette.accent.withValues(alpha: 0.10 + 0.08 * t),
                          AppPalette.accent.withValues(alpha: 0),
                        ],
                        stops: const [0.2, 1],
                      ),
                    ),
                  ),
                );
              },
            ),
            IntroEnter(
              scale: true,
              rise: 24,
              child: IntroFloat(
                amplitude: 6,
                period: const Duration(milliseconds: 3800),
                child: Image.asset('assets/onboarding/ob_intro1.png', height: h, fit: BoxFit.contain, filterQuality: FilterQuality.medium),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Numbers in the stat cards count up once as the card appears.
class _CountUp extends StatelessWidget {
  const _CountUp({required this.to, required this.format, required this.style, this.delay = 0});
  final double to;
  final String Function(double v) format;
  final TextStyle style;
  final double delay;

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.maybeDisableAnimationsOf(context) ?? false) return Text(format(to), style: style);
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: 1),
      duration: const Duration(milliseconds: 1500),
      curve: Interval(delay, 1, curve: Curves.easeOutCubic),
      builder: (_, t, _) => Text(format(to * t), style: style),
    );
  }
}

class _StatCard extends StatelessWidget {
  const _StatCard({required this.to, required this.format, required this.caption, required this.color, this.delay = 0});

  final double to;
  final String Function(double v) format;
  final double delay;
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
            child: Semantics(label: format(to), child: ExcludeSemantics(child: _CountUp(to: to, format: format, delay: delay, style: AppText.stat.copyWith(color: color)))),
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
