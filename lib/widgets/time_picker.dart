import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/app_theme.dart';
import '../utils/l10n.dart';

/// A time of day with seconds (24h hour inside).
class PTime {
  const PTime(this.hour, this.minute, [this.second = 0]);

  PTime.fromTimeOfDay(TimeOfDay t) : this(t.hour, t.minute);
  PTime.fromMinutes(int m) : this((m ~/ 60) % 24, m % 60);

  final int hour, minute, second;

  TimeOfDay get timeOfDay => TimeOfDay(hour: hour, minute: minute);
  int get totalMinutes => hour * 60 + minute;
}

/// Pausey time picker used everywhere in the app: watch dial + manual entry,
/// hours / minutes / seconds, and an AM/PM dropdown beside the heading.
Future<PTime?> showPTimePicker(BuildContext context, {required PTime initial, String? title}) {
  return showDialog<PTime>(
    context: context,
    builder: (_) => _PTimeDialog(initial: initial, title: title),
  );
}

enum _Seg { hour, minute, second }

class _PTimeDialog extends StatefulWidget {
  const _PTimeDialog({required this.initial, this.title});
  final PTime initial;
  final String? title;

  @override
  State<_PTimeDialog> createState() => _PTimeDialogState();
}

class _PTimeDialogState extends State<_PTimeDialog> {
  late int _h12 = widget.initial.hour % 12 == 0 ? 12 : widget.initial.hour % 12;
  late bool _pm = widget.initial.hour >= 12;
  late int _m = widget.initial.minute;
  late int _s = widget.initial.second;
  _Seg _seg = _Seg.hour;
  bool _input = false;

  late final _hc = TextEditingController(text: _two(_h12));
  late final _mc = TextEditingController(text: _two(_m));
  late final _sc = TextEditingController(text: _two(_s));

  static String _two(int v) => v.toString().padLeft(2, '0');

  @override
  void dispose() {
    _hc.dispose();
    _mc.dispose();
    _sc.dispose();
    super.dispose();
  }

  void _syncFields() {
    _hc.text = _two(_h12);
    _mc.text = _two(_m);
    _sc.text = _two(_s);
  }

  void _readFields() {
    _h12 = (int.tryParse(_hc.text) ?? _h12).clamp(1, 12);
    _m = (int.tryParse(_mc.text) ?? _m).clamp(0, 59);
    _s = (int.tryParse(_sc.text) ?? _s).clamp(0, 59);
  }

  void _toggleMode() {
    setState(() {
      if (_input) {
        _readFields();
      } else {
        _syncFields();
      }
      _input = !_input;
    });
  }

  void _done() {
    if (_input) _readFields();
    final h24 = (_h12 % 12) + (_pm ? 12 : 0);
    Navigator.of(context).pop(PTime(h24, _m, _s));
  }

