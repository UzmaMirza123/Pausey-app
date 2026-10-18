import 'package:flutter/material.dart';

import '../../services/auth_service.dart';
import '../../utils/app_theme.dart';
import '../../utils/l10n.dart';
import '../../widgets/common.dart';
import '../../widgets/glow_background.dart';
import '../onboarding/widgets/ob_kit.dart' show ObReveal;
import 'auth_welcome_screen.dart';
import 'auth_widgets.dart';
import 'sign_up_screen.dart';

/// Log-in screen (from the welcome screen or sign-up): the same single
/// [LogInForm] as in onboarding, centred.
class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key, this.onGuest});

  /// From onboarding: "Continue as guest" closes this screen and runs it.
  final VoidCallback? onGuest;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: GlowBackground(
        child: SafeArea(
          child: Column(
            children: [
              AuthTopBar(onBack: () => Navigator.pop(context), trailing: const ThemeToggleButton()),
              Expanded(
                child: AuthCentered(
                  child: LogInForm(
                    onSignedIn: () => Navigator.of(context).popUntil((r) => r.isFirst),
                    onSignUp: () => Navigator.of(context).pushReplacement(authRoute(SignUpScreen(onGuest: onGuest))),
                    onGuest: onGuest == null
                        ? null
                        : () {
                            Navigator.of(context).pop();
                            onGuest!();
                          },
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

/// Scrolls when needed, otherwise keeps [child] in the middle of the screen.
class AuthCentered extends StatelessWidget {
  const AuthCentered({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) => LayoutBuilder(
    builder: (context, box) => SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(AppSpacing.gutter, 8, AppSpacing.gutter, 24),
      child: ConstrainedBox(
        constraints: BoxConstraints(minHeight: box.maxHeight - 32),
        child: Center(
          child: ConstrainedBox(constraints: const BoxConstraints(maxWidth: 480), child: child),
        ),
      ),
    ),
  );
}

/// The one log-in form, used in onboarding and on [LogInScreen]: illustration,
/// email + password, "Forgot password?", Log in, "Don't have an account? Sign up",
/// and round Google / Apple buttons.
class LogInForm extends StatefulWidget {
  const LogInForm({super.key, required this.onSignedIn, required this.onSignUp, this.onBusyChanged, this.onGuest});

  /// Called after a successful sign-in.
  final VoidCallback onSignedIn;
  final VoidCallback onSignUp;

  /// Shows "Continue as guest" (onboarding only).
  final VoidCallback? onGuest;
  final ValueChanged<bool>? onBusyChanged;

  @override
  State<LogInForm> createState() => LogInFormState();
}

class LogInFormState extends State<LogInForm> {
  final _form = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _pass = TextEditingController();
  String? _busy; // email | google | apple | guest
  String? _error;

  bool get busy => _busy != null;

  @override
  void dispose() {
    _email.dispose();
    _pass.dispose();
    super.dispose();
  }

  /// Runs a sign-in; shows its error in the banner. Also used for "Continue as guest".
  Future<void> run(String which, Future<void> Function() action) async {
    FocusScope.of(context).unfocus();
    setState(() {
      _busy = which;
      _error = null;
    });
    widget.onBusyChanged?.call(true);
    try {
      await action();
      if (mounted && AuthService.instance.value is! SignedOut) widget.onSignedIn();
    } catch (e) {
      if (mounted) setState(() => _error = authErrorText(context, e));
    } finally {
      if (mounted) setState(() => _busy = null);
      widget.onBusyChanged?.call(false);
    }
  }

  void _logIn() {
    if (!_form.currentState!.validate()) return;
    run('email', () => AuthService.instance.logInWithEmail(email: _email.text, password: _pass.text));
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final c = context.colors;
    return Form(
      key: _form,
      child: AutofillGroup(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Center(child: AuthIllustration(art: AuthArt.logIn)),
            const SizedBox(height: 14),
            ObReveal(
              child: Semantics(
                header: true,
                child: Text(
                  l.logInTitle,
                  textAlign: TextAlign.center,
                  style: AppText.h1.copyWith(color: c.textPrimary),
                ),
              ),
            ),
            const SizedBox(height: 8),
            ObReveal(
              index: 1,
              child: Text(
                l.logInSubtitle,
                textAlign: TextAlign.center,
                style: AppText.body.copyWith(color: c.textSecondary),
              ),
            ),
            const SizedBox(height: 20),
            AuthErrorBanner(message: _error),
            // Email, password and Log in straight on the background, like the sign-up form.
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ObReveal(
                  index: 2,
                  child: AuthField(
                    controller: _email,
                    label: l.email,
                    icon: Icons.mail_outline_rounded,
                    keyboardType: TextInputType.emailAddress,
                    autofillHints: const [AutofillHints.email],
                    validator: (v) => validateEmail(context, v),
                  ),
                ),
                const SizedBox(height: 14),
                ObReveal(
                  index: 3,
                  child: AuthField(
                    controller: _pass,
                    label: l.password,
                    icon: Icons.lock_outline_rounded,
                    obscure: true,
                    textInputAction: TextInputAction.done,
                    autofillHints: const [AutofillHints.password],
                    onSubmitted: (_) => _logIn(),
                    validator: (v) => (v ?? '').isEmpty ? l.errPasswordShort : null,
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: TextButton(
                    onPressed: () => _showReset(context, _email.text),
                    child: Text(l.forgotPassword, style: AppText.option.copyWith(color: AppPalette.violet)),
                  ),
                ),
                const SizedBox(height: 4),
                ObReveal(
                  index: 4,
                  child: BusyButton(label: l.logIn, busy: _busy == 'email', onPressed: _busy == null ? _logIn : () {}),
                ),
              ],
            ),
            const SizedBox(height: 6),
            ObReveal(
              index: 8,
              child: Wrap(
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Text(l.cvNoAccount, style: AppText.rowSub.copyWith(fontSize: 14, color: c.textSecondary)),
                  TextButton(
                    onPressed: _busy == null ? widget.onSignUp : null,
                    style: TextButton.styleFrom(minimumSize: const Size(48, 44)),
                    child: Text(
                      l.signUp,
                      style: AppText.option.copyWith(fontWeight: FontWeight.w800, color: AppPalette.violet),
                    ),
                  ),
                ],
              ),
            ),
            // "Continue as guest" as a plain text link under "Don't have an account? Sign up".
            if (widget.onGuest != null)
              ObReveal(
                index: 9,
                child: Center(
                  child: TextButton(
                    onPressed: _busy == null ? widget.onGuest : null,
                    style: TextButton.styleFrom(minimumSize: const Size(48, 44)),
                    child: Text(
                      l.cvContinueGuest,
                      style: AppText.option.copyWith(fontWeight: FontWeight.w800, color: AppPalette.violet),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

/// "Forgot password?" bottom sheet.
Future<void> _showReset(BuildContext context, String email) {
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (_) => _ResetSheet(initialEmail: email),
  );
}

class _ResetSheet extends StatefulWidget {
  const _ResetSheet({required this.initialEmail});

  final String initialEmail;

  @override
  State<_ResetSheet> createState() => _ResetSheetState();
}

class _ResetSheetState extends State<_ResetSheet> {
  final _form = GlobalKey<FormState>();
  late final _email = TextEditingController(text: widget.initialEmail);
  bool _busy = false;
  bool _sent = false;
  String? _error;

  @override
  void dispose() {
    _email.dispose();
    super.dispose();
  }

  Future<void> _send() async {
    if (!_form.currentState!.validate()) return;
    setState(() {
      _busy = true;
      _error = null;
    });
    try {
      await AuthService.instance.sendPasswordReset(_email.text);
      if (mounted) setState(() => _sent = true);
    } catch (e) {
      if (mounted) setState(() => _error = authErrorText(context, e));
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final c = context.colors;
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        decoration: BoxDecoration(
          color: c.background[1],
          borderRadius: const BorderRadius.vertical(top: Radius.circular(28)),
          border: Border(top: BorderSide(color: AppPalette.violet.withValues(alpha: 0.25))),
        ),
        child: SafeArea(
          top: false,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(AppSpacing.gutter, 20, AppSpacing.gutter, 20),
            child: Form(
              key: _form,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(l.resetTitle, style: AppText.stat.copyWith(fontSize: 22, color: c.textPrimary)),
                  const SizedBox(height: 6),
                  Text(l.resetSubtitle, style: AppText.body.copyWith(fontSize: 14, color: c.textSecondary)),
                  const SizedBox(height: 18),
                  AuthErrorBanner(message: _error),
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child: _sent
                        ? Container(
                            key: const ValueKey('sent'),
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: AppPalette.teal.withValues(alpha: 0.12),
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(color: AppPalette.teal.withValues(alpha: 0.35)),
                            ),
                            child: Row(
                              children: [
                                const Icon(Icons.mark_email_read_outlined, color: AppPalette.teal),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Text(l.resetSent, style: AppText.option.copyWith(color: c.textPrimary)),
                                ),
                              ],
                            ),
                          )
                        : AuthField(
                            key: const ValueKey('field'),
                            controller: _email,
                            label: l.email,
                            icon: Icons.mail_outline_rounded,
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.send,
                            onSubmitted: (_) => _send(),
                            validator: (v) => validateEmail(context, v),
                          ),
                  ),
                  const SizedBox(height: 18),
                  if (!_sent) BusyButton(label: l.sendLink, busy: _busy, onPressed: _send),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
