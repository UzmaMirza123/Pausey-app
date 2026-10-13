# Pausey — Flutter onboarding

Splash screen, 9 onboarding screens and the "Select Apps" bottom sheet, with light and dark themes.

## Run

```
flutter pub get
flutter run
```

Only package: `flutter_svg`. The Nunito font is bundled in `assets/fonts`, so it works offline.
App name is "Pausey" on Android, iOS and web, and the launcher icons use the Pausey logo.

## Themes

- `lib/utils/app_theme.dart` — **both themes live here**:
  - `AppPalette` — brand colours (same in light and dark).
  - `AppColors` — colours that change per theme (`AppColors.dark`, `AppColors.light`).
    Read them anywhere with `context.colors`.
  - `AppText` — all text styles.
  - `AppTheme.light` / `AppTheme.dark` — the `ThemeData` for `MaterialApp`.
- `lib/utils/theme_controller.dart` — `ThemeController.instance.toggle()` switches light/dark
  (the sun/moon button at the top of every screen).

## How the onboarding works

- `lib/screens/onboarding/onboarding_flow.dart` runs the 9 pages. Continue → next page,
  back arrow (or Android back) → previous page, Skip → last page.
- The footer (dots, back arrow, main button) stays still while the page slides. There are
  always 3 dots; each new screen moves the active dot one step (1 → 2 → 3 → 1 …).
- The back arrow shows from the second screen on.
- Responsive: each screen's content shrinks to fit short phones (down to 62%), sits centred
  on tall phones, and on tablets the whole UI is scaled up evenly (`_TabletScale` in `main.dart`).

## Logo

`lib/widgets/pausey_logo.dart` draws the Pausey mark in code (a "P" whose round part is a pause
button inside a progress ring), so it is sharp at any size and works on light and dark.
`PauseyLogo(size: 120)` shows it finished; the splash animates each part with `LogoProgress`.
`PauseyWordmark` is the animated "Pausey" name.

## Structure

```
lib/
  main.dart                      app, theme wiring, tablet scaling, splash → onboarding
  utils/app_theme.dart           light + dark themes
  utils/theme_controller.dart    light/dark switch
  widgets/pausey_logo.dart       animated logo + wordmark
  widgets/common.dart            header, buttons, cards, onboarding layout + footer
  widgets/onboarding_nav.dart    moving dots, back button, fit-to-screen layout
  widgets/glow_background.dart   gradient + glows + stars background
  screens/splash_screen.dart
  screens/onboarding/onboarding_flow.dart
  screens/onboarding/onboarding_1..9_screen.dart
  screens/onboarding/widgets/    Select Apps sheet, timer ring, light-mode SVG colours
assets/svg/                      icons and illustrations from Figma
```

## To finish

- **Onboarding 8 icons** use temporary Material icons (Figma's free-plan limit blocked the
  download). Search `TODO(figma)` in `onboarding_8_screen.dart`.
- **Permissions** — `_requestPermission` in onboarding 8 is where the real OS request goes.
- **After onboarding** — `main.dart` shows a snackbar when onboarding finishes; route to your
  home screen there.
