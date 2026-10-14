import 'package:flutter/material.dart';

import '../../data/app_repo.dart';
import '../../data/models.dart';
import '../../data/restrictions/restriction_models.dart';
import '../../data/restrictions/restriction_repo.dart';
import '../../services/native_bridge.dart';
import '../../utils/app_theme.dart';
import '../../utils/l10n.dart';
import '../../widgets/glow_background.dart';
import '../../widgets/time_picker.dart';
import '../../widgets/ui_kit.dart';
import 'widgets/applock_ui.dart';

/// Per-app limits: master switch, daily limit, lock schedules, temporary unlock.
/// Every control saves straight away (RestrictionRepo / AppRepo).
class AppLimitDetailsScreen extends StatefulWidget {
  const AppLimitDetailsScreen({super.key, required this.appId});

  /// ManagedApp.id (package name for installed apps, English name for catalogue apps).
  final String appId;

  @override
  State<AppLimitDetailsScreen> createState() => _AppLimitDetailsScreenState();
}

class _AppLimitDetailsScreenState extends State<AppLimitDetailsScreen> {
  /// Last seen app, so the page keeps its content while it closes after "Remove app".
  ManagedApp? _last;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: GlowBackground(
        child: SafeArea(
          child: ListenableBuilder(
            listenable: Listenable.merge([AppRepo.instance, RestrictionRepo.instance]),
            builder: (context, _) {
              final app = AppRepo.instance.apps.where((a) => a.id == widget.appId).firstOrNull ?? _last;
              _last = app;
              final header = ScreenHeader(title: l.alDetailsTitle, onBack: () => Navigator.of(context).maybePop());
              if (app == null) {
                return ListView(children: [
                  header,
                  Padding(
                    padding: const EdgeInsets.all(AppSpacing.gutter),
                    child: StateMessage(
                      icon: Icons.search_off_rounded,
                      color: Tone.violet,
                      badge: l.blockEmptyBadge,
                      title: l.alNotFound,
                      message: l.blockEmptyMsg,
                      primaryLabel: l.back,
                      onPrimary: () => Navigator.of(context).maybePop(),
                    ),
                  ),
                ]);
              }
              final rr = RestrictionRepo.instance;
              final state = rr.stateFor(app);
              final pkg = app.packageName;
              final sections = <Widget>[
                _IdentityCard(app: app, state: state),
                if (pkg == null)
                  _NoteCard(icon: Icons.info_outline_rounded, text: l.alNoPackage)
                else ...[
                  _LimitCard(pkg: pkg, config: rr.configFor(pkg), used: rr.usedMinutes(pkg)),
                  _SchedulesCard(app: app, pkg: pkg, config: rr.configFor(pkg), state: state),
                ],
                _ActionsCard(app: app, state: state),
              ];
              return ListView(
                padding: const EdgeInsets.only(bottom: 40),
                children: [
                  header,
                  Padding(
                    padding: const EdgeInsets.fromLTRB(AppSpacing.gutter, 8, AppSpacing.gutter, 0),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                      for (var i = 0; i < sections.length; i++) ...[if (i > 0) const SizedBox(height: AppSpacing.section), sections[i]],
                    ]),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// A. Identity + master switch
// ---------------------------------------------------------------------------

class _IdentityCard extends StatelessWidget {
  const _IdentityCard({required this.app, required this.state});
  final ManagedApp app;
  final RestrictionState state;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final c = context.colors;
    final repo = AppRepo.instance;
    final rr = RestrictionRepo.instance;
    final canEnforce = rr.status.canEnforce;
    final st = appLockStatus(app, state);
    final hasRules = app.packageName != null && rr.hasOwnRules(app.packageName!);
    final masterSub = !app.locked
        ? l.alMasterOff
        : hasRules
            ? l.alMasterOnRules
            : app.scheduled
                ? l.alMasterOnGeneral
                : l.alMasterOnAllDay;
    String statusText;
    if (state.unlockExpiry != null) {
      statusText = l.alUnlockedUntil(fmtClock(context, state.unlockExpiry!));
    } else if (st == AppLockStatus.locked) {
      statusText = '${statusLabel(l, st, canEnforce: canEnforce)} · ${reasonText(l, app, state)}';
    } else {
      final next = nextLockFor(app, state);
      statusText = next != null ? '${l.alStateAvailable} · ${l.alNextLock(fmtNextLock(context, next))}' : l.alStateAvailable;
    }
    final g = repo.schedule;
    return PCard(
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Row(children: [
          AppIcon(app, size: 56),
          const SizedBox(width: 14),
          Expanded(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(app.name, style: AppText.cardTitle.copyWith(fontSize: 20, color: c.textPrimary), maxLines: 2, overflow: TextOverflow.ellipsis),
              const SizedBox(height: 2),
              Text(app.packageName ?? blockCategoryLabel(l, app.category),
                  style: AppText.small.copyWith(color: c.textMuted), maxLines: 1, overflow: TextOverflow.ellipsis),
            ]),
          ),
        ]),
        const SizedBox(height: 14),
        Container(
          key: const Key('detailStatus'),
          padding: const EdgeInsetsDirectional.fromSTEB(12, 10, 12, 10),
          decoration: BoxDecoration(color: c.glassFill, borderRadius: BorderRadius.circular(AppRadius.tile), border: Border.all(color: c.glassBorder)),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(children: [
              Icon(st == AppLockStatus.locked ? Icons.lock_rounded : Icons.lock_open_rounded, size: 16, color: st == AppLockStatus.locked ? AppPalette.violet : c.textMuted),
              const SizedBox(width: 8),
              Expanded(child: Text(statusText, style: AppText.rowSub.copyWith(fontWeight: FontWeight.w700, color: c.textSecondary))),
            ]),
            if (!canEnforce) ...[
              const SizedBox(height: 4),
              Text(l.alBlockingOff, style: AppText.small.copyWith(color: c.textMuted)),
            ],
            if (state.locked) ...[
              const SizedBox(height: 4),
              Text(l.alChangesApply, style: AppText.small.copyWith(color: c.textMuted)),
            ],
          ]),
        ),
        const SizedBox(height: 6),
        _SwitchRow(
          title: l.alRestrictApp,
          sub: masterSub,
          child: PSwitch(
            key: const Key('masterSwitch'),
            value: app.locked,
            onChanged: (v) async {
              await repo.setAppLocked(app.id, v);
              if (context.mounted) showSavedSnack(context);
            },
          ),
        ),
        _SwitchRow(
          title: l.alFollowGeneral,
          sub: g.enabled ? l.alFollowGeneralSub(fmtMinuteOfDay(context, g.startMinutes), fmtMinuteOfDay(context, g.endMinutes)) : l.alGeneralOff,
          child: PSwitch(
            key: const Key('followGeneralSwitch'),
            value: app.scheduled,
            color: Tone.amber,
            onChanged: (v) async {
              await repo.setAppScheduled(app.id, v);
              if (context.mounted) showSavedSnack(context);
            },
          ),
        ),
      ]),
    );
  }
}

