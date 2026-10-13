import 'package:flutter/material.dart';

import '../../widgets/onboarding_nav.dart';

import 'onboarding_1_screen.dart';
import 'onboarding_2_screen.dart';
import 'onboarding_3_screen.dart';
import 'onboarding_4_screen.dart';
import 'onboarding_5_screen.dart';
import 'onboarding_6_screen.dart';
import 'onboarding_7_screen.dart';
import 'onboarding_8_screen.dart';
import 'onboarding_9_screen.dart';

/// Runs the 9 onboarding screens in order. "Continue" goes to the next page,
/// "Skip" jumps to the last one, and the last page calls [onFinished].
class OnboardingFlow extends StatefulWidget {
  const OnboardingFlow({super.key, this.onFinished, this.initialPage = 0});

  final VoidCallback? onFinished;
  final int initialPage;

  @override
  State<OnboardingFlow> createState() => _OnboardingFlowState();
}

class _OnboardingFlowState extends State<OnboardingFlow> {
  late final PageController _pager = PageController(initialPage: widget.initialPage);
  static const _count = 9;

  void _next() {
    final page = _pager.page?.round() ?? 0;
    if (page >= _count - 1) {
      widget.onFinished?.call();
      return;
    }
    _pager.nextPage(duration: const Duration(milliseconds: 480), curve: Curves.easeInOutCubic);
  }

  void _back() {
    if ((_pager.page ?? 0) > 0.5) {
      _pager.previousPage(duration: const Duration(milliseconds: 480), curve: Curves.easeInOutCubic);
    }
  }

  void _skip() => _pager.animateToPage(_count - 1, duration: const Duration(milliseconds: 500), curve: Curves.easeOutCubic);

  @override
  void dispose() {
    _pager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) {
        if (!didPop) _back();
      },
      child: PageView(
        controller: _pager,
        // Pages with questions must be answered with the button, so no swiping.
        physics: const NeverScrollableScrollPhysics(),
        children: [
          for (final (i, page) in [
            Onboarding1Screen(onNext: _next, onSkip: _skip),
            Onboarding2Screen(onNext: _next, onSkip: _skip),
            Onboarding3Screen(onNext: _next, onSkip: _skip),
            Onboarding4Screen(onNext: _next, onSkip: _skip),
            Onboarding5Screen(onNext: _next, onSkip: _skip),
            Onboarding6Screen(onNext: _next, onSkip: _skip),
            Onboarding7Screen(onNext: _next, onSkip: _skip),
            Onboarding8Screen(onNext: _next, onSkip: _skip),
            Onboarding9Screen(onNext: _next, onSkip: _skip),
          ].indexed)
            OnboardingPageScope(index: i, controller: _pager, onBack: _back, child: page),
        ],
      ),
    );
  }
}
