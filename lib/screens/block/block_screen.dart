import 'dart:typed_data';

import 'package:flutter/material.dart';

import '../../data/app_repo.dart';
import '../../data/models.dart';
import '../../data/restrictions/restriction_repo.dart';
import '../../services/native_bridge.dart';
import '../../utils/app_theme.dart';
import '../../utils/l10n.dart';
import '../../widgets/time_picker.dart';
import '../../widgets/ui_kit.dart';
import '../onboarding/widgets/select_apps_sheet.dart';
import 'app_limit_details_screen.dart';
import 'widgets/applock_ui.dart';
import 'widgets/installed_apps_sheet.dart';

export 'widgets/applock_ui.dart' show blockCategoryLabel;

/// The three tabs under the search field.
enum BlockTab { all, locked, scheduled }

/// Block tab: search, then three tabs.
/// - All: every app on the phone (managed apps off Android).
/// - Locked apps: the apps the user locked (e.g. picked in onboarding), as round icons with a lock.
/// - Scheduled: the general lock schedule and the apps locked on a schedule.
/// Tapping an app opens its page, which has the Block / Unblock button.
class BlockScreen extends StatefulWidget {
  const BlockScreen({super.key, this.initialTab = BlockTab.all});

  /// Tab shown first (the preview opens the other tabs directly).
  final BlockTab initialTab;

  @override
  State<BlockScreen> createState() => _BlockScreenState();
}

/// One row in a tab: a managed app, or an installed app that isn't managed yet.
class _Entry {
  _Entry({required this.id, required this.name, this.app, this.pkg, this.bytes});
  final String id, name;
  final ManagedApp? app;
  final String? pkg;
  final Uint8List? bytes;
}

class _BlockScreenState extends State<BlockScreen> {
  late BlockTab _tab = widget.initialTab;
  String _query = '';

  AppRepo get _repo => AppRepo.instance;
  RestrictionRepo get _rr => RestrictionRepo.instance;

  void _snack(String text) {
    final m = ScaffoldMessenger.maybeOf(context);
    m?.hideCurrentSnackBar();
    m?.showSnackBar(SnackBar(content: Text(text), behavior: SnackBarBehavior.floating));
  }

  Future<void> _addApps() async {
    // On a phone, only apps that are really installed can be added.
    if (InstalledAppsCache.instance.supported) return _addInstalled();
    final result = await showSelectAppsSheet(context, initialApps: {for (final a in _repo.apps) if (a.locked) a.id});
    if (result == null || result.skipped || !mounted) return;
    await _repo.setManagedApps(result.apps);
    if (mounted) _snack(context.l10n.blockAppsUpdated);
  }

  Future<void> _addInstalled() async {
    final n = await showInstalledAppsSheet(context);
    if (n != null && n > 0 && mounted) _snack(context.l10n.blockAppsUpdated);
  }

  Future<void> _open(_Entry e) async {
    var id = e.app?.id;
    // An installed app that isn't managed yet is added (unblocked) so its page can open.
    id ??= await _repo.ensureInstalledApp(e.pkg!, e.name);
    if (!mounted) return;
    await Navigator.of(context).push(MaterialPageRoute(builder: (_) => AppLimitDetailsScreen(appId: id!)));
  }

