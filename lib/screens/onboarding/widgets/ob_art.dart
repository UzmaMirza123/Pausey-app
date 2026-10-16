import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../utils/app_theme.dart';
import 'intro_motion.dart';

/// The onboarding illustrations (assets/onboarding/ob_NAME.png).
enum ObArtKind { relate, goal, apps, screentime, reflect, perm, journey, login, signup }

/// Character illustration on top of an onboarding / auth screen. It rises in,
/// then floats gently. In dark mode it sits in a soft glass circle so its light
/// background reads as part of the design. Decorative for screen readers.
class ObArt extends StatelessWidget {
  const ObArt(this.kind, {super.key, this.maxHeight = 200});
  final ObArtKind kind;
  final double maxHeight;

  @override
  Widget build(BuildContext context) {
    final dark = context.isDark;
    // Smaller on short phones so the content below stays in view.
    final h = (MediaQuery.sizeOf(context).height * 0.23).clamp(130.0, maxHeight);
    Widget img = Image.asset('assets/onboarding/ob_${kind.name}.png', height: h, fit: BoxFit.contain, filterQuality: FilterQuality.medium);
    if (dark) {
      img = Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: AppPalette.violet.withValues(alpha: 0.35), width: 1.2),
          boxShadow: [BoxShadow(color: AppPalette.accent.withValues(alpha: 0.28), blurRadius: 36)],
        ),
        child: ClipOval(child: SizedBox.square(dimension: h, child: ColoredBox(color: const Color(0xFFF0EEFC), child: Center(child: img)))),
      );
    }
    return ExcludeSemantics(
      child: SizedBox(
        height: h + (dark ? 10 : 0),
        child: Center(
          child: IntroEnter(scale: true, rise: 14, child: IntroFloat(amplitude: 5, period: const Duration(milliseconds: 3600), child: img)),
        ),
      ),
    );
  }
}

/// One burst of brand-coloured confetti (Lottie), played once on top of a screen.
/// Nothing is shown when the phone's "Remove animations" setting is on.
class ObConfetti extends StatelessWidget {
  const ObConfetti({super.key, this.size = 420});
  final double size;

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.maybeDisableAnimationsOf(context) ?? false) return const SizedBox.shrink();
    return IgnorePointer(
      child: ExcludeSemantics(child: Lottie.asset('assets/lottie/confetti.json', width: size, height: size, repeat: false, fit: BoxFit.contain)),
    );
  }
}
