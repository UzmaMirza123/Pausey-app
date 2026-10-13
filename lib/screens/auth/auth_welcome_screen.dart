import 'package:flutter/material.dart';

import '../../services/auth_service.dart';
import '../../utils/app_theme.dart';
import '../../utils/l10n.dart';
import '../../widgets/common.dart';
import '../../widgets/glow_background.dart';
import '../../widgets/pausey_logo.dart';
import 'auth_widgets.dart';
import 'log_in_screen.dart';
import 'sign_up_screen.dart';

/// First screen after onboarding: Apple, Google, email or guest.
class AuthWelcomeScreen extends StatefulWidget {
  const AuthWelcomeScreen({super.key});

  @override
  State<AuthWelcomeScreen> createState() => _AuthWelcomeScreenState();
}

class _AuthWelcomeScreenState extends State<AuthWelcomeScreen> with SingleTickerProviderStateMixin {
  late final AnimationController _breath = AnimationController(vsync: this, duration: const Duration(milliseconds: 2200))
    ..repeat(reverse: true);
  String? _busy; // 'apple' | 'google' | 'guest'
  String? _error;

  @override
  void dispose() {
    _breath.dispose();
    super.dispose();
  }

  Future<void> _run(String which, Future<void> Function() action) async {
    setState(() {
      _busy = which;
      _error = null;
    });
    try {
      await action();
    } catch (e) {
      if (mounted) setState(() => _error = authErrorText(context, e));
    } finally {
      if (mounted) setState(() => _busy = null);
    }
  }

