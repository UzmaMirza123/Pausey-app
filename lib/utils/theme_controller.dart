import 'package:flutter/material.dart';

import '../services/local_store.dart';

/// Holds the current light/dark choice for the whole app and remembers it.
/// Starts in light mode (Pausey's default); a saved choice wins. Call [toggle] to switch.
class ThemeController extends ValueNotifier<ThemeMode> {
  ThemeController._() : super(ThemeMode.light);

  static final ThemeController instance = ThemeController._();

  bool get isDark => value == ThemeMode.dark;

  /// Reads the saved choice (call after LocalStore.init).
  void load() {
    final saved = LocalStore.instance.themeDark;
    if (saved != null) value = saved ? ThemeMode.dark : ThemeMode.light;
  }

  void toggle() => set(isDark ? ThemeMode.light : ThemeMode.dark);

  void set(ThemeMode mode) {
    value = mode;
    try {
      LocalStore.instance.setThemeDark(mode == ThemeMode.dark);
    } catch (_) {
      // store not ready (tests/previews) — keep the in-memory value
    }
  }
}
