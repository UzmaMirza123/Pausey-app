import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

import '../utils/app_theme.dart';

/// Shared building blocks for every in-app screen (tabs, Goals, Settings …).
/// Use these instead of hand-made containers so all screens look the same.
///
/// Semantic colours (same in both themes, readable on both):
class Tone {
  Tone._();
  static const violet = AppPalette.accent; // focus, primary
  static const blue = AppPalette.blue;
  static const green = Color(0xFF2FCB8A); // success, goals met
  static const amber = Color(0xFFF5A524); // streak, warnings
  static const red = Color(0xFFFF6B6B); // errors, over limit
  static const pink = Color(0xFFE879C9);
}

/// Standard card: glass fill, 24 radius, soft border. [accent] tints it.
class PCard extends StatelessWidget {
  const PCard({super.key, required this.child, this.padding = const EdgeInsets.all(AppSpacing.card), this.accent, this.gradient, this.onTap});

  final Widget child;
  final EdgeInsetsGeometry padding;

  /// Optional tint colour (border + light fill).
  final Color? accent;

  /// Optional filled gradient (hero cards). Text on it should be white.
  final Gradient? gradient;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final dark = context.isDark;
    final r = BorderRadius.circular(AppRadius.card);
    final box = Ink(
      padding: padding,
      decoration: BoxDecoration(
        borderRadius: r,
        gradient: gradient,
        color: gradient != null
            ? null
            : accent != null
                ? Color.alphaBlend(accent!.withValues(alpha: dark ? 0.10 : 0.07), dark ? const Color(0xFF14122C) : Colors.white)
                : (dark ? const Color(0xFF14122C) : Colors.white),
        border: Border.all(color: gradient != null ? Colors.white.withValues(alpha: 0.12) : (accent?.withValues(alpha: 0.28) ?? c.glassBorder)),
        boxShadow: gradient != null
            ? [BoxShadow(color: AppPalette.accent.withValues(alpha: 0.35), blurRadius: 24, offset: const Offset(0, 10))]
            : (dark ? null : [BoxShadow(color: const Color(0xFF1B1838).withValues(alpha: 0.05), blurRadius: 16, offset: const Offset(0, 6))]),
      ),
      child: child,
    );
    return Material(
      type: MaterialType.transparency,
      child: onTap == null ? box : InkWell(onTap: onTap, borderRadius: r, child: box),
    );
  }
}

/// Gradient used for hero cards (Today's Focus, Productivity score, Pro).
const heroGradient = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFF8E6CFF), Color(0xFF5B34E0)],
);

/// Screen title row: big title + optional subtitle + optional trailing action.
class ScreenHeader extends StatelessWidget {
  const ScreenHeader({super.key, required this.title, this.subtitle, this.trailing, this.onBack});

  final String title;
  final String? subtitle;
  final Widget? trailing;
  final VoidCallback? onBack;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    return Padding(
      padding: const EdgeInsets.fromLTRB(AppSpacing.gutter, 12, AppSpacing.gutter, 8),
      child: Row(
        children: [
          if (onBack != null) ...[
            RoundIconButton(icon: Icons.arrow_back_rounded, onTap: onBack!, tooltip: MaterialLocalizations.of(context).backButtonTooltip),
            const SizedBox(width: 12),
          ],
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppText.screenTitle.copyWith(color: c.textPrimary), maxLines: 2, overflow: TextOverflow.ellipsis),
                if (subtitle != null) ...[
                  const SizedBox(height: 2),
                  Text(subtitle!, style: AppText.rowSub.copyWith(color: c.textMuted), maxLines: 1, overflow: TextOverflow.ellipsis),
                ],
              ],
            ),
          ),
          if (trailing != null) ...[const SizedBox(width: 12), trailing!],
        ],
      ),
    );
  }
}

/// 40×40 round glass button with an icon.
class RoundIconButton extends StatelessWidget {
  const RoundIconButton({super.key, required this.icon, required this.onTap, this.tooltip, this.badge = false});

  final IconData icon;
  final VoidCallback onTap;
  final String? tooltip;
  final bool badge;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final btn = InkResponse(
      onTap: onTap,
      radius: 24,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(shape: BoxShape.circle, color: c.glassFill, border: Border.all(color: c.glassBorder)),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Icon(icon, size: 19, color: c.textPrimary),
            if (badge)
              const PositionedDirectional(top: 9, end: 10, child: CircleAvatar(radius: 4, backgroundColor: Tone.red)),
          ],
        ),
      ),
    );
    return tooltip == null ? btn : Tooltip(message: tooltip!, child: btn);
  }
}

