import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../../data/app_repo.dart';
import '../../../data/models.dart';
import '../../../data/restrictions/restriction_repo.dart';
import '../../../utils/app_theme.dart';
import '../../../utils/l10n.dart';
import '../../../widgets/common.dart';
import '../../block/widgets/applock_ui.dart';

/// Floating "Unblock apps" badge that sits just above the bottom bar on Home
/// (the page scrolls underneath it).
///
/// - Apps blocked right now: their icons (with a lock) and "Unblock apps". Tapping
///   opens a short wait screen, then a picker for 1–15 minutes.
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
        final restricted = [
          for (final a in locked)
            if (rr.stateFor(a).locked) a,
        ];
        final List<ManagedApp> shown = running ? [for (final a in locked) if (unlocked.contains(a.packageName)) a] : restricted;
        if (shown.isEmpty) return const SizedBox.shrink();
        final label = running ? l.homeUnblockedLeft(_mmss(left)) : l.homeUnblockApps;
        return _Pill(
          apps: shown,
          locked: !running,
          label: label,
          onTap: running ? null : () => openUnblockFlow(context, [for (final a in restricted) if (a.packageName != null) a.packageName!]),
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

/// Wait screen → "Unblock all apps for…" picker → unblocks [pkgs] for the picked minutes.
Future<void> openUnblockFlow(BuildContext context, List<String> pkgs) async {
  if (pkgs.isEmpty) return;
  await Navigator.of(context).push(PageRouteBuilder<void>(
    transitionDuration: const Duration(milliseconds: 380),
    reverseTransitionDuration: const Duration(milliseconds: 280),
    pageBuilder: (_, _, _) => _WaitScreen(pkgs: pkgs),
    transitionsBuilder: (_, a, _, child) => FadeTransition(opacity: CurvedAnimation(parent: a, curve: Curves.easeOutCubic), child: child),
  ));
}

/// Calm full screen: a slowly breathing glow, "Wait for 5s … 1s" filling up, then Continue.
class _WaitScreen extends StatefulWidget {
  const _WaitScreen({required this.pkgs});
  final List<String> pkgs;

  @override
  State<_WaitScreen> createState() => _WaitScreenState();
}

class _WaitScreenState extends State<_WaitScreen> with TickerProviderStateMixin {
  static const _wait = Duration(seconds: 5);
  late final AnimationController _count = AnimationController(vsync: this, duration: _wait)..forward();
  late final AnimationController _breath = AnimationController(vsync: this, duration: const Duration(seconds: 4))..repeat(reverse: true);

  @override
  void dispose() {
    _count.dispose();
    _breath.dispose();
    super.dispose();
  }

  Future<void> _continue() async {
    final minutes = await _pickMinutes(context);
    if (minutes == null || !mounted) return;
    await RestrictionRepo.instance.unlockAllFor(widget.pkgs, Duration(minutes: minutes));
    if (mounted) Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final dark = context.isDark;
    final fg = dark ? Colors.white : const Color(0xFF1E1B4B);
    return Scaffold(
      backgroundColor: dark ? const Color(0xFF0D0B22) : const Color(0xFFF3F0FF),
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Soft purple light, breathing slowly.
          AnimatedBuilder(
            animation: _breath,
            builder: (context, _) {
              final b = Curves.easeInOut.transform(_breath.value);
              return CustomPaint(painter: _CalmPainter(breath: b, dark: dark));
            },
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.gutter),
              child: Column(
                children: [
                  const SizedBox(height: 8),
                  Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: _RoundBack(onTap: () => Navigator.of(context).maybePop(), dark: dark),
                  ),
                  const Spacer(),
                  Text(
                    l.homeWaitHint,
                    textAlign: TextAlign.center,
                    style: AppText.cardTitle.copyWith(fontSize: 20, height: 1.35, color: fg.withValues(alpha: 0.85)),
                  ),
                  const Spacer(),
                  // "Wait for Ns" fills up; then it turns into Continue.
                  AnimatedBuilder(
                    animation: _count,
                    builder: (context, _) {
                      final done = _count.isCompleted;
                      final secs = math.max(1, (_wait.inMilliseconds * (1 - _count.value) / 1000).ceil());
                      return _WaitButton(
                        progress: _count.value,
                        done: done,
                        label: done ? l.continueLabel : l.homeWaitFor(secs),
                        dark: dark,
                        onTap: done ? _continue : null,
                      );
                    },
                  ),
                  const SizedBox(height: 10),
                  TextButton(
                    onPressed: () => Navigator.of(context).maybePop(),
                    style: TextButton.styleFrom(minimumSize: const Size(64, 48)),
                    child: Text(l.homeNevermind, style: AppText.rowTitle.copyWith(color: fg.withValues(alpha: 0.6))),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CalmPainter extends CustomPainter {
  _CalmPainter({required this.breath, required this.dark});
  final double breath;
  final bool dark;

  @override
  void paint(Canvas canvas, Size size) {
    final c = Offset(size.width / 2, size.height * 0.42);
    final r = size.width * (0.55 + 0.08 * breath);
    canvas.drawCircle(
      c,
      r,
      Paint()
        ..shader = RadialGradient(colors: [
          AppPalette.violet.withValues(alpha: dark ? 0.42 : 0.30),
          AppPalette.accent.withValues(alpha: dark ? 0.16 : 0.10),
          AppPalette.accent.withValues(alpha: 0),
        ], stops: const [0, 0.55, 1]).createShader(Rect.fromCircle(center: c, radius: r)),
    );
    canvas.drawCircle(
      c,
      size.width * (0.16 + 0.03 * breath),
      Paint()..color = Colors.white.withValues(alpha: (dark ? 0.10 : 0.55) * (0.6 + 0.4 * breath))..maskFilter = const MaskFilter.blur(BlurStyle.normal, 18),
    );
  }

  @override
  bool shouldRepaint(_CalmPainter old) => old.breath != breath || old.dark != dark;
}

class _RoundBack extends StatelessWidget {
  const _RoundBack({required this.onTap, required this.dark});
  final VoidCallback onTap;
  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: dark ? Colors.white.withValues(alpha: 0.10) : Colors.white.withValues(alpha: 0.75),
      shape: const CircleBorder(),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap,
        child: SizedBox.square(
          dimension: 48,
          child: Icon(
            Directionality.of(context) == TextDirection.rtl ? Icons.arrow_forward_rounded : Icons.arrow_back_rounded,
            color: dark ? Colors.white : const Color(0xFF1E1B4B),
            semanticLabel: MaterialLocalizations.of(context).backButtonTooltip,
          ),
        ),
      ),
    );
  }
}

/// Pill that fills from the start edge while waiting, then becomes a solid Continue button.
class _WaitButton extends StatelessWidget {
  const _WaitButton({required this.progress, required this.done, required this.label, required this.dark, required this.onTap});
  final double progress;
  final bool done;
  final String label;
  final bool dark;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final track = dark ? Colors.white.withValues(alpha: 0.10) : AppPalette.accent.withValues(alpha: 0.10);
    return Semantics(
      button: true,
      enabled: done,
      label: label,
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 260),
          height: 58,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: done ? null : track,
            gradient: done ? const LinearGradient(colors: [Color(0xFF9B7BFF), AppPalette.accent]) : null,
            boxShadow: done ? [BoxShadow(color: AppPalette.accent.withValues(alpha: 0.4), blurRadius: 18, offset: const Offset(0, 6))] : null,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: Stack(
              children: [
                if (!done)
                  FractionallySizedBox(
                    alignment: AlignmentDirectional.centerStart,
                    widthFactor: progress.clamp(0.0, 1.0),
                    child: Container(color: AppPalette.accent.withValues(alpha: dark ? 0.35 : 0.22)),
                  ),
                Center(
                  child: Text(
                    label,
                    style: AppText.button.copyWith(
                      color: done ? Colors.white : (dark ? Colors.white.withValues(alpha: 0.75) : AppPalette.accent),
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

/// "Unblock all apps for…" with a 1–15 minute wheel (5 picked), Unblock and Nevermind.
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
            PrimaryButton(label: l.homeUnblock, onPressed: () => Navigator.of(context).pop(_value), showArrow: false, height: 56),
            const SizedBox(height: 4),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              style: TextButton.styleFrom(minimumSize: const Size(64, 48)),
              child: Text(l.homeNevermind, style: AppText.rowTitle.copyWith(color: c.textSecondary)),
            ),
          ],
        ),
      ),
    );
  }
}
