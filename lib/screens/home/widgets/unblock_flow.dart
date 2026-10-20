import 'dart:async';

import 'package:flutter/material.dart';

import '../../../data/app_repo.dart';
import '../../../data/models.dart';
import '../../../data/restrictions/restriction_repo.dart';
import '../../../utils/app_theme.dart';
import '../../../utils/l10n.dart';
import '../../../widgets/common.dart';
import '../../block/widgets/applock_ui.dart';

/// Floating "Unblock apps" badge that sits just above the bottom bar on Home
/// (the page scrolls underneath it). Shown whenever any app is locked (e.g. in
/// onboarding); hidden when none is.
///
/// - Two locked apps' icons (with a lock), then "+N" for the rest, and "Unblock apps".
///   Tapping opens a sheet to pick 1–15 minutes, with Continue and Skip.
/// - While unblocked: the icons and "Unblocked · 4:59 left", counting down. When
///   the time is up the apps are blocked again by themselves.
class UnblockBadge extends StatefulWidget {
  const UnblockBadge({super.key});

  @override
  State<UnblockBadge> createState() => _UnblockBadgeState();
}

class _UnblockBadgeState extends State<UnblockBadge> {
  Timer? _tick;

  @override
  void dispose() {
    _tick?.cancel();
    super.dispose();
  }

  /// Ticks once a second only while a countdown is showing.
  void _ensureTicking(bool on) {
    if (on && _tick == null) {
      _tick = Timer.periodic(const Duration(seconds: 1), (_) {
        if (mounted) setState(() {});
      });
    } else if (!on && _tick != null) {
      _tick!.cancel();
      _tick = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: Listenable.merge([AppRepo.instance, RestrictionRepo.instance, InstalledAppsCache.instance]),
      builder: (context, _) {
        final l = context.l10n;
        final rr = RestrictionRepo.instance;
        final locked = [
          for (final a in AppRepo.instance.apps)
            if (a.locked) a,
        ];
        final end = rr.unlockEndsAt;
        final unlocked = rr.unlockedNow.toSet();
        final left = end?.difference(DateTime.now());
        final running = left != null && !left.isNegative;
        _ensureTicking(running);
        final List<ManagedApp> shown = running ? [for (final a in locked) if (unlocked.contains(a.packageName)) a] : locked;
        if (shown.isEmpty) return const SizedBox.shrink();
        final label = running ? l.homeUnblockedLeft(_mmss(left)) : l.homeUnblockApps;
        return _Pill(
          apps: shown,
          locked: !running,
          label: label,
          onTap: running ? null : () => openUnblockFlow(context, [for (final a in locked) if (a.packageName != null) a.packageName!]),
        );
      },
    );
  }

  static String _mmss(Duration d) {
    final s = d.inSeconds + 1; // count down to 0:01, never show 0:00 while still unblocked
    return '${s ~/ 60}:${(s % 60).toString().padLeft(2, '0')}';
  }
}

