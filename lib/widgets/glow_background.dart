import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/app_theme.dart';

/// One soft, blurred colour glow behind the content ("Gradient+Blur" layers in Figma).
class Blob {
  const Blob({
    this.left,
    this.top,
    this.right,
    this.bottom,
    required this.size,
    required this.color,
    required this.opacity,
    this.blur = 45,
  });

  final double? left, top, right, bottom;
  final double size;
  final Color color;
  final double opacity;
  final double blur;

  /// The three glows used on most onboarding screens (blue top-left,
  /// coral right, violet bottom-left).
  static const onboarding = [
    Blob(left: -130, top: -110, size: 420, color: AppPalette.blue, opacity: 0.12, blur: 50),
    Blob(right: -100, top: 180, size: 300, color: AppPalette.coral, opacity: 0.08, blur: 45),
    Blob(left: -60, bottom: 80, size: 200, color: AppPalette.violet, opacity: 0.09, blur: 35),
  ];

  /// Splash screen glows (blue, violet, teal).
  static const splash = [
    Blob(left: -120, top: -100, size: 420, color: AppPalette.blue, opacity: 0.15, blur: 50),
    Blob(right: -80, bottom: -60, size: 300, color: AppPalette.violet, opacity: 0.11, blur: 40),
    Blob(right: -40, top: 320, size: 180, color: AppPalette.teal, opacity: 0.08, blur: 35),
  ];
}

/// Dark-space background shared by every screen: gradient, colour glows and stars.
class GlowBackground extends StatelessWidget {
  const GlowBackground({
    super.key,
    required this.child,
    this.blobs = Blob.onboarding,
    this.starsAsset = 'assets/svg/ob1_stars.svg',
  });

  final Widget child;
  final List<Blob> blobs;
  final String? starsAsset;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: const Alignment(-0.12, -1),
          end: const Alignment(0.12, 1),
          colors: c.background,
          stops: const [0, 0.3, 0.65, 1],
        ),
      ),
      child: Stack(
        children: [
          for (final b in blobs)
            Positioned(
              left: b.left,
              top: b.top,
              right: b.right,
              bottom: b.bottom,
              child: IgnorePointer(
                child: ImageFiltered(
                  imageFilter: ImageFilter.blur(sigmaX: b.blur / 2, sigmaY: b.blur / 2),
                  child: Container(
                    width: b.size,
                    height: b.size,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: RadialGradient(
                        center: const Alignment(-0.2, -0.3),
                        radius: 0.88,
                        colors: [
                          b.color.withValues(alpha: (b.opacity * c.blobStrength).clamp(0, 1)),
                          b.color.withValues(alpha: 0),
                        ],
                        stops: const [0, 0.7],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          if (starsAsset != null)
            Positioned.fill(
              child: IgnorePointer(
                child: Opacity(
                  opacity: c.starsOpacity,
                  child: SvgPicture.asset(
                    starsAsset!,
                    fit: BoxFit.cover,
                    colorFilter: context.isDark
                        ? null
                        : const ColorFilter.mode(AppPalette.accent, BlendMode.srcIn),
                  ),
                ),
              ),
            ),
          Positioned.fill(child: child),
        ],
      ),
    );
  }
}
