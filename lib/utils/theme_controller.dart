import 'package:flutter/material.dart';

/// Holds the current light/dark choice for the whole app.
/// Starts in dark mode (the Figma design); call [toggle] to switch.
class ThemeController extends ValueNotifier<ThemeMode> {
  ThemeController._() : super(ThemeMode.dark);

  static final ThemeController instance = ThemeController._();

  bool get isDark => value == ThemeMode.dark;

  void toggle() => value = isDark ? ThemeMode.light : ThemeMode.dark;

  void set(ThemeMode mode) => value = mode;
}