class _Pill extends StatelessWidget {
  const _Pill({required this.apps, required this.locked, required this.label, required this.onTap});
  final List<ManagedApp> apps;
  final bool locked;
  final String label;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final dark = context.isDark;
    final c = context.colors;
    const s = 28.0;
    final first = apps.take(2).toList();
    final more = apps.length - first.length;
    return Semantics(
      button: onTap != null,
      label: label,
      child: Material(
        color: dark ? const Color(0xF21A1638) : Colors.white,
        elevation: 0,
        shape: StadiumBorder(side: BorderSide(color: dark ? Colors.white.withValues(alpha: 0.10) : c.glassBorder)),
        shadowColor: Colors.transparent,
        child: InkWell(
          key: const ValueKey('home_unblock'),
          customBorder: const StadiumBorder(),
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              boxShadow: [BoxShadow(color: AppPalette.accent.withValues(alpha: dark ? 0.30 : 0.18), blurRadius: 22, offset: const Offset(0, 8))],
            ),
            padding: const EdgeInsets.fromLTRB(10, 8, 18, 8),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Overlapping app icons, a lock on each while blocked, then "+N".
                SizedBox(
                  width: s + (first.length - 1) * s * 0.62 + (more > 0 ? s * 0.62 : 0),
                  height: s,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      for (var i = 0; i < first.length; i++)
                        PositionedDirectional(
                          start: i * s * 0.62,
                          child: _Bubble(
                            size: s,
                            dark: dark,
                            child: Stack(alignment: Alignment.center, children: [
                              AppIcon(first[i], size: s - 4),
                              if (locked)
                                Container(
                                  width: s - 4,
                                  height: s - 4,
                                  decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.black.withValues(alpha: 0.38)),
                                  child: const Icon(Icons.lock_rounded, size: 13, color: Colors.white),
                                ),
                            ]),
                          ),
                        ),
                      if (more > 0)
                        PositionedDirectional(
                          start: first.length * s * 0.62,
                          child: _Bubble(
                            size: s,
                            dark: dark,
                            child: Center(
                              child: Text('+$more', style: AppText.small.copyWith(letterSpacing: 0, fontWeight: FontWeight.w800, color: dark ? Colors.white : c.textPrimary)),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                Flexible(
                  child: Text(
                  label,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppText.rowTitle.copyWith(
                    fontWeight: FontWeight.w700,
                    color: dark ? Colors.white : c.textPrimary,
                    fontFeatures: const [FontFeature.tabularFigures()],
                  ),
                ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Bubble extends StatelessWidget {
  const _Bubble({required this.size, required this.dark, required this.child});
  final double size;
  final bool dark;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: dark ? const Color(0xFF2A2458) : const Color(0xFFF1EEFF),
        border: Border.all(color: dark ? const Color(0xFF1A1638) : Colors.white, width: 2),
      ),
      alignment: Alignment.center,
      child: ClipOval(child: child),
    );
  }
}

/// "Unblock all apps for…" sheet (1–15 minutes) → unblocks [pkgs] for the picked time.
/// Skip just closes the sheet.
Future<void> openUnblockFlow(BuildContext context, List<String> pkgs) async {
  if (pkgs.isEmpty) return;
  final minutes = await _pickMinutes(context);
  if (minutes == null) return;
  await RestrictionRepo.instance.unlockAllFor(pkgs, Duration(minutes: minutes));
}

/// "Unblock all apps for…" with a 1–15 minute wheel (5 picked), Continue and Skip.
Future<int?> _pickMinutes(BuildContext context) {
  return showModalBottomSheet<int>(
    context: context,
    isScrollControlled: true,
    backgroundColor: context.isDark ? const Color(0xFF14122C) : Colors.white,
    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(AppRadius.card))),
    builder: (ctx) => const _MinutesSheet(),
  );
}

class _MinutesSheet extends StatefulWidget {
  const _MinutesSheet();

  @override
  State<_MinutesSheet> createState() => _MinutesSheetState();
}

class _MinutesSheetState extends State<_MinutesSheet> {
  static const _min = 1, _max = 15;
  int _value = 5;
  late final FixedExtentScrollController _ctl = FixedExtentScrollController(initialItem: _value - _min);

  @override
  void dispose() {
    _ctl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final c = context.colors;
    final dark = context.isDark;
    const itemH = 48.0;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(AppSpacing.gutter, 22, AppSpacing.gutter, 12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(l.homeUnblockAllFor, textAlign: TextAlign.center, style: AppText.cardTitle.copyWith(fontSize: 20, color: c.textPrimary)),
            const SizedBox(height: 12),
            SizedBox(
              height: itemH * 5,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Highlight behind the picked row.
                  Container(
                    height: itemH,
                    width: 180,
                    decoration: BoxDecoration(
                      color: AppPalette.accent.withValues(alpha: dark ? 0.22 : 0.10),
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  ListWheelScrollView.useDelegate(
                    controller: _ctl,
                    itemExtent: itemH,
                    physics: const FixedExtentScrollPhysics(),
                    diameterRatio: 2.2,
                    onSelectedItemChanged: (i) => setState(() => _value = i + _min),
                    childDelegate: ListWheelChildBuilderDelegate(
                      childCount: _max - _min + 1,
                      builder: (context, i) {
                        final v = i + _min;
                        final sel = v == _value;
                        return Center(
                          child: Text(
                            l.homeMinutesN(v),
                            style: AppText.rowTitle.copyWith(
                              fontSize: sel ? 18 : 16,
                              fontWeight: sel ? FontWeight.w800 : FontWeight.w500,
                              color: sel ? c.textPrimary : c.textMuted,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            PrimaryButton(label: l.continueLabel, onPressed: () => Navigator.of(context).pop(_value), height: 56),
            const SizedBox(height: 4),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              style: TextButton.styleFrom(minimumSize: const Size(64, 48)),
              child: Text(l.skip, style: AppText.rowTitle.copyWith(color: c.textSecondary)),
            ),
          ],
        ),
      ),
    );
  }
}
