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
    final h = (MediaQuery.sizeOf(context).height * 0.38).clamp(220.0, 340.0);
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
                child: _Art(height: h),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// The illustration with its hand-written note ("Less scrolling / More you ♥")
/// on the left and the labelled books at the bottom right. The words are real
/// text on top of the picture, so they appear in the app's language. The note
/// is "written" in once, then the heart pops and the book labels fade in.
class _Art extends StatefulWidget {
  const _Art({required this.height});
  final double height;

  @override
  State<_Art> createState() => _ArtState();
}

class _ArtState extends State<_Art> with SingleTickerProviderStateMixin {
  late final _c = AnimationController(vsync: this, duration: const Duration(milliseconds: 2600));

  // Art canvas, in source pixels; overlay positions below use the same units.
  static const _srcW = 246.0, _srcH = 262.0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (MediaQuery.maybeDisableAnimationsOf(context) ?? false) {
      _c.value = 1;
    } else if (_c.value == 0 && !_c.isAnimating) {
      _c.forward();
    }
  }

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  double _at(double a, double b, [Curve curve = Curves.easeOutCubic]) =>
      curve.transform(((_c.value - a) / (b - a)).clamp(0.0, 1.0));

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final h = widget.height;
    final u = h / _srcH; // one source pixel on screen
    final w = _srcW * u;
    final ink = context.isDark ? const Color(0xFFB9A8FF) : const Color(0xFF6A55D8);
    final hand = TextStyle(fontFamily: 'Caveat', fontSize: 16.5 * u, height: 0.92, fontWeight: FontWeight.w600, color: ink);
    final book = AppText.caption.copyWith(fontSize: 8.6 * u, height: 1, fontWeight: FontWeight.w700, color: const Color(0xFF5845B5));

    // Reveals a line of handwriting from where the writing starts.
    Widget written(Widget child, double t) => ClipRect(
          child: Align(alignment: AlignmentDirectional.centerStart, widthFactor: t, child: child),
        );

    Widget label(String text, double cy, double t) => Positioned(
          left: (201 - 3) * u,
          width: 44 * u,
          top: (cy - 6) * u,
          height: 12 * u,
          child: Opacity(
            opacity: t,
            child: Transform.translate(
              offset: Offset(0, 3 * u * (1 - t)),
              child: Transform.rotate(
                angle: 0.03,
                child: FittedBox(fit: BoxFit.scaleDown, child: Text(text, maxLines: 1, style: book)),
              ),
            ),
          ),
        );

    return SizedBox(
      width: w,
      height: h,
      child: AnimatedBuilder(
        animation: _c,
        builder: (context, _) {
          final heart = _at(0.72, 0.95, Curves.elasticOut);
          return Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned.fill(
                child: Image.asset('assets/onboarding/ob_intro1.png', fit: BoxFit.contain, filterQuality: FilterQuality.medium),
              ),
              // Hand-written note, slightly tilted like the mockup.
              Positioned(
                left: (12 - 3) * u,
                top: 26 * u,
                width: 52 * u,
                height: 80 * u,
                child: Transform.rotate(
                  angle: -0.2,
                  // Laid out from the left in every language so the note never runs into her hair.
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    textDirection: TextDirection.ltr,
                    children: [
                      written(Text(l.ob1ArtNote1, maxLines: 2, style: hand), _at(0.22, 0.55, Curves.easeInOut)),
                      SizedBox(height: 2 * u),
                      written(FittedBox(fit: BoxFit.scaleDown, child: Text(l.ob1ArtNote2, maxLines: 1, style: hand)), _at(0.5, 0.75, Curves.easeInOut)),
                      SizedBox(height: 3 * u),
                      Padding(
                        padding: EdgeInsetsDirectional.only(start: 12 * u),
                        child: Transform.scale(scale: heart, child: Icon(Icons.favorite_border_rounded, size: 11 * u, color: ink)),
                      ),
                    ],
                  ),
                ),
              ),
              label(l.ob1BookFocus, 210.5, _at(0.4, 0.65)),
              label(l.ob1BookBalance, 225, _at(0.5, 0.75)),
              label(l.ob1BookHappier, 242, _at(0.6, 0.85)),
            ],
          );
        },
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
