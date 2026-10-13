import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:local_auth/local_auth.dart';

import '../../data/app_repo.dart';
import '../../data/models.dart';
import '../../utils/app_theme.dart';
import '../../utils/l10n.dart';
import '../../widgets/ui_kit.dart';
import '../onboarding/widgets/select_apps_sheet.dart';

/// Which subset of managed apps the filter chips show.
enum BlockFilter { all, locked, unlocked, scheduled }

/// Block tab — App Lock (design 19362e6d).
class BlockScreen extends StatefulWidget {
  const BlockScreen({super.key, this.auth});

  /// Injectable for tests.
  final LocalAuthentication? auth;

  @override
  State<BlockScreen> createState() => _BlockScreenState();
}

class _BlockScreenState extends State<BlockScreen> {
  BlockFilter _filter = BlockFilter.all;
  bool _authBusy = false;

  AppRepo get _repo => AppRepo.instance;

  void _snack(String text, {SnackBarAction? action}) {
    final m = ScaffoldMessenger.maybeOf(context);
    m?.hideCurrentSnackBar();
    m?.showSnackBar(SnackBar(content: Text(text), action: action, behavior: SnackBarBehavior.floating));
  }

  Future<void> _addApps() async {
    final result = await showSelectAppsSheet(context, initialApps: {for (final a in _repo.apps) if (a.locked) a.id});
    if (result == null || result.skipped || !mounted) return;
    await _repo.setManagedApps(result.apps);
    if (mounted) _snack(context.l10n.blockAppsUpdated);
  }

  Future<void> _remove(ManagedApp app) async {
    final before = _repo.apps.map((a) => a.id).toList();
    final locked = app.locked, scheduled = app.scheduled;
    await _repo.removeApp(app.id);
    if (!mounted) return;
    final l = context.l10n;
    _snack(l.blockRemoved(app.name),
        action: SnackBarAction(
          label: l.blockUndo,
          onPressed: () async {
            final ids = [for (final id in before) if (id == app.id || _repo.apps.any((a) => a.id == id)) id];
            await _repo.setManagedApps(ids);
            await _repo.setAppLocked(app.id, locked);
            await _repo.setAppScheduled(app.id, scheduled);
          },
        ));
  }

  Future<void> _toggleFaceId(bool v) async {
    final l = context.l10n;
    if (!v) {
      await _repo.setFaceIdProtection(false);
      return;
    }
    if (_authBusy) return;
    setState(() => _authBusy = true);
    try {
      if (kIsWeb && widget.auth == null) {
        _snack(l.blockFaceIdUnavailable);
        return;
      }
      final auth = widget.auth ?? LocalAuthentication();
      bool supported;
      try {
        supported = await auth.isDeviceSupported();
      } catch (_) {
        supported = false;
      }
      if (!mounted) return;
      if (!supported) {
        _snack(l.blockFaceIdUnavailable);
        return;
      }
      bool ok;
      try {
        ok = await auth.authenticate(localizedReason: l.blockFaceIdReason);
      } catch (_) {
        ok = false;
      }
      if (!mounted) return;
      if (ok) {
        await _repo.setFaceIdProtection(true);
      } else {
        _snack(l.blockFaceIdFailed);
      }
    } finally {
      if (mounted) setState(() => _authBusy = false);
    }
  }

  Future<void> _pickTime(bool start) async {
    final s = _repo.schedule;
    final picked = await showTimePicker(context: context, initialTime: start ? s.start : s.end);
    if (picked == null) return;
    final m = picked.hour * 60 + picked.minute;
    await _repo.updateSchedule((x) => start ? x.startMinutes = m : x.endMinutes = m);
  }

  Future<void> _toggleDay(int d) async {
    final days = _repo.schedule.days;
    if (days.contains(d) && days.length == 1) {
      _snack(context.l10n.blockNeedOneDay);
      return;
    }
    await _repo.updateSchedule((x) => x.days.contains(d) ? x.days.remove(d) : x.days.add(d));
  }

