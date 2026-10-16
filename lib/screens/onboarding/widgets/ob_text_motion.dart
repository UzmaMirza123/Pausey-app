import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

import '../../../utils/app_theme.dart';

bool _reduced(BuildContext context) => MediaQuery.maybeDisableAnimationsOf(context) ?? false;

/// Soft "expo out" curve shared by the onboarding text motion.
const Curve _kTextCurve = Cubic(0.16, 1, 0.3, 1);

/// A headline that reveals word by word: each word fades in, rises 12px and
/// un-blurs, one after another (Opal / milo style).
///
/// Lines wrap and align exactly like a normal [Text] because every word is a
/// [WidgetSpan] in one paragraph with plain spaces between them; RTL follows
/// the ambient [Directionality]. Scripts written without spaces (Japanese,
/// Chinese) are revealed in small chunks of about two characters instead.
///
/// Changing [text] replays the reveal. With "Remove animations" on, the text
/// simply appears.
class ObRevealText extends StatefulWidget {
  const ObRevealText(this.text, {super.key, this.style, this.align = TextAlign.center, this.delay = const Duration(milliseconds: 120), this.header = true});

  final String text;

  /// Defaults to [AppText.h1]; a style without a colour gets the theme's primary text colour.
  final TextStyle? style;
  final TextAlign align;

  /// Wait before the first word starts.
  final Duration delay;

  /// Announce the text as a heading to screen readers.
  final bool header;

  @override
  State<ObRevealText> createState() => _ObRevealTextState();
}

class _ObRevealTextState extends State<ObRevealText> with SingleTickerProviderStateMixin {
  static const _wordMs = 600;
  static const _staggerMs = 60;

  /// The whole stagger (first word start → last word start) never exceeds this,
  /// so a title finishes ~900ms after [ObRevealText.delay].
  static const _maxStaggerMs = 300;

  late final AnimationController _c = AnimationController(vsync: this);
  late List<_Token> _tokens;
  List<Animation<double>> _words = const [];
  bool _started = false;

  @override
  void initState() {
    super.initState();
    _prepare();
  }

  void _prepare() {
    _tokens = _tokenize(widget.text);
    final count = _tokens.where((t) => t.word).length;
    final stagger = count <= 1 ? 0.0 : math.min(_staggerMs.toDouble(), _maxStaggerMs / (count - 1));
    final delayMs = widget.delay.inMicroseconds / 1000;
    final totalMs = delayMs + stagger * math.max(0, count - 1) + _wordMs;
    _c.duration = Duration(microseconds: (totalMs * 1000).round());
    _words = [
      for (var i = 0; i < count; i++)
        // drive() registers no listeners of its own, so nothing to dispose on replay.
        _c.drive(CurveTween(curve: Interval((delayMs + stagger * i) / totalMs, math.min(1, (delayMs + stagger * i + _wordMs) / totalMs), curve: _kTextCurve))),
    ];
  }

  void _play() {
    if (_reduced(context)) {
      _c.value = 1;
    } else {
      _c.forward(from: 0);
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_started) {
      _started = true;
      _play();
    } else if (_reduced(context) && _c.isAnimating) {
      _c.value = 1;
    }
  }

