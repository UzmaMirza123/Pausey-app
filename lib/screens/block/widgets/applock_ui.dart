import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart' show DateFormat;

import '../../../data/app_repo.dart';
import '../../../data/models.dart';
import '../../../data/restrictions/restriction_evaluator.dart';
import '../../../data/restrictions/restriction_models.dart';
import '../../../data/restrictions/restriction_repo.dart';
import '../../../services/native_bridge.dart';
import '../../../utils/app_theme.dart';
import '../../../utils/l10n.dart';
import '../../../widgets/ui_kit.dart';

/// Shared helpers for the App Lock tab and the per-app details screen.

/// What a managed-app row shows as its state (exclusive, used by the filter chips too).
enum AppLockStatus { locked, scheduled, available }

AppLockStatus appLockStatus(ManagedApp a, RestrictionState s) {
  if (s.locked) return AppLockStatus.locked;
  if (a.locked && nextLockFor(a, s) != null) return AppLockStatus.scheduled;
  return AppLockStatus.available;
}

/// Next time this app gets locked: its own schedules, or the general schedule when it follows it.
DateTime? nextLockFor(ManagedApp a, RestrictionState s) {
  if (!a.locked) return null;
  DateTime? best = s.nextLockStart;
  if (a.scheduled) {
    final g = AppRepo.instance.schedule;
    final now = AppRepo.instance.now();
    if (g.enabled && !g.activeAt(now)) {
      final gs = AppLockSchedule(id: 'general', startMinuteOfDay: g.startMinutes, endMinuteOfDay: g.endMinutes, repeatWeekdays: g.days);
      final n = RestrictionEvaluator.nextStart([gs], now);
      if (n != null && (best == null || n.isBefore(best))) best = n;
    }
  }
  return best;
}

String alLocale(BuildContext context) => Localizations.localeOf(context).toString();

/// "10:00 PM" / "22:00" in the phone's language.
String fmtClock(BuildContext context, DateTime t) => DateFormat.jm(alLocale(context)).format(t);

String fmtMinuteOfDay(BuildContext context, int m) => fmtClock(context, DateTime(2024, 1, 1, m ~/ 60, m % 60));

/// "10:00 PM" today, otherwise "Tue 10:00 PM".
String fmtNextLock(BuildContext context, DateTime t) {
  final now = AppRepo.instance.now();
  final sameDay = t.year == now.year && t.month == now.month && t.day == now.day;
  final time = fmtClock(context, t);
  return sameDay ? time : '${DateFormat.E(alLocale(context)).format(t)} $time';
}

String fmtDur(AppLocalizations l, int minutes) => fmtMinutes(minutes, h: l.unitH, m: l.unitM);

/// Translated label for a managed-app category id.
String blockCategoryLabel(AppLocalizations l, String id) => switch (id) {
      'social' => l.blockCatSocial,
      'video' => l.blockCatVideo,
      'games' => l.blockCatGames,
      'shopping' => l.blockCatShopping,
      'community' => l.blockCatCommunity,
      _ => l.blockCatOther,
    };

/// One-word state label.
String statusLabel(AppLocalizations l, AppLockStatus st, {required bool canEnforce}) => switch (st) {
      AppLockStatus.locked => canEnforce ? l.alStateLocked : l.alStateWillLock,
      AppLockStatus.scheduled => l.alStateScheduled,
      AppLockStatus.available => l.alStateAvailable,
    };

/// Short reason line for a restricted app.
String reasonText(AppLocalizations l, ManagedApp a, RestrictionState s) {
  final r = s.reasons;
  if (r.contains(RestrictionReason.focus)) return l.alReasonFocus;
  if (r.contains(RestrictionReason.dailyLimit)) return l.alReasonLimit;
  if (r.contains(RestrictionReason.schedule)) return l.alReasonSchedule;
  return a.scheduled ? l.alReasonGeneral : l.alReasonAllDay;
}

/// Line 1 of a row: today's use against the limit.
String usageLine(AppLocalizations l, ManagedApp a, RestrictionState s) {
  if (a.packageName == null) return blockCategoryLabel(l, a.category);
  if (!a.locked) return l.alRulesOff;
  final used = s.usedMinutes, limit = s.limitMinutes;
  if (limit != null) {
    return used != null ? l.alUsedOf(fmtDur(l, used), fmtDur(l, limit)) : l.alLimitNoUsage(fmtDur(l, limit));
  }
  return used != null ? '${l.alUsedToday(fmtDur(l, used))} · ${l.alNoLimit}' : l.alNoLimit;
}