/// Small coloured square with an icon (used at the start of rows and cards).
class IconBadge extends StatelessWidget {
  const IconBadge({super.key, required this.icon, required this.color, this.size = 40});

  final IconData icon;
  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppRadius.icon),
        color: color.withValues(alpha: context.isDark ? 0.16 : 0.12),
      ),
      child: Icon(icon, size: size * 0.48, color: color),
    );
  }
}

/// Card title row: icon + title + optional trailing (link, badge, legend).
class CardTitle extends StatelessWidget {
  const CardTitle({super.key, required this.icon, required this.title, this.color = Tone.violet, this.trailing});

  final IconData icon;
  final String title;
  final Color color;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 18, color: color),
        const SizedBox(width: 8),
        Expanded(child: Text(title, style: AppText.cardTitle.copyWith(color: context.colors.textPrimary), maxLines: 1, overflow: TextOverflow.ellipsis)),
        ?trailing,
      ],
    );
  }
}

/// Upper-case section label above a group ("NOTIFICATIONS").
class SectionLabel extends StatelessWidget {
  const SectionLabel(this.text, {super.key, this.trailing});

  final String text;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(4, 8, 4, 8),
      child: Row(
        children: [
          Expanded(child: Text(text.toUpperCase(), style: AppText.small.copyWith(color: context.colors.textMuted, letterSpacing: 1.1))),
          ?trailing,
        ],
      ),
    );
  }
}

/// Text button in the accent colour ("See All", "Manage").
class LinkText extends StatelessWidget {
  const LinkText(this.text, {super.key, required this.onTap});

  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
          child: Text(text, style: AppText.rowSub.copyWith(fontWeight: FontWeight.w700, color: AppPalette.violet)),
        ),
      );
}

/// Pill tag ("PRO", "Done", "Sched").
class Pill extends StatelessWidget {
  const Pill(this.text, {super.key, this.color = Tone.violet, this.icon, this.filled = false});

  final String text;
  final Color color;
  final IconData? icon;
  final bool filled;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 3),
      decoration: BoxDecoration(
        color: filled ? color : color.withValues(alpha: 0.14),
        borderRadius: BorderRadius.circular(AppRadius.chip),
        border: Border.all(color: color.withValues(alpha: filled ? 0 : 0.35)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[Icon(icon, size: 11, color: filled ? Colors.white : color), const SizedBox(width: 4)],
          Text(text, style: AppText.small.copyWith(color: filled ? Colors.white : color, letterSpacing: 0.2)),
        ],
      ),
    );
  }
}

/// Selectable chip used for filters and segmented choices (Week/Month, All/Active/Done).
class ChoiceChipP extends StatelessWidget {
  const ChoiceChipP({super.key, required this.label, required this.selected, required this.onTap, this.icon});

  final String label;
  final bool selected;
  final VoidCallback onTap;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    return Semantics(
      selected: selected,
      button: true,
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            color: selected ? AppPalette.accent.withValues(alpha: context.isDark ? 0.22 : 0.12) : c.glassFill,
            borderRadius: BorderRadius.circular(AppRadius.chip),
            border: Border.all(color: selected ? AppPalette.violet : c.glassBorder, width: selected ? 1.4 : 1),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (icon != null) ...[Icon(icon, size: 14, color: selected ? AppPalette.violet : c.textMuted), const SizedBox(width: 6)],
              Text(label, style: AppText.rowSub.copyWith(fontWeight: FontWeight.w700, color: selected ? c.textPrimary : c.textSecondary)),
            ],
          ),
        ),
      ),
    );
  }
}

/// Switch in the app's style (violet when on).
class PSwitch extends StatelessWidget {
  const PSwitch({super.key, required this.value, required this.onChanged, this.color = AppPalette.accent});

  final bool value;
  final ValueChanged<bool>? onChanged;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Switch.adaptive(
      value: value,
      onChanged: onChanged,
      activeThumbColor: Colors.white,
      activeTrackColor: color,
      inactiveThumbColor: context.isDark ? const Color(0xFF6D6890) : Colors.white,
      inactiveTrackColor: context.colors.dotInactive,
      trackOutlineColor: WidgetStateProperty.all(Colors.transparent),
    );
  }
}

/// Small stat tile: icon, value, label (and optional progress bar).
class StatTile extends StatelessWidget {
  const StatTile({super.key, required this.icon, required this.value, required this.label, this.color = Tone.violet, this.progress, this.onTap});