  Future<void> _pickTime(bool start) async {
    final s = _repo.schedule;
    final picked = await showPTimePicker(context, initial: PTime.fromMinutes(start ? s.startMinutes : s.endMinutes));
    if (picked == null) return;
    final m = picked.totalMinutes;
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

  /// Locked on a schedule: follows the general schedule, or has its own schedules on.
  bool _isScheduled(ManagedApp a) {
    if (!a.locked) return false;
    if (a.scheduled) return true;
    final p = a.packageName;
    if (p == null) return false;
    final c = _rr.configFor(p);
    return c.schedulesEnabled && c.schedules.any((s) => s.enabled && s.isValid);
  }

  @override
  Widget build(BuildContext context) {
    final cache = InstalledAppsCache.instance;
    return ListenableBuilder(
      listenable: Listenable.merge([_repo, _rr, cache]),
      builder: (context, _) {
        final l = context.l10n;
        final status = _rr.status;
        if (cache.supported && !cache.loaded) {
          WidgetsBinding.instance.addPostFrameCallback((_) => cache.ensureLoaded());
        }
        final apps = _repo.apps;
        final q = _query.trim().toLowerCase();
        bool match(String name) => q.isEmpty || name.toLowerCase().contains(q);

        // All: every installed app on Android (with its managed state), else the managed list.
        final List<_Entry> all;
        if (cache.supported && cache.loaded) {
          final byPkg = {for (final a in apps) ?a.packageName: a};
          all = [
            for (final i in cache.apps)
              _Entry(id: byPkg[i.packageName]?.id ?? i.packageName, name: byPkg[i.packageName]?.name ?? i.label, app: byPkg[i.packageName], pkg: i.packageName, bytes: i.icon),
          ];
        } else {
          all = [for (final a in apps) _Entry(id: a.id, name: a.name, app: a, pkg: a.packageName)]
            ..sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
        }
        final locked = [for (final e in all) if (e.app?.locked == true) e];
        final scheduled = [for (final e in all) if (e.app != null && _isScheduled(e.app!)) e];
        final shown = [
          for (final e in switch (_tab) { BlockTab.all => all, BlockTab.locked => locked, BlockTab.scheduled => scheduled })
            if (match(e.name)) e,
        ];

        return PageList(
          header: ScreenHeader(
            title: l.blockTitle,
            subtitle: apps.isEmpty ? null : (status.canEnforce ? l.alSummary(locked.length, apps.length) : l.alSummaryOff(apps.length)),
            trailing: _AddButton(label: l.blockAddApp, onTap: _addApps),
          ),
          children: [
            if (!status.canEnforce) _FadeIn(delay: 0, child: _PermissionBanner(status: status)),
            _SearchField(onChanged: (v) => setState(() => _query = v)),
            _Tabs(
              value: _tab,
              labels: {BlockTab.all: l.alFilterAll, BlockTab.locked: l.blkTabLocked, BlockTab.scheduled: l.alFilterScheduled},
              onChanged: (t) => setState(() => _tab = t),
            ),
            if (_tab == BlockTab.scheduled) _FadeIn(delay: 0, child: _ScheduleCard(onPickTime: _pickTime, onToggleDay: _toggleDay)),
            // Until the phone's app list has been read, the managed apps are shown.
            if (shown.isEmpty)
              PCard(
                key: const Key('tabEmpty'),
                child: Text(
                  q.isNotEmpty || _tab == BlockTab.all ? l.alNoMatches : (_tab == BlockTab.locked ? l.blkNoLocked : l.blkNoScheduled),
                  textAlign: TextAlign.center,
                  style: AppText.rowSub.copyWith(color: context.colors.textMuted),
                ),
              )
            else if (_tab == BlockTab.locked)
              _LockedGrid(entries: shown, onTap: _open)
            else
              Column(
                key: ValueKey(_tab),
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  for (var i = 0; i < shown.length; i++) ...[
                    if (i > 0) const SizedBox(height: 10),
                    _FadeIn(
                      key: ValueKey('${_tab.name}_${shown[i].id}'),
                      delay: (i < 12 ? i : 12) * 30,
                      child: _AppRow(entry: shown[i], canEnforce: status.canEnforce, scheduledTab: _tab == BlockTab.scheduled, onTap: () => _open(shown[i])),
                    ),
                  ],
                ],
              ),
          ],
        );
      },
    );
  }
}

/// Three equal tabs in one rounded glass bar; the picked one is filled.
class _Tabs extends StatelessWidget {
  const _Tabs({required this.value, required this.labels, required this.onChanged});
  final BlockTab value;
  final Map<BlockTab, String> labels;
  final ValueChanged<BlockTab> onChanged;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    return Container(
      height: 48,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(color: c.glassFill, borderRadius: BorderRadius.circular(AppRadius.chip), border: Border.all(color: c.glassBorder)),
      child: Row(children: [
        for (final t in BlockTab.values)
          Expanded(
            child: Semantics(
              selected: t == value,
              button: true,
              child: GestureDetector(
                key: Key('tab_${t.name}'),
                behavior: HitTestBehavior.opaque,
                onTap: () => onChanged(t),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 220),
                  curve: Curves.easeOutCubic,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  decoration: BoxDecoration(
                    color: t == value ? AppPalette.accent : Colors.transparent,
                    borderRadius: BorderRadius.circular(AppRadius.chip),
                    boxShadow: t == value ? [BoxShadow(color: AppPalette.accent.withValues(alpha: 0.28), blurRadius: 12, offset: const Offset(0, 4))] : null,
                  ),
                  child: Text(
                    labels[t]!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppText.rowSub.copyWith(fontWeight: FontWeight.w700, color: t == value ? Colors.white : c.textSecondary),
                  ),
                ),
              ),
            ),
          ),
      ]),
    );
  }
}

