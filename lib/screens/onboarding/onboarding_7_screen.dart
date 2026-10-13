import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../services/local_store.dart';
import '../../utils/app_theme.dart';
import '../../utils/l10n.dart';
import '../../widgets/common.dart';
import '../../widgets/glow_background.dart';

/// Lavender-grey used for body copy on this screen in dark mode (#7B749E).
const _lavender = Color(0xFF7B749E);

/// Big number colour in dark mode (#F0ECFF).
const _numberDark = Color(0xFFF0ECFF);

/// Figma: OnBoarding 7 — "Set your daily screen-time goal" (727:41400).
class Onboarding7Screen extends StatefulWidget {
  const Onboarding7Screen({super.key, required this.onNext, required this.onSkip});

  final VoidCallback onNext;
  final VoidCallback onSkip;

  @override
  State<Onboarding7Screen> createState() => _Onboarding7ScreenState();
}

class _Onboarding7ScreenState extends State<Onboarding7Screen> {
  static const _chips = [1.0, 2.0, 3.0, 4.0];

  /// Daily goal in hours (1–4; dragging the dial snaps to half hours).
  double _hours = 2;

  /// True while the handle is being dragged, so the ring follows the finger
  /// instead of easing.
  bool _dragging = false;

  static const _blobs = [
    Blob(left: -130, top: -120, size: 420, color: AppPalette.blue, opacity: 0.13, blur: 55),
    Blob(right: -100, top: 200, size: 300, color: AppPalette.blue, opacity: 0.11, blur: 45),
    Blob(left: -50, bottom: 80, size: 200, color: AppPalette.violet, opacity: 0.08, blur: 35),
  ];

  @override
  void initState() {
    super.initState();
    _save();
  }

  void _save() =>
      LocalStore.instance.saveAnswer('dailyGoalHours', _hours == _hours.roundToDouble() ? _hours.toInt() : _hours);

  void _set(double h) {
    if (h == _hours) return;
    setState(() => _hours = h);
    _save();
  }

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final dark = context.isDark;
    final bodyColor = dark ? _lavender : c.textSecondary;
    return OnboardingScaffold(
      onSkip: widget.onSkip,
      dotsIndex: 0,
      blobs: _blobs,
      starsAsset: 'assets/svg/ob7_stars.svg',
      button: PrimaryButton(label: context.l10n.continueLabel, onPressed: widget.onNext),
      footerExtra: Text(
        context.l10n.freeToStart,
        style: TextStyle(
          fontFamily: AppText.fontFamily,
          fontSize: 12,
          fontWeight: FontWeight.w400,
          height: 18 / 12,
          letterSpacing: 0.24,
          color: dark ? const Color(0x42FFFFFF) : c.textMuted,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(AppSpacing.gutter, 32, AppSpacing.gutter, 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              context.l10n.ob7Title,
              textAlign: TextAlign.center,
              style: AppText.h1.copyWith(color: c.textPrimary, height: 32.5 / 30),
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 82.25,
              child: Align(
                alignment: Alignment.topCenter,
                child: Text(
                  context.l10n.ob7Subtitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: AppText.fontFamily,
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    height: 21.13 / 13,
                    color: bodyColor,
                  ),
                ),
              ),
            ),
            Center(
              child: _GoalDial(
                hours: _hours,
                dragging: _dragging,
                onDragStart: () => setState(() => _dragging = true),
                onDragEnd: () => setState(() => _dragging = false),
                onChanged: _set,
              ),
            ),
            const SizedBox(height: 6),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (var i = 0; i < _chips.length; i++) ...[
                  if (i > 0) const SizedBox(width: 12),
                  Expanded(
                    child: _HourChip(
                      label: context.l10n.ob7Hours('${_chips[i].toInt()}'),
                      selected: _hours == _chips[i],
                      onTap: () => _set(_chips[i]),
                    ),
                  ),
                ],
              ],
            ),
            const SizedBox(height: 40),
            _InfoNote(textColor: bodyColor),
          ],
        ),
      ),
    );
  }
}

