import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../utils/app_theme.dart';
import '../../../widgets/pausey_logo.dart';

// Clean, minimal onboarding pieces: one bold interactive centrepiece each,
// soft glass, subtle glow and calm motion. Every animation is skipped when the
// phone's "Remove animations" setting is on.

bool _reduced(BuildContext context) => MediaQuery.maybeDisableAnimationsOf(context) ?? false;

Duration _d(bool reduce, int ms) => reduce ? Duration.zero : Duration(milliseconds: ms);

const _brand = LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [AppPalette.accent, AppPalette.violet]);

// ─────────────────────────────────────────────────────────────────────────────
// 1. App picker: lock tray + grid
// ─────────────────────────────────────────────────────────────────────────────

/// One installed app the user can choose to pause.
@immutable
class AppPick {
  const AppPick({required this.id, required this.label, required this.icon});

  final String id;
  final String label;

  /// The app icon (any widget, e.g. an Image); it is clipped to a rounded square.
  final Widget icon;
}

/// "Which apps distract you?" — a lock tray showing the chosen apps on top and
/// a grid of app tiles below. Tapping a tile toggles it; the icon flies up into
/// the tray. The grid does not scroll by itself: put it in a scrolling page.
class AppPickGrid extends StatefulWidget {
  const AppPickGrid({super.key, required this.apps, required this.selected, required this.onToggle, required this.trayLabel});

  final List<AppPick> apps;
  final Set<String> selected;
  final ValueChanged<String> onToggle;

  /// Text in the tray, e.g. "2 apps to pause" (or a hint when nothing is chosen).
  final String trayLabel;

  @override
  State<AppPickGrid> createState() => _AppPickGridState();
}

class _Flight {
  _Flight(this.entry, this.ctl);
  final OverlayEntry entry;
  final AnimationController ctl;
}

class _AppPickGridState extends State<AppPickGrid> with TickerProviderStateMixin {
  static const _trayIcon = 34.0;

  final _trayKey = GlobalKey();
  final List<_Flight> _flights = [];

  /// Selected ids, newest first (drives the tray order).
  List<String> _order = [];
  Map<String, AppPick> _byId = {};

  @override
  void initState() {
    super.initState();
    _index();
    _order = widget.selected.toList().reversed.toList();
  }

  void _index() => _byId = {for (final a in widget.apps) a.id: a};

  @override
  void didUpdateWidget(AppPickGrid old) {
    super.didUpdateWidget(old);
    if (!identical(old.apps, widget.apps)) _index();
    final next = _order.where(widget.selected.contains).toList();
    for (final id in widget.selected) {
      if (!next.contains(id)) next.insert(0, id);
    }
    _order = next;
  }

  @override
  void dispose() {
    final fs = List.of(_flights);
    _flights.clear();
    for (final f in fs) {
      f.entry.remove();
      f.ctl.dispose();
    }
    super.dispose();
  }

  void _tap(AppPick p, Rect? from) {
    HapticFeedback.selectionClick();
    final adding = !widget.selected.contains(p.id);
    if (adding && from != null && !_reduced(context)) _fly(p, from);
    widget.onToggle(p.id);
  }

  /// Global centre of the tray's first slot (where the newest icon lands).
  Offset? _target() {
    final box = _trayKey.currentContext?.findRenderObject() as RenderBox?;
    if (box == null || !box.hasSize || !box.attached) return null;
    final rtl = Directionality.of(context) == TextDirection.rtl;
    final x = rtl ? box.size.width - _trayIcon / 2 : _trayIcon / 2;
    return box.localToGlobal(Offset(x, box.size.height / 2));
  }

