import 'dart:async';
import 'dart:convert';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';

import '../../data/app_repo.dart';
import '../../data/models.dart';
import '../../services/local_store.dart';

enum TimerPhase { idle, running, paused }

/// The focus timer. One instance for the whole app, so it keeps going while the
/// user switches tabs. Time is measured from the wall clock (not by counting
/// ticks), so backgrounding the app or a slow frame never loses seconds, and
/// the state is saved so an app restart picks the session up again.
class FocusTimer extends ChangeNotifier {
  FocusTimer._();
  static final FocusTimer instance = FocusTimer._();

  static const _key = 'focus_timer';

  /// Clock (tests can replace it). Defaults to AppRepo's clock.
  DateTime Function() get now => AppRepo.instance.now;

  FocusMode mode = FocusMode.pomodoro;
  TimerPhase phase = TimerPhase.idle;

  /// True while the short break after a pomodoro runs.
  bool onBreak = false;

  /// Length of the current run (focus or break) in seconds.
  int plannedSeconds = 0;

  /// Seconds counted before the current run segment started (pauses excluded).
  int _banked = 0;
  DateTime? _segmentStart;
  DateTime? _sessionStart;

  /// Finished/stopped focus sessions, for the screen to show Session Complete.
  final _ended = StreamController<FocusSession>.broadcast();
  Stream<FocusSession> get ended => _ended.stream;

  /// Fires when a break ends by itself.
  final _breakOver = StreamController<void>.broadcast();
  Stream<void> get breakOver => _breakOver.stream;

  Timer? _tick;
  bool _loaded = false;

  bool get isIdle => phase == TimerPhase.idle;
  bool get isRunning => phase == TimerPhase.running;
  bool get isPaused => phase == TimerPhase.paused;

  /// Planned length for [m] from settings.
  int minutesFor(FocusMode m) => AppRepo.instance.minutesPlanned(m);

  int get elapsedSeconds {
    var s = _banked;
    if (isRunning && _segmentStart != null) s += now().difference(_segmentStart!).inSeconds;
    return s.clamp(0, plannedSeconds == 0 ? 1 << 30 : plannedSeconds);
  }

  /// Seconds left; when idle, the full length of the selected mode.
  int get remainingSeconds => isIdle ? minutesFor(mode) * 60 : (plannedSeconds - elapsedSeconds).clamp(0, plannedSeconds);

  /// 0..1 of the current run.
  double get progress => isIdle || plannedSeconds == 0 ? 0 : elapsedSeconds / plannedSeconds;

  /// Restore a session that was running when the app was closed.
  void ensureLoaded() {
    if (_loaded) return;
    _loaded = true;
    try {
      final raw = LocalStore.instance.getRaw(_key);
      if (raw == null) return;
      final j = jsonDecode(raw) as Map<String, dynamic>;
      mode = FocusMode.values.firstWhere((m) => m.name == j['mode'], orElse: () => FocusMode.pomodoro);
      phase = TimerPhase.values.firstWhere((p) => p.name == j['phase'], orElse: () => TimerPhase.idle);
      onBreak = j['break'] as bool? ?? false;
      plannedSeconds = j['planned'] as int? ?? 0;
      _banked = j['banked'] as int? ?? 0;
      _segmentStart = DateTime.tryParse(j['seg'] as String? ?? '');
      _sessionStart = DateTime.tryParse(j['start'] as String? ?? '');
      if (!isIdle) _startTicker();
      _check();
    } catch (e) {
      debugPrint('FocusTimer: bad saved state: $e');
    }
  }

  void _persist() {
    try {
      LocalStore.instance.setRaw(
        _key,
        jsonEncode({
          'mode': mode.name,
          'phase': phase.name,
          'break': onBreak,
          'planned': plannedSeconds,
          'banked': _banked,
          'seg': _segmentStart?.toIso8601String(),
          'start': _sessionStart?.toIso8601String(),
        }),
      );
    } catch (_) {}
  }

  void _changed() {
    _persist();
    _syncSound();
    notifyListeners();
  }

  /// Pick a mode (only while idle). Returns false if a session is running.
  bool selectMode(FocusMode m) {
    if (!isIdle) return false;
    mode = m;
    _changed();
    return true;
  }

  /// Start a fresh focus session in [m] (or the current mode). Skips a running break.
  void start([FocusMode? m]) {
    if (m != null) mode = m;
    onBreak = false;
    _begin(minutesFor(mode) * 60);
    _sessionStart = now();
  }

  void _begin(int seconds) {
    plannedSeconds = seconds;
    _banked = 0;
    _segmentStart = now();
    phase = TimerPhase.running;
    _startTicker();
    _changed();
  }