// ---------------------------------------------------------------------------
// Installed-app icons (Android)
// ---------------------------------------------------------------------------

/// Installed apps read once from Android, so rows can show real launcher icons.
class InstalledAppsCache extends ChangeNotifier {
  InstalledAppsCache._();
  static final InstalledAppsCache instance = InstalledAppsCache._();

  List<InstalledApp> apps = const [];
  bool loaded = false;
  bool _loading = false;

  Uint8List? iconFor(String? pkg) {
    if (pkg == null) return null;
    for (final a in apps) {
      if (a.packageName == pkg) return a.icon;
    }
    return null;
  }

  /// Loads the list when the native side is available (no-op elsewhere).
  Future<void> ensureLoaded({bool force = false}) async {
    if (_loading || (loaded && !force) || !RestrictionRepo.instance.status.supported) return;
    _loading = true;
    try {
      apps = await NativeBridge.instance.installedApps();
      loaded = true;
    } finally {
      _loading = false;
      notifyListeners();
    }
  }
}

/// Real launcher icon when known, otherwise the bundled brand glyph.
class AppIcon extends StatelessWidget {
  const AppIcon(this.app, {super.key, this.size = 44});
  final ManagedApp app;
  final double size;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: InstalledAppsCache.instance,
      builder: (context, _) {
        final bytes = InstalledAppsCache.instance.iconFor(app.packageName);
        if (bytes == null) return AppGlyph(app.id, size: size);
        return InstalledIcon(bytes, size: size);
      },
    );
  }
}

class InstalledIcon extends StatelessWidget {
  const InstalledIcon(this.bytes, {super.key, this.size = 44});
  final Uint8List? bytes;
  final double size;

  @override
  Widget build(BuildContext context) {
    if (bytes == null) {
      return Container(
        width: size,
        height: size,
        decoration: BoxDecoration(shape: BoxShape.circle, color: context.isDark ? const Color(0xFF1E1A3A) : const Color(0xFFF1EEFF)),
        child: Icon(Icons.apps_rounded, size: size * 0.5, color: AppPalette.violet),
      );
    }
    return ClipRRect(
      borderRadius: BorderRadius.circular(size * 0.28),
      child: Image.memory(bytes!, width: size, height: size, gaplessPlayback: true, filterQuality: FilterQuality.medium),
    );
  }
}

// ---------------------------------------------------------------------------
// Small shared widgets
// ---------------------------------------------------------------------------

/// Brief "Saved" confirmation.
void showSavedSnack(BuildContext context, [String? text]) {
  final m = ScaffoldMessenger.maybeOf(context);
  m?.hideCurrentSnackBar();
  m?.showSnackBar(SnackBar(content: Text(text ?? context.l10n.alSaved), behavior: SnackBarBehavior.floating, duration: const Duration(milliseconds: 1400)));
}

/// Confirm dialog for destructive actions. Returns true when confirmed.
Future<bool> confirmAction(BuildContext context, {required String title, required String message, required String confirm, bool destructive = true}) async {
  final ok = await showDialog<bool>(
    context: context,
    builder: (ctx) => AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        TextButton(onPressed: () => Navigator.pop(ctx, false), child: Text(ctx.l10n.cancel)),
        FilledButton(
          style: FilledButton.styleFrom(backgroundColor: destructive ? Tone.red : AppPalette.accent, foregroundColor: Colors.white),
          onPressed: () => Navigator.pop(ctx, true),
          child: Text(confirm),
        ),
      ],
    ),
  );
  return ok == true;
}

/// Seven weekday letters, selected ones highlighted (1 = Monday).
class WeekdayLetters extends StatelessWidget {
  const WeekdayLetters({super.key, required this.days});
  final Set<int> days;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final loc = alLocale(context);
    return Row(mainAxisSize: MainAxisSize.min, children: [
      for (var d = 1; d <= 7; d++)
        Padding(
          padding: const EdgeInsetsDirectional.only(end: 5),
          child: Text(
            DateFormat.EEEEE(loc).format(DateTime(2024, 1, d)),
            style: AppText.small.copyWith(
              fontWeight: days.contains(d) ? FontWeight.w800 : FontWeight.w500,
              color: days.contains(d) ? AppPalette.violet : c.textMuted.withValues(alpha: 0.5),
            ),
          ),
        ),
    ]);
  }
}