class _SwitchRow extends StatelessWidget {
  const _SwitchRow({required this.title, required this.sub, required this.child});
  final String title, sub;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(children: [
        Expanded(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(title, style: AppText.rowTitle.copyWith(color: c.textPrimary)),
            const SizedBox(height: 1),
            Text(sub, style: AppText.rowSub.copyWith(fontSize: 12, color: c.textMuted)),
          ]),
        ),
        const SizedBox(width: 8),
        child,
      ]),
    );
  }
}

class _NoteCard extends StatelessWidget {
  const _NoteCard({required this.icon, required this.text});
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    return PCard(
      key: const Key('noPackageNote'),
      accent: Tone.blue,
      padding: const EdgeInsets.all(16),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Icon(icon, size: 18, color: Tone.blue),
        const SizedBox(width: 10),
        Expanded(child: Text(text, style: AppText.rowSub.copyWith(color: c.textSecondary))),
      ]),
    );
  }
}

// ---------------------------------------------------------------------------
// B. Daily limit
// ---------------------------------------------------------------------------

const _presets = [15, 30, 45, 60, 120];

class _LimitCard extends StatelessWidget {
  const _LimitCard({required this.pkg, required this.config, required this.used});
  final String pkg;
  final AppRestrictionConfig config;
  final int? used;

