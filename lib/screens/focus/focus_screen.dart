import 'dart:async';

import 'package:flutter/material.dart';

import '../../data/app_repo.dart';
import '../../data/models.dart';
import '../../utils/app_theme.dart';
import '../../utils/l10n.dart';
import '../../widgets/common.dart';
import '../../widgets/ui_kit.dart';
import '../shell/app_shell.dart';
import 'focus_timer.dart';
import 'session_complete_screen.dart';
import 'widgets/focus_widgets.dart';

/// Focus tab — the timer.
class FocusScreen extends StatefulWidget {
  const FocusScreen({super.key});

  @override
  State<FocusScreen> createState() => _FocusScreenState();
}

class _FocusScreenState extends State<FocusScreen> {
  final timer = FocusTimer.instance;
  late final StreamSubscription<FocusSession> _endedSub;
  late final StreamSubscription<void> _breakSub;
  late final AppLifecycleListener _life;

  @override
  void initState() {
    super.initState();
    timer.ensureLoaded();
    _endedSub = timer.ended.listen(_showComplete);
    _breakSub = timer.breakOver.listen((_) {
      if (mounted) _snack(context.l10n.focusBreakOver);
    });
    _life = AppLifecycleListener(onResume: timer.onResumed);
  }

  @override
  void dispose() {
    _endedSub.cancel();
    _breakSub.cancel();
    _life.dispose();
    super.dispose();
  }