/// Day chips row used in schedule editors (1 = Monday … 7 = Sunday).
class DayChips extends StatelessWidget {
  const DayChips({super.key, required this.days, required this.onToggle, this.keyPrefix = 'day'});
  final Set<int> days;
  final ValueChanged<int> onToggle;
  final String keyPrefix;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final loc = alLocale(context);
    return Row(children: [
      for (var d = 1; d <= 7; d++) ...[
        if (d > 1) const SizedBox(width: 6),
        Expanded(
          child: Tooltip(
            message: DateFormat.EEEE(loc).format(DateTime(2024, 1, d)),
            child: Semantics(
              selected: days.contains(d),
              button: true,
              child: GestureDetector(
                key: Key('${keyPrefix}_$d'),
                onTap: () => onToggle(d),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  height: 34,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: days.contains(d) ? AppPalette.accent : c.glassFill,
                    borderRadius: BorderRadius.circular(AppRadius.chip),
                    border: Border.all(color: days.contains(d) ? Colors.transparent : c.glassBorder),
                  ),
                  child: Text(
                    DateFormat.EEEEE(loc).format(DateTime(2024, 1, d)),
                    style: AppText.rowSub.copyWith(fontWeight: FontWeight.w700, color: days.contains(d) ? Colors.white : c.textMuted),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    ]);
  }
}

/// Glass tile showing a time, tap to change.
class TimeTile extends StatelessWidget {
  const TimeTile({super.key, required this.label, required this.value, required this.icon, required this.color, required this.onTap});
  final String label, value;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppRadius.tile),
        child: Ink(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          decoration: BoxDecoration(color: c.glassFill, borderRadius: BorderRadius.circular(AppRadius.tile), border: Border.all(color: c.glassBorder)),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(label, style: AppText.rowSub.copyWith(color: c.textMuted), maxLines: 1, overflow: TextOverflow.ellipsis),
            const SizedBox(height: 4),
            Row(children: [
              Icon(icon, size: 16, color: color),
              const SizedBox(width: 6),
              Expanded(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(value, style: AppText.rowTitle.copyWith(fontWeight: FontWeight.w800, color: c.textPrimary)),
                ),
              ),
            ]),
          ]),
        ),
      ),
    );
  }
}

/// Bottom-sheet container in the app style (handle + rounded top).
class SheetFrame extends StatelessWidget {
  const SheetFrame({super.key, required this.child, this.scroll = true});
  final Widget child;
  final bool scroll;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final body = Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Center(child: Container(width: 40, height: 4, decoration: BoxDecoration(color: c.dotInactive, borderRadius: BorderRadius.circular(2)))),
        const SizedBox(height: 16),
        if (scroll) child else Flexible(child: child),
      ],
    );
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.viewInsetsOf(context).bottom),
      child: Container(
        decoration: BoxDecoration(
          color: context.isDark ? const Color(0xFF14122C) : Colors.white,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(AppRadius.card)),
          border: Border.all(color: c.glassBorder),
        ),
        child: SafeArea(
          top: false,
          child: scroll
              ? SingleChildScrollView(padding: const EdgeInsets.fromLTRB(AppSpacing.gutter, 12, AppSpacing.gutter, AppSpacing.gutter), child: body)
              : Padding(padding: const EdgeInsets.fromLTRB(AppSpacing.gutter, 12, AppSpacing.gutter, AppSpacing.gutter), child: body),
        ),
      ),
    );
  }
}

/// Primary pill button used inside sheets.
class SheetButton extends StatelessWidget {
  const SheetButton({super.key, required this.label, required this.onPressed});
  final String label;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) => FilledButton(
        onPressed: onPressed,
        style: FilledButton.styleFrom(
          backgroundColor: AppPalette.accent,
          foregroundColor: Colors.white,
          disabledBackgroundColor: AppPalette.accent.withValues(alpha: 0.35),
          disabledForegroundColor: Colors.white70,
          minimumSize: const Size.fromHeight(54),
          shape: const StadiumBorder(),
          textStyle: AppText.button,
        ),
        child: Text(label, maxLines: 1, overflow: TextOverflow.ellipsis),
      );
}

/// Shared text-field look (glass fill, rounded).
InputDecoration alFieldDecoration(BuildContext context, {String? hint, Widget? prefixIcon, double radius = AppRadius.tile}) {
  final c = context.colors;
  final border = OutlineInputBorder(borderRadius: BorderRadius.circular(radius), borderSide: BorderSide(color: c.glassBorder));
  return InputDecoration(
    hintText: hint,
    hintStyle: AppText.rowTitle.copyWith(color: c.textMuted),
    prefixIcon: prefixIcon,
    isDense: true,
    counterText: '',
    filled: true,
    fillColor: c.glassFill,
    contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
    border: border,
    enabledBorder: border,
    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(radius), borderSide: const BorderSide(color: AppPalette.violet)),
  );
}
