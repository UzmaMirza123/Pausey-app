import 'package:flutter/material.dart';

import '../../services/local_store.dart';
import '../../utils/app_theme.dart';
import '../../utils/l10n.dart';
import '../../widgets/common.dart';
import '../../widgets/glow_background.dart';

/// Figma: OnBoarding 8 — "Enable Essential Permissions" (727:41511).
///
/// Built from the Figma layout (sizes and positions). The four icons are
/// temporary Material icons: Figma's free-plan tool limit blocked the asset
/// download. Swap them for the Figma SVGs (nodes 727:41563, 727:41568,
/// 727:41579, 727:41588, 727:41597, 727:41606) — see the TODOs.
class Onboarding8Screen extends StatefulWidget {
  const Onboarding8Screen({super.key, required this.onNext, required this.onSkip});

  final VoidCallback onNext;
  final VoidCallback onSkip;

  @override
  State<Onboarding8Screen> createState() => _Onboarding8ScreenState();
}

class _Permission {
  const _Permission(this.id, this.title, this.subtitle, this.icon, this.color);
  final String id;
  final String Function(AppLocalizations) title;
  final String Function(AppLocalizations) subtitle;
  final IconData icon; // TODO(figma): replace with the row's SVG asset.
  final Color color;
}

class _Onboarding8ScreenState extends State<Onboarding8Screen> {
  static const _items = [
    _Permission('usage', _usageTitle, _usageSub, Icons.query_stats_rounded, AppPalette.blue),
    _Permission('notifications', _notifTitle, _notifSub, Icons.notifications_none_rounded, AppPalette.violet),
    _Permission('tracking', _trackTitle, _trackSub, Icons.timelapse_rounded, AppPalette.teal),
  ];

  static String _usageTitle(AppLocalizations l) => l.ob8UsageTitle;
  static String _usageSub(AppLocalizations l) => l.ob8UsageSub;
  static String _notifTitle(AppLocalizations l) => l.ob8NotifTitle;
  static String _notifSub(AppLocalizations l) => l.ob8NotifSub;
  static String _trackTitle(AppLocalizations l) => l.ob8TrackTitle;
  static String _trackSub(AppLocalizations l) => l.ob8TrackSub;

  final Set<int> _granted = {};

  @override
  void initState() {
    super.initState();
    _save();
  }

  void _save() => LocalStore.instance.saveAnswer('permissions', [
    for (var i = 0; i < _items.length; i++)
      if (_granted.contains(i)) _items[i].id,
  ]);

  /// TODO(permissions): call the real OS permission request here
  /// (e.g. Usage Access settings intent, notification permission).
  Future<bool> _requestPermission(int index) async => true;