  @override
  void didUpdateWidget(ObRevealText old) {
    super.didUpdateWidget(old);
    if (old.text != widget.text || old.delay != widget.delay) {
      _prepare();
      if (old.text != widget.text) _play();
    }
  }

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var style = widget.style ?? AppText.h1;
    if (style.color == null && style.foreground == null) style = style.copyWith(color: context.colors.textPrimary);
    final Widget visual;
    if (_reduced(context)) {
      visual = Text(widget.text, style: style, textAlign: widget.align);
    } else {
      // A paragraph lays inline widgets out unscaled, rounds them, then scales them
      // by the text scaler, which makes words a hair larger than plain text and can
      // change line breaks. So apply the scaler to the font size up front and lay
      // everything (spaces and words) out at scale 1, exactly like a normal Text.
      final base = DefaultTextStyle.of(context).style.merge(style);
      final fontSize = base.fontSize ?? kDefaultFontSize;
      style = style.copyWith(fontSize: MediaQuery.textScalerOf(context).scale(fontSize));
      var w = 0;
      if (Directionality.of(context) == TextDirection.rtl) {
        // Inline widgets in a paragraph are always placed left to right, which would
        // reverse an Urdu/Arabic sentence. A Wrap follows the reading direction and
        // breaks lines between words the same way.
        final space = (TextPainter(text: TextSpan(text: ' ', style: style), textDirection: TextDirection.rtl, textScaler: TextScaler.noScaling)..layout()).width;
        visual = Wrap(
          alignment: switch (widget.align) {
            TextAlign.center => WrapAlignment.center,
            TextAlign.end || TextAlign.left => WrapAlignment.end,
            _ => WrapAlignment.start,
          },
          spacing: space,
          children: [
            for (final (text, i) in _rtlChunks()) _RevealWord(text: text, style: style, animation: _words[i]),
          ],
        );
      } else {
        visual = Text.rich(
          textScaler: TextScaler.noScaling,
          TextSpan(
            style: style,
            children: [
              for (final t in _tokens)
                if (t.word)
                  WidgetSpan(
                    alignment: PlaceholderAlignment.baseline,
                    baseline: TextBaseline.alphabetic,
                    child: _RevealWord(text: t.text, style: style, animation: _words[w++]),
                  )
                else
                  TextSpan(text: t.text),
            ],
          ),
          textAlign: widget.align,
        );
      }
    }
    return Semantics(
      label: widget.text,
      header: widget.header,
      child: ExcludeSemantics(child: visual),
    );
  }
}

/// Right-to-left lines, one Wrap item per word, except that a run of
/// left-to-right words (an app name like "Twitter / X") stays one item, so it
/// keeps its own reading order inside the Urdu/Arabic sentence.
extension on _ObRevealTextState {
  List<(String, int)> _rtlChunks() {
    final out = <(String, int)>[];
    final words = [for (final t in _tokens) if (t.word) t.text];
    var i = 0;
    while (i < words.length) {
      if (!_isRtlWord(words[i]) && _hasLtrLetter(words[i])) {
        var j = i;
        // Extend over following LTR words, and neutral ones ("/", "&") that sit between LTR words.
        while (j + 1 < words.length && !_isRtlWord(words[j + 1]) && (_hasLtrLetter(words[j + 1]) || (j + 2 < words.length && _hasLtrLetter(words[j + 2]) && !_isRtlWord(words[j + 2])))) {
          j++;
        }
        out.add((words.sublist(i, j + 1).join(' '), i));
        i = j + 1;
      } else {
        out.add((words[i], i));
        i++;
      }
    }
    return out;
  }
}

bool _isRtlWord(String w) => w.runes.any((r) => (r >= 0x0590 && r <= 0x08FF) || (r >= 0xFB1D && r <= 0xFDFF) || (r >= 0xFE70 && r <= 0xFEFF));
bool _hasLtrLetter(String w) => w.runes.any((r) => (r >= 0x41 && r <= 0x5A) || (r >= 0x61 && r <= 0x7A) || (r >= 0xC0 && r <= 0x24F) || (r >= 0x30 && r <= 0x39));

/// One animated word. Only paint-time effects (opacity, translate, blur) are
/// used, so its size and therefore the paragraph's line breaks never change.
class _RevealWord extends StatelessWidget {
  const _RevealWord({required this.text, required this.style, required this.animation});

  final String text;
  final TextStyle style;
  final Animation<double> animation;

  static const _rise = 12.0;
  static const _blur = 6.0;

