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

  bool _leaving = false;

  /// A drag past the end of the last screen (Android: overscroll, iOS: bounce).
  bool _onScroll(ScrollNotification n) {
    if (n.depth != 0) return false;
    if (n is ScrollStartNotification) _leaving = false; // a new drag
    if (_leaving) return false;
    final m = n.metrics;
    final atEnd = m.pixels >= m.maxScrollExtent - 1;
    final pushedOn =
        (n is OverscrollNotification && n.overscroll > 6 && n.dragDetails != null) ||
        (n is ScrollUpdateNotification && n.dragDetails != null && m.pixels > m.maxScrollExtent + 40);
    if (atEnd && pushedOn) {
      _leaving = true;
      widget.onFinished();
    }
    return false;
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
      // Swipe left / right moves between the intro screens; swiping on past the last
      // one goes on to the questions (same as its Continue).
      child: NotificationListener<ScrollNotification>(
        onNotification: _onScroll,
        child: PageView(
          controller: _pager,
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
      ),
    );
  }
}