/// Locked apps as round icons with a lock, four to a row, the name and "Unblock" under each.
class _LockedGrid extends StatelessWidget {
  const _LockedGrid({required this.entries, required this.onTap});
  final List<_Entry> entries;
  final ValueChanged<_Entry> onTap;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final c = context.colors;
    return LayoutBuilder(builder: (context, box) {
      const cols = 4;
      final w = box.maxWidth / cols;
      final icon = (w - 14).clamp(52.0, 76.0);
      return Wrap(
        runSpacing: 18,
        children: [
          for (var i = 0; i < entries.length; i++)
            SizedBox(
              width: w,
              child: _FadeIn(
                key: ValueKey('locked_${entries[i].id}'),
                delay: (i < 12 ? i : 12) * 30,
                child: InkWell(
                  key: Key('row_${entries[i].id}'),
                  borderRadius: BorderRadius.circular(AppRadius.tile),
                  onTap: () => onTap(entries[i]),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Column(children: [
                      LockAvatar(app: entries[i].app, bytes: entries[i].bytes, size: icon, locked: true),
                      const SizedBox(height: 8),
                      Text(entries[i].name,
                          maxLines: 1, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center, style: AppText.rowSub.copyWith(fontWeight: FontWeight.w600, color: c.textPrimary)),
                      Text(l.blkUnblock,
                          maxLines: 1, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center, style: AppText.small.copyWith(fontWeight: FontWeight.w700, color: AppPalette.violet)),
                    ]),
                  ),
                ),
              ),
            ),
        ],
      );
    });
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

class _SearchField extends StatelessWidget {
  const _SearchField({required this.onChanged});
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    return TextField(
      key: const Key('appSearch'),
      onChanged: onChanged,
      style: AppText.rowTitle.copyWith(color: c.textPrimary),
      textInputAction: TextInputAction.search,
      decoration: alFieldDecoration(context, hint: context.l10n.alSearchHint, prefixIcon: Icon(Icons.search_rounded, color: c.textMuted, size: 20), radius: AppRadius.chip),
    );
  }
}

/// Honest status: what is (not) enforced on this phone.
class _PermissionBanner extends StatelessWidget {
  const _PermissionBanner({required this.status});
  final NativeStatus status;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final c = context.colors;
    if (!status.supported) {
      return Container(
        key: const Key('androidOnlyNote'),
        padding: const EdgeInsetsDirectional.fromSTEB(14, 10, 14, 10),
        decoration: BoxDecoration(color: c.glassFill, borderRadius: BorderRadius.circular(AppRadius.tile), border: Border.all(color: c.glassBorder)),
        child: Row(children: [
          Icon(Icons.info_outline_rounded, size: 18, color: c.textMuted),
          const SizedBox(width: 10),
          Expanded(child: Text(l.alAndroidOnly, style: AppText.rowSub.copyWith(color: c.textSecondary))),
        ]),
      );
    }
    return PCard(
      key: const Key('permissionBanner'),
      accent: Tone.amber,
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        CardTitle(icon: Icons.warning_amber_rounded, color: Tone.amber, title: l.alPermTitle),
        const SizedBox(height: 6),
        Text(l.alPermMsg, style: AppText.rowSub.copyWith(color: c.textSecondary)),
        const SizedBox(height: 12),
        _PermStep(
          n: 1,
          title: l.alPermUsage,
          sub: l.alPermUsageSub,
          granted: status.usageAccess,
          onTap: NativeBridge.instance.openUsageAccessSettings,
        ),
        const SizedBox(height: 10),
        _PermStep(
          n: 2,
          title: l.alPermOverlay,
          sub: l.alPermOverlaySub,
          granted: status.overlay,
          onTap: NativeBridge.instance.openOverlaySettings,
        ),
        const SizedBox(height: 10),
        Text(l.alPermReturn, style: AppText.small.copyWith(color: c.textMuted)),
      ]),
    );
  }
}

class _PermStep extends StatelessWidget {
  const _PermStep({required this.n, required this.title, required this.sub, required this.granted, required this.onTap});
  final int n;
  final String title, sub;
  final bool granted;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final c = context.colors;
    return Row(children: [
      Container(
        width: 26,
        height: 26,
        alignment: Alignment.center,
        decoration: BoxDecoration(shape: BoxShape.circle, color: (granted ? Tone.green : Tone.amber).withValues(alpha: 0.16)),
        child: granted
            ? const Icon(Icons.check_rounded, size: 16, color: Tone.green)
            : Text('$n', style: AppText.small.copyWith(fontWeight: FontWeight.w800, color: Tone.amber)),
      ),
      const SizedBox(width: 10),
      Expanded(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(title, style: AppText.rowTitle.copyWith(color: c.textPrimary)),
          Text(sub, style: AppText.rowSub.copyWith(fontSize: 12, color: c.textMuted)),
        ]),
      ),
      const SizedBox(width: 8),
      granted
          ? Text(l.alAllowed, style: AppText.rowSub.copyWith(fontWeight: FontWeight.w700, color: Tone.green))
          : FilledButton(
              onPressed: onTap,
              style: FilledButton.styleFrom(
                backgroundColor: AppPalette.accent,
                foregroundColor: Colors.white,
                shape: const StadiumBorder(),
                padding: const EdgeInsets.symmetric(horizontal: 14),
                minimumSize: const Size(0, 36),
                textStyle: AppText.rowSub.copyWith(fontWeight: FontWeight.w700),
              ),
              child: Text(l.alAllow),
            ),
    ]);
  }
}