  Future<void> _set(BuildContext context, void Function(AppRestrictionConfig c) change) async {
    await RestrictionRepo.instance.updateConfig(pkg, change);
    if (context.mounted) showSavedSnack(context);
  }

  Future<void> _custom(BuildContext context) async {
    final m = await showDurationSheet(context, initialMinutes: config.dailyLimitMinutes);
    if (m != null && context.mounted) {
      await _set(context, (c) => c.dailyLimitMinutes = m);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final c = context.colors;
    final on = config.dailyLimitEnabled;
    final limit = config.dailyLimitMinutes;
    final isPreset = _presets.contains(limit);
    return PCard(
      key: const Key('limitCard'),
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        CardTitle(
          icon: Icons.hourglass_bottom_rounded,
          color: Tone.blue,
          title: l.alDailyLimit,
          trailing: PSwitch(key: const Key('limitSwitch'), value: on, onChanged: (v) => _set(context, (c) => c.dailyLimitEnabled = v)),
        ),
        if (!on)
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 26, top: 2),
            child: Text(l.alDailyLimitOffSub, style: AppText.rowSub.copyWith(fontSize: 12, color: c.textMuted)),
          )
        else ...[
          const SizedBox(height: 14),
          Wrap(spacing: 8, runSpacing: 8, children: [
            for (final p in _presets)
              ChoiceChipP(key: Key('limit_$p'), label: fmtDur(l, p), selected: limit == p, onTap: () => _set(context, (c) => c.dailyLimitMinutes = p)),
            ChoiceChipP(
              key: const Key('limit_custom'),
              icon: Icons.tune_rounded,
              label: isPreset ? l.alCustom : '${l.alCustom} · ${fmtDur(l, limit)}',
              selected: !isPreset,
              onTap: () => _custom(context),
            ),
          ]),
          const SizedBox(height: 16),
          if (used != null) ...[
            Row(children: [
              Expanded(child: _Stat(label: l.alUsedLabel, value: fmtDur(l, used!))),
              Expanded(child: _Stat(label: l.alLeftLabel, value: fmtDur(l, (limit - used!).clamp(0, limit)), end: true)),
            ]),
            const SizedBox(height: 10),
            PBar(value: limit <= 0 ? 0 : used! / limit, color: used! >= limit ? Tone.red : Tone.blue),
            if (used! >= limit) ...[
              const SizedBox(height: 8),
              Text(l.alLimitReached, style: AppText.rowSub.copyWith(fontWeight: FontWeight.w700, color: Tone.red)),
            ],
          ] else
            const _UsageUnavailable(),
          const SizedBox(height: 10),
          Text(l.alResets, style: AppText.small.copyWith(color: c.textMuted)),
        ],
      ]),
    );
  }
}

class _Stat extends StatelessWidget {
  const _Stat({required this.label, required this.value, this.end = false});
  final String label, value;
  final bool end;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    return Column(crossAxisAlignment: end ? CrossAxisAlignment.end : CrossAxisAlignment.start, children: [
      Text(label, style: AppText.rowSub.copyWith(color: c.textMuted), maxLines: 1, overflow: TextOverflow.ellipsis),
      Text(value, style: AppText.tileValue.copyWith(color: c.textPrimary)),
    ]);
  }
}