  void _fly(AppPick p, Rect from) {
    final overlay = Overlay.maybeOf(context);
    final to = _target();
    final ob = overlay?.context.findRenderObject() as RenderBox?;
    if (overlay == null || to == null || ob == null || !ob.hasSize) return;
    final start = ob.globalToLocal(from.center);
    final end = ob.globalToLocal(to);
    final w0 = from.width;
    final ctl = AnimationController(vsync: this, duration: const Duration(milliseconds: 560));
    final curve = CurvedAnimation(parent: ctl, curve: Curves.easeInOutCubic);
    late final _Flight f;
    final themes = InheritedTheme.capture(from: context, to: overlay.context);
    final entry = OverlayEntry(
      builder: (_) => themes.wrap(
        IgnorePointer(
          child: AnimatedBuilder(
            animation: curve,
            builder: (context, child) {
              final t = curve.value;
              // Quadratic arc that rises above both points.
              final ctrl = Offset((start.dx + end.dx) / 2, math.min(start.dy, end.dy) - 70);
              final u = 1 - t;
              final pos = start * (u * u) + ctrl * (2 * u * t) + end * (t * t);
              final w = ui.lerpDouble(w0, _trayIcon, t)!;
              final op = ctl.value < 0.82 ? 1.0 : (1 - (ctl.value - 0.82) / 0.18).clamp(0.0, 1.0);
              return Stack(
                children: [
                  Positioned(
                    left: pos.dx - w / 2,
                    top: pos.dy - w / 2,
                    width: w,
                    height: w,
                    child: Opacity(opacity: op, child: child),
                  ),
                ],
              );
            },
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(w0 * 0.28),
                boxShadow: [BoxShadow(color: AppPalette.accent.withValues(alpha: 0.35), blurRadius: 18, spreadRadius: 1)],
              ),
              child: Material(
                type: MaterialType.transparency,
                child: FittedBox(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(13),
                    child: SizedBox.square(dimension: 48, child: p.icon),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
    f = _Flight(entry, ctl);
    _flights.add(f);
    overlay.insert(entry);
    ctl.forward().whenCompleteOrCancel(() {
      if (!_flights.remove(f)) return;
      entry.remove();
      ctl.dispose();
    });
  }

  @override
  Widget build(BuildContext context) {
    final reduce = _reduced(context);
    final ids = _order.where(_byId.containsKey).toList();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        _LockTray(
          stackKey: _trayKey,
          order: ids,
          icons: {for (final id in ids) id: _byId[id]!.icon},
          label: widget.trayLabel,
          reduce: reduce,
          iconSize: _trayIcon,
        ),
        const SizedBox(height: 22),
        LayoutBuilder(
          builder: (context, cons) {
            final cols = cons.maxWidth < 340 ? 3 : 4;
            final labelH = MediaQuery.textScalerOf(context).scale(15);
            return GridView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: widget.apps.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: cols, mainAxisExtent: 62 + 8 + labelH + 14, crossAxisSpacing: 6),
              itemBuilder: (context, i) {
                final p = widget.apps[i];
                return _AppTile(
                  key: ValueKey(p.id),
                  pick: p,
                  index: i,
                  selected: widget.selected.contains(p.id),
                  reduce: reduce,
                  onTap: (rect) => _tap(p, rect),
                );
              },
            );
          },
        ),
      ],
    );
  }
}

class _LockTray extends StatelessWidget {
  const _LockTray({required this.stackKey, required this.order, required this.icons, required this.label, required this.reduce, required this.iconSize});