  @override
  Widget build(BuildContext context) {
    // [style] already carries the scaled font size (see the parent's build).
    final word = Text(text, style: style, textScaler: TextScaler.noScaling);
    return AnimatedBuilder(
      animation: animation,
      child: word,
      builder: (context, child) {
        final t = animation.value.clamp(0.0, 1.0);
        final sigma = _blur * (1 - t);
        return Opacity(
          opacity: t,
          child: Transform.translate(
            offset: Offset(0, _rise * (1 - t)),
            child: ImageFiltered(
              enabled: sigma > 0.05,
              imageFilter: ui.ImageFilter.blur(sigmaX: sigma, sigmaY: sigma, tileMode: TileMode.decal),
              child: child,
            ),
          ),
        );
      },
    );
  }
}

class _Token {
  const _Token(this.text, {required this.word});
  final String text;

  /// False for the whitespace between words.
  final bool word;
}

/// Splits [text] into words and the whitespace between them. Runs that contain
/// Japanese / Chinese characters are split further into ~2-character chunks,
/// with punctuation kept on the chunk it belongs to.
List<_Token> _tokenize(String text) {
  final out = <_Token>[];
  final buf = StringBuffer();
  bool? inSpace;
  void flush() {
    if (buf.isEmpty) return;
    final s = buf.toString();
    buf.clear();
    if (inSpace == true) {
      // Keep explicit line breaks; collapse other whitespace like a normal Text would show it.
      out.add(_Token(s.contains('\n') ? '\n' * '\n'.allMatches(s).length : ' ', word: false));
    } else {
      out.addAll(_chunk(s));
    }
  }

  for (final ch in text.characters) {
    final space = ch.trim().isEmpty;
    if (inSpace != null && space != inSpace) flush();
    inSpace = space;
    buf.write(ch);
  }
  flush();
  // Leading/trailing whitespace would only shift the line.
  while (out.isNotEmpty && !out.first.word && out.first.text == ' ') {
    out.removeAt(0);
  }
  while (out.isNotEmpty && !out.last.word && out.last.text == ' ') {
    out.removeLast();
  }
  return out;
}

List<_Token> _chunk(String run) {
  final chars = run.characters.toList();
  if (!chars.any(_isCjk)) return [_Token(run, word: true)];

  final out = <_Token>[];
  final cur = StringBuffer();
  var weight = 0; // CJK characters (a Latin run counts as a full chunk)
  void flush() {
    if (cur.isEmpty) return;
    out.add(_Token(cur.toString(), word: true));
    cur.clear();
    weight = 0;
  }

  var i = 0;
  while (i < chars.length) {
    final ch = chars[i];
    if (_closing.contains(ch)) {
      // Never start a chunk with closing punctuation, a small kana or "ー".
      if (cur.isEmpty && out.isNotEmpty) {
        final last = out.removeLast();
        cur.write(last.text);
        weight = 2;
      }
      cur.write(ch);
      i++;
      continue;
    }
    if (_opening.contains(ch)) {
      flush();
      cur.write(ch);
      i++;
      continue;
    }
    if (_isCjk(ch)) {
      if (weight >= 2) flush();
      cur.write(ch);
      weight++;
      i++;
      continue;
    }
    // A run of Latin letters / digits inside CJK text stays whole.
    final latin = StringBuffer();
    while (i < chars.length && !_isCjk(chars[i]) && !_closing.contains(chars[i]) && !_opening.contains(chars[i])) {
      latin.write(chars[i]);
      i++;
    }
    if (weight > 0) flush();
    cur.write(latin);
    weight = 2;
  }
  flush();
  return out;
}

const _closing = {
  '、',
  '。',
  '，',
  '．',
  '・',
  '：',
  '；',
  '？',
  '！',
  '…',
  '‥',
  '〜',
  '～',
  'ー',
  '）',
  '」',
  '』',
  '】',
  '〉',
  '》',
  '〕',
  '］',
  '｝',
  '”',
  '’',
  ',',
  '.',
  ':',
  ';',
  '?',
  '!',
  ')',
  ']',
  '}',
  '%',
  '％',
  'ぁ',
  'ぃ',
  'ぅ',
  'ぇ',
  'ぉ',
  'っ',
  'ゃ',
  'ゅ',
  'ょ',
  'ゎ',
  'ァ',
  'ィ',
  'ゥ',
  'ェ',
  'ォ',
  'ッ',
  'ャ',
  'ュ',
  'ョ',
  'ヮ',
  'ヵ',
  'ヶ',
};

