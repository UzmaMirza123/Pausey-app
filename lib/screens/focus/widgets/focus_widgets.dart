import 'package:flutter/material.dart';

import '../../../data/models.dart';
import '../../../utils/app_theme.dart';
import '../../../utils/l10n.dart';

String modeName(AppLocalizations l, FocusMode m) => switch (m) {
      FocusMode.pomodoro => l.focusModePomodoro,
      FocusMode.deep => l.focusModeDeep,
      FocusMode.custom => l.focusModeCustom,
    };

IconData modeIcon(FocusMode m) => switch (m) {
      FocusMode.pomodoro => Icons.timer_outlined,
      FocusMode.deep => Icons.psychology_outlined,
      FocusMode.custom => Icons.tune_rounded,
    };

String soundName(AppLocalizations l, String id) => switch (id) {
      'rain' => l.focusSoundRain,
      'forest' => l.focusSoundForest,
      'waves' => l.focusSoundWaves,
      'white' => l.focusSoundWhite,
      _ => l.focusSoundOff,
    };

IconData soundIcon(String id) => switch (id) {
      'rain' => Icons.water_drop_outlined,
      'forest' => Icons.forest_outlined,
      'waves' => Icons.waves_rounded,
      'white' => Icons.graphic_eq_rounded,
      _ => Icons.volume_off_outlined,
    };

/// "15:32" (or "1:05:00" for long sessions).
String clock(int seconds) {
  final h = seconds ~/ 3600, m = (seconds % 3600) ~/ 60, s = seconds % 60;
  String two(int v) => v.toString().padLeft(2, '0');
  return h > 0 ? '$h:${two(m)}:${two(s)}' : '${two(m)}:${two(s)}';
}

/// Three tall mode tiles (Pomodoro / Deep Focus / Custom).
class ModeTabs extends StatelessWidget {
  const ModeTabs({super.key, required this.selected, required this.onTap, required this.subtitles, this.locked = false});

  final FocusMode selected;
  final ValueChanged<FocusMode> onTap;
  final Map<FocusMode, String> subtitles;

  /// A session is running — tiles look dimmed (tap still reports, for a hint).
  final bool locked;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final l = context.l10n;
    return Row(
      children: [
        for (final m in FocusMode.values) ...[
          if (m != FocusMode.pomodoro) const SizedBox(width: 10),
          Expanded(
            child: Semantics(
              button: true,
              selected: m == selected,
              child: GestureDetector(
                onTap: () => onTap(m),
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 200),
                  opacity: locked && m != selected ? 0.45 : 1,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 220),
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 12),
                    decoration: BoxDecoration(
                      color: m == selected ? AppPalette.accent.withValues(alpha: context.isDark ? 0.22 : 0.12) : (context.isDark ? const Color(0xFF14122C) : Colors.white),
                      borderRadius: BorderRadius.circular(AppRadius.tile),
                      border: Border.all(color: m == selected ? AppPalette.violet : c.glassBorder, width: m == selected ? 1.4 : 1),
                    ),
                    child: Column(
                      children: [
                        Icon(modeIcon(m), size: 20, color: m == selected ? AppPalette.violet : c.textMuted),
                        const SizedBox(height: 4),
                        Text(modeName(l, m),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: AppText.rowSub.copyWith(fontWeight: FontWeight.w700, color: m == selected ? c.textPrimary : c.textSecondary)),
                        Text(subtitles[m] ?? '', maxLines: 1, overflow: TextOverflow.ellipsis, style: AppText.small.copyWith(color: c.textMuted)),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ],
    );
  }
}

/// Square glass control button (stop / restart).
class ControlButton extends StatelessWidget {
  const ControlButton({super.key, required this.icon, required this.tooltip, this.onTap, this.size = 60});

  final IconData icon;
  final String tooltip;
  final VoidCallback? onTap;
  final double size;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    return Tooltip(
      message: tooltip,
      child: Semantics(
        button: true,
        enabled: onTap != null,
        label: tooltip,
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 200),
          opacity: onTap == null ? 0.4 : 1,
          child: Material(
            color: context.isDark ? const Color(0xFF14122C) : Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppRadius.tile), side: BorderSide(color: c.glassBorder)),
            clipBehavior: Clip.antiAlias,
            child: InkWell(
              onTap: onTap,
              child: SizedBox.square(dimension: size, child: Icon(icon, color: c.textPrimary, size: 24)),
            ),
          ),
        ),
      ),
    );
  }
}

/// The big violet play / pause button.
class MainControl extends StatelessWidget {
  const MainControl({super.key, required this.icon, required this.tooltip, required this.onTap});

  final IconData icon;
  final String tooltip;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip,
      child: Semantics(
        button: true,
        label: tooltip,
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            width: 84,
            height: 84,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppRadius.card),
              gradient: const LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [AppPalette.accent, AppPalette.violet]),
              boxShadow: [BoxShadow(color: AppPalette.accent.withValues(alpha: 0.45), blurRadius: 24, offset: const Offset(0, 8))],
            ),
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              transitionBuilder: (c, a) => ScaleTransition(scale: a, child: c),
              child: Icon(icon, key: ValueKey(icon), color: Colors.white, size: 38),
            ),
          ),
        ),
      ),
    );
  }
}

/// One number + label in the stats strip.
class StripStat extends StatelessWidget {
  const StripStat({super.key, required this.value, required this.label});
  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        FittedBox(fit: BoxFit.scaleDown, child: Text(value, style: AppText.tileValue.copyWith(color: c.textPrimary))),
        const SizedBox(height: 2),
        Text(label, maxLines: 2, textAlign: TextAlign.center, overflow: TextOverflow.ellipsis, style: AppText.rowSub.copyWith(fontSize: 12, color: c.textMuted)),
      ],
    );
  }
}

/// Fades + slides its child in once.
class EnterAnim extends StatelessWidget {
  const EnterAnim({super.key, required this.child, this.delay = 0});
  final Widget child;
  final int delay;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: 1),
      duration: Duration(milliseconds: 420 + delay),
      curve: Interval(delay / (420 + delay), 1, curve: Curves.easeOutCubic),
      builder: (context, t, child) => Opacity(opacity: t, child: Transform.translate(offset: Offset(0, 16 * (1 - t)), child: child)),
      child: child,
    );
  }
}

