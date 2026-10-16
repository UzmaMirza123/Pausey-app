import 'package:flutter/material.dart';

import '../../widgets/onboarding_nav.dart';
import 'onboarding_1_screen.dart';
import 'onboarding_2_screen.dart';
import 'onboarding_3_screen.dart';
import 'onboarding_4_screen.dart';

/// The 4 intro screens shown right after the splash (Reduce screen addiction →
/// Lock distracting apps → Stay focused → Track your progress). The last
/// "Continue" (or "Skip" on any of them) moves on to the onboarding questions.
class IntroFlow extends StatefulWidget {
  const IntroFlow({super.key, required this.onFinished, this.initialPage = 0});

  final VoidCallback onFinished;
  final int initialPage;

  @override
  State<IntroFlow> createState() => _IntroFlowState();
}

class _IntroFlowState extends State<IntroFlow> {
  late final PageController _pager = PageController(initialPage: widget.initialPage);
  static const _count = 4;

  void _next() {
    final page = _pager.page?.round() ?? 0;
    if (page >= _count - 1) {
      widget.onFinished();
      return;
    }
    _pager.nextPage(duration: const Duration(milliseconds: 480), curve: Curves.easeInOutCubic);
  }

  void _back() {
    if ((_pager.page ?? 0) > 0.5) {
      _pager.previousPage(duration: const Duration(milliseconds: 480), curve: Curves.easeInOutCubic);
    }
  }

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
        physics: const NeverScrollableScrollPhysics(),
        children: [
          for (final (i, page) in [
            Onboarding1Screen(onNext: _next, onSkip: _next),
            Onboarding2Screen(onNext: _next, onSkip: _next),
            Onboarding3Screen(onNext: _next, onSkip: _next),
            Onboarding4Screen(onNext: _next, onSkip: _next),
          ].indexed)
            OnboardingPageScope(index: i, controller: _pager, onBack: _back, child: page),
        ],
      ),
    );
  }
}
