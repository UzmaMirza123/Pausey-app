import 'package:flutter/material.dart';

import '../../services/auth_service.dart';
import '../../utils/app_theme.dart';
import '../../utils/l10n.dart';
import '../../widgets/common.dart';
import '../../widgets/glow_background.dart';
import 'auth_welcome_screen.dart';
import 'auth_widgets.dart';
import 'log_in_screen.dart';

final _emailRe = RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]{2,}$');

String? validateEmail(BuildContext context, String? v) =>
    _emailRe.hasMatch((v ?? '').trim()) ? null : context.l10n.errEmailInvalid;

/// Email sign-up: name, email, password (with strength meter), confirm, terms.
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key, this.backToLogIn = false, this.onGuest});

  /// From onboarding: passed on to the log-in screen so it keeps "Continue as guest".
  final VoidCallback? onGuest;

  /// Opened from a log-in form: "Log in" goes back to that same form instead of
  /// opening another one.
  final bool backToLogIn;

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _form = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _pass = TextEditingController();
  final _confirm = TextEditingController();
  bool _terms = false;
  bool _busy = false;
  bool _showTermsError = false;
  String? _error;

  @override
  void dispose() {
    for (final c in [_name, _email, _pass, _confirm]) {
      c.dispose();
    }
    super.dispose();
  }

  Future<void> _submit() async {
    FocusScope.of(context).unfocus();
    final ok = _form.currentState!.validate();
    setState(() => _showTermsError = !_terms);
    if (!ok || !_terms) return;
    setState(() {
      _busy = true;
      _error = null;
    });
    try {
      await AuthService.instance.signUpWithEmail(name: _name.text, email: _email.text, password: _pass.text);
      if (mounted) Navigator.of(context).popUntil((r) => r.isFirst);
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
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: GlowBackground(
        child: SafeArea(
          child: Column(
            children: [
              AuthTopBar(onBack: () => Navigator.pop(context), trailing: const ThemeToggleButton()),
              Expanded(
                child: AuthCentered(
                  child: Form(
                    key: _form,
                    child: AutofillGroup(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const Center(child: AuthIllustration(art: AuthArt.signUp)),
                          const SizedBox(height: 14),
                          EnterUp(
                            child: Semantics(
                              header: true,
                              child: Text(l.signUpTitle, textAlign: TextAlign.center, style: AppText.h1.copyWith(color: c.textPrimary)),
                            ),
                          ),
                          const SizedBox(height: 8),
                          EnterUp(
                            delay: const Duration(milliseconds: 80),
                            child: Text(l.signUpSubtitle, textAlign: TextAlign.center, style: AppText.body.copyWith(color: c.textSecondary)),
                          ),
                          const SizedBox(height: 26),
                          AuthErrorBanner(message: _error),
                          EnterUp(
                            delay: const Duration(milliseconds: 140),
                            child: AuthField(
                              controller: _name,
                              label: l.fullName,
                              icon: Icons.person_outline_rounded,
                              autofillHints: const [AutofillHints.name],
                              textCapitalization: TextCapitalization.words,
                              validator: (v) => (v ?? '').trim().isEmpty ? l.errNameRequired : null,
                            ),
                          ),
                          const SizedBox(height: 14),
                          EnterUp(
                            delay: const Duration(milliseconds: 200),
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
                            delay: const Duration(milliseconds: 260),
                            child: AuthField(
                              controller: _pass,
                              label: l.password,
                              icon: Icons.lock_outline_rounded,
                              obscure: true,
                              autofillHints: const [AutofillHints.newPassword],
                              onChanged: (_) => setState(() {}),
                              validator: (v) => (v ?? '').length < 8 ? l.errPasswordShort : null,
                            ),
                          ),
                          const SizedBox(height: 10),
                          _StrengthMeter(password: _pass.text),
                          const SizedBox(height: 14),
                          EnterUp(
                            delay: const Duration(milliseconds: 320),
                            child: AuthField(
                              controller: _confirm,
                              label: l.confirmPassword,
                              icon: Icons.lock_reset_rounded,
                              obscure: true,
                              textInputAction: TextInputAction.done,
                              onSubmitted: (_) => _submit(),
                              validator: (v) => v != _pass.text ? l.errPasswordMismatch : null,
                            ),
                          ),
                          const SizedBox(height: 14),
                          _TermsRow(
                            value: _terms,
                            showError: _showTermsError && !_terms,
                            onChanged: (v) => setState(() => _terms = v),
                          ),
                          const SizedBox(height: 22),
                          _BusyButton(label: l.createAccount, busy: _busy, onPressed: _submit),
                          const SizedBox(height: 14),
                          Wrap(
                            alignment: WrapAlignment.center,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              Text(l.haveAccount, style: AppText.caption.copyWith(fontSize: 14, color: c.textSecondary)),
                              TextButton(
                                onPressed: () => widget.backToLogIn
                                    ? Navigator.of(context).pop()
                                    : Navigator.of(context).pushReplacement(authRoute(LogInScreen(onGuest: widget.onGuest))),
                                child: Text(l.logIn, style: AppText.option.copyWith(fontWeight: FontWeight.w800, color: AppPalette.violet)),
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

/// Three-segment bar that fills as the password gets stronger.
class _StrengthMeter extends StatelessWidget {
  const _StrengthMeter({required this.password});

  final String password;

  int get _score {
    if (password.isEmpty) return 0;
    var s = 0;
    if (password.length >= 8) s++;
    if (RegExp(r'[A-Z]').hasMatch(password) && RegExp(r'[a-z]').hasMatch(password)) s++;
    if (RegExp(r'[0-9]').hasMatch(password) && RegExp(r'[^A-Za-z0-9]').hasMatch(password)) s++;
    return s.clamp(1, 3);
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final c = context.colors;
    final score = _score;
    final color = [c.dotInactive, AppPalette.coral, AppPalette.gold, AppPalette.teal][score];
    final label = ['', l.strengthWeak, l.strengthOk, l.strengthStrong][score];
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 200),
      opacity: password.isEmpty ? 0 : 1,
      child: Row(
        children: [
          for (var i = 1; i <= 3; i++) ...[
            if (i > 1) const SizedBox(width: 6),
            Expanded(
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                height: 5,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(99), color: i <= score ? color : c.dotInactive),
              ),
            ),
          ],
          const SizedBox(width: 10),
          Semantics(
            label: '${l.passwordStrength}: $label',
            child: Text(label, style: AppText.caption.copyWith(fontSize: 12, fontWeight: FontWeight.w700, color: color)),
          ),
        ],
      ),
    );
  }
}

class _TermsRow extends StatelessWidget {
  const _TermsRow({required this.value, required this.onChanged, required this.showError});

  final bool value;
  final bool showError;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: () => onChanged(!value),
          child: Row(
            children: [
              Checkbox(
                value: value,
                onChanged: (v) => onChanged(v ?? false),
                activeColor: AppPalette.accent,
                side: BorderSide(color: showError ? AppPalette.coral : c.glassBorder, width: 1.6),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
              ),
              Expanded(child: Text(context.l10n.agreeTerms, style: AppText.caption.copyWith(fontSize: 13, color: c.textSecondary))),
            ],
          ),
        ),
        if (showError)
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 12),
            child: Text(context.l10n.errTerms, style: AppText.caption.copyWith(fontSize: 12, color: AppPalette.coral)),
          ),
      ],
    );
  }
}

/// PrimaryButton that shows a spinner while working.
class _BusyButton extends StatelessWidget {
  const _BusyButton({super.key, required this.label, required this.busy, required this.onPressed});

  final String label;
  final bool busy;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Opacity(opacity: busy ? 0 : 1, child: PrimaryButton(label: label, onPressed: busy ? null : onPressed)),
        if (busy)
          const SizedBox(width: 26, height: 26, child: CircularProgressIndicator(strokeWidth: 2.6, color: AppPalette.violet)),
      ],
    );
  }
}

/// Exposed so the log-in screen uses the same busy button.
class BusyButton extends _BusyButton {
  const BusyButton({super.key, required super.label, required super.busy, required super.onPressed});
}