  @override
  Widget build(BuildContext context) {
    final ml = MaterialLocalizations.of(context);
    final c = context.colors;
    final dark = context.isDark;
    final bg = dark ? const Color(0xFF13112A) : Colors.white;
    final heading = widget.title ?? (_input ? ml.timePickerInputHelpText : ml.timePickerDialHelpText);
    return Dialog(
      backgroundColor: bg,
      insetPadding: const EdgeInsets.symmetric(horizontal: AppSpacing.gutter, vertical: 24),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppRadius.card)),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 380),
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      heading,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: AppText.cardTitle.copyWith(color: c.textPrimary),
                    ),
                  ),
                  const SizedBox(width: 8),
                  _PeriodDropdown(pm: _pm, onChanged: (v) => setState(() => _pm = v)),
                ],
              ),
              const SizedBox(height: 18),
              if (_input)
                _inputFields(context)
              else ...[
                _segments(context),
                const SizedBox(height: 18),
                Center(
                  child: _Dial(
                    seg: _seg,
                    value: switch (_seg) {
                      _Seg.hour => _h12,
                      _Seg.minute => _m,
                      _Seg.second => _s,
                    },
                    onChanged: (v) => setState(() {
                      switch (_seg) {
                        case _Seg.hour:
                          _h12 = v;
                        case _Seg.minute:
                          _m = v;
                        case _Seg.second:
                          _s = v;
                      }
                    }),
                    onEnd: () => setState(() {
                      if (_seg == _Seg.hour) {
                        _seg = _Seg.minute;
                      } else if (_seg == _Seg.minute) {
                        _seg = _Seg.second;
                      }
                    }),
                  ),
                ),
              ],
              const SizedBox(height: 12),
              Row(
                children: [
                  IconButton(
                    tooltip: _input ? ml.dialModeButtonLabel : ml.inputTimeModeButtonLabel,
                    onPressed: _toggleMode,
                    icon: Icon(_input ? Icons.access_time_rounded : Icons.keyboard_outlined, color: c.textSecondary),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text(ml.cancelButtonLabel, style: AppText.rowTitle.copyWith(color: c.textSecondary)),
                  ),
                  TextButton(
                    onPressed: _done,
                    child: Text(
                      ml.okButtonLabel,
                      style: AppText.rowTitle.copyWith(color: AppPalette.accent, fontWeight: FontWeight.w800),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _segments(BuildContext context) {
    final c = context.colors;
    Widget box(_Seg s, int v) {
      final on = _seg == s;
      return Expanded(
        child: InkWell(
          borderRadius: BorderRadius.circular(AppRadius.tile),
          onTap: () => setState(() => _seg = s),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 180),
            height: 64,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppRadius.tile),
              color: on ? AppPalette.accent.withValues(alpha: 0.22) : c.glassFill,
              border: Border.all(color: on ? AppPalette.accent : c.glassBorder),
            ),
            child: Text(_two(v), style: AppText.heroValue.copyWith(color: on ? AppPalette.accent : c.textPrimary)),
          ),
        ),
      );
    }

    Widget colon() => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: Text(':', style: AppText.heroValue.copyWith(color: c.textMuted)),
    );
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Row(children: [box(_Seg.hour, _h12), colon(), box(_Seg.minute, _m), colon(), box(_Seg.second, _s)]),
    );
  }

  Widget _inputFields(BuildContext context) {
    final ml = MaterialLocalizations.of(context);
    final l = context.l10n;
    final c = context.colors;
    Widget field(TextEditingController ctl, String label, int max, {bool last = false}) {
      return Expanded(
        child: Column(
          children: [
            TextField(
              controller: ctl,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              textInputAction: last ? TextInputAction.done : TextInputAction.next,
              maxLength: 2,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly, _MaxValue(max)],
              onSubmitted: last ? (_) => _done() : null,
              style: AppText.heroValue.copyWith(color: c.textPrimary),
              decoration: InputDecoration(
                counterText: '',
                filled: true,
                fillColor: c.glassFill,
                contentPadding: const EdgeInsets.symmetric(vertical: 12),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppRadius.tile),
                  borderSide: BorderSide(color: c.glassBorder),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppRadius.tile),
                  borderSide: const BorderSide(color: AppPalette.accent, width: 1.5),
                ),
              ),
            ),
            const SizedBox(height: 6),
            Text(
              label,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppText.small.copyWith(color: c.textMuted),
            ),
          ],
        ),
      );
    }

    Widget colon() => Padding(
      padding: const EdgeInsets.fromLTRB(6, 0, 6, 22),
      child: Text(':', style: AppText.heroValue.copyWith(color: c.textMuted)),
    );
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          field(_hc, ml.timePickerHourLabel, 12),
          colon(),
          field(_mc, ml.timePickerMinuteLabel, 59),
          colon(),
          field(_sc, l.timeSecondLabel, 59, last: true),
        ],
      ),
    );
  }
}

/// Keeps typed numbers within 0..max.
class _MaxValue extends TextInputFormatter {
  _MaxValue(this.max);
  final int max;
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    final v = int.tryParse(newValue.text);
    return v != null && v > max ? oldValue : newValue;
  }
}

/// AM / PM dropdown beside the heading.
class _PeriodDropdown extends StatelessWidget {
  const _PeriodDropdown({required this.pm, required this.onChanged});
  final bool pm;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    final ml = MaterialLocalizations.of(context);
    final c = context.colors;
    return Container(
      padding: const EdgeInsetsDirectional.only(start: 12, end: 6),
      decoration: BoxDecoration(
        color: AppPalette.accent.withValues(alpha: 0.14),
        borderRadius: BorderRadius.circular(AppRadius.chip),
        border: Border.all(color: AppPalette.accent.withValues(alpha: 0.5)),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<bool>(
          value: pm,
          isDense: true,
          padding: const EdgeInsets.symmetric(vertical: 8),
          borderRadius: BorderRadius.circular(AppRadius.tile),
          dropdownColor: context.isDark ? const Color(0xFF1E1B38) : Colors.white,
          icon: const Icon(Icons.keyboard_arrow_down_rounded, color: AppPalette.accent),
          style: AppText.rowTitle.copyWith(color: c.textPrimary, fontWeight: FontWeight.w800),
          items: [
            DropdownMenuItem(
              value: false,
              child: Text(ml.anteMeridiemAbbreviation),
            ),
            DropdownMenuItem(
              value: true,
              child: Text(ml.postMeridiemAbbreviation),
            ),
          ],
          onChanged: (v) => v == null ? null : onChanged(v),
        ),
      ),
    );
  }
}

