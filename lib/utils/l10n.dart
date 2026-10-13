import 'package:flutter/material.dart';

import '../l10n/app_localizations.dart';
import '../services/local_store.dart';

export '../l10n/app_localizations.dart';

extension L10nContext on BuildContext {
  /// Translated text: `context.l10n.continueLabel`.
  AppLocalizations get l10n => AppLocalizations.of(this);
}

/// App language. By default (null) it follows the phone's language; if the
/// phone uses a language Pausey doesn't have, English is used.
class LocaleController extends ValueNotifier<Locale?> {
  LocaleController._() : super(null);

  static final LocaleController instance = LocaleController._();

  /// Names shown in the language picker, in their own language.
  static const names = {
    'en': 'English',
    'ur': 'اردو',
    'ar': 'العربية',
    'hi': 'हिन्दी',
    'es': 'Español',
    'fr': 'Français',
    'de': 'Deutsch',
  };

  void load() {
    final code = LocalStore.instance.localeOverride;
    value = code == null ? null : Locale(code);
  }

  /// null = follow the phone again.
  Future<void> set(String? code) async {
    value = code == null ? null : Locale(code);
    await LocalStore.instance.setLocaleOverride(code);
  }

  /// Picks the phone's language when Pausey supports it.
  static Locale resolve(List<Locale>? device, Iterable<Locale> supported) {
    for (final d in device ?? const <Locale>[]) {
      for (final s in supported) {
        if (s.languageCode == d.languageCode) return s;
      }
    }
    return const Locale('en');
  }
}