class _UsageUnavailable extends StatelessWidget {
  const _UsageUnavailable();

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final c = context.colors;
    final supported = RestrictionRepo.instance.status.supported;
    return Container(
      key: const Key('usageUnavailable'),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: c.glassFill, borderRadius: BorderRadius.circular(AppRadius.tile), border: Border.all(color: c.glassBorder)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Row(children: [
          Icon(Icons.query_stats_rounded, size: 18, color: c.textMuted),
          const SizedBox(width: 8),
          Expanded(child: Text(l.alUsageUnavailable, style: AppText.rowTitle.copyWith(color: c.textPrimary))),
        ]),
        const SizedBox(height: 4),
        Text(supported ? l.alUsageNeedsAccess : l.alUsageAndroidOnly, style: AppText.rowSub.copyWith(fontSize: 12, color: c.textMuted)),
        if (supported) ...[
          const SizedBox(height: 10),
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: FilledButton.icon(
              onPressed: NativeBridge.instance.openUsageAccessSettings,
              icon: const Icon(Icons.open_in_new_rounded, size: 16),
              label: Text(l.alGrantUsage),
              style: FilledButton.styleFrom(
                backgroundColor: AppPalette.accent,
                foregroundColor: Colors.white,
                shape: const StadiumBorder(),
                textStyle: AppText.rowSub.copyWith(fontWeight: FontWeight.w700),
              ),
            ),
          ),
        ],
      ]),
    );
  }
}

/// Hours + minutes picker for a custom daily limit. Returns minutes (> 0).
Future<int?> showDurationSheet(BuildContext context, {required int initialMinutes}) {
  return showModalBottomSheet<int>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (_) => _DurationSheet(initial: initialMinutes),
  );
}

class _DurationSheet extends StatefulWidget {
  const _DurationSheet({required this.initial});
  final int initial;

  @override
  State<_DurationSheet> createState() => _DurationSheetState();
}

class _DurationSheetState extends State<_DurationSheet> {
  late int _h = (widget.initial ~/ 60).clamp(0, 12);
  late int _m = ((widget.initial % 60) ~/ 5) * 5;

  int get _total => _h * 60 + _m;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final c = context.colors;
    return SheetFrame(
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Text(l.alCustomLimitTitle, style: AppText.cardTitle.copyWith(fontSize: 20, color: c.textPrimary)),
        const SizedBox(height: 16),
        _Stepper(
          keyPrefix: 'hours',
          label: l.alHours,
          value: '$_h',
          onMinus: _h > 0 ? () => setState(() => _h--) : null,
          onPlus: _h < 12 ? () => setState(() => _h++) : null,
        ),
        const SizedBox(height: 10),
        _Stepper(
          keyPrefix: 'minutes',
          label: l.alMinutes,
          value: _m.toString().padLeft(2, '0'),
          onMinus: () => setState(() => _m = (_m - 5) % 60),
          onPlus: () => setState(() => _m = (_m + 5) % 60),
        ),
        const SizedBox(height: 14),
        Center(
          child: Text(_total > 0 ? fmtDur(l, _total) : l.alErrZeroLimit,
              style: AppText.rowTitle.copyWith(fontWeight: FontWeight.w800, color: _total > 0 ? c.textPrimary : Tone.red)),
        ),
        const SizedBox(height: 18),
        SheetButton(label: l.alSave, onPressed: _total > 0 ? () => Navigator.pop(context, _total) : null),
      ]),
    );
  }
}

class _Stepper extends StatelessWidget {
  const _Stepper({required this.keyPrefix, required this.label, required this.value, required this.onMinus, required this.onPlus});
  final String keyPrefix, label, value;
  final VoidCallback? onMinus, onPlus;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    Widget btn(IconData i, VoidCallback? f, String k) => Opacity(
          opacity: f == null ? 0.35 : 1,
          child: RoundIconButton(key: Key('${keyPrefix}_$k'), icon: i, onTap: f ?? () {}),
        );
    return PCard(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: Row(children: [
        Expanded(child: Text(label, style: AppText.rowTitle.copyWith(color: c.textSecondary))),
        btn(Icons.remove_rounded, onMinus, 'minus'),
        SizedBox(width: 56, child: Text(value, textAlign: TextAlign.center, style: AppText.tileValue.copyWith(color: c.textPrimary))),
        btn(Icons.add_rounded, onPlus, 'plus'),
      ]),
    );
  }
}

// ---------------------------------------------------------------------------
// C. Lock schedules
// ---------------------------------------------------------------------------

