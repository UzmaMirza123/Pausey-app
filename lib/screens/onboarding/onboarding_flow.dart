import 'package:flutter/material.dart';

import '../../services/auth_service.dart';
import '../../widgets/onboarding_nav.dart';
import 'onboarding_7_screen.dart';
import 'onboarding_state.dart';
import 'stages/about_you.dart';
import 'stages/set_up.dart';
import 'stages/your_plan.dart';
import 'widgets/ob_kit.dart';

export 'stages/set_up.dart' show ObFirstAction;

/// The conversational onboarding: 11 stages in three chapters (the 3 dots).
///
/// Progress is saved after every step, so closing the app resumes where the user
/// left. The starter plan is applied only on the last stage.
class OnboardingFlow extends StatefulWidget {
  const OnboardingFlow({super.key, this.onFinished, this.initialStage, this.onBackFromStart});

  /// Called when done. `null` = a returning user signed in from the welcome screen.
  final void Function(ObFirstAction? action)? onFinished;

  /// Back pressed on the first question (returns to the intro screens).
  final VoidCallback? onBackFromStart;

  /// First stage shown (the old "Your time is yours" welcome, stage 0, was removed).
  static const firstStage = 1;

  /// Preview/testing: start on this stage instead of the saved one.
  final int? initialStage;

  static const stageCount = 11;
  static const _accountStage = 9;

  /// Progress dot (chapter) for each stage; null = no dots (welcome).
  static int? chapterOf(int stage) => stage == 0 ? null : (stage <= 4 ? 0 : (stage <= 7 ? 1 : 2));

  @override
  State<OnboardingFlow> createState() => _OnboardingFlowState();
}

class _OnboardingFlowState extends State<OnboardingFlow> {
  final _s = OnboardingState.instance;
  final _gate = ObBackGate();

  /// Lets the original screen's footer show the back arrow and the middle progress dot.
  final _dialPager = PageController();
  bool _forward = true;

  @override
  void initState() {
    super.initState();
    _s.load();
    if (widget.initialStage != null) _s.stage = widget.initialStage!;
    _s.stage = _s.stage.clamp(OnboardingFlow.firstStage, OnboardingFlow.stageCount - 1);
  }

  bool get _signedIn => AuthService.instance.value is! SignedOut;

  void _go(int to) {
    // The account stage is skipped when the user is already signed in.
    if (to == OnboardingFlow._accountStage && _signedIn) to += (to > _s.stage ? 1 : -1);
    if (to < OnboardingFlow.firstStage) {
      widget.onBackFromStart?.call();
      return;
    }
    if (to >= OnboardingFlow.stageCount) return;
    if (to == 7) _s.suggestPlan(); // fill the starter plan from the answers
    _gate.handler = null;
    setState(() => _forward = to > _s.stage);
    _s.update((s) => s.stage = to);
  }

  void _next() => _go(_s.stage + 1);
  /// A stage's inner step first (story beats), then the previous stage.
  void _back() {
    final inner = _gate.handler;
    inner != null ? inner() : _go(_s.stage - 1);
  }

  @override
  void dispose() {
    _dialPager.dispose();
    super.dispose();
  }

  Future<void> _finish(ObFirstAction action) async {
    await _s.applyPlan();
    await _s.reset();
    widget.onFinished?.call(action);
  }

  Widget _stage(int i) => switch (i) {
        1 => RelateStage(onNext: _next),
        2 => GoalStage(onNext: _next),
        3 => AppsStage(onNext: _next),
        4 => ScreenTimeStage(onNext: _next),
        5 => ReflectionStage(onNext: _next),
        6 => HowItHelpsStage(onNext: _next),
        // "Set your daily screen-time goal" (the original onboarding screen) in place of the starter plan.
        7 => OnboardingPageScope(index: 1, controller: _dialPager, onBack: _back, child: Onboarding7Screen(onNext: _next, onSkip: _next)),
        8 => PermissionsStage(onNext: _next),
        9 => AccountStage(onNext: _next),
        _ => ReadyStage(onFinish: _finish),
      };

  @override
  Widget build(BuildContext context) {
    final i = _s.stage;
    final reduced = ObMotion.reduced(context);
    return PopScope(
      canPop: i == 0,
      onPopInvokedWithResult: (didPop, _) {
        if (!didPop) _back();
      },
      child: AnimatedSwitcher(
        duration: reduced ? Duration.zero : ObMotion.page,
        switchInCurve: Curves.easeOutCubic,
        switchOutCurve: Curves.easeInCubic,
        transitionBuilder: (child, a) {
          final incoming = child.key == ValueKey(i);
          final dir = (_forward ? 1 : -1) * (incoming ? 1 : -1);
          return FadeTransition(
            opacity: a,
            child: SlideTransition(position: Tween(begin: Offset(0.06 * dir, 0), end: Offset.zero).animate(a), child: child),
          );
        },
        child: KeyedSubtree(
          key: ValueKey(i),
          child: ObFlowScope(chapter: OnboardingFlow.chapterOf(i), canBack: i > OnboardingFlow.firstStage || widget.onBackFromStart != null, onBack: _back, backGate: _gate, child: _stage(i)),
        ),
      ),
    );
  }
}
