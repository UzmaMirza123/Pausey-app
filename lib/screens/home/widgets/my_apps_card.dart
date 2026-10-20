import 'package:flutter/material.dart';

import '../../../data/app_repo.dart';
import '../../../data/models.dart';
import '../../../data/restrictions/restriction_repo.dart';
import '../../../utils/app_theme.dart';
import '../../../utils/l10n.dart';
import '../../block/widgets/applock_ui.dart';
import '../../shell/app_shell.dart';

/// Home "My apps" card: the locked apps as ringed icons with a lock and a centred
/// "Manage apps" pill. ("Unblock apps" floats above the bottom bar: UnblockBadge.)
class MyAppsSection extends StatelessWidget {
  const MyAppsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: Listenable.merge([AppRepo.instance, RestrictionRepo.instance, InstalledAppsCache.instance]),
      builder: (context, _) {
        final repo = AppRepo.instance;
        final locked = [
          for (final a in repo.apps)
            if (a.locked) a,
        ];
        final shown = locked.take(3).toList();
        void manage() => AppShell.of(context)?.goTab(AppTab.block);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // "Unblock apps" now floats above the bottom bar (see UnblockBadge).
            _MyAppsCard(apps: shown, total: locked.length, onManage: manage),
          ],
        );
      },
    );
  }
}

class _MyAppsCard extends StatelessWidget {
  const _MyAppsCard({required this.apps, required this.total, required this.onManage});
  final List<ManagedApp> apps;
  final int total;
  final VoidCallback onManage;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final c = context.colors;
    final dark = context.isDark;
    final r = BorderRadius.circular(AppRadius.card);
    final names = apps.map((a) => a.name).join(', ');
    final more = total - apps.length;
    return Semantics(
      container: true,
      label: l.homeMyApps,
      child: Material(
        type: MaterialType.transparency,
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: r,
            color: dark ? c.glassFill : Colors.white,
            border: Border.all(color: c.glassBorder),
          ),
          child: ClipRRect(
            borderRadius: r,
            child: Stack(
              children: [
                // Soft brand glow rising from the bottom edge.
                Positioned(
                  left: -40,
                  right: -40,
                  bottom: -150,
                  height: 280,
                  child: IgnorePointer(
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: RadialGradient(
                          radius: 0.5,
                          colors: [
                            AppPalette.accent.withValues(alpha: dark ? 0.30 : 0.16),
                            AppPalette.accent.withValues(alpha: 0),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(18, 14, 18, 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Header: "My apps ›" opens App Lock.
                      Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: InkWell(
                          onTap: onManage,
                          borderRadius: BorderRadius.circular(AppRadius.chip),
                          child: ConstrainedBox(
                            constraints: const BoxConstraints(minHeight: 40),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  l.homeMyApps,
                                  style: AppText.rowTitle.copyWith(fontWeight: FontWeight.w700, color: c.textSecondary),
                                ),
                                Icon(
                                  Directionality.of(context) == TextDirection.rtl ? Icons.chevron_left_rounded : Icons.chevron_right_rounded,
                                  color: c.textSecondary,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 14),
                      // Ringed, locked app icons with the "Manage apps" pill over them.
                      SizedBox(
                        height: 96,
                        child: Stack(
                          alignment: Alignment.center,
                          clipBehavior: Clip.none,
                          children: [
                            Positioned(top: 0, child: apps.isEmpty ? const _EmptyRing() : _IconCluster(apps: apps)),
                            Positioned(
                              bottom: 0,
                              child: _ManagePill(label: l.homeManageApps, onTap: onManage),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        apps.isEmpty ? l.homeNoLockedApps : (more > 0 ? l.homeAppNamesMore(names, more) : names),
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: AppText.rowTitle.copyWith(color: c.textPrimary),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        apps.isEmpty ? l.homeNoLockedAppsSub : l.homeAppsLocked(total),
                        textAlign: TextAlign.center,
                        style: AppText.rowSub.copyWith(fontWeight: FontWeight.w700, color: apps.isEmpty ? c.textMuted : AppPalette.accent),
                      ),
                    ],
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

class _IconCluster extends StatelessWidget {
  const _IconCluster({required this.apps});
  final List<ManagedApp> apps;

  @override
  Widget build(BuildContext context) {
    const size = 64.0, overlap = 18.0;
    final width = size + (apps.length - 1) * (size - overlap);
    return SizedBox(
      width: width,
      height: size,
      child: Stack(
        children: [
          // Drawn last-to-first so each lock badge sits above the next icon.
          for (var i = apps.length - 1; i >= 0; i--)
            PositionedDirectional(
              start: i * (size - overlap),
              child: _LockedIcon(app: apps[i], size: size),
            ),
        ],
      ),
    );
  }
}

/// App icon inside a soft ring, dimmed, with a lock on top.
class _LockedIcon extends StatelessWidget {
  const _LockedIcon({required this.app, required this.size});
  final ManagedApp app;
  final double size;

  @override
  Widget build(BuildContext context) {
    final dark = context.isDark;
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: dark ? const Color(0xFF1A1735) : Colors.white,
        border: Border.all(color: AppPalette.accent.withValues(alpha: 0.55), width: 2),
      ),
      child: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          Opacity(opacity: 0.85, child: AppIcon(app, size: size * 0.6)),
          PositionedDirectional(
            end: -2,
            bottom: -2,
            child: Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: dark ? const Color(0xFF1A1735) : Colors.white,
                border: Border.all(color: AppPalette.accent.withValues(alpha: 0.55), width: 1.5),
              ),
              child: const Icon(Icons.lock_rounded, color: AppPalette.accent, size: 14),
            ),
          ),
        ],
      ),
    );
  }
}

class _EmptyRing extends StatelessWidget {
  const _EmptyRing();

  @override
  Widget build(BuildContext context) => Container(
    width: 64,
    height: 64,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      border: Border.all(color: AppPalette.accent.withValues(alpha: 0.4), width: 2),
      color: AppPalette.accent.withValues(alpha: 0.08),
    ),
    child: const Icon(Icons.lock_open_rounded, color: AppPalette.accent),
  );
}

class _ManagePill extends StatelessWidget {
  const _ManagePill({required this.label, required this.onTap});
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final dark = context.isDark;
    return Material(
      color: dark ? const Color(0xFFF3F1FF) : Colors.white,
      shape: StadiumBorder(side: BorderSide(color: dark ? Colors.transparent : c.glassBorder)),
      elevation: 0,
      child: InkWell(
        onTap: onTap,
        customBorder: const StadiumBorder(),
        child: ConstrainedBox(
          constraints: const BoxConstraints(minHeight: 40),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.apps_rounded, size: 18, color: AppPalette.accent),
                const SizedBox(width: 8),
                Text(
                  label,
                  style: AppText.rowSub.copyWith(fontWeight: FontWeight.w700, color: const Color(0xFF1B1838)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