  final IconData icon;
  final String value;
  final String label;
  final Color color;
  final double? progress;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    return PCard(
      onTap: onTap,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 20, color: color),
          const SizedBox(height: 8),
          FittedBox(fit: BoxFit.scaleDown, child: Text(value, style: AppText.tileValue.copyWith(color: c.textPrimary))),
          const SizedBox(height: 2),
          Text(label, textAlign: TextAlign.center, maxLines: 2, overflow: TextOverflow.ellipsis, style: AppText.rowSub.copyWith(fontSize: 12, color: c.textMuted)),
          if (progress != null) ...[const SizedBox(height: 10), PBar(value: progress!, color: color, height: 5)],
        ],
      ),
    );
  }
}

/// Rounded progress bar (animates to [value] 0..1).
class PBar extends StatelessWidget {
  const PBar({super.key, required this.value, this.color = Tone.violet, this.height = 8});

  final double value;
  final Color color;
  final double height;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(height),
      child: SizedBox(
        height: height,
        child: Stack(
          children: [
            Positioned.fill(child: ColoredBox(color: context.colors.dotInactive)),
            TweenAnimationBuilder<double>(
              tween: Tween(begin: 0, end: value.clamp(0, 1)),
              duration: const Duration(milliseconds: 700),
              curve: Curves.easeOutCubic,
              builder: (_, v, _) => FractionallySizedBox(
                widthFactor: v,
                alignment: AlignmentDirectional.centerStart,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(height),
                    gradient: LinearGradient(colors: [color.withValues(alpha: 0.75), color]),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Circular progress ring with a centred child. Animates when [value] changes.
class Ring extends StatelessWidget {
  const Ring({super.key, required this.value, this.size = 96, this.stroke = 10, this.color = Tone.violet, this.color2, this.track, this.child});

  final double value;
  final double size;
  final double stroke;
  final Color color;
  final Color? color2;
  final Color? track;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: value.clamp(0, 1)),
      duration: const Duration(milliseconds: 900),
      curve: Curves.easeOutCubic,
      builder: (context, v, _) => SizedBox.square(
        dimension: size,
        child: CustomPaint(
          painter: _RingPainter(v, stroke, color, color2 ?? color, track ?? context.colors.dotInactive),
          child: Center(child: child),
        ),
      ),
    );
  }
}

class _RingPainter extends CustomPainter {
  _RingPainter(this.v, this.stroke, this.c1, this.c2, this.track);
  final double v, stroke;
  final Color c1, c2, track;

  @override
  void paint(Canvas canvas, Size size) {
    final r = Rect.fromLTWH(stroke / 2, stroke / 2, size.width - stroke, size.height - stroke);
    canvas.drawArc(r, 0, math.pi * 2, false, Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = stroke
      ..color = track);
    if (v <= 0) return;
    canvas.drawArc(
      r,
      -math.pi / 2,
      math.pi * 2 * v,
      false,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = stroke
        ..strokeCap = StrokeCap.round
        ..shader = ui.Gradient.sweep(r.center, [c1, c2, c1], const [0, 0.5, 1], TileMode.clamp, -math.pi / 2, math.pi * 1.5),
    );
  }

  @override
  bool shouldRepaint(_RingPainter o) => o.v != v || o.c1 != c1 || o.track != track;
}

/// Vertical bar chart (rounded pills) with labels under each bar.
class PillBars extends StatelessWidget {
  const PillBars({super.key, required this.values, required this.labels, this.highlight, this.height = 110, this.color = Tone.violet, this.goal});

  final List<double> values;
  final List<String> labels;

  /// Index drawn bright (e.g. today).
  final int? highlight;
  final double height;
  final Color color;

  /// Optional goal line value (same unit as values).
  final double? goal;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final maxV = math.max(goal ?? 0, values.fold<double>(0, math.max));
    return SizedBox(
      height: height + 22,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          for (var i = 0; i < values.length; i++) ...[
            if (i > 0) const SizedBox(width: 8),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TweenAnimationBuilder<double>(
                    tween: Tween(begin: 0, end: maxV <= 0 ? 0 : values[i] / maxV),
                    duration: Duration(milliseconds: 500 + i * 60),
                    curve: Curves.easeOutCubic,
                    builder: (_, f, _) => Container(
                      height: math.max(10, height * f),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        gradient: i == highlight
                            ? LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [color.withValues(alpha: 0.75), color])
                            : null,
                        color: i == highlight ? null : color.withValues(alpha: context.isDark ? 0.22 : 0.18),
                      ),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(labels[i], style: AppText.small.copyWith(color: i == highlight ? color : c.textMuted)),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}

/// Smooth line chart with a soft fill (sparkline). Values any scale.
class SparkLine extends StatelessWidget {
  const SparkLine({super.key, required this.values, this.height = 70, this.color = Tone.violet, this.onDark = false});

  final List<double> values;
  final double height;
  final Color color;

  /// Draw for a coloured (hero) background: white line.
  final bool onDark;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: double.infinity,
      child: TweenAnimationBuilder<double>(
        tween: Tween(begin: 0, end: 1),
        duration: const Duration(milliseconds: 900),
        curve: Curves.easeOutCubic,
        builder: (_, t, _) => CustomPaint(painter: _SparkPainter(values, onDark ? Colors.white : color, t)),
      ),
    );
  }
}

class _SparkPainter extends CustomPainter {
  _SparkPainter(this.v, this.color, this.t);
  final List<double> v;
  final Color color;
  final double t;

  @override
  void paint(Canvas canvas, Size size) {
    if (v.length < 2) return;
    final lo = v.reduce(math.min), hi = v.reduce(math.max);
    final span = (hi - lo).abs() < 1e-6 ? 1 : hi - lo;
    Offset p(int i) => Offset(size.width * i / (v.length - 1), size.height - 6 - (size.height - 14) * ((v[i] - lo) / span) * t);
    final path = Path()..moveTo(p(0).dx, p(0).dy);
    for (var i = 1; i < v.length; i++) {
      final a = p(i - 1), b = p(i);
      final mx = (a.dx + b.dx) / 2;
      path.cubicTo(mx, a.dy, mx, b.dy, b.dx, b.dy);
    }
    final fill = Path.from(path)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();
    canvas.drawPath(fill, Paint()..shader = ui.Gradient.linear(Offset.zero, Offset(0, size.height), [color.withValues(alpha: 0.28), color.withValues(alpha: 0)]));
    canvas.drawPath(path, Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.4
      ..strokeCap = StrokeCap.round
      ..color = color);
    canvas.drawCircle(p(v.length - 1), 4, Paint()..color = color);
  }

  @override
  bool shouldRepaint(_SparkPainter o) => o.t != t || o.v != v || o.color != color;
}

/// A row inside a grouped settings-style list.
class PListTile extends StatelessWidget {
  const PListTile({super.key, required this.icon, required this.title, this.subtitle, this.color = Tone.violet, this.trailing, this.onTap, this.destructive = false});

  final IconData icon;
  final String title;
  final String? subtitle;
  final Color color;
  final Widget? trailing;
  final VoidCallback? onTap;
  final bool destructive;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            IconBadge(icon: icon, color: destructive ? Tone.red : color, size: 36),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: AppText.rowTitle.copyWith(color: destructive ? Tone.red : c.textPrimary)),
                  if (subtitle != null) Text(subtitle!, style: AppText.rowSub.copyWith(fontSize: 12, color: c.textMuted)),
                ],
              ),
            ),
            if (trailing != null) trailing! else if (onTap != null) Icon(Icons.chevron_right_rounded, color: c.textMuted, textDirection: Directionality.of(context)),
          ],
        ),
      ),
    );
  }
}

