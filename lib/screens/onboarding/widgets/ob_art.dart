import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'intro_motion.dart';

/// The onboarding illustrations (assets/onboarding/ob_NAME.png).
enum ObArtKind { relate, moretime, apps, screentime, reflect, permissions, access, journey, login, signup }

/// Character illustration on top of an onboarding / auth screen. It rises in,
/// then floats gently. The art has a transparent background, so it sits on the
/// light and dark themes alike. Decorative for screen readers.
class ObArt extends StatelessWidget {
  const ObArt(this.kind, {super.key, this.maxHeight = 200});
  final ObArtKind kind;
  final double maxHeight;

  @override
  Widget build(BuildContext context) {
    // Smaller on short phones so the content below stays in view.
    final h = (MediaQuery.sizeOf(context).height * 0.23).clamp(130.0, maxHeight);
    final img = Image.asset('assets/onboarding/ob_${kind.name}.png', height: h, fit: BoxFit.contain, filterQuality: FilterQuality.medium);
    return ExcludeSemantics(
      child: SizedBox(
        height: h,
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
