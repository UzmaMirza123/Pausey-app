import 'package:flutter/material.dart';

/// Brand colours taken from the Figma file. These are the same in both themes.
class AppPalette {
  AppPalette._();

  static const Color blue = Color(0xFF6C8FFF);
  static const Color violet = Color(0xFFA78BFA);
  static const Color accent = Color(0xFF7C5CFC); // "AI" in the logo
  static const Color button = Color(0xFF8A6FDB); // Continue button fill
  static const Color teal = Color(0xFF34D9C3);
  static const Color coral = Color(0xFFFF6B6B);
  static const Color gold = Color(0xFFF5C542);
  static const Color white = Color(0xFFFFFFFF);

  /// Active page-dot / progress gradient (blue → violet).
  static const LinearGradient brandGradient = LinearGradient(
    colors: [blue, violet],
  );
}

/// Colours that change between light and dark mode.
/// Read them in any widget with `context.colors`.
@immutable
class AppColors extends ThemeExtension<AppColors> {
  const AppColors({
    required this.background,
    required this.textPrimary,
    required this.textSecondary,
    required this.textMuted,
    required this.textLabel,
    required this.glassFill,
    required this.glassBorder,
    required this.dotInactive,
    required this.divider,
    required this.blobStrength,
    required this.starsOpacity,
  });

  /// Full-screen background gradient (top → bottom).
  final List<Color> background;

  /// Headings (#D9D9D9 in dark).
  final Color textPrimary;

  /// Body / description text (white 44% in dark).
  final Color textSecondary;

  /// Small captions (white 35–42% in dark).
  final Color textMuted;

  /// App-name label in the header (white 60% in dark).
  final Color textLabel;

  /// Fill and border of the frosted "glass" cards and chips.
  final Color glassFill;
  final Color glassBorder;

  /// Inactive page dot.
  final Color dotInactive;

  /// Thin separators.
  final Color divider;

  /// Multiplier for the soft colour glows in the background (1 = as in Figma).
  final double blobStrength;

  /// Opacity of the star field behind each screen.
  final double starsOpacity;

  static const dark = AppColors(
    background: [
      Color(0xFF0A0A1C),
      Color(0xFF0C0C1E),
      Color(0xFF080E1B),
      Color(0xFF060810),
    ],
    textPrimary: Color(0xFFD9D9D9),
    textSecondary: Color(0x70FFFFFF), // 44%
    textMuted: Color(0x6BFFFFFF), // 42%
    textLabel: Color(0x99FFFFFF), // 60%
    glassFill: Color(0x0FFFFFFF), // 6%
    glassBorder: Color(0x29FFFFFF), // 16%
    dotInactive: Color(0x33FFFFFF), // 20%
    divider: Color(0x1AFFFFFF),
    blobStrength: 1,
    starsOpacity: 1,
  );

  static const light = AppColors(
    background: [
      Color(0xFFF8F7FF),
      Color(0xFFF3F1FF),
      Color(0xFFEEF1FF),
      Color(0xFFE8EAF8),
    ],
    textPrimary: Color(0xFF1B1838),
    textSecondary: Color(0x991B1838), // 60%
    textMuted: Color(0x801B1838), // 50%
    textLabel: Color(0xB31B1838), // 70%
    glassFill: Color(0xB3FFFFFF), // 70% white
    glassBorder: Color(0x1F1B1838), // 12%
    dotInactive: Color(0x261B1838), // 15%
    divider: Color(0x141B1838),
    blobStrength: 2.2,
    starsOpacity: 0.25,
  );

  @override
  AppColors copyWith({
    List<Color>? background,
    Color? textPrimary,
    Color? textSecondary,
    Color? textMuted,
    Color? textLabel,
    Color? glassFill,
    Color? glassBorder,
    Color? dotInactive,
    Color? divider,
    double? blobStrength,
    double? starsOpacity,
  }) {
    return AppColors(
      background: background ?? this.background,
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      textMuted: textMuted ?? this.textMuted,
      textLabel: textLabel ?? this.textLabel,
      glassFill: glassFill ?? this.glassFill,
      glassBorder: glassBorder ?? this.glassBorder,
      dotInactive: dotInactive ?? this.dotInactive,
      divider: divider ?? this.divider,
      blobStrength: blobStrength ?? this.blobStrength,
      starsOpacity: starsOpacity ?? this.starsOpacity,
    );
  }

  @override
  AppColors lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) return this;
    return AppColors(
      background: List.generate(
        background.length,
        (i) => Color.lerp(background[i], other.background[i], t)!,
      ),
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t)!,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
      textMuted: Color.lerp(textMuted, other.textMuted, t)!,
      textLabel: Color.lerp(textLabel, other.textLabel, t)!,
      glassFill: Color.lerp(glassFill, other.glassFill, t)!,
      glassBorder: Color.lerp(glassBorder, other.glassBorder, t)!,
      dotInactive: Color.lerp(dotInactive, other.dotInactive, t)!,
      divider: Color.lerp(divider, other.divider, t)!,
      blobStrength: blobStrength + (other.blobStrength - blobStrength) * t,
      starsOpacity: starsOpacity + (other.starsOpacity - starsOpacity) * t,
    );
  }
}