  Future<void> _emergency() async {
    final l = context.l10n;
    if (!_repo.settings.emergencyBypass) {
      _snack(l.blockEmergencyOff);
      return;
    }
    final left = _repo.bypassLeftToday;
    if (left <= 0) {
      _snack(l.blockEmergencyNone);
      return;
    }
    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(l.blockEmergencyConfirmTitle),
        content: Text(l.blockEmergencyConfirmMsg(left)),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx, false), child: Text(l.cancel)),
          FilledButton(
            style: FilledButton.styleFrom(backgroundColor: Tone.red, foregroundColor: Colors.white),
            onPressed: () => Navigator.pop(ctx, true),
            child: Text(l.blockEmergencyUse),
          ),
        ],
      ),
    );
    if (ok != true || !mounted) return;
    final used = await _repo.useBypass();
    if (mounted) _snack(used ? l.blockEmergencyUsed : l.blockEmergencyNone);
  }

  Future<void> _appOptions(ManagedApp app) async {
    await showModalBottomSheet<void>(
      context: context,
      useSafeArea: true,
      backgroundColor: context.isDark ? const Color(0xFF14122C) : Colors.white,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(AppRadius.card))),
      builder: (ctx) => ListenableBuilder(
        listenable: _repo,
        builder: (ctx, _) {
          final l = ctx.l10n;
          final c = ctx.colors;
          final a = _repo.apps.where((x) => x.id == app.id).firstOrNull;
          if (a == null) return const SizedBox.shrink();
          return Padding(
            padding: const EdgeInsets.fromLTRB(AppSpacing.gutter, 20, AppSpacing.gutter, 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(children: [
                  AppGlyph(a.id, size: 44),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Text(a.name, style: AppText.cardTitle.copyWith(color: c.textPrimary), maxLines: 1, overflow: TextOverflow.ellipsis),
                      Text(blockCategoryLabel(l, a.category), style: AppText.rowSub.copyWith(color: c.textMuted)),
                    ]),
                  ),
                ]),
                const SizedBox(height: 12),
                _OptionRow(
                  icon: Icons.lock_rounded,
                  title: l.blockLockedLabel,
                  trailing: PSwitch(value: a.locked, onChanged: (v) => _repo.setAppLocked(a.id, v)),
                ),
                _OptionRow(
                  icon: Icons.schedule_rounded,
                  color: Tone.amber,
                  title: l.blockOnlySchedule,
                  subtitle: l.blockOnlyScheduleSub,
                  trailing: PSwitch(value: a.scheduled, color: Tone.amber, onChanged: (v) => _repo.setAppScheduled(a.id, v)),
                ),
                const SizedBox(height: 8),
                TextButton.icon(
                  style: TextButton.styleFrom(foregroundColor: Tone.red, padding: const EdgeInsets.symmetric(vertical: 14)),
                  onPressed: () {
                    Navigator.pop(ctx);
                    _remove(a);
                  },
                  icon: const Icon(Icons.delete_outline_rounded),
                  label: Text(l.blockRemove, style: AppText.rowTitle.copyWith(color: Tone.red)),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _repo,
      builder: (context, _) {
        final l = context.l10n;
        final apps = _repo.apps;
        final shown = switch (_filter) {
          BlockFilter.all => apps,
          BlockFilter.locked => apps.where((a) => a.locked).toList(),
          BlockFilter.unlocked => apps.where((a) => !a.locked).toList(),
          BlockFilter.scheduled => apps.where((a) => a.scheduled).toList(),
        };
        void setFilter(BlockFilter f) => setState(() => _filter = _filter == f ? BlockFilter.all : f);
        return PageList(
          header: ScreenHeader(
            title: l.blockTitle,
            subtitle: l.blockSubtitle(_repo.lockedCount, apps.length),
            trailing: _AddButton(label: l.blockAddApp, onTap: _addApps),
          ),
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              clipBehavior: Clip.none,
              child: Row(children: [
                ChoiceChipP(
                  icon: Icons.lock_rounded,
                  label: l.blockLockedChip(_repo.lockedCount),
                  selected: _filter == BlockFilter.locked,
                  onTap: () => setFilter(BlockFilter.locked),
                ),
                const SizedBox(width: 8),
                ChoiceChipP(
                  icon: Icons.lock_open_rounded,
                  label: l.blockUnlockedChip(_repo.unlockedCount),
                  selected: _filter == BlockFilter.unlocked,
                  onTap: () => setFilter(BlockFilter.unlocked),
                ),
                const SizedBox(width: 8),
                ChoiceChipP(
                  icon: Icons.calendar_month_rounded,
                  label: l.blockScheduledChip(_repo.scheduledCount),
                  selected: _filter == BlockFilter.scheduled,
                  onTap: () => setFilter(BlockFilter.scheduled),
                ),
              ]),
            ),
            _FadeIn(
              delay: 0,
              child: PCard(
                child: Row(children: [
                  const IconBadge(icon: Icons.face_retouching_natural_rounded, color: Tone.violet, size: 48),
                  const SizedBox(width: 14),
                  Expanded(child: _Texts(title: l.blockFaceIdTitle, sub: l.blockFaceIdSub)),
                  const SizedBox(width: 8),
                  PSwitch(key: const Key('faceIdSwitch'), value: _repo.faceIdProtection, onChanged: _authBusy ? null : _toggleFaceId),
                ]),
              ),
            ),
            _FadeIn(delay: 60, child: _ScheduleCard(onPickTime: _pickTime, onToggleDay: _toggleDay)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SectionLabel(
                  l.blockManagedApps,
                  trailing: apps.isEmpty
                      ? null
                      : LinkText(l.blockLockAll, onTap: () async {
                          await _repo.lockAll();
                          if (mounted) _snack(l.blockAllLocked);
                        }),
                ),
                if (apps.isEmpty)
                  StateMessage(
                    icon: Icons.shield_outlined,
                    color: Tone.violet,
                    badge: l.blockEmptyBadge,
                    title: l.blockEmptyTitle,
                    message: l.blockEmptyMsg,
                    primaryLabel: l.blockAddApp,
                    onPrimary: _addApps,
                  )
                else
                  for (var i = 0; i < shown.length; i++) ...[
                    if (i > 0) const SizedBox(height: 10),
                    _FadeIn(
                      key: ValueKey(shown[i].id),
                      delay: 100 + i * 40,
                      child: _AppRow(
                        app: shown[i],
                        onTap: () => _appOptions(shown[i]),
                        onLocked: (v) => _repo.setAppLocked(shown[i].id, v),
                      ),
                    ),
                  ],
              ],
            ),
            _FadeIn(delay: 200, child: _EmergencyCard(onTap: _emergency)),
          ],
        );
      },
    );
  }
}

