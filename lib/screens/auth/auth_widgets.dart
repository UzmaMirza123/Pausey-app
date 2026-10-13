import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../services/auth_service.dart';
import '../../utils/app_theme.dart';
import '../../utils/l10n.dart';

/// Translated message for an [AuthFailure].
String authErrorText(BuildContext context, Object error) {
  final l = context.l10n;
  final code = error is AuthFailure ? error.code : 'unknown';
  return switch (code) {
    'not_configured' => l.authErr_not_configured,
    'cancelled' => l.authErr_cancelled,
    'invalid_email' => l.authErr_invalid_email,
    'wrong_password' => l.authErr_wrong_password,
    'user_not_found' => l.authErr_user_not_found,
    'email_in_use' => l.authErr_email_in_use,
    'weak_password' => l.authErr_weak_password,
    'network' => l.authErr_network,
    'too_many' => l.authErr_too_many,
    _ => l.authErr_unknown,
  };
}

/// Red banner that slides in above the buttons when sign-in fails.
class AuthErrorBanner extends StatelessWidget {
  const AuthErrorBanner({super.key, required this.message});

  final String? message;

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeOutCubic,
      child: message == null
          ? const SizedBox(width: double.infinity)
          : Container(
              width: double.infinity,
              margin: const EdgeInsets.only(bottom: 14),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
              decoration: BoxDecoration(
                color: AppPalette.coral.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: AppPalette.coral.withValues(alpha: 0.35)),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.error_outline_rounded, size: 18, color: AppPalette.coral),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Semantics(
                      liveRegion: true,
                      child: Text(message!, style: AppText.caption.copyWith(fontSize: 13, height: 18 / 13, color: context.colors.textPrimary)),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}

/// Glass text field used on the sign-up and log-in screens.
class AuthField extends StatefulWidget {
  const AuthField({
    super.key,
    required this.controller,
    required this.label,
    required this.icon,
    this.obscure = false,
    this.keyboardType,
    this.textInputAction = TextInputAction.next,
    this.autofillHints,
    this.validator,
    this.onSubmitted,
    this.onChanged,
    this.textCapitalization = TextCapitalization.none,
  });

  final TextEditingController controller;
  final String label;
  final IconData icon;
  final bool obscure;
  final TextInputType? keyboardType;
  final TextInputAction textInputAction;
  final Iterable<String>? autofillHints;
  final String? Function(String?)? validator;
  final ValueChanged<String>? onSubmitted;
  final ValueChanged<String>? onChanged;
  final TextCapitalization textCapitalization;

  @override
  State<AuthField> createState() => _AuthFieldState();
}

class _AuthFieldState extends State<AuthField> {
  late bool _hidden = widget.obscure;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final dark = context.isDark;
    OutlineInputBorder border(Color color, [double w = 1]) =>
        OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide(color: color, width: w));
    return TextFormField(
      controller: widget.controller,
      obscureText: _hidden,
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      autofillHints: widget.autofillHints,
      validator: widget.validator,
      onFieldSubmitted: widget.onSubmitted,
      onChanged: widget.onChanged,
      textCapitalization: widget.textCapitalization,
      autocorrect: false,
      style: AppText.option.copyWith(fontSize: 15, color: c.textPrimary),
      cursorColor: AppPalette.accent,
      decoration: InputDecoration(
        labelText: widget.label,
        labelStyle: AppText.caption.copyWith(fontSize: 14, color: c.textMuted),
        floatingLabelStyle: AppText.caption.copyWith(fontSize: 13, color: AppPalette.violet, fontWeight: FontWeight.w600),
        prefixIcon: Icon(widget.icon, size: 20, color: c.textMuted),
        suffixIcon: widget.obscure
            ? IconButton(
                tooltip: _hidden ? context.l10n.showPassword : context.l10n.hidePassword,
                onPressed: () => setState(() => _hidden = !_hidden),
                icon: Icon(_hidden ? Icons.visibility_outlined : Icons.visibility_off_outlined, size: 20, color: c.textMuted),
              )
            : null,
        filled: true,
        fillColor: dark ? const Color(0x0FFFFFFF) : Colors.white.withValues(alpha: 0.8),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
        enabledBorder: border(c.glassBorder),
        focusedBorder: border(AppPalette.accent, 1.6),
        errorBorder: border(AppPalette.coral.withValues(alpha: 0.7)),
        focusedErrorBorder: border(AppPalette.coral, 1.6),
        errorStyle: AppText.caption.copyWith(fontSize: 12, color: AppPalette.coral),
      ),
    );
  }
}

