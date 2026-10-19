import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_localizations/flutter_localizations.dart';

import 'data/app_repo.dart';
import 'data/restrictions/restriction_repo.dart';
import 'screens/shell/app_shell.dart';
import 'screens/onboarding/onboarding_flow.dart';
import 'screens/onboarding/stages/set_up.dart' show AccountStage;
import 'screens/splash_screen.dart';
import 'services/auth_service.dart';
import 'services/installed_apps.dart';
import 'services/local_store.dart';
import 'utils/app_theme.dart';
import 'utils/l10n.dart';
import 'utils/theme_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStore.init();
  AppRepo.instance.load();
  RestrictionRepo.instance
    ..load()
    ..start();
  InstalledAppsCache.instance.ensureLoaded();
  ThemeController.instance.load();
  LocaleController.instance.load();
  await AuthService.instance.init();
  runApp(const PauseyApp());
}

class PauseyApp extends StatelessWidget {
  const PauseyApp({super.key, this.home});

  /// Optional start screen (used by previews); defaults to the splash.
  final Widget? home;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: Listenable.merge([ThemeController.instance, LocaleController.instance, AppRepo.instance]),
      builder: (context, _) {
        final mode = ThemeController.instance.value;
        final dark = mode == ThemeMode.dark;
        SystemChrome.setSystemUIOverlayStyle(
          (dark ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark).copyWith(
            statusBarColor: Colors.transparent,
            systemNavigationBarColor: Colors.transparent,
          ),
        );
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
          themeMode: mode,
          // Follows the phone's language unless the user picked one.
          locale: LocaleController.instance.value,
          supportedLocales: AppLocalizations.supportedLocales,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          localeListResolutionCallback: (device, supported) => LocaleController.resolve(device, supported),
          onGenerateTitle: (context) => context.l10n.appName,
          builder: (context, child) {
            RestrictionRepo.instance.setNativeStrings(context.l10n);
            return MediaQuery(
              // Settings → Text size
              data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(AppRepo.instance.settings.textScale)),
              child: _TabletScale(child: child!),
            );
          },
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
          data: mq.copyWith(size: virtual, padding: mq.padding / scale, viewPadding: mq.viewPadding / scale, viewInsets: mq.viewInsets / scale),
          child: child,
        ),
      ),
    );
  }
}

/// Splash → onboarding (first launch) → sign-in → home.
/// A saved guest or account skips straight to home.
class _Root extends StatefulWidget {
  const _Root();

  @override
  State<_Root> createState() => _RootState();
}

enum _Stage { splash, onboarding, app }

/// Signed out after onboarding (e.g. from Settings): the account screen; signing in swaps to the app by itself.
void _noop() {}

class _RootState extends State<_Root> {
  _Stage _stage = _Stage.splash;

  void _afterSplash() => setState(() {
    final signedIn = AuthService.instance.value is! SignedOut;
    // The onboarding (intro screens first) resumes where the user left it.
    _stage = signedIn || LocalStore.instance.onboardingDone ? _Stage.app : _Stage.onboarding;
  });

  Future<void> _afterOnboarding(ObFirstAction? action) async {
    await LocalStore.instance.setOnboardingDone();
    // The starter plan was already applied by the last onboarding stage.
    if (action != null) AppShell.pendingTab = action == ObFirstAction.appLimits ? AppTab.block : AppTab.focus;
    if (mounted) setState(() => _stage = _Stage.app);
  }

  @override
  Widget build(BuildContext context) {
    final Widget child = switch (_stage) {
      _Stage.splash => SplashScreen(onFinished: _afterSplash),
      _Stage.onboarding => OnboardingFlow(onFinished: _afterOnboarding),
      _Stage.app => ValueListenableBuilder<Session>(
        valueListenable: AuthService.instance,
        builder: (context, session, _) => AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          child: session is SignedOut ? const AccountStage(key: ValueKey('auth'), onNext: _noop) : AppShell(key: ValueKey(session.runtimeType)),
        ),
      ),
    };
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 700),
      switchInCurve: Curves.easeOutCubic,
      switchOutCurve: Curves.easeInCubic,
      transitionBuilder: (child, a) => FadeTransition(
        opacity: a,
        child: ScaleTransition(scale: Tween(begin: 1.06, end: 1.0).animate(a), child: child),
      ),
      child: KeyedSubtree(key: ValueKey(_stage), child: child),
    );
  }
}