class _SchedulesCard extends StatelessWidget {
  const _SchedulesCard({required this.app, required this.pkg, required this.config, required this.state});
  final ManagedApp app;
  final String pkg;
  final AppRestrictionConfig config;
  final RestrictionState state;

  Future<void> _edit(BuildContext context, [AppLockSchedule? s]) async {
    final saved = await showScheduleEditor(context, pkg: pkg, schedule: s);
    if (saved == true && context.mounted) showSavedSnack(context);
  }

  Future<void> _delete(BuildContext context, AppLockSchedule s) async {
    final l = context.l10n;
    final ok = await confirmAction(context,
        title: l.alDeleteScheduleQ, message: l.alDeleteScheduleMsg(s.title.isEmpty ? l.alScheduleDefault : s.title), confirm: l.alDelete);
    if (!ok) return;
    await RestrictionRepo.instance.deleteSchedule(pkg, s.id);
    if (context.mounted) showSavedSnack(context);
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final c = context.colors;
    final on = config.schedulesEnabled;
    final list = [...config.schedules]..sort((a, b) => a.startMinuteOfDay.compareTo(b.startMinuteOfDay));
    return PCard(
      key: const Key('schedulesCard'),
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        CardTitle(
          icon: Icons.event_rounded,
          color: Tone.amber,
          title: l.alScheduledLocking,
          trailing: PSwitch(
            key: const Key('schedSwitch'),
            value: on,
            color: Tone.amber,
            onChanged: (v) async {
              await RestrictionRepo.instance.updateConfig(pkg, (c) => c.schedulesEnabled = v);
              if (context.mounted) showSavedSnack(context);
            },
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.only(start: 26, top: 2),
          child: Text(l.alScheduledOffSub, style: AppText.rowSub.copyWith(fontSize: 12, color: c.textMuted)),
        ),
        const SizedBox(height: 12),
        AnimatedOpacity(
          duration: const Duration(milliseconds: 200),
          opacity: on ? 1 : 0.5,
          child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            if (list.isEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: Text(l.alNoSchedules, style: AppText.rowSub.copyWith(color: c.textMuted)),
              ),
            for (var i = 0; i < list.length; i++) ...[
              if (i > 0) Divider(height: 18, color: c.divider),
              _ScheduleRow(
                s: list[i],
                active: on && state.activeScheduleIds.contains(list[i].id),
                onEdit: () => _edit(context, list[i]),
                onDelete: () => _delete(context, list[i]),
                onEnabled: (v) async {
                  await RestrictionRepo.instance.saveSchedule(pkg, list[i].copy()..enabled = v);
                  if (context.mounted) showSavedSnack(context);
                },
              ),
            ],
          ]),
        ),
        const SizedBox(height: 12),
        OutlinedButton.icon(
          key: const Key('addSchedule'),
          onPressed: () => _edit(context),
          icon: const Icon(Icons.add_rounded, size: 18),
          label: Text(l.alAddSchedule, maxLines: 1, overflow: TextOverflow.ellipsis),
          style: OutlinedButton.styleFrom(
            foregroundColor: AppPalette.violet,
            side: BorderSide(color: AppPalette.violet.withValues(alpha: 0.5)),
            shape: const StadiumBorder(),
            padding: const EdgeInsets.symmetric(vertical: 12),
            textStyle: AppText.rowSub.copyWith(fontWeight: FontWeight.w700),
          ),
        ),
        if (on && app.locked && state.nextLockStart != null) ...[
          const SizedBox(height: 10),
          Row(children: [
            Icon(Icons.schedule_rounded, size: 15, color: c.textMuted),
            const SizedBox(width: 6),
            Expanded(
              child: Text(l.alNextLock(fmtNextLock(context, state.nextLockStart!)),
                  key: const Key('nextLockLine'), style: AppText.rowSub.copyWith(color: c.textSecondary)),
            ),
          ]),
        ],
      ]),
    );
  }
}

