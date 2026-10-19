import 'package:flutter/material.dart';

import '../../services/auth_service.dart';
import '../../widgets/onboarding_nav.dart';
import 'onboarding_1_screen.dart';
import 'onboarding_2_screen.dart';
import 'onboarding_3_screen.dart';
import 'onboarding_4_screen.dart';
import 'onboarding_7_screen.dart';
import 'onboarding_9_screen.dart';
import 'onboarding_state.dart';
import 'stages/about_you.dart';
import 'stages/set_up.dart';
import 'stages/your_plan.dart';
import 'widgets/ob_kit.dart';

export 'stages/set_up.dart' show ObFirstAction;

/// Every onboarding screen, in order. One flow for all of them: the same Next,
/// back arrow, Skip, swipe, progress dots and page change everywhere.
enum ObStep {
  // The 4 intro screens.
  reduceAddiction,
  lockApps,
  stayFocused,
  trackProgress,
  // Questions and set-up.
  relate,
  goal,
  screenTime,
  permissions,
  apps,
  reflection,
  story,
  dailyGoal,
  accessibility,
  account,
  allSet,
}

/// The onboarding, from the first intro screen to "You're all set!".
///
/// Progress is saved after every step, so closing the app resumes where the user
/// left. The starter plan is applied only on the last screen.
class OnboardingFlow extends StatefulWidget {
  const OnboardingFlow({super.key, this.onFinished, this.initialStage});

  /// Called when done. `null` = a returning user signed in from the welcome screen.
  final void Function(ObFirstAction? action)? onFinished;

  /// Preview/testing: start on this screen (an [ObStep] index) instead of the saved one.
  final int? initialStage;

  static final stageCount = ObStep.values.length;

  /// Extra screens inside the "How it works" story (4 beats = 4 screens).
  static const _storyExtra = 3;

  /// Running step for the progress dots: every screen moves the active dot one
  /// step (1 → 2 → 3 → 1 …); the story's beats count as screens too.
  static int dotsAt(int stage) => stage + (stage > ObStep.story.index ? _storyExtra : 0);

  @override
  State<OnboardingFlow> createState() => _OnboardingFlowState();
}

class _OnboardingFlowState extends State<OnboardingFlow> {
  /// How long a page turn takes (smooth, like turning a book page).
  static const _pageTurn = Duration(milliseconds: 650);

  final _s = OnboardingState.instance;
  final _gate = ObBackGate();
  bool _forward = true;

  /// Step the dots glide in from (the screen before).
  late int _dotsFrom;

  @override
  void initState() {
    super.initState();
    _s.load();
    if (widget.initialStage != null) _s.stage = widget.initialStage!;
    _s.stage = _s.stage.clamp(0, OnboardingFlow.stageCount - 1);
    _s.selectDefaults();
    _dotsFrom = OnboardingFlow.dotsAt(_s.stage);
  }

  bool get _signedIn => AuthService.instance.value is! SignedOut;

  void _go(int to) {
    // The account screen is skipped when the user is already signed in.
    if (to == ObStep.account.index && _signedIn) to += (to > _s.stage ? 1 : -1);
    if (to < 0 || to >= OnboardingFlow.stageCount) return;
    if (to == ObStep.dailyGoal.index) _s.suggestPlan(); // fill the starter plan from the answers
    _gate.handler = null;
    setState(() {
      _forward = to > _s.stage;
      // One step forward or back.
      _dotsFrom = OnboardingFlow.dotsAt(to) + (_forward ? -1 : 1);
    });
    _s.update((s) => s.stage = to);
  }

  void _next() => _go(_s.stage + 1);

  /// A screen's inner step first (story beats), then the previous screen.
  void _back() {
    final inner = _gate.handler;
    inner != null ? inner() : _go(_s.stage - 1);
  }

  /// "Enter Pausey": apply the plan and open the app on Home.
  Future<void> _enter() async {
    await _s.applyPlan();
    await _s.reset();
    widget.onFinished?.call(null);
  }

  Widget _stage(ObStep step) => switch (step) {
        ObStep.reduceAddiction => Onboarding1Screen(onNext: _next, onSkip: _next),
        ObStep.lockApps => Onboarding2Screen(onNext: _next, onSkip: _next),
        ObStep.stayFocused => Onboarding3Screen(onNext: _next, onSkip: _next),
        ObStep.trackProgress => Onboarding4Screen(onNext: _next, onSkip: _next),
        ObStep.relate => RelateStage(onNext: _next),
        ObStep.goal => GoalStage(onNext: _next),
        ObStep.screenTime => ScreenTimeStage(onNext: _next),
        // Usage access + display over other apps, so the next screen can show the most-used apps.
        ObStep.permissions => PermissionsStage(onNext: _next),
        ObStep.apps => AppsStage(onNext: _next),
        ObStep.reflection => ReflectionStage(onNext: _next),
        ObStep.story => HowItHelpsStage(onNext: _next),
        ObStep.dailyGoal => Onboarding7Screen(onNext: _next, onSkip: _next),
        ObStep.accessibility => AccessibilityStage(onNext: _next),
        ObStep.account => AccountStage(onNext: _next),
        ObStep.allSet => Onboarding9Screen(onNext: _enter, onSkip: () => _go(0)),
      };

  @override
  Widget build(BuildContext context) {
    final i = _s.stage;
    final reduced = ObMotion.reduced(context);
    final canBack = i > 0;
    return PopScope(
      canPop: i == 0,
      onPopInvokedWithResult: (didPop, _) {
        if (!didPop) _back();
      },
      child: AnimatedSwitcher(
        duration: reduced ? Duration.zero : _pageTurn,
        switchInCurve: Curves.easeInOutCubic,
        switchOutCurve: Curves.easeInOutCubic,
        // Next: the leaving page stays on top while it turns away; back: the returning page turns in on top.
        layoutBuilder: (current, previous) => Stack(
          alignment: Alignment.center,
          children: _forward ? [?current, ...previous] : [...previous, ?current],
        ),
        // Each page turns its own content like a book page and keeps its footer still (FlowSwitchScope).
        // The leaving page takes no taps, so a quick second tap can't skip a screen.
        transitionBuilder: (child, a) {
          final incoming = child.key == ValueKey(i);
          return IgnorePointer(
            ignoring: !incoming,
            child: FlowSwitchScope(animation: a, forward: _forward, incoming: incoming, child: child),
          );
        },
        child: KeyedSubtree(
          key: ValueKey(i),
          // The same place-in-the-flow for both kinds of screens (question pages and the original designs).
          child: ObFlowScope(
            dotsAt: OnboardingFlow.dotsAt(i),
            dotsFrom: _dotsFrom,
            onSkip: _next,
            canBack: canBack,
            onBack: _back,
            backGate: _gate,
            child: OnboardingPageScope(
              canBack: canBack,
              onBack: _back,
              dotsAt: OnboardingFlow.dotsAt(i),
              dotsFrom: _dotsFrom,
              child: _stage(ObStep.values[i]),
            ),
          ),
        ),
      ),
    );
  }
}