/// Watch-style dial: 1–12 for hours, 0–59 for minutes/seconds (labels every 5).
class _Dial extends StatelessWidget {
  const _Dial({required this.seg, required this.value, required this.onChanged, required this.onEnd});
  final _Seg seg;
  final int value;
  final ValueChanged<int> onChanged;
  final VoidCallback onEnd;

  int _valueAt(Offset p, double size) {
    final center = Offset(size / 2, size / 2);
    final d = p - center;
    var a = math.atan2(d.dx, -d.dy); // 0 at 12 o'clock, clockwise
    if (a < 0) a += 2 * math.pi;
    if (seg == _Seg.hour) {
      final h = (a / (2 * math.pi) * 12).round() % 12;
      return h == 0 ? 12 : h;
    }
    return (a / (2 * math.pi) * 60).round() % 60;
  }

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    return LayoutBuilder(
      builder: (context, box) {
        final size = math.min(box.maxWidth, 260.0);
        void handle(Offset p) {
          final v = _valueAt(p, size);
          if (v != value) {
            HapticFeedback.selectionClick();
            onChanged(v);
          }
        }

        return GestureDetector(
          onPanDown: (d) => handle(d.localPosition),
          onPanUpdate: (d) => handle(d.localPosition),
          onPanEnd: (_) => onEnd(),
          onTapUp: (d) {
            handle(d.localPosition);
            onEnd();
          },
          child: SizedBox(
            width: size,
            height: size,
            child: CustomPaint(
              painter: _DialPainter(
                seg: seg,
                value: value,
                face: context.isDark ? const Color(0xFF1E1B38) : const Color(0xFFF1EEFF),
                text: c.textPrimary,
                muted: c.textMuted,
              ),
            ),
          ),
        );
      },
    );
  }
}

class _DialPainter extends CustomPainter {
  _DialPainter({required this.seg, required this.value, required this.face, required this.text, required this.muted});
  final _Seg seg;
  final int value;
  final Color face, text, muted;

  @override
  void paint(Canvas canvas, Size size) {
    final center = size.center(Offset.zero);
    final r = size.width / 2;
    canvas.drawCircle(center, r, Paint()..color = face);
    final steps = seg == _Seg.hour ? 12 : 60;
    final labelR = r - 26;
    Offset at(int i, double rad) {
      final a = i / steps * 2 * math.pi;
      return center + Offset(math.sin(a) * rad, -math.cos(a) * rad);
    }

    // hand
    final idx = seg == _Seg.hour ? value % 12 : value;
    final tip = at(idx, labelR);
    final accent = Paint()..color = AppPalette.accent;
    canvas.drawLine(center, tip, accent..strokeWidth = 2.5);
    canvas.drawCircle(center, 4, accent);
    canvas.drawCircle(tip, 20, accent);

    // ticks for minutes/seconds
    if (steps == 60) {
      for (var i = 0; i < 60; i++) {
        if (i % 5 == 0) continue;
        canvas.drawCircle(at(i, labelR), 1.4, Paint()..color = muted.withValues(alpha: 0.6));
      }
    }
    // labels
    for (var i = 0; i < 12; i++) {
      final n = seg == _Seg.hour ? (i == 0 ? 12 : i) : i * 5;
      final pos = at(seg == _Seg.hour ? i : i * 5, labelR);
      final selected = seg == _Seg.hour ? value == n : value == n;
      final tp = TextPainter(
        text: TextSpan(
          text: seg == _Seg.hour ? '$n' : n.toString().padLeft(2, '0'),
          style: AppText.rowTitle.copyWith(color: selected ? Colors.white : text, fontWeight: FontWeight.w700),
        ),
        textDirection: TextDirection.ltr,
      )..layout();
      tp.paint(canvas, pos - Offset(tp.width / 2, tp.height / 2));
    }
    if (steps == 60 && value % 5 != 0) {
      final tp = TextPainter(
        text: TextSpan(
          text: value.toString().padLeft(2, '0'),
          style: AppText.small.copyWith(color: Colors.white, fontWeight: FontWeight.w800),
        ),
        textDirection: TextDirection.ltr,
      )..layout();
      tp.paint(canvas, tip - Offset(tp.width / 2, tp.height / 2));
    }
  }

  @override
  bool shouldRepaint(_DialPainter old) => old.value != value || old.seg != seg || old.face != face || old.text != text;
}