class _ScheduleRow extends StatelessWidget {
  const _ScheduleRow({required this.s, required this.active, required this.onEdit, required this.onDelete, required this.onEnabled});
  final AppLockSchedule s;
  final bool active;
  final VoidCallback onEdit, onDelete;
  final ValueChanged<bool> onEnabled;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final c = context.colors;
    final range = '${fmtMinuteOfDay(context, s.startMinuteOfDay)} – ${fmtMinuteOfDay(context, s.endMinuteOfDay)}';
    return Column(
      key: Key('schedule_${s.id}'),
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(children: [
          Expanded(
            child: InkWell(
              onTap: onEdit,
              borderRadius: BorderRadius.circular(8),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Wrap(spacing: 8, crossAxisAlignment: WrapCrossAlignment.center, children: [
                  Text(s.title.isEmpty ? l.alScheduleDefault : s.title, style: AppText.rowTitle.copyWith(color: c.textPrimary)),
                  if (active) Text(l.alActiveNow, style: AppText.small.copyWith(fontWeight: FontWeight.w800, color: Tone.green)),
                ]),
                const SizedBox(height: 2),
                Text(s.overnight ? '$range · ${l.alEndsNextDay}' : range, style: AppText.rowSub.copyWith(color: c.textSecondary)),
                const SizedBox(height: 4),
                WeekdayLetters(days: s.repeatWeekdays),
              ]),
            ),
          ),
          const SizedBox(width: 8),
          PSwitch(key: Key('schedEnabled_${s.id}'), value: s.enabled, color: Tone.amber, onChanged: onEnabled),
        ]),
        Row(children: [
          LinkText(l.alEdit, onTap: onEdit),
          const SizedBox(width: 12),
          InkWell(
            key: Key('deleteSchedule_${s.id}'),
            onTap: onDelete,
            borderRadius: BorderRadius.circular(8),
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: Text(l.alDelete, style: AppText.rowSub.copyWith(fontWeight: FontWeight.w700, color: Tone.red)),
            ),
          ),
        ]),
      ],
    );
  }
}

/// Add (schedule == null) or edit a lock window for [pkg]. Returns true when saved.
Future<bool?> showScheduleEditor(BuildContext context, {required String pkg, AppLockSchedule? schedule}) {
  return showModalBottomSheet<bool>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (_) => _ScheduleEditor(pkg: pkg, schedule: schedule),
  );
}

class _ScheduleEditor extends StatefulWidget {
  const _ScheduleEditor({required this.pkg, this.schedule});
  final String pkg;
  final AppLockSchedule? schedule;

  @override
  State<_ScheduleEditor> createState() => _ScheduleEditorState();
}

class _ScheduleEditorState extends State<_ScheduleEditor> {
  late final _title = TextEditingController(text: widget.schedule?.title ?? '');
  late int _start = widget.schedule?.startMinuteOfDay ?? 22 * 60;
  late int _end = widget.schedule?.endMinuteOfDay ?? 7 * 60;
  late final Set<int> _days = Set.of(widget.schedule?.repeatWeekdays ?? {1, 2, 3, 4, 5});
  bool _tried = false;

  @override
  void dispose() {
    _title.dispose();
    super.dispose();
  }

  Future<void> _pick(bool start) async {
    final p = await showPTimePicker(context, initial: PTime.fromMinutes(start ? _start : _end), title: start ? context.l10n.blockStart : context.l10n.blockEnd);
    if (p == null) return;
    setState(() => start ? _start = p.totalMinutes : _end = p.totalMinutes);
  }

  void _preset(String name, int s, int e) => setState(() {
        _title.text = name;
        _start = s;
        _end = e;
      });

