import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

import '../../data/app_repo.dart';
import '../../data/models.dart';
import '../../data/restrictions/restriction_models.dart';
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

/// Which managed apps the filter chips show (matches the row state labels).
enum BlockFilter { all, locked, scheduled, available }

/// Block tab — App Lock (design 19362e6d): managed apps with real per-app state,
/// permission status, and the general lock settings below.
class BlockScreen extends StatefulWidget {
  const BlockScreen({super.key, this.auth});

  /// Injectable for tests.
  final LocalAuthentication? auth;

  @override
  State<BlockScreen> createState() => _BlockScreenState();
}

class _BlockScreenState extends State<BlockScreen> {
  BlockFilter _filter = BlockFilter.all;
  String _query = '';
  bool _authBusy = false;

  AppRepo get _repo => AppRepo.instance;
  RestrictionRepo get _rr => RestrictionRepo.instance;

  void _snack(String text) {
    final m = ScaffoldMessenger.maybeOf(context);
    m?.hideCurrentSnackBar();
    m?.showSnackBar(SnackBar(content: Text(text), behavior: SnackBarBehavior.floating));
  }

  Future<void> _addApps() async {
    final result = await showSelectAppsSheet(context, initialApps: {for (final a in _repo.apps) if (a.locked) a.id});
    if (result == null || result.skipped || !mounted) return;
    await _repo.setManagedApps(result.apps);
    if (mounted) _snack(context.l10n.blockAppsUpdated);
  }

  Future<void> _addInstalled() async {
    final n = await showInstalledAppsSheet(context);
    if (n != null && n > 0 && mounted) _snack(context.l10n.blockAppsUpdated);
  }

