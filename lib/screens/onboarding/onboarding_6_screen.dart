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

/// Highlighted (last picked) row gradient.
const _activeGradient = LinearGradient(
  begin: Alignment(-0.74, -1),
  end: Alignment(0.74, 1),
  colors: [Color(0xFF2A1F6E), Color(0xFF3D2A9E)],
);

/// Glows of this frame: blue top-left, blue right, violet bottom-left.
const _blobs = [
  Blob(left: -130, top: -120, size: 420, color: AppPalette.blue, opacity: 0.13, blur: 55),
  Blob(right: -100, top: 200, size: 300, color: AppPalette.blue, opacity: 0.11, blur: 45),
  Blob(left: -50, bottom: 80, size: 200, color: AppPalette.violet, opacity: 0.08, blur: 35),
];

class _Occupation {
  const _Occupation(this.id, this.icon);

  /// English label, stored as the answer.
  final String id;
  final String icon;
}

/// Figma: OnBoarding — "What is your occupation?" (727:41749). Multi-select.
class Onboarding6Screen extends StatefulWidget {
  const Onboarding6Screen({super.key, required this.onNext, required this.onSkip});

  final VoidCallback onNext;
  final VoidCallback onSkip;

  @override
  State<Onboarding6Screen> createState() => _Onboarding6ScreenState();
}

class _Onboarding6ScreenState extends State<Onboarding6Screen> {
  static const _options = [
    _Occupation('Software Development', 'assets/svg/ob6_code.svg'),
    _Occupation('CEO / Founder', 'assets/svg/ob6_briefcase.svg'),
    _Occupation('Remote Worker', 'assets/svg/ob6_wifi.svg'),
    _Occupation('Finance / Ops / Consulting', 'assets/svg/ob6_chart.svg'),
    _Occupation('Art / Content', 'assets/svg/ob6_pen.svg'),
    _Occupation('Education', 'assets/svg/ob6_book.svg'),
    _Occupation('Others', 'assets/svg/ob6_dots.svg'),
  ];

  /// The design shows "Art / Content" and "Education" checked.
  final Set<int> _checked = {4, 5};

  /// The most recently checked row gets the highlighted purple style
  /// (in the design: "Art / Content").
  int? _active = 4;

  static List<String> _labels(AppLocalizations l) => [
    l.ob6Software,
    l.ob6Founder,
    l.ob6Remote,
    l.ob6Finance,
    l.ob6Art,
    l.ob6Education,
    l.ob6Others,
  ];

  @override
  void initState() {
    super.initState();
    _save();
  }

  void _save() {
    final ids = [
      for (var i = 0; i < _options.length; i++)
        if (_checked.contains(i)) _options[i].id,
    ];
    LocalStore.instance.saveAnswer('occupation', ids);
  }

  void _toggle(int i) {
    setState(() {
      if (_checked.remove(i)) {
        if (_active == i) _active = null;
      } else {
        _checked.add(i);
        _active = i;
      }
    });
    _save();
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
      starsAsset: 'assets/svg/ob6_stars.svg',
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
            Text(
              l.ob6Title,
              textAlign: TextAlign.center,
              style: AppText.h1.copyWith(color: c.textPrimary, height: 32.5 / 30),
            ),
            const SizedBox(height: 7.8),
            Text(
              l.ob6Subtitle,
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
              if (i > 0) const SizedBox(height: 12),
              _OccupationRow(
                option: _options[i],
                label: labels[i],
                checked: _checked.contains(i),
                active: _active == i,
                onTap: () => _toggle(i),
              ),
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

/// Option row: round icon tile, label and a check circle on the right.
class _OccupationRow extends StatelessWidget {
  const _OccupationRow({
    required this.option,
    required this.label,
    required this.checked,
    required this.active,
    required this.onTap,
  });

  final _Occupation option;
  final String label;
  final bool checked;
  final bool active;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(16);
    final dark = context.isDark;
    return Semantics(
      button: true,
      checked: checked,
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
              color: active ? null : AppPalette.violet.withValues(alpha: 0.09),
              gradient: active ? _activeGradient : null,
              border: Border.all(
                color: active ? AppPalette.accent.withValues(alpha: 0.4) : AppPalette.violet.withValues(alpha: 0.22),
              ),
              boxShadow: [
                BoxShadow(
                  color: AppPalette.accent.withValues(alpha: active ? 0.2 : 0),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  width: 36,
                  height: 36,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppPalette.accent.withValues(alpha: 0.09),
                    border: Border.all(color: AppPalette.accent.withValues(alpha: 0.2)),
                  ),
                  child: SvgPicture.asset(option.icon, width: 15, height: 15),
                ),
                const SizedBox(width: 9),
                Expanded(
                  child: AnimatedDefaultTextStyle(
                    duration: const Duration(milliseconds: 220),
                    style: TextStyle(
                      fontFamily: AppText.fontFamily,
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      height: 18.57 / 13,
                      // white 88% on dark / on the active gradient; ink on light rows
                      color: active || dark ? const Color(0xE0FFFFFF) : context.colors.textPrimary,
                    ),
                    child: Text(label, maxLines: 2, overflow: TextOverflow.ellipsis, textAlign: TextAlign.start),
                  ),
                ),
                _CheckCircle(checked: checked, active: active),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// 20px check circle: empty ring, filled accent, or (on the active row) an
/// accent→violet gradient with a violet ring.
class _CheckCircle extends StatelessWidget {
  const _CheckCircle({required this.checked, required this.active});

  final bool checked;
  final bool active;

  @override
  Widget build(BuildContext context) {
    final BoxDecoration deco;
    if (!checked) {
      deco = BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: AppPalette.accent.withValues(alpha: 0.2), width: 2),
      );
    } else if (active) {
      deco = BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: AppPalette.violet, width: 2),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppPalette.accent, AppPalette.violet],
        ),
        boxShadow: [BoxShadow(color: AppPalette.accent.withValues(alpha: 0.33), blurRadius: 4)],
      );
    } else {
      deco = BoxDecoration(
        shape: BoxShape.circle,
        color: AppPalette.accent,
        boxShadow: [BoxShadow(color: AppPalette.accent.withValues(alpha: 0.33), blurRadius: 4)],
      );
    }
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: 20,
      height: 20,
      alignment: Alignment.center,
      decoration: deco,
      child: AnimatedScale(
        scale: checked ? 1 : 0,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOutBack,
        child: SvgPicture.asset('assets/svg/ob6_check.svg', width: 11, height: 11),
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
        SvgPicture.asset('assets/svg/ob6_lock.svg', width: 12, height: 12),
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