  Future<void> _save() async {
    final nav = Navigator.of(context);
    final s = AppLockSchedule(
      id: widget.schedule?.id ?? RestrictionRepo.newId(),
      title: _title.text.trim(),
      enabled: widget.schedule?.enabled ?? true,
      startMinuteOfDay: _start,
      endMinuteOfDay: _end,
      repeatWeekdays: Set.of(_days),
    );
    if (!s.isValid) {
      setState(() => _tried = true);
      return;
    }
    final rr = RestrictionRepo.instance;
    if (widget.schedule == null && !rr.configFor(widget.pkg).schedulesEnabled) {
      await rr.updateConfig(widget.pkg, (c) => c.schedulesEnabled = true);
    }
    final ok = await rr.saveSchedule(widget.pkg, s);
    if (!ok) {
      setState(() => _tried = true);
      return;
    }
    nav.pop(true);
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final c = context.colors;
    final same = _start == _end;
    final presets = [(l.alPresetStudy, 16 * 60, 19 * 60), (l.alPresetEvening, 19 * 60, 22 * 60), (l.alPresetSleep, 22 * 60, 7 * 60)];
    return SheetFrame(
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Text(widget.schedule == null ? l.alNewSchedule : l.alEditSchedule, style: AppText.cardTitle.copyWith(fontSize: 20, color: c.textPrimary)),
        const SizedBox(height: 16),
        _label(l.alTitleOptional),
        TextField(
          key: const Key('scheduleTitle'),
          controller: _title,
          maxLength: 30,
          style: AppText.rowTitle.copyWith(color: c.textPrimary),
          decoration: alFieldDecoration(context, hint: l.alScheduleDefault),
        ),
        const SizedBox(height: 10),
        Wrap(spacing: 8, runSpacing: 8, children: [
          for (final (name, s, e) in presets)
            ChoiceChipP(label: name, selected: _title.text.trim() == name && _start == s && _end == e, onTap: () => _preset(name, s, e)),
        ]),
        const SizedBox(height: 16),
        Row(children: [
          Expanded(
              child: TimeTile(
                  key: const Key('editorStart'),
                  label: l.blockStart,
                  value: fmtMinuteOfDay(context, _start),
                  icon: Icons.play_arrow_rounded,
                  color: Tone.violet,
                  onTap: () => _pick(true))),
          const SizedBox(width: 10),
          Expanded(
              child: TimeTile(
                  key: const Key('editorEnd'),
                  label: l.blockEnd,
                  value: fmtMinuteOfDay(context, _end),
                  icon: Icons.stop_rounded,
                  color: Tone.amber,
                  onTap: () => _pick(false))),
        ]),
        if (!same && _end < _start) ...[
          const SizedBox(height: 8),
          Row(children: [
            Icon(Icons.nights_stay_rounded, size: 15, color: c.textMuted),
            const SizedBox(width: 6),
            Expanded(child: Text(l.alEndsNextDay, style: AppText.rowSub.copyWith(color: c.textMuted))),
          ]),
        ],
        if (_tried && same) _error(l.alErrSameTime),
        const SizedBox(height: 16),
        _label(l.alRepeatOn),
        DayChips(days: _days, keyPrefix: 'sday', onToggle: (d) => setState(() => _days.contains(d) ? _days.remove(d) : _days.add(d))),
        if (_tried && _days.isEmpty) _error(l.alErrNoDays),
        const SizedBox(height: 22),
        SheetButton(key: const Key('saveSchedule'), label: l.alSave, onPressed: _save),
      ]),
    );
  }

  Widget _error(String t) => Padding(
        padding: const EdgeInsets.only(top: 8),
        child: Row(children: [
          const Icon(Icons.error_outline_rounded, size: 15, color: Tone.red),
          const SizedBox(width: 6),
          Expanded(child: Text(t, style: AppText.rowSub.copyWith(fontWeight: FontWeight.w700, color: Tone.red))),
        ]),
      );

  Widget _label(String t) => Padding(
        padding: const EdgeInsetsDirectional.only(bottom: 8, start: 2),
        child: Text(t, style: AppText.rowSub.copyWith(fontWeight: FontWeight.w700, color: context.colors.textSecondary)),
      );
}

// ---------------------------------------------------------------------------
// D. Unlock / reset / remove
// ---------------------------------------------------------------------------

class _ActionsCard extends StatelessWidget {
  const _ActionsCard({required this.app, required this.state});
  final ManagedApp app;
  final RestrictionState state;

