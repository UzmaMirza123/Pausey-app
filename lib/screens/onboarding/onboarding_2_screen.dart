import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utils/app_theme.dart';
import '../../utils/l10n.dart';
import '../../widgets/common.dart';
import 'widgets/select_apps_sheet.dart';

/// Figma: OnBoarding 2 — "Lock Distracting Apps" (727:42272).
///
/// "Select Apps" opens the app-picker sheet (727:43344). When the sheet is
/// confirmed (or skipped from inside the sheet) onboarding continues.
class Onboarding2Screen extends StatelessWidget {
  const Onboarding2Screen({super.key, required this.onNext, required this.onSkip});

  final VoidCallback onNext;
  final VoidCallback onSkip;

  Future<void> _selectApps(BuildContext context) async {
    final result = await showSelectAppsSheet(context);
    if (result != null) onNext();
  }

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final dark = context.isDark;
    final l = context.l10n;
    return OnboardingScaffold(
      onSkip: onSkip,
      dotsIndex: 0,
      starsAsset: 'assets/svg/ob2_stars.svg',
      button: PrimaryButton(label: l.ob2SelectApps, onPressed: () => _selectApps(context)),
      footerExtra: Text(
        l.freeToStart,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: AppText.fontFamily,
          fontSize: 12,
          fontWeight: FontWeight.w400,
          height: 18 / 12,
          letterSpacing: 0.24,
          color: dark ? const Color(0x42FFFFFF) : c.textMuted,
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 8),
          const _OrbitIllustration(),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.gutter),
            child: Column(
              children: [
                Text(
                  l.ob2Title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: AppText.fontFamily,
                    fontSize: 26,
                    fontWeight: FontWeight.w800,
                    height: 35.75 / 26,
                    letterSpacing: -0.4,
                    color: c.textPrimary,
                  ),
                ),
                const SizedBox(height: 7),
                Text(
                  l.ob2Body,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: AppText.fontFamily,
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    height: 21.13 / 13,
                    color: dark ? const Color(0xFF5A5278) : c.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                _FeatureRow(
                  icon: 'assets/svg/ob2_shield.svg',
                  iconWidth: 16,
                  iconHeight: 16,
                  tint: _green,
                  darkFill: const Color(0xFF0D2419),
                  text: l.ob2Feature1,
                ),
                const SizedBox(height: 10),
                _FeatureRow(
                  icon: 'assets/svg/ob2_clock.svg',
                  iconWidth: 15.33,
                  iconHeight: 15.33,
                  tint: _sky,
                  darkFill: const Color(0xFF0A1628),
                  text: l.ob2Feature2,
                ),
                const SizedBox(height: 10),
                _FeatureRow(
                  icon: 'assets/svg/ob2_padlock.svg',
                  iconWidth: 14,
                  iconHeight: 15.33,
                  tint: AppPalette.violet,
                  darkFill: const Color(0xFF1A1238),
                  text: l.ob2Feature3,
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}

const _green = Color(0xFF34D399);
const _sky = Color(0xFF60A5FA);

/// 260×270 hero: dashed orbit with six app icons around a glowing lock.
/// The app icons float gently up and down.
class _OrbitIllustration extends StatefulWidget {
  const _OrbitIllustration();

  @override
  State<_OrbitIllustration> createState() => _OrbitIllustrationState();
}

class _OrbitIllustrationState extends State<_OrbitIllustration> with SingleTickerProviderStateMixin {
  late final AnimationController _float = AnimationController(vsync: this, duration: const Duration(seconds: 4))
    ..repeat();

  // (asset, left, top) in the 260×270 box, straight from Figma.
  static const _icons = [
    ('assets/svg/ob2_instagram.svg', 113.0, -2.0),
    ('assets/svg/ob2_music.svg', 212.52, 52.0),
    ('assets/svg/ob2_x.svg', 215.52, 169.0),
    ('assets/svg/ob2_youtube.svg', 115.0, 223.0),
    ('assets/svg/ob2_facebook.svg', 14.47, 163.0),
    ('assets/svg/ob2_snapchat.svg', 14.47, 59.0),
  ];

  @override
  void dispose() {
    _float.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final dark = context.isDark;
    return SizedBox(
      width: 260,
      height: 270,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Soft violet glow (340×340 "Gradient" layer behind the hero).
          Positioned(
            left: -40,
            top: -24.66,
            width: 340,
            height: 340,
            child: IgnorePointer(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      AppPalette.accent.withValues(alpha: dark ? 0.15 : 0.12),
                      AppPalette.accent.withValues(alpha: 0),
                    ],
                    stops: const [0, 0.65],
                  ),
                ),
              ),
            ),
          ),
          SvgPicture.asset('assets/svg/ob2_orbit.svg', width: 260, height: 260),
          for (var i = 0; i < _icons.length; i++)
            AnimatedBuilder(
              animation: _float,
              builder: (context, child) {
                final dy = math.sin((_float.value + i / _icons.length) * 2 * math.pi) * 3;
                return Positioned(left: _icons[i].$2, top: _icons[i].$3 + dy, child: child!);
              },
              child: SvgPicture.asset(_icons[i].$1, width: 32, height: 32),
            ),
          Positioned(
            left: 96,
            top: 94,
            child: Container(
              width: 68,
              height: 68,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: dark ? const Color(0xB30A0A1E) : const Color(0xE6FFFFFF),
                border: Border.all(color: const Color(0xFFC4A8FF).withValues(alpha: dark ? 0.25 : 0.5), width: 2),
                boxShadow: [
                  BoxShadow(color: AppPalette.accent.withValues(alpha: dark ? 0.53 : 0.35), blurRadius: 36),
                  BoxShadow(color: AppPalette.violet.withValues(alpha: 0.27), blurRadius: 10),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 1.5),
                child: SvgPicture.asset('assets/svg/ob2_lock.svg', width: 30, height: 40.5),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// One feature row: tinted round icon + text, on a dark-violet gradient card.
class _FeatureRow extends StatelessWidget {
  const _FeatureRow({
    required this.icon,
    required this.iconWidth,
    required this.iconHeight,
    required this.tint,
    required this.darkFill,
    required this.text,
  });

  final String icon;
  final double iconWidth;
  final double iconHeight;
  final Color tint;
  final Color darkFill;
  final String text;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final dark = context.isDark;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: dark ? const Color(0xFF23204A) : c.glassBorder),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: dark
              ? const [Color(0xFF13112A), Color(0xFF1A1840)]
              : [c.glassFill, AppPalette.accent.withValues(alpha: 0.06)],
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: dark ? darkFill : tint.withValues(alpha: 0.12),
              border: Border.all(color: tint.withValues(alpha: dark ? 0.2 : 0.3)),
            ),
            child: SvgPicture.asset(icon, width: iconWidth, height: iconHeight),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontFamily: AppText.fontFamily,
                fontSize: 13,
                fontWeight: FontWeight.w600,
                height: 18.57 / 13,
                color: dark ? const Color(0xFFC4BFE8) : c.textPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
