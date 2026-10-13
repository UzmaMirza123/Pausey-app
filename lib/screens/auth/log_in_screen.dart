import 'package:flutter/material.dart';

import '../../services/auth_service.dart';
import '../../utils/app_theme.dart';
import '../../utils/l10n.dart';
import '../../widgets/common.dart';
import '../../widgets/glow_background.dart';
import 'auth_welcome_screen.dart';
import 'auth_widgets.dart';
import 'sign_up_screen.dart';

/// Email log-in, plus Apple/Google and "Forgot password?".
class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final _form = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _pass = TextEditingController();
  String? _busy; // 'email' | 'apple' | 'google'
  String? _error;

  @override
  void dispose() {
    _email.dispose();
    _pass.dispose();
    super.dispose();
  }

  Future<void> _run(String which, Future<void> Function() action) async {
    FocusScope.of(context).unfocus();
    setState(() {
      _busy = which;
      _error = null;
    });
    try {
      await action();
      if (mounted) Navigator.of(context).popUntil((r) => r.isFirst);
    } catch (e) {
      if (mounted) setState(() => _error = authErrorText(context, e));
    } finally {
      if (mounted) setState(() => _busy = null);
    }
  }

  void _logIn() {
    if (!_form.currentState!.validate()) return;
    _run('email', () => AuthService.instance.logInWithEmail(email: _email.text, password: _pass.text));
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final c = context.colors;
    final auth = AuthService.instance;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: GlowBackground(
        child: SafeArea(
          child: Column(
            children: [
              AuthTopBar(onBack: () => Navigator.pop(context), trailing: const ThemeToggleButton()),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(AppSpacing.gutter, 8, AppSpacing.gutter, 24),
                  child: Form(
                    key: _form,
                    child: AutofillGroup(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          EnterUp(child: Text(l.logInTitle, style: AppText.h1.copyWith(color: c.textPrimary))),
                          const SizedBox(height: 6),
                          EnterUp(
                            delay: const Duration(milliseconds: 80),
                            child: Text(l.logInSubtitle, style: AppText.body.copyWith(color: c.textSecondary)),
                          ),
                          const SizedBox(height: 26),
                          AuthErrorBanner(message: _error),
                          EnterUp(
                            delay: const Duration(milliseconds: 140),
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
                          EnterUp(
                            delay: const Duration(milliseconds: 200),
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
                          const SizedBox(height: 8),
                          BusyButton(label: l.logIn, busy: _busy == 'email', onPressed: _busy == null ? _logIn : () {}),
                          const SizedBox(height: 20),
                          const OrDivider(),
                          const SizedBox(height: 20),
                          SocialButton(
                            kind: SocialKind.apple,
                            label: l.continueWithApple,
                            loading: _busy == 'apple',
                            onPressed: _busy == null ? () => _run('apple', auth.signInWithApple) : null,
                          ),
                          const SizedBox(height: 12),
                          SocialButton(
                            kind: SocialKind.google,
                            label: l.continueWithGoogle,
                            loading: _busy == 'google',
                            onPressed: _busy == null ? () => _run('google', auth.signInWithGoogle) : null,
                          ),
                          const SizedBox(height: 16),
                          Wrap(
                            alignment: WrapAlignment.center,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              Text(l.noAccount, style: AppText.caption.copyWith(fontSize: 14, color: c.textSecondary)),
                              TextButton(
                                onPressed: () => Navigator.of(context).pushReplacement(authRoute(const SignUpScreen())),
                                child: Text(l.signUp, style: AppText.option.copyWith(fontWeight: FontWeight.w800, color: AppPalette.violet)),
                              ),
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
                                Expanded(child: Text(l.resetSent, style: AppText.option.copyWith(color: c.textPrimary))),
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