  Future<void> _unlock(BuildContext context) async {
    final l = context.l10n;
    final mins = RestrictionRepo.unlockDuration.inMinutes;
    final ok = await confirmAction(context,
        title: l.alTempUnlockQ(app.name, mins),
        message: l.blockEmergencyConfirmMsg(AppRepo.instance.bypassLeftToday),
        confirm: l.alUnlock,
        destructive: false);
    if (!ok || !context.mounted) return;
    final done = await RestrictionRepo.instance.temporaryUnlock(app.packageName!);
    if (!context.mounted) return;
    final u = RestrictionRepo.instance.unlockFor(app.packageName!);
    showSavedSnack(context, done && u != null ? l.alUnlockedUntil(fmtClock(context, u.expiry)) : l.blockEmergencyNone);
  }

  Future<void> _reset(BuildContext context) async {
    final l = context.l10n;
    final ok = await confirmAction(context, title: l.alResetQ(app.name), message: l.alResetMsg, confirm: l.alReset);
    if (!ok) return;
    await RestrictionRepo.instance.resetApp(app.packageName!);
    if (context.mounted) showSavedSnack(context, l.alResetDone);
  }

  Future<void> _remove(BuildContext context) async {
    final l = context.l10n;
    final ok = await confirmAction(context, title: l.alRemoveQ(app.name), message: l.alRemoveMsg, confirm: l.alRemove);
    if (!ok || !context.mounted) return;
    final messenger = ScaffoldMessenger.maybeOf(context);
    Navigator.of(context).pop();
    if (app.packageName != null) await RestrictionRepo.instance.resetApp(app.packageName!);
    await AppRepo.instance.removeApp(app.id);
    messenger?.hideCurrentSnackBar();
    messenger?.showSnackBar(SnackBar(content: Text(l.blockRemoved(app.name)), behavior: SnackBarBehavior.floating));
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final c = context.colors;
    final repo = AppRepo.instance;
    final pkg = app.packageName;
    final tiles = <Widget>[];
    if (pkg != null) {
      if (state.unlockExpiry != null) {
        tiles.add(PListTile(
          key: const Key('unlockActive'),
          icon: Icons.lock_open_rounded,
          color: Tone.green,
          title: l.alUnlockedUntil(fmtClock(context, state.unlockExpiry!)),
          trailing: TextButton(
            key: const Key('endUnlock'),
            onPressed: () async {
              await RestrictionRepo.instance.endUnlock(pkg);
              if (context.mounted) showSavedSnack(context);
            },
            child: Text(l.alEndEarly, style: AppText.rowSub.copyWith(fontWeight: FontWeight.w700, color: AppPalette.violet)),
          ),
        ));
      } else {
        final left = repo.bypassLeftToday;
        final String? blocked = state.reasons.contains(RestrictionReason.focus)
            ? l.alTempUnlockFocus
            : !repo.settings.emergencyBypass
                ? l.blockEmergencyOff
                : left <= 0
                    ? l.blockEmergencyNone
                    : !state.locked
                        ? l.alTempUnlockNotLocked
                        : null;
        tiles.add(Opacity(
          opacity: blocked == null ? 1 : 0.55,
          child: PListTile(
            key: const Key('tempUnlock'),
            icon: Icons.lock_clock_rounded,
            color: Tone.amber,
            title: l.alTempUnlock(RestrictionRepo.unlockDuration.inMinutes),
            subtitle: blocked ?? l.alTempUnlockSub(left),
            onTap: blocked == null ? () => _unlock(context) : null,
          ),
        ));
      }
      tiles.add(PListTile(
        key: const Key('resetRules'),
        icon: Icons.restart_alt_rounded,
        color: Tone.blue,
        title: l.alResetRules,
        subtitle: l.alResetRulesSub,
        onTap: () => _reset(context),
      ));
    }
    tiles.add(PListTile(
      key: const Key('removeApp'),
      icon: Icons.delete_outline_rounded,
      destructive: true,
      title: l.alRemoveApp,
      subtitle: l.alRemoveAppSub,
      onTap: () => _remove(context),
      trailing: Icon(Icons.chevron_right_rounded, color: c.textMuted),
    ));
    return PGroup(children: tiles);
  }
}