enum SocialKind { apple, google }

/// "Continue with Apple / Google" buttons. Apple is black in light mode and
/// white in dark mode (Apple's guidelines); Google is a light outlined button.
class SocialButton extends StatefulWidget {
  const SocialButton({super.key, required this.kind, required this.label, required this.onPressed, this.loading = false});

  final SocialKind kind;
  final String label;
  final VoidCallback? onPressed;
  final bool loading;

  @override
  State<SocialButton> createState() => _SocialButtonState();
}

class _SocialButtonState extends State<SocialButton> {
  bool _down = false;

  @override
  Widget build(BuildContext context) {
    final dark = context.isDark;
    final apple = widget.kind == SocialKind.apple;
    final bg = apple ? (dark ? Colors.white : Colors.black) : (dark ? const Color(0x14FFFFFF) : Colors.white);
    final fg = apple ? (dark ? Colors.black : Colors.white) : context.colors.textPrimary;
    final borderColor = apple ? Colors.transparent : (dark ? const Color(0x33FFFFFF) : const Color(0x1F1B1838));
    return Semantics(
      button: true,
      label: widget.label,
      child: GestureDetector(
        onTapDown: widget.onPressed == null ? null : (_) => setState(() => _down = true),
        onTapCancel: () => setState(() => _down = false),
        onTapUp: (_) => setState(() => _down = false),
        onTap: widget.loading ? null : widget.onPressed,
        child: AnimatedScale(
          scale: _down ? 0.97 : 1,
          duration: const Duration(milliseconds: 120),
          child: Container(
            height: 56,
            width: double.infinity,
            decoration: BoxDecoration(
              color: bg,
              borderRadius: BorderRadius.circular(50),
              border: Border.all(color: borderColor),
              boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: dark ? 0.25 : 0.06), blurRadius: 14, offset: const Offset(0, 4))],
            ),
            alignment: Alignment.center,
            child: widget.loading
                ? SizedBox(width: 22, height: 22, child: CircularProgressIndicator(strokeWidth: 2.4, color: fg))
                : Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      apple
                          ? Icon(Icons.apple, size: 24, color: fg)
                          : SvgPicture.asset('assets/svg/google_g.svg', width: 20, height: 20),
                      const SizedBox(width: 12),
                      Text(widget.label, style: AppText.button.copyWith(color: fg, fontSize: 16)),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}

/// Thin line with a word in the middle ("or").
class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final line = Expanded(child: Container(height: 1, color: c.glassBorder));
    return Row(
      children: [
        line,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(context.l10n.or, style: AppText.caption.copyWith(fontSize: 12, color: c.textMuted)),
        ),
        line,
      ],
    );
  }
}

/// Fades and lifts its child in after [delay] (staggered entrance).
class EnterUp extends StatefulWidget {
  const EnterUp({super.key, required this.child, this.delay = Duration.zero});

  final Widget child;
  final Duration delay;

  @override
  State<EnterUp> createState() => _EnterUpState();
}

class _EnterUpState extends State<EnterUp> with SingleTickerProviderStateMixin {
  late final AnimationController _c = AnimationController(vsync: this, duration: const Duration(milliseconds: 600));

  @override
  void initState() {
    super.initState();
    Future.delayed(widget.delay, () {
      if (mounted) _c.forward();
    });
  }

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final a = CurvedAnimation(parent: _c, curve: Curves.easeOutCubic);
    return FadeTransition(
      opacity: a,
      child: SlideTransition(position: Tween(begin: const Offset(0, 0.15), end: Offset.zero).animate(a), child: widget.child),
    );
  }
}

/// Simple top bar with a round back button and the theme switch.
class AuthTopBar extends StatelessWidget {
  const AuthTopBar({super.key, this.onBack, required this.trailing});

  final VoidCallback? onBack;
  final Widget trailing;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    return Padding(
      padding: const EdgeInsets.fromLTRB(AppSpacing.gutter - 6, 8, AppSpacing.gutter, 0),
      child: Row(
        children: [
          if (onBack != null)
            IconButton(
              tooltip: context.l10n.back,
              onPressed: onBack,
              icon: Icon(Icons.arrow_back_rounded, color: c.textPrimary),
            )
          else
            const SizedBox(height: 48),
          const Spacer(),
          trailing,
        ],
      ),
    );
  }
}