/// Translated label for a managed-app category id.
String blockCategoryLabel(AppLocalizations l, String id) => switch (id) {
      'social' => l.blockCatSocial,
      'video' => l.blockCatVideo,
      'games' => l.blockCatGames,
      'shopping' => l.blockCatShopping,
      'community' => l.blockCatCommunity,
      _ => l.blockCatOther,
    };

class _Texts extends StatelessWidget {
  const _Texts({required this.title, this.sub});
  final String title;
  final String? sub;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(title, style: AppText.rowTitle.copyWith(color: c.textPrimary), maxLines: 2, overflow: TextOverflow.ellipsis),
      if (sub != null) ...[
        const SizedBox(height: 2),
        Text(sub!, style: AppText.rowSub.copyWith(color: c.textMuted), maxLines: 2, overflow: TextOverflow.ellipsis),
      ],
    ]);
  }
}

class _AddButton extends StatelessWidget {
  const _AddButton({required this.label, required this.onTap});
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 150),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          key: const Key('addAppButton'),
          onTap: onTap,
          borderRadius: BorderRadius.circular(AppRadius.chip),
          child: Ink(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(gradient: heroGradient, borderRadius: BorderRadius.circular(AppRadius.chip)),
            child: Row(mainAxisSize: MainAxisSize.min, children: [
              const Icon(Icons.add_rounded, size: 18, color: Colors.white),
              const SizedBox(width: 6),
              Flexible(
                child: Text(label, maxLines: 1, overflow: TextOverflow.ellipsis, style: AppText.rowSub.copyWith(fontWeight: FontWeight.w700, color: Colors.white)),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}

class _ScheduleCard extends StatelessWidget {
  const _ScheduleCard({required this.onPickTime, required this.onToggleDay});
  final void Function(bool start) onPickTime;
  final void Function(int day) onToggleDay;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final s = AppRepo.instance.schedule;
    final loc = Localizations.localeOf(context).toString();
    String fmt(TimeOfDay t) => DateFormat.jm(loc).format(DateTime(2024, 1, 1, t.hour, t.minute));
    return PCard(
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        CardTitle(
          icon: Icons.event_available_rounded,
          color: Tone.amber,
          title: l.blockScheduleTitle,
          trailing: PSwitch(key: const Key('scheduleSwitch'), value: s.enabled, onChanged: (v) => AppRepo.instance.updateSchedule((x) => x.enabled = v)),
        ),
        AnimatedOpacity(
          duration: const Duration(milliseconds: 200),
          opacity: s.enabled ? 1 : 0.45,
          child: IgnorePointer(
            ignoring: !s.enabled,
            child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
              const SizedBox(height: 14),
              Row(children: [
                Expanded(child: _TimeTile(label: l.blockStart, value: fmt(s.start), icon: Icons.bedtime_rounded, color: Tone.violet, onTap: () => onPickTime(true))),
                const SizedBox(width: 10),
                Expanded(child: _TimeTile(label: l.blockEnd, value: fmt(s.end), icon: Icons.wb_sunny_rounded, color: Tone.amber, onTap: () => onPickTime(false))),
              ]),
              const SizedBox(height: 14),
              Row(children: [
                for (var d = 1; d <= 7; d++) ...[
                  if (d > 1) const SizedBox(width: 6),
                  Expanded(
                    child: _DayChip(
                      key: Key('day_$d'),
                      letter: DateFormat.EEEEE(loc).format(DateTime(2024, 1, d)),
                      tooltip: DateFormat.EEEE(loc).format(DateTime(2024, 1, d)),
                      selected: s.days.contains(d),
                      onTap: () => onToggleDay(d),
                    ),
                  ),
                ],
              ]),
            ]),
          ),
        ),
      ]),
    );
  }
}