/// Card holding [PListTile]s separated by thin dividers.
class PGroup extends StatelessWidget {
  const PGroup({super.key, required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return PCard(
      padding: EdgeInsets.zero,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppRadius.card),
        child: Column(
          children: [
            for (var i = 0; i < children.length; i++) ...[
              if (i > 0) Divider(height: 1, thickness: 1, indent: 66, color: context.colors.divider),
              children[i],
            ],
          ],
        ),
      ),
    );
  }
}

/// Shimmering grey block for loading states.
class Skeleton extends StatefulWidget {
  const Skeleton({super.key, this.width, this.height = 14, this.radius = 8, this.circle = false});

  final double? width;
  final double height;
  final double radius;
  final bool circle;

  @override
  State<Skeleton> createState() => _SkeletonState();
}

class _SkeletonState extends State<Skeleton> with SingleTickerProviderStateMixin {
  late final AnimationController _c = AnimationController(vsync: this, duration: const Duration(milliseconds: 1200))..repeat(reverse: true);

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final base = context.colors.dotInactive;
    return AnimatedBuilder(
      animation: _c,
      builder: (_, _) => Container(
        width: widget.circle ? widget.height : widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          color: Color.lerp(base, base.withValues(alpha: base.a * 0.45), _c.value),
          borderRadius: widget.circle ? null : BorderRadius.circular(widget.radius),
          shape: widget.circle ? BoxShape.circle : BoxShape.rectangle,
        ),
      ),
    );
  }
}