  final Key stackKey;
  final List<String> order;
  final Map<String, Widget> icons;
  final String label;
  final bool reduce;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final dark = context.isDark;
    final empty = order.isEmpty;
    final card = BorderRadius.circular(AppRadius.card);
    return Semantics(
      container: true,
      liveRegion: true,
      label: label,
      excludeSemantics: true,
      child: AnimatedContainer(
        duration: _d(reduce, 420),
        curve: Curves.easeOutCubic,
        decoration: BoxDecoration(
          borderRadius: card,
          gradient: LinearGradient(
            begin: AlignmentDirectional.topStart,
            end: AlignmentDirectional.bottomEnd,
            colors: empty
                ? [c.glassFill, c.glassFill]
                : dark
                ? [AppPalette.accent.withValues(alpha: 0.20), AppPalette.blue.withValues(alpha: 0.06)]
                : [Colors.white, const Color(0xFFF1EDFF)],
          ),
          border: Border.all(color: empty ? Colors.transparent : AppPalette.accent.withValues(alpha: dark ? 0.40 : 0.22)),
          boxShadow: [
            BoxShadow(
              color: AppPalette.accent.withValues(alpha: empty ? 0 : (dark ? 0.22 : 0.14)),
              blurRadius: 28,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: CustomPaint(
          painter: _DashedBorder(
            color: empty ? c.textMuted.withValues(alpha: c.textMuted.a * (dark ? 0.75 : 0.6)) : Colors.transparent,
            radius: AppRadius.card,
          ),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16, 14, 14, 14),
            child: Row(
              children: [
                _LockBadge(on: !empty, reduce: reduce),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AnimatedSwitcher(
                        duration: _d(reduce, 240),
                        layoutBuilder: (cur, prev) => Stack(alignment: AlignmentDirectional.centerStart, children: [...prev, ?cur]),
                        child: Text(
                          label,
                          key: ValueKey(label),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: AppText.rowTitle.copyWith(color: empty ? c.textSecondary : c.textPrimary),
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        key: stackKey,
                        height: iconSize,
                        width: double.infinity,
                        child: _TrayStack(order: order, icons: icons, reduce: reduce, size: iconSize),
                      ),
                    ],
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

class _LockBadge extends StatelessWidget {
  const _LockBadge({required this.on, required this.reduce});
  final bool on;
  final bool reduce;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    return AnimatedContainer(
      duration: _d(reduce, 360),
      curve: Curves.easeOutCubic,
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: on ? _brand : null,
        color: on ? null : c.dotInactive.withValues(alpha: c.dotInactive.a * 0.8),
        boxShadow: [
          BoxShadow(
            color: AppPalette.accent.withValues(alpha: on ? 0.38 : 0),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: AnimatedSwitcher(
        duration: _d(reduce, 260),
        transitionBuilder: (child, a) => ScaleTransition(
          scale: a,
          child: FadeTransition(opacity: a, child: child),
        ),
        child: Icon(on ? Icons.lock_rounded : Icons.lock_outline_rounded, key: ValueKey(on), size: 20, color: on ? Colors.white : c.textMuted),
      ),
    );
  }
}

/// Overlapping stack of chosen icons (newest at the start), max 6 + "+N".
class _TrayStack extends StatefulWidget {
  const _TrayStack({required this.order, required this.icons, required this.reduce, required this.size});
  final List<String> order;
  final Map<String, Widget> icons;
  final bool reduce;
  final double size;

  @override
  State<_TrayStack> createState() => _TrayStackState();
}

class _TrayStackState extends State<_TrayStack> with TickerProviderStateMixin {
  static const _max = 6;
  final Map<String, AnimationController> _ctl = {};
  final Map<String, Widget> _icon = {};
  final Map<String, int> _slot = {};
  List<String> _shown = [];
  final List<String> _leaving = [];

  @override
  void initState() {
    super.initState();
    _sync(animate: false);
  }

  @override
  void didUpdateWidget(_TrayStack old) {
    super.didUpdateWidget(old);
    _sync(animate: !widget.reduce);
  }

  void _sync({required bool animate}) {
    final next = widget.order.take(_max).toList();
    for (final id in next) {
      _icon[id] = widget.icons[id]!;
    }
    for (final id in _shown) {
      if (next.contains(id)) continue;
      final ctl = _ctl[id];
      if (ctl == null) continue;
      if (!animate) {
        _drop(id);
        continue;
      }
      _leaving.add(id);
      ctl.duration = const Duration(milliseconds: 260);
      ctl.reverse().whenCompleteOrCancel(() {
        if (!mounted || !_leaving.contains(id) || ctl.value > 0) return;
        setState(() => _drop(id));
      });
    }
    for (var i = 0; i < next.length; i++) {
      final id = next[i];
      _leaving.remove(id);
      _slot[id] = i;
      var ctl = _ctl[id];
      if (ctl == null) {
        ctl = AnimationController(vsync: this, value: animate ? 0 : 1);
        _ctl[id] = ctl;
      }
      if (animate && ctl.value < 1) {
        ctl.duration = const Duration(milliseconds: 780);
        ctl.forward();
      } else if (!animate) {
        ctl.value = 1;
      }
    }
    _shown = next;
  }

  void _drop(String id) {
    _leaving.remove(id);
    _ctl.remove(id)?.dispose();
    _icon.remove(id);
    _slot.remove(id);
  }

  @override
  void dispose() {
    for (final c in _ctl.values) {
      c.dispose();
    }
    super.dispose();
  }

  Widget _chip(String id, double step) {
    final ctl = _ctl[id]!;
    final s = widget.size;
    final ring = context.isDark ? context.colors.background[1] : Colors.white;
    final entering = !_leaving.contains(id);
    return AnimatedPositionedDirectional(
      key: ValueKey(id),
      duration: _d(widget.reduce, 380),
      curve: Curves.easeOutCubic,
      start: _slot[id]! * step,
      top: 0,
      width: s,
      height: s,
      child: AnimatedBuilder(
        animation: ctl,
        builder: (context, child) {
          // Entering: wait for the flying icon, then pop in. Leaving: shrink + drop.
          final v = ctl.value;
          final t = entering ? Curves.easeOutBack.transform(((v - 0.6) / 0.4).clamp(0.0, 1.0)) : Curves.easeIn.transform(v);
          final o = entering ? ((v - 0.6) / 0.2).clamp(0.0, 1.0) : v;
          return Opacity(
            opacity: o,
            child: Transform.translate(
              offset: Offset(0, (1 - t) * (entering ? -8 : 8)),
              child: Transform.scale(scale: 0.4 + 0.6 * t, child: child),
            ),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(s * 0.32),
            color: ring,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: context.isDark ? 0.35 : 0.10),
                blurRadius: 6,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          padding: const EdgeInsets.all(2),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(s * 0.26),
            child: FittedBox(child: SizedBox.square(dimension: 48, child: _icon[id])),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final s = widget.size;
    final extra = widget.order.length - _max;
    return LayoutBuilder(
      builder: (context, cons) {
        // Overlap more when the tray is narrow so 6 icons + "+N" always fit.
        final room = cons.maxWidth - s - (extra > 0 ? 50 : 0);
        final step = (room / (_max - 1)).clamp(12.0, s * 0.74);
        if (_shown.isEmpty && _leaving.isEmpty) {
          return Row(
            children: [
              for (var i = 0; i < 3; i++)
                Padding(
                  padding: const EdgeInsetsDirectional.only(end: 8),
                  child: CustomPaint(
                    size: Size.square(s),
                    painter: _DashedBorder(
                      color: c.textMuted.withValues(alpha: c.textMuted.a * (0.6 - i * 0.15)),
                      radius: s * 0.32,
                    ),
                  ),
                ),
            ],
          );
        }
        final shownCount = _shown.length;
        return Stack(
          clipBehavior: Clip.none,
          children: [
            for (final id in _leaving) _chip(id, step),
            for (final id in _shown.reversed) _chip(id, step),
            PositionedDirectional(
              start: shownCount * step + (s - step) + 6,
              top: 0,
              height: s,
              child: AnimatedSwitcher(
                duration: _d(widget.reduce, 240),
                transitionBuilder: (child, a) => ScaleTransition(
                  scale: a,
                  child: FadeTransition(opacity: a, child: child),
                ),
                child: extra > 0
                    ? Container(
                        key: const ValueKey('more'),
                        constraints: BoxConstraints(minWidth: s),
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(s),
                          color: AppPalette.accent.withValues(alpha: context.isDark ? 0.22 : 0.10),
                        ),
                        child: Text(
                          '+$extra',
                          textDirection: TextDirection.ltr,
                          style: AppText.small.copyWith(color: AppPalette.accent, letterSpacing: 0),
                        ),
                      )
                    : const SizedBox.shrink(key: ValueKey('none')),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _AppTile extends StatefulWidget {
  const _AppTile({super.key, required this.pick, required this.index, required this.selected, required this.reduce, required this.onTap});

  final AppPick pick;
  final int index;
  final bool selected;
  final bool reduce;

  /// Called with the icon's global rect (for the flight), or null.
  final void Function(Rect? iconRect) onTap;

  @override
  State<_AppTile> createState() => _AppTileState();
}

class _AppTileState extends State<_AppTile> with SingleTickerProviderStateMixin {
  static const _stagger = 12;
  final _iconKey = GlobalKey();
  AnimationController? _enter;
  bool _down = false;

  @override
  void initState() {
    super.initState();
    if (widget.index < _stagger && !widget.reduce) {
      final delay = widget.index * 40;
      _enter = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 420 + delay),
      )..forward();
    }
  }

  @override
  void dispose() {
    _enter?.dispose();
    super.dispose();
  }

  Rect? _rect() {
    final box = _iconKey.currentContext?.findRenderObject() as RenderBox?;
    if (box == null || !box.hasSize) return null;
    return box.localToGlobal(Offset.zero) & box.size;
  }

  void _press(bool v) {
    if (_down != v) setState(() => _down = v);
  }

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final dark = context.isDark;
    final sel = widget.selected;
    final reduce = widget.reduce;
    final ring = dark ? c.background[1] : Colors.white;

    Widget tile = Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox.square(
          dimension: 62,
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              AnimatedContainer(
                duration: _d(reduce, 260),
                curve: Curves.easeOutCubic,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: sel ? AppPalette.accent.withValues(alpha: dark ? 0.20 : 0.10) : Colors.transparent,
                  border: Border.all(color: sel ? AppPalette.accent.withValues(alpha: dark ? 0.85 : 0.65) : Colors.transparent, width: 1.6),
                  boxShadow: [BoxShadow(color: AppPalette.accent.withValues(alpha: sel ? (dark ? 0.30 : 0.18) : 0), blurRadius: 14)],
                ),
              ),
              AnimatedScale(
                scale: sel ? 0.86 : 1,
                duration: _d(reduce, 320),
                curve: Curves.easeOutBack,
                child: ClipRRect(
                  key: _iconKey,
                  borderRadius: BorderRadius.circular(13),
                  child: SizedBox.square(dimension: 48, child: widget.pick.icon),
                ),
              ),
              PositionedDirectional(
                top: -4,
                end: -4,
                child: AnimatedScale(
                  scale: sel ? 1 : 0,
                  duration: _d(reduce, sel ? 420 : 200),
                  curve: sel ? Curves.elasticOut : Curves.easeIn,
                  child: Container(
                    width: 22,
                    height: 22,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: _brand,
                      border: Border.all(color: ring, width: 2),
                    ),
                    child: const Icon(Icons.lock_rounded, size: 11, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2),
          child: AnimatedDefaultTextStyle(
            duration: _d(reduce, 200),
            style: AppText.small.copyWith(fontWeight: FontWeight.w600, letterSpacing: 0.1, color: sel ? c.textPrimary : c.textSecondary),
            child: Text(widget.pick.label, maxLines: 1, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
          ),
        ),
      ],
    );

    tile = AnimatedScale(scale: _down ? 0.92 : 1, duration: _d(reduce, _down ? 110 : 380), curve: _down ? Curves.easeOut : Curves.easeOutBack, child: tile);

    final enter = _enter;
    if (enter != null) {
      final start = widget.index * 40 / (420 + widget.index * 40);
      final a = CurvedAnimation(
        parent: enter,
        curve: Interval(start, 1, curve: Curves.easeOutCubic),
      );
      tile = AnimatedBuilder(
        animation: a,
        builder: (context, child) => Opacity(
          opacity: a.value,
          child: Transform.translate(offset: Offset(0, 14 * (1 - a.value)), child: child),
        ),
        child: tile,
      );
    }

    return Semantics(
      button: true,
      selected: sel,
      label: widget.pick.label,
      excludeSemantics: true,
      onTap: () => widget.onTap(null),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTapDown: (_) => _press(true),
        onTapCancel: () => _press(false),
        onTapUp: (_) => _press(false),
        onTap: () => widget.onTap(_rect()),
        child: Align(alignment: Alignment.topCenter, child: tile),
      ),
    );
  }
}

class _DashedBorder extends CustomPainter {
  _DashedBorder({required this.color, required this.radius});
  final Color color;
  final double radius;

  @override
  void paint(Canvas canvas, Size size) {
    if (color.a == 0) return;
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.3
      ..strokeCap = StrokeCap.round;
    final path = Path()..addRRect(RRect.fromRectAndRadius((Offset.zero & size).deflate(0.65), Radius.circular(radius)));
    for (final m in path.computeMetrics()) {
      const dash = 5.0, gap = 5.0;
      // Spread the dashes evenly around the shape.
      final n = (m.length / (dash + gap)).floor().clamp(1, 1000);
      final unit = m.length / n;
      for (var i = 0; i < n; i++) {
        final s = i * unit;
        canvas.drawPath(m.extractPath(s, s + unit * dash / (dash + gap)), paint);
      }
    }
  }

  @override
  bool shouldRepaint(_DashedBorder old) => old.color != color || old.radius != radius;
}

// ─────────────────────────────────────────────────────────────────────────────
// 2. Permission ring
// ─────────────────────────────────────────────────────────────────────────────

/// Minimal permissions centrepiece: one ring segment per permission, filling
/// with a teal → accent sweep when granted; "done/total" in the centre.
class PermissionRing extends StatefulWidget {
  const PermissionRing({super.key, required this.states, required this.centerLabel, this.size = 150});

  final List<bool> states;

  /// Small word under the count, e.g. "allowed".
  final String centerLabel;
  final double size;

  @override
  State<PermissionRing> createState() => _PermissionRingState();
}

class _PermissionRingState extends State<PermissionRing> with TickerProviderStateMixin {
  List<AnimationController> _seg = [];
  late final AnimationController _breath = AnimationController(vsync: this, duration: const Duration(milliseconds: 2600));
  bool _started = false;

  bool get _allOn => widget.states.isNotEmpty && widget.states.every((s) => s);

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_started) {
      _started = true;
      _build(animate: !_reduced(context));
    }
    _loop();
  }

  void _build({required bool animate}) {
    for (final c in _seg) {
      c.dispose();
    }
    _seg = [
      for (var i = 0; i < widget.states.length; i++)
        AnimationController(
          vsync: this,
          duration: Duration(milliseconds: 700 + i * 120),
          value: animate ? 0 : (widget.states[i] ? 1 : 0),
        ),
    ];
    if (animate) {
      for (var i = 0; i < _seg.length; i++) {
        if (widget.states[i]) _seg[i].forward();
      }
    }
  }

  @override
  void didUpdateWidget(PermissionRing old) {
    super.didUpdateWidget(old);
    final reduce = _reduced(context);
    if (old.states.length != widget.states.length) {
      _build(animate: false);
    } else {
      for (var i = 0; i < _seg.length; i++) {
        final on = widget.states[i];
        if (reduce) {
          _seg[i].value = on ? 1 : 0;
        } else {
          _seg[i].duration = Duration(milliseconds: on ? 700 : 320);
          on ? _seg[i].forward() : _seg[i].reverse();
        }
      }
    }
    _loop();
  }

  void _loop() {
    final run = _allOn && !_reduced(context);
    if (run && !_breath.isAnimating) {
      _breath.repeat(reverse: true);
    } else if (!run && _breath.isAnimating) {
      _breath.stop();
      _breath.value = 0;
    }
  }

  @override
  void dispose() {
    for (final c in _seg) {
      c.dispose();
    }
    _breath.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final reduce = _reduced(context);
    final total = widget.states.length;
    final done = widget.states.where((s) => s).length;
    final all = _allOn;
    final s = widget.size;
    final inner = s - 2 * 20;
    return Semantics(
      label: '$done/$total ${widget.centerLabel}',
      excludeSemantics: true,
      child: SizedBox.square(
        dimension: s,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned.fill(
              child: RepaintBoundary(
                child: CustomPaint(
                  painter: _RingPainter(
                    seg: _seg,
                    breath: _breath,
                    all: all,
                    inactive: c.dotInactive,
                    dark: context.isDark,
                    rtl: Directionality.of(context) == TextDirection.rtl,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: inner * 0.8,
              height: inner * 0.7,
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Directionality(
                      textDirection: TextDirection.ltr,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          AnimatedSwitcher(
                            duration: _d(reduce, 320),
                            transitionBuilder: (child, a) => FadeTransition(
                              opacity: a,
                              child: SlideTransition(
                                position: Tween(begin: const Offset(0, 0.35), end: Offset.zero).animate(a),
                                child: child,
                              ),
                            ),
                            child: Text(
                              '$done',
                              key: ValueKey(done),
                              style: AppText.heroValue.copyWith(color: c.textPrimary),
                            ),
                          ),
                          Text('/$total', style: AppText.cardTitle.copyWith(color: c.textMuted)),
                        ],
                      ),
                    ),
                    const SizedBox(height: 2),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AnimatedSize(
                          duration: _d(reduce, 300),
                          curve: Curves.easeOutCubic,
                          child: all
                              ? Padding(
                                  padding: const EdgeInsetsDirectional.only(end: 4),
                                  child: Container(
                                    width: 15,
                                    height: 15,
                                    decoration: const BoxDecoration(shape: BoxShape.circle, color: AppPalette.teal),
                                    child: const Icon(Icons.check_rounded, size: 11, color: Colors.white),
                                  ),
                                )
                              : const SizedBox.shrink(),
                        ),
                        Text(widget.centerLabel, maxLines: 1, style: AppText.label.copyWith(color: all ? c.textPrimary : c.textMuted)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _RingPainter extends CustomPainter {
  _RingPainter({required this.seg, required this.breath, required this.all, required this.inactive, required this.dark, required this.rtl})
    : super(repaint: Listenable.merge([...seg, breath]));

  final List<AnimationController> seg;
  final Animation<double> breath;
  final bool all;
  final Color inactive;
  final bool dark;
  final bool rtl;

  @override
  void paint(Canvas canvas, Size size) {
    final n = seg.length;
    final center = size.center(Offset.zero);
    const stroke = 10.0;
    final r = size.width / 2 - stroke / 2 - 6;
    if (rtl) {
      canvas.translate(size.width, 0);
      canvas.scale(-1, 1);
    }

    // Soft glow behind the ring once everything is allowed.
    final b = all ? Curves.easeInOut.transform(breath.value) : 0.0;
    final fill = seg.isEmpty ? 0.0 : seg.map((c) => c.value).reduce((a, b) => a + b) / n;
    final glowA = (dark ? 0.16 : 0.10) * fill + (all ? (dark ? 0.12 : 0.08) * (0.5 + 0.5 * b) : 0);
    if (glowA > 0) {
      canvas.drawCircle(
        center,
        r + 2 + 4 * b,
        Paint()
          ..color = AppPalette.accent.withValues(alpha: glowA)
          ..maskFilter = MaskFilter.blur(BlurStyle.normal, 16 + 6 * b),
      );
    }
    if (n == 0) {
      canvas.drawCircle(
        center,
        r,
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = stroke
          ..color = inactive,
      );
      return;
    }

    final rect = Rect.fromCircle(center: center, radius: r);
    final segAngle = 2 * math.pi / n;
    final gap = n == 1 ? 0.0 : (10 + stroke) / r;
    final sweep = segAngle - gap;
    final base = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = stroke
      ..strokeCap = n == 1 ? StrokeCap.butt : StrokeCap.round
      ..color = inactive;
    final shader = SweepGradient(
      colors: const [AppPalette.teal, AppPalette.blue, AppPalette.accent, AppPalette.violet],
      stops: const [0.0, 0.42, 0.78, 1.0],
      transform: const GradientRotation(-math.pi / 2),
    ).createShader(rect);
    final on = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = stroke
      ..strokeCap = base.strokeCap
      ..shader = shader;
    final halo = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = stroke + 2
      ..strokeCap = base.strokeCap
      ..shader = shader
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 6);

    for (var i = 0; i < n; i++) {
      final start = -math.pi / 2 + i * segAngle + gap / 2;
      canvas.drawArc(rect, start, sweep, false, base);
      final t = Curves.easeInOutCubic.transform(seg[i].value);
      if (t <= 0.001) continue;
      // Fade the round-cap dot in at the very start of the sweep.
      final a = (t / 0.08).clamp(0.0, 1.0);
      halo.color = Colors.white.withValues(alpha: a * (dark ? 0.55 : 0.35));
      on.color = Colors.white.withValues(alpha: a);
      canvas.drawArc(rect, start, sweep * t, false, halo);
      canvas.drawArc(rect, start, sweep * t, false, on);
    }
  }

  @override
  bool shouldRepaint(_RingPainter old) => old.seg != seg || old.all != all || old.inactive != inactive || old.dark != dark || old.rtl != rtl;
}

// ─────────────────────────────────────────────────────────────────────────────
// 3. Auth hero
// ─────────────────────────────────────────────────────────────────────────────

/// Calm hero for the Log in / Sign up screens: the Pausey logo in a soft glass
/// circle with a breathing glow and one slow orbit ring carrying two tiny dots.
class AuthHero extends StatefulWidget {
  const AuthHero({super.key, this.size = 132});

  final double size;

  @override
  State<AuthHero> createState() => _AuthHeroState();
}

class _AuthHeroState extends State<AuthHero> with TickerProviderStateMixin {
  late final AnimationController _enter = AnimationController(vsync: this, duration: const Duration(milliseconds: 720));
  late final AnimationController _breath = AnimationController(vsync: this, duration: const Duration(milliseconds: 3400));
  late final AnimationController _orbit = AnimationController(vsync: this, duration: const Duration(seconds: 16));
  bool _started = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final reduce = _reduced(context);
    if (!_started) {
      _started = true;
      _orbit.value = 0.12;
      if (reduce) {
        _enter.value = 1;
      } else {
        _enter.forward();
      }
    }
    if (reduce) {
      _breath
        ..stop()
        ..value = 0.5;
      _orbit.stop();
    } else {
      if (!_breath.isAnimating) _breath.repeat(reverse: true);
      if (!_orbit.isAnimating) _orbit.repeat();
    }
  }

  @override
  void dispose() {
    _enter.dispose();
    _breath.dispose();
    _orbit.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final s = widget.size;
    final dark = context.isDark;
    final c = context.colors;
    final glass = s * 0.70;
    final enter = CurvedAnimation(parent: _enter, curve: Curves.easeOutCubic);
    return SizedBox.square(
      dimension: s,
      child: AnimatedBuilder(
        animation: enter,
        builder: (context, child) => Opacity(
          opacity: enter.value,
          child: Transform.scale(scale: 0.86 + 0.14 * enter.value, child: child),
        ),
        child: Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            Positioned.fill(
              child: RepaintBoundary(
                child: CustomPaint(
                  painter: _HeroPainter(breath: _breath, orbit: _orbit, dark: dark, glassR: glass / 2),
                ),
              ),
            ),
            Container(
              width: glass,
              height: glass,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: dark
                      ? [Colors.white.withValues(alpha: 0.10), Colors.white.withValues(alpha: 0.025)]
                      : [Colors.white, Colors.white.withValues(alpha: 0.72)],
                ),
                border: Border.all(color: dark ? Colors.white.withValues(alpha: 0.14) : c.glassBorder.withValues(alpha: 0.08), width: 1),
                boxShadow: [
                  BoxShadow(
                    color: (dark ? Colors.black : AppPalette.accent).withValues(alpha: dark ? 0.35 : 0.14),
                    blurRadius: 24,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              alignment: Alignment.center,
              child: AnimatedBuilder(
                animation: _breath,
                builder: (context, _) => PauseyLogo(
                  size: glass * 0.78,
                  progress: LogoProgress(pulse: Curves.easeInOut.transform(_breath.value)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _HeroPainter extends CustomPainter {
  _HeroPainter({required this.breath, required this.orbit, required this.dark, required this.glassR}) : super(repaint: Listenable.merge([breath, orbit]));

  final Animation<double> breath;
  final Animation<double> orbit;
  final bool dark;
  final double glassR;

  @override
  void paint(Canvas canvas, Size size) {
    final center = size.center(Offset.zero);
    final b = Curves.easeInOut.transform(breath.value);

    // Breathing glow behind the glass.
    final glowR = glassR * (1.25 + 0.10 * b);
    canvas.drawCircle(
      center,
      glowR,
      Paint()
        ..shader = RadialGradient(
          colors: [
            AppPalette.accent.withValues(alpha: (dark ? 0.34 : 0.20) * (0.75 + 0.25 * b)),
            AppPalette.blue.withValues(alpha: (dark ? 0.12 : 0.08) * (0.75 + 0.25 * b)),
            AppPalette.blue.withValues(alpha: 0),
          ],
          stops: const [0.0, 0.6, 1.0],
        ).createShader(Rect.fromCircle(center: center, radius: glowR)),
    );

    // One thin orbit ring.
    final r = size.width / 2 - 3;
    final rect = Rect.fromCircle(center: center, radius: r);
    canvas.drawCircle(
      center,
      r,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1
        ..shader = SweepGradient(
          colors: [
            AppPalette.blue.withValues(alpha: dark ? 0.55 : 0.48),
            AppPalette.violet.withValues(alpha: dark ? 0.18 : 0.16),
            AppPalette.violet.withValues(alpha: dark ? 0.55 : 0.48),
            AppPalette.blue.withValues(alpha: dark ? 0.18 : 0.16),
            AppPalette.blue.withValues(alpha: dark ? 0.55 : 0.48),
          ],
        ).createShader(rect),
    );

    // Two dots travelling opposite each other, each with a short fading trail.
    final a0 = orbit.value * 2 * math.pi - math.pi / 2;
    void dot(double angle, Color color, double radius) {
      const trail = 1.1;
      final trailPaint = Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2
        ..strokeCap = StrokeCap.round
        ..shader = SweepGradient(
          startAngle: 0,
          endAngle: trail,
          colors: [
            color.withValues(alpha: 0),
            color.withValues(alpha: dark ? 0.9 : 0.75),
          ],
          transform: GradientRotation(angle - trail),
        ).createShader(rect);
      canvas.drawArc(rect, angle - trail, trail, false, trailPaint);
      final p = center + Offset(math.cos(angle), math.sin(angle)) * r;
      canvas.drawCircle(
        p,
        radius * 2.6,
        Paint()
          ..color = color.withValues(alpha: dark ? 0.30 : 0.22)
          ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 4),
      );
      canvas.drawCircle(p, radius, Paint()..color = color);
    }

    dot(a0, AppPalette.blue, 3.4);
    dot(a0 + math.pi, AppPalette.violet, 2.8);
  }

  @override
  bool shouldRepaint(_HeroPainter old) => old.dark != dark || old.glassR != glassR;
}
