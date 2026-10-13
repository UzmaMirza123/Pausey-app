import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'screens/onboarding/onboarding_flow.dart';
import 'screens/splash_screen.dart';
import 'utils/app_theme.dart';
import 'utils/theme_controller.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const PauseyApp());
}

class PauseyApp extends StatelessWidget {
  const PauseyApp({super.key, this.home});

  /// Optional start screen (used by previews); defaults to the splash.
  final Widget? home;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: ThemeController.instance,
      builder: (context, mode, _) {
        final dark = mode == ThemeMode.dark;
        SystemChrome.setSystemUIOverlayStyle(
          (dark ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark)
              .copyWith(statusBarColor: Colors.transparent, systemNavigationBarColor: Colors.transparent),
        );
        return MaterialApp(
          title: 'Pausey',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
          themeMode: mode,
          builder: (context, child) => _TabletScale(child: child!),
          home: home ?? const _Root(),
        );
      },
    );
  }
}

/// On tablets the phone-sized design would look tiny, so the whole UI is drawn
/// at a phone-like size and scaled up evenly. Phones are left untouched.
class _TabletScale extends StatelessWidget {
  const _TabletScale({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    final size = mq.size;
    if (size.shortestSide < 600) return child;
    final scale = math.min(size.width / 430, size.height / 900).clamp(1.0, 1.7);
    final virtual = size / scale;
    return FittedBox(
      fit: BoxFit.contain,
      child: SizedBox(
        width: virtual.width,
        height: virtual.height,
        child: MediaQuery(
          data: mq.copyWith(
            size: virtual,
            padding: mq.padding / scale,
            viewPadding: mq.viewPadding / scale,
            viewInsets: mq.viewInsets / scale,
          ),
          child: child,
        ),
      ),
    );
  }
}

/// Splash first, then the onboarding flow.
class _Root extends StatefulWidget {
  const _Root();

  @override
  State<_Root> createState() => _RootState();
}

class _RootState extends State<_Root> {
  bool _splashDone = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 700),
      switchInCurve: Curves.easeOutCubic,
      switchOutCurve: Curves.easeInCubic,
      // splash zooms gently away while onboarding fades in
      transitionBuilder: (child, a) => FadeTransition(
        opacity: a,
        child: ScaleTransition(scale: Tween(begin: 1.06, end: 1.0).animate(a), child: child),
      ),
      child: _splashDone
          ? OnboardingFlow(
              onFinished: () => ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Onboarding complete — connect your home screen here.')),
              ),
            )
          : SplashScreen(onFinished: () => setState(() => _splashDone = true)),
    );
  }
}