  void _snack(String text) {
    if (!mounted) return;
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(text), behavior: SnackBarBehavior.floating));
  }

  Future<void> _showComplete(FocusSession s) async {
    if (!mounted) return;
    final shell = AppShell.of(context);
    final r = await Navigator.of(context).push<String>(MaterialPageRoute(builder: (_) => SessionCompleteScreen(session: s)));
    if (r == SessionCompleteScreen.startAnother) {
      timer.start(s.mode);
    } else if (r == SessionCompleteScreen.done) {
      shell?.goTab(AppTab.home);
    }
  }

  void _onMode(FocusMode m) {
    if (!timer.isIdle) {
      if (m != timer.mode) _snack(context.l10n.focusBusy);
      return;
    }
    timer.selectMode(m);
    if (m == FocusMode.custom) _customPicker();
  }

  Future<void> _confirmStop() async {
    final l = context.l10n;
    if (timer.onBreak) {
      timer.skipBreak();
      return;
    }
    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(l.focusStopTitle),
        content: Text(l.focusStopBody),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx, false), child: Text(l.focusKeepGoing)),
          TextButton(onPressed: () => Navigator.pop(ctx, true), child: Text(l.focusEndSession, style: const TextStyle(color: Tone.red))),
        ],
      ),
    );
    if (ok != true) return;
    final s = await timer.stop();
    if (s == null) _snack(l.focusTooShort);
  }

  void _mainTap() {
    if (timer.isIdle) {
      timer.start();
    } else if (timer.isRunning) {
      timer.pause();
    } else {
      timer.resume();
    }
  }

  // --- sheets ---------------------------------------------------------------

  Future<void> _customPicker() async {
    final l = context.l10n;
    var v = AppRepo.instance.settings.customMinutes.toDouble();
    final res = await showModalBottomSheet<int>(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, set) => _Sheet(
          title: l.focusCustomTitle,
          children: [
            Center(child: Text(l.focusMinutesN(v.round()), style: AppText.heroValue.copyWith(color: ctx.colors.textPrimary))),
            Slider(value: v, min: 5, max: 180, divisions: 35, activeColor: Tone.violet, onChanged: (x) => set(() => v = x)),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              alignment: WrapAlignment.center,
              children: [
                for (final p in const [15, 30, 45, 60, 120])
                  ChoiceChipP(label: l.focusMinutesN(p), selected: v.round() == p, onTap: () => set(() => v = p.toDouble())),
              ],
            ),
            const SizedBox(height: 20),
            PrimaryButton(label: l.focusSet, showArrow: false, onPressed: () => Navigator.pop(ctx, v.round())),
          ],
        ),
      ),
    );
    if (res != null) {
      await AppRepo.instance.updateSettings((s) => s.customMinutes = res);
      timer.selectMode(FocusMode.custom);
    }
  }

  Future<void> _durationsSheet() async {
    final l = context.l10n;
    await showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (ctx) => ListenableBuilder(
        listenable: AppRepo.instance,
        builder: (ctx, _) {
          final s = AppRepo.instance.settings;
          Widget row(IconData icon, String label, int value, int step, int lo, int hi, void Function(AppSettings, int) apply) => _StepperRow(
                icon: icon,
                label: label,
                value: l.focusMinutesN(value),
                onMinus: value - step >= lo ? () => AppRepo.instance.updateSettings((x) => apply(x, value - step)) : null,
                onPlus: value + step <= hi ? () => AppRepo.instance.updateSettings((x) => apply(x, value + step)) : null,
              );
          return _Sheet(
            title: l.focusDurations,
            children: [
              row(modeIcon(FocusMode.pomodoro), l.focusModePomodoro, s.pomodoroMinutes, 5, 5, 90, (x, v) => x.pomodoroMinutes = v),
              row(modeIcon(FocusMode.deep), l.focusModeDeep, s.deepMinutes, 15, 30, 240, (x, v) => x.deepMinutes = v),
              row(modeIcon(FocusMode.custom), l.focusModeCustom, s.customMinutes, 5, 5, 180, (x, v) => x.customMinutes = v),
              row(Icons.coffee_outlined, l.focusBreakLength, s.breakMinutes, 1, 1, 30, (x, v) => x.breakMinutes = v),
            ],
          );
        },
      ),
    );
  }

  Future<void> _soundSheet() async {
    final l = context.l10n;
    await showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (ctx) => ListenableBuilder(
        listenable: AppRepo.instance,
        builder: (ctx, _) {
          final s = AppRepo.instance.settings;
          return _Sheet(
            title: l.focusAmbient,
            children: [
              for (final id in FocusTimer.sounds)
                PListTile(
                  icon: soundIcon(id),
                  title: soundName(l, id),
                  color: id == 'off' ? Tone.red : Tone.blue,
                  trailing: Icon(id == s.ambientSound ? Icons.check_circle_rounded : Icons.circle_outlined,
                      color: id == s.ambientSound ? Tone.violet : ctx.colors.textMuted),
                  onTap: () async {
                    await AppRepo.instance.updateSettings((x) => x.ambientSound = id);
                    timer.refreshSound();
                    timer.previewSound(id);
                  },
                ),
              const SizedBox(height: 8),
              Row(children: [
                Icon(Icons.volume_down_rounded, color: ctx.colors.textMuted),
                Expanded(child: _VolumeSlider(value: s.ambientVolume, onDone: _setVolume, enabled: s.ambientSound != 'off')),
                Icon(Icons.volume_up_rounded, color: ctx.colors.textMuted),
              ]),
            ],
          );
        },
      ),
    );
  }

  Future<void> _setVolume(double v) async {
    await AppRepo.instance.updateSettings((x) => x.ambientVolume = v);
    timer.refreshSound();
  }

  // --- build ----------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final c = context.colors;
    return ListenableBuilder(
      listenable: Listenable.merge([AppRepo.instance, timer]),
      builder: (context, _) {
        final repo = AppRepo.instance;
        final s = repo.settings;
        final idle = timer.isIdle;
        final doneToday = repo.completedSessionsOn(repo.now());
        final locked = repo.lockedCount;
        final ringColor = timer.onBreak ? Tone.green : Tone.violet;

        final (String label, String status, Color statusColor) = idle
            ? (l.focusReadyLabel, l.focusIdleState, c.textMuted)
            : timer.onBreak
                ? (l.focusBreakLabel, timer.isPaused ? l.focusPausedState : l.focusOnBreak, Tone.green)
                : (l.focusRemaining, timer.isPaused ? l.focusPausedState : l.focusInSession, timer.isPaused ? Tone.amber : Tone.green);

        return PageList(
          header: ScreenHeader(
            title: l.navFocus,
            trailing: RoundIconButton(icon: Icons.tune_rounded, tooltip: l.focusDurations, onTap: _durationsSheet),
          ),
          children: [
            EnterAnim(
              child: ModeTabs(
                selected: timer.mode,
                locked: !idle,
                onTap: _onMode,
                subtitles: {for (final m in FocusMode.values) m: l.focusMinutesN(repo.minutesPlanned(m))},
              ),
            ),
            EnterAnim(
              delay: 80,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Ring(
                    value: idle ? 0 : timer.progress,
                    size: 240,
                    stroke: 14,
                    color: ringColor,
                    color2: timer.onBreak ? AppPalette.teal : AppPalette.violet,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 28),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(label, maxLines: 1, overflow: TextOverflow.ellipsis, style: AppText.small.copyWith(color: c.textMuted, letterSpacing: 1.6)),
                          const SizedBox(height: 4),
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              clock(timer.remainingSeconds),
                              // the timer readout is the one deliberately large number on this screen
                              style: AppText.heroValue.copyWith(fontSize: 52, height: 1.1, color: c.textPrimary, fontFeatures: const [FontFeature.tabularFigures()]),
                            ),
                          ),
                          const SizedBox(height: 6),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              if (!idle) ...[
                                Container(width: 7, height: 7, decoration: BoxDecoration(color: statusColor, shape: BoxShape.circle)),
                                const SizedBox(width: 6),
                              ],
                              Flexible(
                                child: Text(status, maxLines: 2, textAlign: TextAlign.center, overflow: TextOverflow.ellipsis, style: AppText.rowSub.copyWith(color: statusColor)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            if (idle && repo.sessions.isEmpty) Center(child: Pill(l.focusFirstHint, color: Tone.violet, icon: Icons.bolt_rounded)),
            EnterAnim(
              delay: 140,
              child: PCard(
                padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 8),
                child: IntrinsicHeight(
                  child: Row(
                    children: [
                      Expanded(child: StripStat(value: '$doneToday', label: l.focusSessionsDone)),
                      VerticalDivider(color: c.divider, width: 1),
                      Expanded(child: StripStat(value: '${(timer.progress * 100).round()}%', label: l.focusProgress)),
                      VerticalDivider(color: c.divider, width: 1),
                      Expanded(
                        child: timer.mode == FocusMode.pomodoro
                            ? StripStat(value: fmtMinutes(s.breakMinutes, h: l.unitH, m: l.unitM), label: l.focusBreakAfter)
                            : StripStat(value: fmtMinutes(repo.todayFocusMinutes, h: l.unitH, m: l.unitM), label: l.focusFocusedToday),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            EnterAnim(
              delay: 180,
              child: PCard(
                accent: locked > 0 ? null : Tone.amber,
                onTap: () => AppShell.of(context)?.goTab(AppTab.block),
                child: Row(
                  children: [
                    IconBadge(icon: locked > 0 ? Icons.shield_outlined : Icons.add_moderator_outlined, color: locked > 0 ? Tone.violet : Tone.amber),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(locked > 0 ? l.focusAppsBlocked(locked) : l.focusNoApps,
                              maxLines: 1, overflow: TextOverflow.ellipsis, style: AppText.rowTitle.copyWith(color: c.textPrimary)),
                          const SizedBox(height: 2),
                          Text(locked > 0 ? l.focusAppsBlockedSub : l.focusNoAppsSub,
                              maxLines: 2, overflow: TextOverflow.ellipsis, style: AppText.rowSub.copyWith(color: c.textMuted)),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    LinkText(locked > 0 ? l.focusEdit : l.focusAdd, onTap: () => AppShell.of(context)?.goTab(AppTab.block)),
                  ],
                ),
              ),
            ),
            EnterAnim(
              delay: 220,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ControlButton(
                    icon: timer.onBreak ? Icons.skip_next_rounded : Icons.stop_rounded,
                    tooltip: timer.onBreak ? l.focusSkipBreak : l.focusStop,
                    onTap: idle ? null : _confirmStop,
                  ),
                  const SizedBox(width: 24),
                  MainControl(
                    icon: timer.isRunning ? Icons.pause_rounded : Icons.play_arrow_rounded,
                    tooltip: idle ? l.focusStart : (timer.isRunning ? l.focusPause : l.focusResume),
                    onTap: _mainTap,
                  ),
                  const SizedBox(width: 24),
                  ControlButton(icon: Icons.replay_rounded, tooltip: l.focusRestart, onTap: idle ? null : timer.reset),
                ],
              ),
            ),
            EnterAnim(
              delay: 260,
              child: PCard(
                onTap: _soundSheet,
                padding: const EdgeInsetsDirectional.fromSTEB(AppSpacing.card, 12, 4, 12),
                child: Row(
                  children: [
                    const IconBadge(icon: Icons.music_note_rounded, color: Tone.green),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(l.focusAmbient, maxLines: 1, overflow: TextOverflow.ellipsis, style: AppText.rowTitle.copyWith(color: c.textPrimary)),
                          const SizedBox(height: 2),
                          Text(soundName(l, s.ambientSound), maxLines: 1, overflow: TextOverflow.ellipsis, style: AppText.rowSub.copyWith(color: c.textMuted)),
                        ],
                      ),
                    ),
                    Icon(s.ambientSound == 'off' || s.ambientVolume == 0 ? Icons.volume_off_rounded : Icons.volume_up_rounded, size: 20, color: c.textMuted),
                    SizedBox(width: 96, child: _VolumeSlider(value: s.ambientVolume, onDone: _setVolume, enabled: s.ambientSound != 'off')),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

/// Volume slider that updates live and saves when released.
class _VolumeSlider extends StatefulWidget {
  const _VolumeSlider({required this.value, required this.onDone, this.enabled = true});
  final double value;
  final ValueChanged<double> onDone;
  final bool enabled;

  @override
  State<_VolumeSlider> createState() => _VolumeSliderState();
}

class _VolumeSliderState extends State<_VolumeSlider> {
  double? _drag;

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        trackHeight: 5,
        thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 7),
        overlayShape: const RoundSliderOverlayShape(overlayRadius: 14),
      ),
      child: Slider(
        value: (_drag ?? widget.value).clamp(0.0, 1.0),
        activeColor: AppPalette.teal,
        inactiveColor: context.colors.dotInactive,
        semanticFormatterCallback: (v) => '${(v * 100).round()}%',
        onChanged: widget.enabled ? (v) => setState(() => _drag = v) : null,
        onChangeEnd: (v) {
          widget.onDone(v);
          setState(() => _drag = null);
        },
      ),
    );
  }
}

class _Sheet extends StatelessWidget {
  const _Sheet({required this.title, required this.children});
  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    return Container(
      decoration: BoxDecoration(
        color: context.isDark ? const Color(0xFF14122C) : Colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(AppRadius.card)),
        border: Border.all(color: c.glassBorder),
      ),
      padding: const EdgeInsets.fromLTRB(AppSpacing.gutter, 12, AppSpacing.gutter, 20),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(child: Container(width: 40, height: 4, decoration: BoxDecoration(color: c.dotInactive, borderRadius: BorderRadius.circular(2)))),
            const SizedBox(height: 16),
            Text(title, style: AppText.cardTitle.copyWith(color: c.textPrimary)),
            const SizedBox(height: 12),
            ...children,
          ],
        ),
      ),
    );
  }
}

class _StepperRow extends StatelessWidget {
  const _StepperRow({required this.icon, required this.label, required this.value, this.onMinus, this.onPlus});
  final IconData icon;
  final String label;
  final String value;
  final VoidCallback? onMinus, onPlus;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          IconBadge(icon: icon, color: Tone.violet, size: 36),
          const SizedBox(width: 12),
          Expanded(child: Text(label, maxLines: 1, overflow: TextOverflow.ellipsis, style: AppText.rowTitle.copyWith(color: c.textPrimary))),
          IconButton(onPressed: onMinus, tooltip: '−', icon: const Icon(Icons.remove_circle_outline_rounded), color: Tone.violet),
          SizedBox(width: 64, child: Text(value, textAlign: TextAlign.center, style: AppText.rowTitle.copyWith(color: c.textPrimary))),
          IconButton(onPressed: onPlus, tooltip: '+', icon: const Icon(Icons.add_circle_outline_rounded), color: Tone.violet),
        ],
      ),
    );
  }
}