  Future<void> _toggle(int i) async {
    if (_granted.contains(i)) {
      setState(() => _granted.remove(i));
      _save();
      return;
    }
    final ok = await _requestPermission(i);
    if (ok && mounted) {
      setState(() => _granted.add(i));
      _save();
    }
  }

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final dark = context.isDark;
    return OnboardingScaffold(
      onSkip: widget.onSkip,
      dotsIndex: 0,
      blobs: const [
        Blob(left: -130, top: -120, size: 420, color: AppPalette.blue, opacity: 0.12, blur: 50),
        Blob(right: -100, top: 200, size: 300, color: AppPalette.violet, opacity: 0.08, blur: 45),
        Blob(left: -50, bottom: 80, size: 200, color: AppPalette.violet, opacity: 0.09, blur: 35),
      ],
      starsAsset: 'assets/svg/ob7_stars.svg', // TODO(figma): ob8's own star field (727:41516)
      button: PrimaryButton(label: context.l10n.continueLabel, onPressed: widget.onNext),
      footerExtra: Padding(
        padding: const EdgeInsets.only(top: 6),
        child: Text(
          context.l10n.freeToStart,
          style: TextStyle(
            fontFamily: AppText.fontFamily,
            fontSize: 12,
            height: 18 / 12,
            letterSpacing: 0.24,
            color: dark ? const Color(0x42FFFFFF) : c.textMuted,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.gutter),
        child: Column(
          children: [
            const SizedBox(height: 24),
            _ShieldBadge(allGranted: _granted.length == _items.length),
            const SizedBox(height: 21),
            Text(
              context.l10n.ob8Title,
              textAlign: TextAlign.center,
              style: AppText.h1.copyWith(color: c.textPrimary, fontSize: 28, height: 32.5 / 28),
            ),
            const SizedBox(height: 8),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 300),
              child: Text(
                context.l10n.ob8Subtitle,
                textAlign: TextAlign.center,
                style: AppText.body.copyWith(color: c.textSecondary, fontSize: 14, height: 21.5 / 14),
              ),
            ),
            const SizedBox(height: 14),
            for (var i = 0; i < _items.length; i++) ...[
              if (i > 0) const SizedBox(height: 12),
              _PermissionRow(item: _items[i], granted: _granted.contains(i), onTap: () => _toggle(i)),
            ],
            const SizedBox(height: 18),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // TODO(figma): 12px lock icon 727:41606
                Icon(Icons.lock_outline_rounded, size: 12, color: c.textMuted),
                const SizedBox(width: 6),
                Flexible(
                  child: Text(
                    context.l10n.dataStaysOnDevice,
                    textAlign: TextAlign.center,
                    style: AppText.caption.copyWith(fontSize: 11, color: c.textMuted),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}

/// 80×80 shield tile with a small check badge on its top-right corner.
class _ShieldBadge extends StatelessWidget {
  const _ShieldBadge({required this.allGranted});

  final bool allGranted;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 88,
      height: 88,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            left: 0,
            top: 4,
            child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(26),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [AppPalette.blue.withValues(alpha: 0.22), AppPalette.violet.withValues(alpha: 0.14)],
                ),
                border: Border.all(color: AppPalette.blue.withValues(alpha: 0.3)),
                boxShadow: [
                  BoxShadow(color: AppPalette.blue.withValues(alpha: 0.25), blurRadius: 24, offset: const Offset(0, 6)),
                ],
              ),
              // TODO(figma): 40px shield icon 727:41563
              child: const Icon(Icons.shield_outlined, size: 40, color: AppPalette.blue),
            ),
          ),
          Positioned(
            left: 64,
            top: 0,
            child: AnimatedScale(
              scale: allGranted ? 1.15 : 1,
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeOutBack,
              child: Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppPalette.teal,
                  boxShadow: [BoxShadow(color: AppPalette.teal.withValues(alpha: 0.5), blurRadius: 8)],
                ),
                // TODO(figma): 11px check 727:41568
                child: const Icon(Icons.check_rounded, size: 13, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// 330×70 permission card. Tap to grant; a check appears on the right.
class _PermissionRow extends StatelessWidget {
  const _PermissionRow({required this.item, required this.granted, required this.onTap});

  final _Permission item;
  final bool granted;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final title = item.title(context.l10n);
    final subtitle = item.subtitle(context.l10n);
    return Semantics(
      button: true,
      toggled: granted,
      label: '$title. $subtitle',
      child: SizedBox(
        width: double.infinity,
        child: GlassCard(
          onTap: onTap,
          radius: 18,
          padding: const EdgeInsets.all(15),
          color: granted ? item.color.withValues(alpha: 0.12) : AppPalette.violet.withValues(alpha: 0.07),
          borderColor: granted ? item.color.withValues(alpha: 0.45) : AppPalette.violet.withValues(alpha: 0.2),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: item.color.withValues(alpha: 0.12),
                  border: Border.all(color: item.color.withValues(alpha: 0.25)),
                ),
                child: Icon(item.icon, size: 19, color: item.color),
              ),
              const SizedBox(width: 9),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppText.option.copyWith(
                        fontSize: 14,
                        height: 19 / 14,
                        fontWeight: FontWeight.w700,
                        color: c.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 1),
                    Text(
                      subtitle,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: AppText.caption.copyWith(fontSize: 11, height: 15 / 11, color: c.textMuted),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 220),
                transitionBuilder: (w, a) => ScaleTransition(scale: a, child: w),
                child: granted
                    ? Container(
                        key: const ValueKey('on'),
                        width: 22,
                        height: 22,
                        decoration: BoxDecoration(shape: BoxShape.circle, color: item.color),
                        child: const Icon(Icons.check_rounded, size: 14, color: Colors.white),
                      )
                    : Container(
                        key: const ValueKey('off'),
                        width: 22,
                        height: 22,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: c.glassBorder, width: 2),
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