const _opening = {'（', '「', '『', '【', '〈', '《', '〔', '［', '｛', '“', '‘', '(', '[', '{'};

bool _isCjk(String ch) {
  final r = ch.runes.first;
  return (r >= 0x3040 && r <= 0x30FF) || // Hiragana, Katakana
      (r >= 0x31F0 && r <= 0x31FF) || // Katakana extensions
      (r >= 0x3400 && r <= 0x4DBF) || // CJK ext A
      (r >= 0x4E00 && r <= 0x9FFF) || // CJK unified
      (r >= 0xF900 && r <= 0xFAFF) || // CJK compatibility
      (r >= 0x3000 && r <= 0x303F) || // CJK symbols & punctuation
      (r >= 0xFF00 && r <= 0xFFEF) || // Full-width forms
      (r >= 0x20000 && r <= 0x2FA1F); // CJK ext B+
}

/// Fade + rise for subtitles and content that follow an [ObRevealText].
/// Plays once when first built (rebuilds don't replay it); [index] adds 50ms
/// per step. Instant with "Remove animations" on.
class ObFadeUp extends StatelessWidget {
  const ObFadeUp({super.key, required this.child, this.delay = Duration.zero, this.rise = 12, this.index = 0});

  final Widget child;
  final Duration delay;
  final double rise;
  final int index;

  static const _ms = 400;

  @override
  Widget build(BuildContext context) {
    if (_reduced(context)) return child;
    final delayMs = delay.inMilliseconds + index * 50;
    final total = delayMs + _ms;
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: 1),
      duration: Duration(milliseconds: total),
      curve: Interval(delayMs / total, 1, curve: _kTextCurve),
      child: child,
      builder: (_, t, c) => Opacity(
        opacity: t.clamp(0.0, 1.0),
        child: Transform.translate(offset: Offset(0, rise * (1 - t)), child: c),
      ),
    );
  }
}

/// Three dots bouncing in turn ("someone is typing…"), 1.2s loop.
/// Still dots when "Remove animations" is on.
class ObTypingDots extends StatefulWidget {
  const ObTypingDots({super.key, this.color, this.size = 6});

  /// Defaults to the theme's secondary text colour.
  final Color? color;

  /// Diameter of one dot.
  final double size;

  @override
  State<ObTypingDots> createState() => _ObTypingDotsState();
}

class _ObTypingDotsState extends State<ObTypingDots> with SingleTickerProviderStateMixin {
  late final _c = AnimationController(vsync: this, duration: const Duration(milliseconds: 1200));

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_reduced(context)) {
      _c
        ..stop()
        ..value = 0;
    } else if (!_c.isAnimating) {
      _c.repeat();
    }
  }

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final color = widget.color ?? context.colors.textSecondary;
    final s = widget.size;
    final lift = s * 0.7;
    return ExcludeSemantics(
      child: SizedBox(
        height: s + lift,
        child: AnimatedBuilder(
          animation: _c,
          builder: (context, _) => Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              for (var i = 0; i < 3; i++) ...[if (i > 0) SizedBox(width: s * 0.6), _dot(i, color, s, lift)],
            ],
          ),
        ),
      ),
    );
  }

  Widget _dot(int i, Color color, double s, double lift) {
    // Each dot hops during its own 40% window of the loop, 15% after the previous one.
    final local = ((_c.value - i * 0.15) / 0.4);
    final h = local > 0 && local < 1 ? math.sin(local * math.pi) : 0.0;
    return Transform.translate(
      offset: Offset(0, -lift * h),
      child: Container(
        width: s,
        height: s,
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.45 + 0.55 * h),
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