  void _open(Widget page) => Navigator.of(context).push(_fadeRoute(page));

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final c = context.colors;
    final auth = AuthService.instance;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: GlowBackground(
        blobs: Blob.splash,
        starsAsset: 'assets/svg/splash_stars.svg',
        child: SafeArea(
          child: Column(
            children: [
              const AuthTopBar(trailing: Row(children: [LanguageButton(), SizedBox(width: 8), ThemeToggleButton()])),
              Expanded(
                child: LayoutBuilder(
                  builder: (context, box) => SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: AppSpacing.gutter),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(minHeight: box.maxHeight),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              const SizedBox(height: 8),
                              EnterUp(
                                child: AnimatedBuilder(
                                  animation: _breath,
                                  builder: (_, _) => PauseyLogo(
                                    size: 120,
                                    progress: LogoProgress(pulse: Curves.easeInOut.transform(_breath.value)),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 18),
                              EnterUp(
                                delay: const Duration(milliseconds: 120),
                                child: Text(l.authTitle, textAlign: TextAlign.center, style: AppText.h1.copyWith(color: c.textPrimary)),
                              ),
                              const SizedBox(height: 10),
                              EnterUp(
                                delay: const Duration(milliseconds: 200),
                                child: ConstrainedBox(
                                  constraints: const BoxConstraints(maxWidth: 320),
                                  child: Text(l.authSubtitle, textAlign: TextAlign.center, style: AppText.body.copyWith(color: c.textSecondary)),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 28),
                          Column(
                            children: [
                              AuthErrorBanner(message: _error),
                              EnterUp(
                                delay: const Duration(milliseconds: 280),
                                child: SocialButton(
                                  kind: SocialKind.apple,
                                  label: l.continueWithApple,
                                  loading: _busy == 'apple',
                                  onPressed: _busy == null ? () => _run('apple', auth.signInWithApple) : null,
                                ),
                              ),
                              const SizedBox(height: 12),
                              EnterUp(
                                delay: const Duration(milliseconds: 340),
                                child: SocialButton(
                                  kind: SocialKind.google,
                                  label: l.continueWithGoogle,
                                  loading: _busy == 'google',
                                  onPressed: _busy == null ? () => _run('google', auth.signInWithGoogle) : null,
                                ),
                              ),
                              const SizedBox(height: 12),
                              EnterUp(
                                delay: const Duration(milliseconds: 400),
                                child: PrimaryButton(
                                  label: l.signUpWithEmail,
                                  height: 56,
                                  showArrow: false,
                                  leading: const Icon(Icons.mail_outline_rounded, color: Colors.white, size: 20),
                                  onPressed: _busy == null ? () => _open(const SignUpScreen()) : null,
                                ),
                              ),
                              const SizedBox(height: 18),
                              const EnterUp(delay: Duration(milliseconds: 460), child: OrDivider()),
                              const SizedBox(height: 10),
                              EnterUp(
                                delay: const Duration(milliseconds: 500),
                                child: _GuestButton(
                                  loading: _busy == 'guest',
                                  onPressed: _busy == null ? () => _run('guest', auth.continueAsGuest) : null,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(l.guestNote, textAlign: TextAlign.center, style: AppText.caption.copyWith(fontSize: 12, color: c.textMuted)),
                              const SizedBox(height: 18),
                              Wrap(
                                alignment: WrapAlignment.center,
                                crossAxisAlignment: WrapCrossAlignment.center,
                                children: [
                                  Text(l.haveAccount, style: AppText.caption.copyWith(fontSize: 14, color: c.textSecondary)),
                                  TextButton(
                                    onPressed: () => _open(const LogInScreen()),
                                    child: Text(l.logIn, style: AppText.option.copyWith(fontWeight: FontWeight.w800, color: AppPalette.violet)),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _GuestButton extends StatelessWidget {
  const _GuestButton({required this.onPressed, required this.loading});

  final VoidCallback? onPressed;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: TextButton.icon(
        onPressed: loading ? null : onPressed,
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50), side: BorderSide(color: c.glassBorder)),
          backgroundColor: c.glassFill,
        ),
        icon: loading
            ? const SizedBox(width: 18, height: 18, child: CircularProgressIndicator(strokeWidth: 2, color: AppPalette.violet))
            : Icon(Icons.person_outline_rounded, size: 20, color: c.textPrimary),
        label: Text(context.l10n.continueAsGuest, style: AppText.option.copyWith(fontSize: 15, color: c.textPrimary)),
      ),
    );
  }
}

/// Small globe button that opens the language list.
class LanguageButton extends StatelessWidget {
  const LanguageButton({super.key});

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final code = Localizations.localeOf(context).languageCode;
    return Semantics(
      button: true,
      label: context.l10n.language,
      child: InkWell(
        borderRadius: BorderRadius.circular(99),
        onTap: () => showLanguagePicker(context),
        child: Container(
          height: 30,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(99), color: c.glassFill, border: Border.all(color: c.glassBorder)),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.language_rounded, size: 15, color: c.textLabel),
              const SizedBox(width: 6),
              Text(code.toUpperCase(), style: AppText.caption.copyWith(fontSize: 12, fontWeight: FontWeight.w700, color: c.textLabel)),
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> showLanguagePicker(BuildContext context) {
  return showModalBottomSheet<void>(
    context: context,
    backgroundColor: Colors.transparent,
    builder: (ctx) {
      final c = ctx.colors;
      final current = LocaleController.instance.value?.languageCode;
      Widget tile(String? code, String title) {
        final selected = current == code;
        return ListTile(
          onTap: () {
            LocaleController.instance.set(code);
            Navigator.pop(ctx);
          },
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          tileColor: selected ? AppPalette.accent.withValues(alpha: 0.12) : null,
          title: Text(title, style: AppText.option.copyWith(fontSize: 15, color: c.textPrimary)),
          trailing: selected ? const Icon(Icons.check_circle_rounded, color: AppPalette.accent) : null,
        );
      }

      return Container(
        decoration: BoxDecoration(
          color: c.background[1],
          borderRadius: const BorderRadius.vertical(top: Radius.circular(28)),
          border: Border(top: BorderSide(color: AppPalette.violet.withValues(alpha: 0.25))),
        ),
        child: SafeArea(
          top: false,
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(AppSpacing.gutter, 16, AppSpacing.gutter, 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(ctx.l10n.language, style: AppText.stat.copyWith(fontSize: 20, color: c.textPrimary)),
                const SizedBox(height: 10),
                tile(null, ctx.l10n.phoneLanguage),
                for (final e in LocaleController.names.entries) tile(e.key, e.value),
              ],
            ),
          ),
        ),
      );
    },
  );
}

Route<T> _fadeRoute<T>(Widget page) => PageRouteBuilder<T>(
      transitionDuration: const Duration(milliseconds: 450),
      reverseTransitionDuration: const Duration(milliseconds: 350),
      pageBuilder: (_, _, _) => page,
      transitionsBuilder: (_, a, _, child) {
        final curved = CurvedAnimation(parent: a, curve: Curves.easeOutCubic);
        return FadeTransition(
          opacity: curved,
          child: SlideTransition(position: Tween(begin: const Offset(0, 0.06), end: Offset.zero).animate(curved), child: child),
        );
      },
    );

/// Same transition, for the other auth screens.
Route<T> authRoute<T>(Widget page) => _fadeRoute<T>(page);