/// Spacing shared by every screen.
class AppSpacing {
  AppSpacing._();

  /// Same empty space on the left and right of every screen.
  static const double gutter = 20;

  /// Gap between cards / sections on app screens.
  static const double section = 16;

  /// Inner padding of cards.
  static const double card = 18;
}

/// Corner radii used everywhere (app screens).
class AppRadius {
  AppRadius._();
  static const double card = 24;
  static const double tile = 18;
  static const double chip = 99;
  static const double icon = 12;
}

/// Text styles used across the screens (Nunito, bundled in assets/fonts; sizes from Figma).
/// Colours come from the current theme, so they work in light and dark.
class AppText {
  AppText._();

  static const fontFamily = 'Nunito';

  static TextStyle _n(double size, FontWeight w, {double? height, double ls = 0}) =>
      TextStyle(
        fontFamily: fontFamily,
        fontSize: size,
        fontWeight: w,
        height: height == null ? null : height / size,
        letterSpacing: ls,
      );

  /// Splash logo — 36 / ExtraBold / -1.44
  static TextStyle logo = _n(36, FontWeight.w800, height: 36, ls: -1.44);

  /// Screen title — 30 / ExtraBold / line 34.5 / -0.9
  static TextStyle h1 = _n(30, FontWeight.w800, height: 34.5, ls: -0.9);

  /// Description under the title — 15 / Regular / line 25.2
  static TextStyle body = _n(15, FontWeight.w400, height: 25.2, ls: 0.15);

  /// Stat value in small cards — 18 / ExtraBold
  static TextStyle stat = _n(18, FontWeight.w800, height: 18, ls: -0.54);

  /// Card caption — 10 / Regular
  static TextStyle caption = _n(10, FontWeight.w400, height: 15);

  /// Header app name — 13 / SemiBold
  static TextStyle label = _n(13, FontWeight.w600, height: 19.5, ls: -0.13);

  /// Skip link — 14 / Medium
  static TextStyle link = _n(14, FontWeight.w500, height: 21, ls: 0.14);

  /// Button text — 16 / Bold
  static TextStyle button = _n(16, FontWeight.w700, height: 24, ls: -0.16);

  /// Option rows / list items — 14 / SemiBold
  static TextStyle option = _n(14, FontWeight.w600, height: 20);

  // ---- App screens (tabs) -------------------------------------------------
  // One scale for every in-app screen: 28 / 20 / 17 / 15 / 13 / 11.

  /// Screen title ("Analytics", "App Lock") — 28 / ExtraBold
  static TextStyle screenTitle = _n(28, FontWeight.w800, height: 34, ls: -0.6);

  /// Big number in a hero card ("87", "3h 24m") — 34 / ExtraBold
  static TextStyle heroValue = _n(34, FontWeight.w800, height: 40, ls: -0.8);

  /// Number in a stat tile ("13", "32h 14m") — 22 / ExtraBold
  static TextStyle tileValue = _n(22, FontWeight.w800, height: 28, ls: -0.4);

  /// Card title ("Weekly Focus Hours") — 17 / Bold
  static TextStyle cardTitle = _n(17, FontWeight.w700, height: 22, ls: -0.2);

  /// List row title ("Instagram") — 15 / SemiBold
  static TextStyle rowTitle = _n(15, FontWeight.w600, height: 20);

  /// Secondary text in rows/cards — 13 / Regular
  static TextStyle rowSub = _n(13, FontWeight.w400, height: 18);

  /// Small labels, chart axes, section headers — 11 / Bold
  static TextStyle small = _n(11, FontWeight.w700, height: 14, ls: 0.4);

  /// Tiny footer text — 11 / Regular
  static TextStyle tiny = _n(11, FontWeight.w400, height: 16.5, ls: 0.66);
}

/// The two app themes. Plug them into MaterialApp `theme` and `darkTheme`.
class AppTheme {
  AppTheme._();

  static ThemeData get dark => _build(Brightness.dark, AppColors.dark);
  static ThemeData get light => _build(Brightness.light, AppColors.light);

  static ThemeData _build(Brightness brightness, AppColors colors) {
    final base = ThemeData(brightness: brightness, useMaterial3: true, fontFamily: AppText.fontFamily);
    return base.copyWith(
      scaffoldBackgroundColor: colors.background.first,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppPalette.accent,
        brightness: brightness,
        primary: AppPalette.button,
        secondary: AppPalette.blue,
        tertiary: AppPalette.teal,
        surface: colors.background.first,
      ),
      textTheme: base.textTheme.apply(
        bodyColor: colors.textPrimary,
        displayColor: colors.textPrimary,
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: colors.background[1],
        modalBackgroundColor: colors.background[1],
        surfaceTintColor: Colors.transparent,
      ),
      extensions: [colors],
    );
  }
}

extension AppThemeContext on BuildContext {
  /// Theme-aware colours: `context.colors.textPrimary` etc.
  AppColors get colors => Theme.of(this).extension<AppColors>()!;

  bool get isDark => Theme.of(this).brightness == Brightness.dark;
}