  void pause() {
    if (!isRunning) return;
    _banked = elapsedSeconds;
    _segmentStart = null;
    phase = TimerPhase.paused;
    _changed();
  }

  void resume() {
    if (!isPaused) return;
    _segmentStart = now();
    phase = TimerPhase.running;
    _startTicker();
    _changed();
  }

  /// Restart the current run from zero without saving anything.
  void reset() {
    if (isIdle) return;
    _banked = 0;
    _segmentStart = isRunning ? now() : null;
    if (!onBreak) _sessionStart = now();
    _changed();
  }

  /// End early. Returns the saved session, or null when nothing was saved
  /// (a break, or under a minute of focus).
  Future<FocusSession?> stop() async {
    if (isIdle) return null;
    final secs = elapsedSeconds;
    final wasBreak = onBreak;
    _toIdle();
    if (wasBreak || secs < 60) return null;
    return _record(secs, completed: false);
  }

  void _toIdle() {
    phase = TimerPhase.idle;
    onBreak = false;
    _banked = 0;
    _segmentStart = null;
    plannedSeconds = 0;
    _tick?.cancel();
    _tick = null;
    _changed();
  }

  Future<FocusSession> _record(int secs, {required bool completed}) async {
    final s = FocusSession(
      start: _sessionStart ?? now().subtract(Duration(seconds: secs)),
      plannedMinutes: (plannedSeconds == 0 ? minutesFor(mode) * 60 : plannedSeconds) ~/ 60,
      focusedSeconds: secs,
      mode: mode,
      completed: completed,
    );
    await AppRepo.instance.addSession(s);
    _ended.add(s);
    return s;
  }

  void _startTicker() {
    _tick?.cancel();
    _tick = Timer.periodic(const Duration(seconds: 1), (_) => _check());
  }

  /// Called every second and when the app comes back to the foreground.
  void _check() {
    if (isRunning && elapsedSeconds >= plannedSeconds) {
      _finish();
    } else if (!isIdle) {
      notifyListeners();
    }
  }

  Future<void> _finish() async {
    if (onBreak) {
      _toIdle();
      _breakOver.add(null);
      return;
    }
    final secs = plannedSeconds;
    final planned = plannedSeconds;
    final wasPomodoro = mode == FocusMode.pomodoro;
    // record with the planned length before the break replaces it
    final s = FocusSession(
      start: _sessionStart ?? now().subtract(Duration(seconds: secs)),
      plannedMinutes: planned ~/ 60,
      focusedSeconds: secs,
      mode: mode,
      completed: true,
    );
    if (wasPomodoro && AppRepo.instance.settings.breakMinutes > 0) {
      onBreak = true;
      _sessionStart = null;
      _begin(AppRepo.instance.settings.breakMinutes * 60);
    } else {
      _toIdle();
    }
    await AppRepo.instance.addSession(s);
    _ended.add(s);
  }

  /// Skip the break and go back to idle.
  void skipBreak() {
    if (onBreak) _toIdle();
  }

  /// Call when the app returns to the foreground.
  void onResumed() => _check();

  // ---------------------------------------------------------------------------
  // Ambient sound (plays while a focus run is going)
  // ---------------------------------------------------------------------------

  static const sounds = ['off', 'rain', 'forest', 'waves', 'white'];

  /// Turn off for tests / previews.
  static bool soundEnabled = true;
  AudioPlayer? _player;
  String? _playing;

  Future<void> _syncSound() async {
    if (!soundEnabled) return;
    final s = AppRepo.instance.settings;
    final want = isRunning && !onBreak && s.ambientSound != 'off' && s.ambientVolume > 0 ? s.ambientSound : null;
    try {
      if (want == null) {
        if (_playing != null) await _player?.pause();
        _playing = null;
        return;
      }
      final p = _player ??= AudioPlayer()..setReleaseMode(ReleaseMode.loop);
      await p.setVolume(s.ambientVolume.clamp(0.0, 1.0));
      if (_playing != want) {
        _playing = want;
        await p.play(AssetSource('focus/$want.wav'), volume: s.ambientVolume);
      }
    } catch (e) {
      debugPrint('FocusTimer: ambient sound failed: $e');
    }
  }

  /// Re-apply sound choice / volume after settings change.
  void refreshSound() => _syncSound();

  /// Short preview when the user picks a sound while idle.
  Future<void> previewSound(String id) async {
    if (!soundEnabled || id == 'off' || isRunning) return;
    try {
      final p = _player ??= AudioPlayer()..setReleaseMode(ReleaseMode.loop);
      _playing = null;
      await p.play(AssetSource('focus/$id.wav'), volume: AppRepo.instance.settings.ambientVolume);
      Future.delayed(const Duration(seconds: 3), () {
        if (!isRunning) p.pause();
      });
    } catch (_) {}
  }
}

