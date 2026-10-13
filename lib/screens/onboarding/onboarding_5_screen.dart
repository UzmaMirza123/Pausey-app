import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../services/local_store.dart';
import '../../utils/app_theme.dart';
import '../../utils/l10n.dart';
import '../../widgets/common.dart';
import '../../widgets/glow_background.dart';

/// Subtitle colour from the design (blue-grey), used in dark mode.
const _subtitleDark = Color(0xFFA0B0D0);

/// "Your data never leaves your device." note colour (same as its lock icon).
const _noteColor = Color(0xFF6B80A8);

/// Teal tint of the phone tile gradient.
const _tileTeal = Color(0xFF4FD1C5);

/// Green "done" badge on the phone tile.
const _badgeGreen = Color(0xFF4ADE80);

/// Selected option gradient (left → right).
const _selectedGradient = LinearGradient(colors: [Color(0xFF2A1F6E), Color(0xFF3D2A9E)]);

/// Glows of this frame: blue top-left, blue right, violet bottom-left.
const _blobs = [
  Blob(left: -130, top: -120, size: 420, color: AppPalette.blue, opacity: 0.13, blur: 55),
  Blob(right: -100, top: 200, size: 300, color: AppPalette.blue, opacity: 0.11, blur: 45),
  Blob(left: -50, bottom: 80, size: 200, color: AppPalette.violet, opacity: 0.08, blur: 35),
];

/// Figma: OnBoarding — "What is your daily average Screen Time?" (727:41892).
class Onboarding5Screen extends StatefulWidget {
  const Onboarding5Screen({super.key, required this.onNext, required this.onSkip});

  final VoidCallback onNext;
  final VoidCallback onSkip;

  @override
  State<Onboarding5Screen> createState() => _Onboarding5ScreenState();
}

class _Onboarding5ScreenState extends State<Onboarding5Screen> {
  /// English labels are the stored answer ids.
  static const _options = ['More than 7 hours', '5-7 hours', '4-5 hours', '3-4 hours', '1-3 hours', 'Under 1 hour'];

  static List<String> _labels(AppLocalizations l) => [
    l.ob5More7,
    l.ob5H5to7,
    l.ob5H4to5,
    l.ob5H3to4,
    l.ob5H1to3,
    l.ob5Under1,
  ];

  /// The design shows "4-5 hours" selected.
  int _selected = 2;

  @override
  void initState() {
    super.initState();
    LocalStore.instance.saveAnswer('screenTime', _options[_selected]);
  }

  void _select(int i) {
    setState(() => _selected = i);
    LocalStore.instance.saveAnswer('screenTime', _options[i]);
  }

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final dark = context.isDark;
    final l = context.l10n;
    final labels = _labels(l);
    return OnboardingScaffold(
      onSkip: widget.onSkip,
      dotsIndex: 0,
      blobs: _blobs,
      starsAsset: 'assets/svg/ob5_stars.svg',
      button: PrimaryButton(label: l.continueLabel, onPressed: widget.onNext),
      footerExtra: Text(
        l.freeToStart,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: AppText.fontFamily,
          fontSize: 12,
          fontWeight: FontWeight.w400,
          height: 18 / 12,
          letterSpacing: 0.24,
          color: dark ? const Color(0x42FFFFFF) : c.textMuted, // white 26% in dark
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.gutter),
        child: Column(
          children: [
            const SizedBox(height: 24),
            const _PhoneTile(),
            const SizedBox(height: 21), // 8 bottom padding + 13 gap
            Text(
              l.ob5Title,
              textAlign: TextAlign.center,
              style: AppText.h1.copyWith(color: c.textPrimary, height: 32.5 / 30),
            ),
            const SizedBox(height: 7.8),
            Text(
              l.ob5Subtitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: AppText.fontFamily,
                fontSize: 13,
                fontWeight: FontWeight.w400,
                height: 21.13 / 13,
                color: dark ? _subtitleDark : c.textSecondary,
              ),
            ),
            const SizedBox(height: 29), // 16 bottom padding + 13 gap
            for (var i = 0; i < _options.length; i++) ...[
              if (i > 0) const SizedBox(height: 10),
              _OptionRow(label: labels[i], selected: i == _selected, onTap: () => _select(i)),
            ],
            const SizedBox(height: 29),
            const _PrivacyNote(),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

/// 80×80 rounded tile with the phone icon and a green check badge.
class _PhoneTile extends StatelessWidget {
  const _PhoneTile();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      height: 80,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: 80,
            height: 80,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32),
              border: Border.all(color: AppPalette.accent.withValues(alpha: 0.33)),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [AppPalette.accent.withValues(alpha: 0.2), _tileTeal.withValues(alpha: 0.2)],
              ),
            ),
            child: SvgPicture.asset('assets/svg/ob5_phone.svg', width: 38, height: 38),
          ),
          Positioned(
            top: -4,
            right: -4,
            child: Container(
              width: 20,
              height: 20,
              alignment: Alignment.center,
              decoration: const BoxDecoration(color: _badgeGreen, shape: BoxShape.circle),
              child: SvgPicture.asset('assets/svg/ob5_check.svg', width: 11, height: 11),
            ),
          ),
        ],
      ),
    );
  }
}

/// One single-choice row; the selected one gets the deep purple gradient.
class _OptionRow extends StatelessWidget {
  const _OptionRow({required this.label, required this.selected, required this.onTap});

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(16);
    return Semantics(
      button: true,
      selected: selected,
      label: label,
      excludeSemantics: true,
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          onTap: onTap,
          borderRadius: radius,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 220),
            curve: Curves.easeOut,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10), // Figma 15/11 with an inside 1px stroke,
            decoration: BoxDecoration(
              borderRadius: radius,
              color: selected ? null : AppPalette.violet.withValues(alpha: 0.09),
              gradient: selected ? _selectedGradient : null,
              border: Border.all(color: AppPalette.violet.withValues(alpha: 0.22)),
            ),
            child: AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 220),
              style: TextStyle(
                fontFamily: AppText.fontFamily,
                fontSize: 13,
                fontWeight: FontWeight.w700,
                height: 18.57 / 13,
                // white 88% on dark / on the selected gradient; ink on light rows
                color: selected || context.isDark ? const Color(0xE0FFFFFF) : context.colors.textPrimary,
              ),
              child: Text(label, textAlign: TextAlign.center),
            ),
          ),
        ),
      ),
    );
  }
}

/// Lock icon + "Your data never leaves your device."
class _PrivacyNote extends StatelessWidget {
  const _PrivacyNote();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset('assets/svg/ob5_lock.svg', width: 12, height: 12),
        const SizedBox(width: 6),
        Flexible(
          child: Text(
            context.l10n.dataStaysOnDevice,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontFamily: AppText.fontFamily,
              fontSize: 11,
              fontWeight: FontWeight.w400,
              height: 14.67 / 11,
              color: _noteColor,
            ),
          ),
        ),
      ],
    );
  }
}