class _ScheduleCard extends StatelessWidget {
  const _ScheduleCard({required this.onPickTime, required this.onToggleDay});
  final void Function(bool start) onPickTime;
  final void Function(int day) onToggleDay;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final c = context.colors;
    final s = AppRepo.instance.schedule;
    return PCard(
      padding: const EdgeInsets.fromLTRB(AppSpacing.card, 14, AppSpacing.card, 16),
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        CardTitle(
          icon: Icons.event_available_rounded,
          color: Tone.amber,
          title: l.blockScheduleTitle,
          trailing: PSwitch(key: const Key('scheduleSwitch'), value: s.enabled, onChanged: (v) => AppRepo.instance.updateSchedule((x) => x.enabled = v)),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.only(start: 26),
          child: Text(l.alGeneralScheduleSub, style: AppText.rowSub.copyWith(fontSize: 12, color: c.textMuted)),
        ),
        AnimatedOpacity(
          duration: const Duration(milliseconds: 200),
          opacity: s.enabled ? 1 : 0.45,
          child: IgnorePointer(
            ignoring: !s.enabled,
            child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
              const SizedBox(height: 12),
              Row(children: [
                Expanded(
                    child: TimeTile(
                        label: l.blockStart, value: fmtMinuteOfDay(context, s.startMinutes), icon: Icons.bedtime_rounded, color: Tone.violet, onTap: () => onPickTime(true))),
                const SizedBox(width: 10),
                Expanded(
                    child: TimeTile(
                        label: l.blockEnd, value: fmtMinuteOfDay(context, s.endMinutes), icon: Icons.wb_sunny_rounded, color: Tone.amber, onTap: () => onPickTime(false))),
              ]),
              const SizedBox(height: 12),
              DayChips(days: s.days, onToggle: onToggleDay),
            ]),
          ),
        ),
      ]),
    );
  }
}

class _AppRow extends StatelessWidget {
  const _AppRow({required this.entry, required this.canEnforce, required this.scheduledTab, required this.onTap});
  final _Entry entry;
  final bool canEnforce, scheduledTab;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final c = context.colors;
    final app = entry.app;
    final locked = app?.locked ?? false;
    String label;
    String? line2;
    Color labelColor = c.textMuted;
    if (app == null || !locked) {
      label = l.blkNotBlocked;
    } else {
      final state = RestrictionRepo.instance.stateFor(app);
      final st = appLockStatus(app, state);
      label = scheduledTab ? statusLabel(l, st, canEnforce: canEnforce) : l.blkBlocked;
      labelColor = AppPalette.violet;
      if (state.unlockExpiry != null) {
        line2 = l.alUnlockedUntil(fmtClock(context, state.unlockExpiry!));
      } else if (st == AppLockStatus.locked) {
        line2 = reasonText(l, app, state);
      } else {
        final next = nextLockFor(app, state);
        if (next != null) line2 = l.alNextLock(fmtNextLock(context, next));
      }
    }
    return PCard(
      key: Key('row_${entry.id}'),
      onTap: onTap,
      padding: const EdgeInsetsDirectional.fromSTEB(12, 10, 8, 10),
      child: Row(children: [
        LockAvatar(app: app, bytes: entry.bytes, size: 48, locked: locked),
        const SizedBox(width: 12),
        Expanded(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(entry.name, style: AppText.rowTitle.copyWith(color: c.textPrimary), maxLines: 1, overflow: TextOverflow.ellipsis),
            const SizedBox(height: 2),
            Text(label, key: Key('state_${entry.id}'), style: AppText.small.copyWith(fontWeight: FontWeight.w700, color: labelColor)),
            if (line2 != null) Text(line2, style: AppText.rowSub.copyWith(fontSize: 12, color: c.textMuted), maxLines: 1, overflow: TextOverflow.ellipsis),
          ]),
        ),
        const SizedBox(width: 4),
        Icon(Icons.chevron_right_rounded, color: c.textMuted, size: 24),
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