  void _open(ManagedApp a) => Navigator.of(context).push(MaterialPageRoute(builder: (_) => AppLimitDetailsScreen(appId: a.id)));

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
    final ok = await confirmAction(context,
        title: l.blockEmergencyConfirmTitle, message: l.blockEmergencyConfirmMsg(left), confirm: l.blockEmergencyUse);
    if (!ok || !mounted) return;
    final used = await _repo.useBypass();
    if (mounted) _snack(used ? l.blockEmergencyUsed : l.blockEmergencyNone);
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: Listenable.merge([_repo, _rr]),
      builder: (context, _) {
        final l = context.l10n;
        final status = _rr.status;
        if (status.supported && !InstalledAppsCache.instance.loaded) {
          WidgetsBinding.instance.addPostFrameCallback((_) => InstalledAppsCache.instance.ensureLoaded());
        }
        final apps = _repo.apps;
        final states = {for (final a in apps) a.id: _rr.stateFor(a)};
        final st = {for (final a in apps) a.id: appLockStatus(a, states[a.id]!)};
        final restricted = st.values.where((s) => s == AppLockStatus.locked).length;
        final q = _query.trim().toLowerCase();
        final shown = [
          for (final a in apps)
            if ((q.isEmpty || a.name.toLowerCase().contains(q)) &&
                switch (_filter) {
                  BlockFilter.all => true,
                  BlockFilter.locked => st[a.id] == AppLockStatus.locked,
                  BlockFilter.scheduled => st[a.id] == AppLockStatus.scheduled,
                  BlockFilter.available => st[a.id] == AppLockStatus.available,
                })
              a,
        ];
        return PageList(
          header: ScreenHeader(
            title: l.blockTitle,
            subtitle: apps.isEmpty ? null : (status.canEnforce ? l.alSummary(restricted, apps.length) : l.alSummaryOff(apps.length)),
            trailing: _AddButton(label: l.blockAddApp, onTap: _addApps),
          ),
          children: [
            if (!status.canEnforce) _FadeIn(delay: 0, child: _PermissionBanner(status: status)),
            if (apps.isEmpty) ...[
              StateMessage(
                icon: Icons.shield_outlined,
                color: Tone.violet,
                badge: l.blockEmptyBadge,
                title: l.blockEmptyTitle,
                message: l.blockEmptyMsg,
                primaryLabel: l.blockAddApp,
                onPrimary: _addApps,
                secondaryLabel: status.supported ? l.alFromInstalled : null,
                onSecondary: status.supported ? _addInstalled : null,
              ),
            ] else ...[
              _SearchField(onChanged: (v) => setState(() => _query = v)),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                clipBehavior: Clip.none,
                child: Row(children: [
                  for (final f in BlockFilter.values) ...[
                    if (f.index > 0) const SizedBox(width: 8),
                    ChoiceChipP(
                      key: Key('filter_${f.name}'),
                      label: switch (f) {
                        BlockFilter.all => l.alFilterAll,
                        BlockFilter.locked => l.alFilterLocked,
                        BlockFilter.scheduled => l.alFilterScheduled,
                        BlockFilter.available => l.alFilterAvailable,
                      },
                      selected: _filter == f,
                      onTap: () => setState(() => _filter = f),
                    ),
                  ],
                ]),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SectionLabel(l.blockManagedApps),
                  if (shown.isEmpty)
                    PCard(
                      child: Text(l.alNoMatches, textAlign: TextAlign.center, style: AppText.rowSub.copyWith(color: context.colors.textMuted)),
                    ),
                  for (var i = 0; i < shown.length; i++) ...[
                    if (i > 0) const SizedBox(height: 10),
                    _FadeIn(
                      key: ValueKey(shown[i].id),
                      delay: 60 + i * 40,
                      child: _AppRow(
                        app: shown[i],
                        state: states[shown[i].id]!,
                        status: st[shown[i].id]!,
                        canEnforce: status.canEnforce,
                        onTap: () => _open(shown[i]),
                        onLocked: (v) => _repo.setAppLocked(shown[i].id, v),
                      ),
                    ),
                  ],
                  if (status.supported) ...[const SizedBox(height: 10), InstalledAppsLink(onTap: _addInstalled)],
                ],
              ),
            ],
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
              SectionLabel(l.alGeneral),
              _FadeIn(delay: 120, child: _ScheduleCard(onPickTime: _pickTime, onToggleDay: _toggleDay)),
              const SizedBox(height: 12),
              _FadeIn(
                delay: 160,
                child: PGroup(children: [
                  PListTile(
                    icon: Icons.face_retouching_natural_rounded,
                    title: l.blockFaceIdTitle,
                    subtitle: l.blockFaceIdSub,
                    trailing: PSwitch(key: const Key('faceIdSwitch'), value: _repo.faceIdProtection, onChanged: _authBusy ? null : _toggleFaceId),
                  ),
                  PListTile(
                    key: const Key('emergencyCard'),
                    icon: Icons.shield_rounded,
                    color: Tone.amber,
                    title: l.blockEmergencyTitle,
                    subtitle: _repo.settings.emergencyBypass ? l.blockEmergencySub(_repo.bypassLeftToday) : l.blockEmergencyOff,
                    onTap: _emergency,
                    trailing: Text(l.blockEmergencyUse,
                        style: AppText.rowSub.copyWith(
                            fontWeight: FontWeight.w800,
                            color: AppPalette.violet.withValues(alpha: _repo.settings.emergencyBypass && _repo.bypassLeftToday > 0 ? 1 : 0.45))),
                  ),
                  if (apps.isNotEmpty)
                    PListTile(
                      key: const Key('lockAllRow'),
                      icon: Icons.lock_rounded,
                      title: l.blockLockAll,
                      subtitle: l.alLockAllSub,
                      onTap: () async {
                        await _repo.lockAll();
                        if (mounted) _snack(l.blockAllLocked);
                      },
                    ),
                ]),
              ),
            ]),
          ],
        );
      },
    );
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
  const _AppRow({required this.app, required this.state, required this.status, required this.canEnforce, required this.onTap, required this.onLocked});
  final ManagedApp app;
  final RestrictionState state;
  final AppLockStatus status;
  final bool canEnforce;
  final VoidCallback onTap;
  final ValueChanged<bool> onLocked;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final c = context.colors;
    String? line2;
    if (state.unlockExpiry != null) {
      line2 = l.alUnlockedUntil(fmtClock(context, state.unlockExpiry!));
    } else if (status == AppLockStatus.locked) {
      line2 = reasonText(l, app, state);
    } else {
      final next = nextLockFor(app, state);
      if (next != null) line2 = l.alNextLock(fmtNextLock(context, next));
    }
    final label = statusLabel(l, status, canEnforce: canEnforce);
    return PCard(
      key: Key('row_${app.id}'),
      onTap: onTap,
      padding: const EdgeInsetsDirectional.fromSTEB(14, 12, 6, 12),
      child: Row(children: [
        AppIcon(app, size: 44),
        const SizedBox(width: 12),
        Expanded(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(crossAxisAlignment: CrossAxisAlignment.baseline, textBaseline: TextBaseline.alphabetic, children: [
              Flexible(child: Text(app.name, style: AppText.rowTitle.copyWith(color: c.textPrimary), maxLines: 1, overflow: TextOverflow.ellipsis)),
              const SizedBox(width: 8),
              Text(
                label,
                key: Key('state_${app.id}'),
                style: AppText.small.copyWith(
                  fontWeight: FontWeight.w700,
                  color: status == AppLockStatus.locked ? c.textSecondary : c.textMuted,
                ),
              ),
            ]),
            const SizedBox(height: 2),
            Text(usageLine(l, app, state), style: AppText.rowSub.copyWith(color: c.textMuted), maxLines: 1, overflow: TextOverflow.ellipsis),
            if (line2 != null)
              Text(line2, style: AppText.rowSub.copyWith(fontSize: 12, color: c.textMuted), maxLines: 1, overflow: TextOverflow.ellipsis),
          ]),
        ),
        const SizedBox(width: 4),
        PSwitch(key: Key('lock_${app.id}'), value: app.locked, onChanged: onLocked),
        Icon(Icons.chevron_right_rounded, color: c.textMuted, size: 22),
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