/// Friendly full-card message for errors / empty data (Error States design).
class StateMessage extends StatelessWidget {
  const StateMessage({
    super.key,
    required this.icon,
    required this.color,
    required this.badge,
    required this.title,
    required this.message,
    this.primaryLabel,
    this.onPrimary,
    this.secondaryLabel,
    this.onSecondary,
  });

  final IconData icon;
  final Color color;
  final String badge;
  final String title;
  final String message;
  final String? primaryLabel;
  final VoidCallback? onPrimary;
  final String? secondaryLabel;
  final VoidCallback? onSecondary;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    return PCard(
      accent: color,
      padding: const EdgeInsets.fromLTRB(20, 28, 20, 24),
      child: Column(
        children: [
          Container(
            width: 84,
            height: 84,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color.withValues(alpha: 0.12),
              border: Border.all(color: color.withValues(alpha: 0.25)),
            ),
            child: Center(child: IconBadge(icon: icon, color: color, size: 56)),
          ),
          const SizedBox(height: 16),
          Pill(badge, color: color, icon: Icons.circle),
          const SizedBox(height: 12),
          Text(title, textAlign: TextAlign.center, style: AppText.cardTitle.copyWith(fontSize: 20, color: c.textPrimary)),
          const SizedBox(height: 8),
          Text(message, textAlign: TextAlign.center, style: AppText.rowSub.copyWith(color: c.textSecondary)),
          if (primaryLabel != null) ...[
            const SizedBox(height: 18),
            FilledButton(
              onPressed: onPrimary,
              style: FilledButton.styleFrom(
                backgroundColor: color,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
                shape: const StadiumBorder(),
                textStyle: AppText.button.copyWith(fontSize: 15),
              ),
              child: Text(primaryLabel!),
            ),
          ],
          if (secondaryLabel != null) ...[
            const SizedBox(height: 10),
            OutlinedButton(
              onPressed: onSecondary,
              style: OutlinedButton.styleFrom(
                foregroundColor: color,
                side: BorderSide(color: color.withValues(alpha: 0.5)),
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: const StadiumBorder(),
              ),
              child: Text(secondaryLabel!),
            ),
          ],
        ],
      ),
    );
  }
}

/// Standard scrollable page body for tab screens (gutter + bottom room for the nav bar).
class PageList extends StatelessWidget {
  const PageList({super.key, required this.children, this.header});

  final Widget? header;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(bottom: 120),
      children: [
        ?header,
        Padding(
          padding: const EdgeInsets.fromLTRB(AppSpacing.gutter, 8, AppSpacing.gutter, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              for (var i = 0; i < children.length; i++) ...[
                if (i > 0) const SizedBox(height: AppSpacing.section),
                children[i],
              ],
            ],
          ),
        ),
      ],
    );
  }
}

/// App icon for a managed app id (brand marks come from the Select Apps assets).
class AppGlyph extends StatelessWidget {
  const AppGlyph(this.appId, {super.key, this.size = 40});

  final String appId;
  final double size;

  static const _png = {
    'Instagram': 'assets/svg/sheet_instagram.png',
    'Twitter / X': 'assets/svg/sheet_x.png',
    'YouTube': 'assets/svg/sheet_youtube.png',
    'TikTok': 'assets/svg/sheet_tiktok.png',
    'Facebook': 'assets/svg/sheet_facebook.png',
    'Netflix': 'assets/svg/sheet_netflix.png',
  };

  static const _icons = {
    'Reddit': Icons.forum_rounded,
    'Snapchat': Icons.camera_alt_rounded,
    'WhatsApp': Icons.chat_rounded,
    'Gaming Apps': Icons.sports_esports_rounded,
    'Shopping': Icons.shopping_bag_rounded,
  };

  @override
  Widget build(BuildContext context) {
    final png = _png[appId];
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(shape: BoxShape.circle, color: context.isDark ? const Color(0xFF1E1A3A) : const Color(0xFFF1EEFF)),
      alignment: Alignment.center,
      child: png != null
          ? ClipOval(child: Image.asset(png, width: size * 0.78, height: size * 0.78, filterQuality: FilterQuality.medium))
          : Icon(_icons[appId] ?? Icons.apps_rounded, size: size * 0.5, color: AppPalette.violet),
    );
  }
}

/// "3h 24m" / "45m" from minutes (locale-neutral digits; units translated by caller if needed).
String fmtMinutes(int minutes, {String h = 'h', String m = 'm'}) {
  final hh = minutes ~/ 60, mm = minutes % 60;
  if (hh == 0) return '$mm$m';
  if (mm == 0) return '$hh$h';
  return '$hh$h $mm$m';
}