/// "2h / per day" dial: dark track, violet progress arc and a draggable handle
/// dot that orbits just outside the ring at the arc's leading end.
class _GoalDial extends StatelessWidget {
  const _GoalDial({
    required this.hours,
    required this.dragging,
    required this.onChanged,
    required this.onDragStart,
    required this.onDragEnd,
  });

  final double hours;
  final bool dragging;
  final ValueChanged<double> onChanged;
  final VoidCallback onDragStart;
  final VoidCallback onDragEnd;

  static const double size = 200;
  static const double minHours = 1;
  static const double maxHours = 4;

  /// Arc start (degrees clockwise from 12 o'clock) and sweep per hour,
  /// measured from the Figma arc for 2h (204° → 336°).
  static const double startDeg = 204;
  static const double degPerHour = 66;

  /// Distance of the handle dot from the dial centre (Figma: 116).
  static const double handleRadius = 116;

  void _update(Offset local) {
    final d = local - const Offset(size / 2, size / 2);
    if (d.distance < 20) return;
    var deg = math.atan2(d.dx, -d.dy) * 180 / math.pi; // clockwise from 12
    if (deg < 0) deg += 360;
    final sweep = (deg - startDeg) % 360;
    var h = sweep / degPerHour;
    if (h < minHours || h > maxHours) {
      // In the empty gap: stick to whichever end is nearer the current value.
      h = hours >= (minHours + maxHours) / 2 ? maxHours : minHours;
    }
    onChanged(((h * 2).round() / 2).clamp(minHours, maxHours).toDouble());
  }

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final dark = context.isDark;
    final whole = hours == hours.roundToDouble();
    final label = context.l10n.ob7Hours(whole ? '${hours.toInt()}' : hours.toStringAsFixed(1));
    final numberSize = whole ? 52.0 : 44.0;
    return Semantics(
      slider: true,
      label: context.l10n.ob7DialLabel,
      value: label,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onPanStart: (e) {
          onDragStart();
          _update(e.localPosition);
        },
        onPanUpdate: (e) => _update(e.localPosition),
        onPanEnd: (_) => onDragEnd(),
        onPanCancel: onDragEnd,
        child: SizedBox(
          width: size,
          height: size,
          child: TweenAnimationBuilder<double>(
            tween: Tween(end: hours),
            duration: Duration(milliseconds: dragging ? 90 : 520),
            curve: dragging ? Curves.linear : Curves.easeOutCubic,
            builder: (context, value, child) {
              final sweep = value * degPerHour;
              final a = (startDeg + sweep) * math.pi / 180;
              final handle = Offset(size / 2 + handleRadius * math.sin(a), size / 2 - handleRadius * math.cos(a));
              return Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  CustomPaint(
                    size: const Size.square(156),
                    painter: _RingPainter(
                      sweepDeg: sweep,
                      startDeg: startDeg,
                      track: dark ? const Color(0xFF2A2450) : AppPalette.accent.withValues(alpha: 0.12),
                    ),
                  ),
                  Positioned(left: handle.dx - 7, top: handle.dy - 7, child: const _HandleDot()),
                  child!,
                ],
              );
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 52,
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 220),
                    transitionBuilder: (child, a) => FadeTransition(
                      opacity: a,
                      child: ScaleTransition(scale: Tween(begin: 0.85, end: 1.0).animate(a), child: child),
                    ),
                    child: SizedBox(
                      key: ValueKey(label),
                      width: 104,
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          label,
                          style: TextStyle(
                            fontFamily: AppText.fontFamily,
                            fontSize: numberSize,
                            fontWeight: FontWeight.w700,
                            height: 52 / numberSize,
                            color: dark ? _numberDark : c.textPrimary,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  context.l10n.ob7PerDay,
                  style: TextStyle(
                    fontFamily: AppText.fontFamily,
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    height: 18.57 / 13,
                    color: dark ? _lavender : c.textSecondary,
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

/// 156×156 ring: full track plus a round-capped arc with a vertical
/// #7C5CFC → #C4A8FF gradient (fixed in ring space, as in Figma).
class _RingPainter extends CustomPainter {
  _RingPainter({required this.sweepDeg, required this.startDeg, required this.track});

  final double sweepDeg;
  final double startDeg;
  final Color track;

  static const double thickness = 14.62;

  @override
  void paint(Canvas canvas, Size size) {
    final r = (size.width - thickness) / 2;
    final center = size.center(Offset.zero);

    canvas.drawCircle(
      center,
      r,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = thickness
        ..color = track,
    );

    final arc = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = thickness
      ..strokeCap = StrokeCap.round
      ..shader = const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFF7C5CFC), Color(0xFFC4A8FF)],
      ).createShader(Rect.fromLTRB(0, -6.4, size.width, 149.6));
    // Canvas angles start at 3 o'clock; ours start at 12 o'clock.
    final start = (startDeg - 90) * math.pi / 180;
    canvas.drawArc(Rect.fromCircle(center: center, radius: r), start, sweepDeg * math.pi / 180, false, arc);
  }

  @override
  bool shouldRepaint(_RingPainter old) => old.sweepDeg != sweepDeg || old.startDeg != startDeg || old.track != track;
}

/// 14px violet dot that marks (and drags) the end of the goal arc.
class _HandleDot extends StatelessWidget {
  const _HandleDot();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 14,
      height: 14,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppPalette.violet, AppPalette.accent],
        ),
        boxShadow: [BoxShadow(color: AppPalette.accent.withValues(alpha: 0.4), blurRadius: 8)],
      ),
    );
  }
}