class _TimeTile extends StatelessWidget {
  const _TimeTile({required this.label, required this.value, required this.icon, required this.color, required this.onTap});
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
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(color: c.glassFill, borderRadius: BorderRadius.circular(AppRadius.tile), border: Border.all(color: c.glassBorder)),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(label, style: AppText.rowSub.copyWith(color: c.textMuted), maxLines: 1, overflow: TextOverflow.ellipsis),
            const SizedBox(height: 6),
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

class _DayChip extends StatelessWidget {
  const _DayChip({super.key, required this.letter, required this.tooltip, required this.selected, required this.onTap});
  final String letter, tooltip;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    return Tooltip(
      message: tooltip,
      child: Semantics(
        selected: selected,
        button: true,
        child: GestureDetector(
          onTap: onTap,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            height: 34,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: selected ? AppPalette.accent : c.glassFill,
              borderRadius: BorderRadius.circular(AppRadius.chip),
              border: Border.all(color: selected ? Colors.transparent : c.glassBorder),
            ),
            child: Text(letter, style: AppText.rowSub.copyWith(fontWeight: FontWeight.w700, color: selected ? Colors.white : c.textMuted)),
          ),
        ),
      ),
    );
  }
}

class _AppRow extends StatelessWidget {
  const _AppRow({required this.app, required this.onTap, required this.onLocked});
  final ManagedApp app;
  final VoidCallback onTap;
  final ValueChanged<bool> onLocked;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final c = context.colors;
    return PCard(
      onTap: onTap,
      padding: const EdgeInsetsDirectional.fromSTEB(14, 12, 10, 12),
      child: Row(children: [
        AppGlyph(app.id, size: 44),
        const SizedBox(width: 12),
        Expanded(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(children: [
              Flexible(child: Text(app.name, style: AppText.rowTitle.copyWith(color: c.textPrimary), maxLines: 1, overflow: TextOverflow.ellipsis)),
              if (app.scheduled) ...[const SizedBox(width: 8), Pill(l.blockSched, color: Tone.amber, icon: Icons.schedule_rounded)],
            ]),
            const SizedBox(height: 2),
            Text(blockCategoryLabel(l, app.category), style: AppText.rowSub.copyWith(color: c.textMuted), maxLines: 1, overflow: TextOverflow.ellipsis),
          ]),
        ),
        PSwitch(key: Key('lock_${app.id}'), value: app.locked, onChanged: onLocked),
      ]),
    );
  }
}

class _OptionRow extends StatelessWidget {
  const _OptionRow({required this.icon, required this.title, this.subtitle, required this.trailing, this.color = Tone.violet});
  final IconData icon;
  final String title;
  final String? subtitle;
  final Widget trailing;
  final Color color;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(children: [
          IconBadge(icon: icon, color: color, size: 36),
          const SizedBox(width: 12),
          Expanded(child: _Texts(title: title, sub: subtitle)),
          trailing,
        ]),
      );
}

class _EmergencyCard extends StatelessWidget {
  const _EmergencyCard({required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final repo = AppRepo.instance;
    final on = repo.settings.emergencyBypass;
    final left = repo.bypassLeftToday;
    return PCard(
      key: const Key('emergencyCard'),
      gradient: heroGradient,
      onTap: onTap,
      child: Row(children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white.withValues(alpha: 0.18)),
          child: const Icon(Icons.shield_rounded, size: 20, color: Colors.white),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(l.blockEmergencyTitle, style: AppText.rowTitle.copyWith(color: Colors.white), maxLines: 2, overflow: TextOverflow.ellipsis),
            const SizedBox(height: 2),
            Text(on ? l.blockEmergencySub(left) : l.blockEmergencyOff,
                style: AppText.rowSub.copyWith(color: Colors.white.withValues(alpha: 0.8)), maxLines: 2, overflow: TextOverflow.ellipsis),
          ]),
        ),
        const SizedBox(width: 8),
        Text(l.blockEmergencyUse, style: AppText.rowSub.copyWith(fontWeight: FontWeight.w800, color: Colors.white.withValues(alpha: on && left > 0 ? 1 : 0.5))),
      ]),
    );
  }
}

/// Entrance fade + slide.
class _FadeIn extends StatelessWidget {
  const _FadeIn({super.key, required this.child, required this.delay});
  final Widget child;
  final int delay;

  @override
  Widget build(BuildContext context) => TweenAnimationBuilder<double>(
        tween: Tween(begin: 0, end: 1),
        duration: Duration(milliseconds: 350 + delay),
        curve: Interval(delay / (350 + delay), 1, curve: Curves.easeOutCubic),
        builder: (_, t, c) => Opacity(opacity: t, child: Transform.translate(offset: Offset(0, 12 * (1 - t)), child: c)),
        child: child,
      );
}