/// 66×52 hour chip. Selected: violet gradient, light border and glow.
class _HourChip extends StatelessWidget {
  const _HourChip({required this.label, required this.selected, required this.onTap});

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final dark = context.isDark;
    final idle = dark ? const [Color(0xFF1B1840), Color(0xFF1E1B3C)] : [c.glassFill, c.glassFill];
    return Semantics(
      button: true,
      selected: selected,
      label: context.l10n.ob7HoursPerDay(label),
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedScale(
          scale: selected ? 1 : 0.97,
          duration: const Duration(milliseconds: 220),
          curve: Curves.easeOut,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 260),
            curve: Curves.easeOut,
            height: 52,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: selected ? AppPalette.violet : (dark ? const Color(0xFF2E2B50) : c.glassBorder),
              ),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: selected ? const [AppPalette.accent, Color(0xFF9D7EF8)] : idle,
              ),
              boxShadow: [
                BoxShadow(
                  color: AppPalette.accent.withValues(alpha: selected ? 0.33 : 0),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 200),
              style: TextStyle(
                fontFamily: AppText.fontFamily,
                fontSize: 15,
                fontWeight: FontWeight.w700,
                height: 22.5 / 15,
                color: selected ? Colors.white : (dark ? const Color(0xFF6A6390) : c.textMuted),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: FittedBox(fit: BoxFit.scaleDown, child: Text(label, maxLines: 1)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Small violet-tinted note with the info icon.
class _InfoNote extends StatelessWidget {
  const _InfoNote({required this.textColor});

  final Color textColor;

  @override
  Widget build(BuildContext context) {
    final dark = context.isDark;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 13),
      decoration: BoxDecoration(
        color: AppPalette.accent.withValues(alpha: dark ? 0.05 : 0.07),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppPalette.accent.withValues(alpha: dark ? 0.13 : 0.18)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.only(top: 1),
            child: SizedBox(
              width: 14,
              height: 14,
              child: Center(child: SvgPicture.asset('assets/svg/ob7_info.svg', width: 13.6667, height: 13.6667)),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              context.l10n.ob7InfoNote,
              style: TextStyle(
                fontFamily: AppText.fontFamily,
                fontSize: 11,
                fontWeight: FontWeight.w400,
                height: 17.88 / 11,
                color: textColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
