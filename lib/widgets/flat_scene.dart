import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../screens/onboarding/widgets/intro_motion.dart';
import '../utils/app_theme.dart';

/// What the person in a [FlatScene] is doing.
enum SceneKind {
  /// On the phone, with chat bubbles (a message for the user).
  message,

  /// Laptop on the lap, with a lock and a password card.
  logIn,

  /// Laptop on the lap, with a new profile card and a plus.
  signUp,
}

/// Flat illustration in the app's colours: a person relaxing on a sofa, with a
/// soft blob, a plant and a few shapes. Light and dark versions. It floats gently
/// (still when the phone's "Remove animations" setting is on).
class FlatScene extends StatelessWidget {
  const FlatScene({super.key, required this.kind, this.width = 280});
  final SceneKind kind;
  final double width;

  static const aspect = 230 / 320;

  static const _light = {
    'blob': '#E9E5FB',
    'sofa': '#C9D5FF',
    'sofaDark': '#B3C2FA',
    'ink': '#2E2A4F',
    'skin': '#E2A07D',
    'skinDark': '#C9855F',
    'shirt': '#FFFFFF',
    'device': '#D4D0EE',
    'accent': '#7C5CFC',
    'blue': '#6C8FFF',
    'violet': '#A78BFA',
    'dot': '#CFDDFF',
    'leaf': '#B8AEF0',
    'leafDark': '#9C8FE6',
    'card': '#FFFFFF',
    'line': '#E4DFFA',
    'hair': '#2E2A4F',
    'pants': '#2E2A4F',
  };

  static const _dark = {
    'blob': '#2A2552',
    'sofa': '#45509A',
    'sofaDark': '#3A4486',
    'ink': '#C9C2F5',
    'skin': '#E2A07D',
    'skinDark': '#C9855F',
    'shirt': '#ECE9FF',
    'device': '#5A5490',
    'accent': '#8C6FFF',
    'blue': '#6C8FFF',
    'violet': '#A78BFA',
    'dot': '#3B4B8F',
    'leaf': '#6E62C4',
    'leafDark': '#5A4FB0',
    'card': '#211C40',
    'line': '#3A3466',
    'hair': '#15122B',
    'pants': '#1B1736',
  };

  static const _base = r'''<path d="M95 58 C130 18 205 22 238 60 C268 94 262 150 236 182 C205 220 120 222 88 186 C58 152 62 96 95 58 Z" fill="{blob}"/>
<circle cx="66" cy="66" r="19" fill="{dot}"/>
<circle cx="292" cy="112" r="7" fill="none" stroke="{ink}" stroke-width="2.2"/>
<path d="M40 166 L54 174 L40 182 Z" fill="none" stroke="{ink}" stroke-width="2.2" stroke-linejoin="round"/>
<path d="M274 160 C262 140 266 122 272 112 C278 124 280 142 274 160 Z" fill="{leaf}"/>
<path d="M276 162 C286 146 296 140 304 138 C300 150 292 160 276 162 Z" fill="{leafDark}"/>
<path d="M272 164 C258 156 252 146 250 136 C262 140 270 150 272 164 Z" fill="{leafDark}"/>
<path d="M275 165 L275 118" stroke="{ink}" stroke-width="1.4"/>
<path d="M264 166 L286 166 L282 196 L268 196 Z" fill="{ink}"/>
<rect x="78" y="118" width="164" height="62" rx="20" fill="{sofaDark}"/>
<rect x="70" y="160" width="180" height="32" rx="12" fill="{sofa}"/>
<rect x="60" y="138" width="30" height="56" rx="13" fill="{sofa}"/>
<rect x="230" y="138" width="30" height="56" rx="13" fill="{sofa}"/>
<path d="M82 192 L76 212" stroke="{ink}" stroke-width="4" stroke-linecap="round"/>
<path d="M238 192 L244 212" stroke="{ink}" stroke-width="4" stroke-linecap="round"/>
<path d="M140 116 C130 104 132 88 142 82" stroke="{skinDark}" stroke-width="7" fill="none" stroke-linecap="round"/>
<path d="M136 116 C138 110 146 108 154 108 C164 108 171 112 172 120 L174 162 L134 162 Z" fill="{shirt}"/>
<rect x="149" y="98" width="9" height="12" rx="3" fill="{skinDark}"/>
<circle cx="153" cy="90" r="12" fill="{skin}"/>
<path d="M140 92 C136 76 150 68 162 72 C172 76 172 88 166 90 C160 84 150 84 146 92 C146 100 144 104 140 104 C136 102 138 96 140 92 Z" fill="{hair}"/>
<circle cx="142" cy="74" r="7" fill="{hair}"/>
<path d="M138 150 L196 150 C204 150 207 156 206 164 L204 204 L192 204 L192 172 L140 174 Z" fill="{pants}"/>
<path d="M190 202 L206 202 C214 202 220 206 220 210 L190 210 Z" fill="{ink}"/>
<path d="M150 158 L204 160 C212 161 214 168 210 174 L226 196 L216 202 L196 178 L150 178 Z" fill="{pants}"/>
<path d="M214 196 L226 192 C232 191 236 196 232 200 L220 206 Z" fill="{ink}"/>''';

  static const _props = {
    SceneKind.message: r'''<path d="M168 128 C178 132 184 138 186 146" stroke="{skinDark}" stroke-width="7" fill="none" stroke-linecap="round"/>
<rect x="182" y="126" width="14" height="24" rx="3" fill="{ink}" transform="rotate(14 189 138)"/>
<rect x="184.5" y="129" width="9" height="17" rx="1.5" fill="{violet}" transform="rotate(14 189 138)"/>
<path d="M196 42 h70 a12 12 0 0 1 12 12 v22 a12 12 0 0 1 -12 12 h-48 l-14 12 l2 -12 h-10 a12 12 0 0 1 -12 -12 v-22 a12 12 0 0 1 12 -12 z" fill="{accent}"/>
<rect x="198" y="56" width="56" height="5" rx="2.5" fill="#FFFFFF"/>
<rect x="198" y="67" width="40" height="5" rx="2.5" fill="#FFFFFF" opacity="0.75"/>
<circle cx="264" cy="69" r="4" fill="#FFFFFF" opacity="0.9"/>
<path d="M30 104 h44 a10 10 0 0 1 10 10 v12 a10 10 0 0 1 -10 10 h-30 l-10 9 l1 -9 h-5 a10 10 0 0 1 -10 -10 v-12 a10 10 0 0 1 10 -10 z" fill="{card}" stroke="{line}" stroke-width="1.5"/>
<circle cx="44" cy="120" r="3" fill="{violet}"/>
<circle cx="54" cy="120" r="3" fill="{violet}"/>
<circle cx="64" cy="120" r="3" fill="{violet}"/>''',
    SceneKind.logIn: r'''<path d="M168 132 C176 140 180 148 182 152" stroke="{skinDark}" stroke-width="7" fill="none" stroke-linecap="round"/>
<path d="M164 156 L214 152 L206 120 L160 124 Z" fill="{device}"/>
<path d="M160 157 L216 153 L218 158 L162 162 Z" fill="{ink}"/>
<circle cx="187" cy="139" r="5" fill="{accent}"/>
<circle cx="234" cy="70" r="26" fill="{accent}"/>
<rect x="224" y="68" width="20" height="16" rx="4" fill="#FFFFFF"/>
<path d="M228 68 v-5 a6 6 0 0 1 12 0 v5" stroke="#FFFFFF" stroke-width="3" fill="none"/>
<circle cx="234" cy="76" r="2.4" fill="{accent}"/>
<rect x="22" y="96" width="62" height="34" rx="9" fill="{card}" stroke="{line}" stroke-width="1.5"/>
<circle cx="36" cy="113" r="3" fill="{ink}"/><circle cx="46" cy="113" r="3" fill="{ink}"/>
<circle cx="56" cy="113" r="3" fill="{ink}"/><circle cx="66" cy="113" r="3" fill="{ink}"/>''',
    SceneKind.signUp: r'''<path d="M168 132 C176 140 180 148 182 152" stroke="{skinDark}" stroke-width="7" fill="none" stroke-linecap="round"/>
<path d="M164 156 L214 152 L206 120 L160 124 Z" fill="{device}"/>
<path d="M160 157 L216 153 L218 158 L162 162 Z" fill="{ink}"/>
<circle cx="187" cy="139" r="5" fill="{accent}"/>
<rect x="200" y="34" width="78" height="62" rx="12" fill="{card}" stroke="{line}" stroke-width="1.5"/>
<circle cx="222" cy="58" r="10" fill="{violet}"/>
<path d="M210 82 a12 10 0 0 1 24 0 z" fill="{violet}"/>
<rect x="240" y="52" width="28" height="5" rx="2.5" fill="{line}"/>
<rect x="240" y="63" width="20" height="5" rx="2.5" fill="{line}"/>
<circle cx="276" cy="36" r="11" fill="{accent}"/>
<path d="M271 36 l3.5 3.5 l6.5 -7" stroke="#FFFFFF" stroke-width="2.6" fill="none" stroke-linecap="round" stroke-linejoin="round"/>
<circle cx="46" cy="114" r="16" fill="{blue}"/>
<path d="M46 106 v16 M38 114 h16" stroke="#FFFFFF" stroke-width="3" stroke-linecap="round"/>''',
  };

  static String svg(SceneKind kind, {required bool dark}) {
    var s = '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 320 230">$_base${_props[kind]!}</svg>';
    (dark ? _dark : _light).forEach((k, v) => s = s.replaceAll('{$k}', v));
    return s;
  }

  @override
  Widget build(BuildContext context) {
    return ExcludeSemantics(
      child: IntroEnter(
        scale: true,
        rise: 10,
        child: IntroFloat(
          amplitude: 4,
          period: const Duration(milliseconds: 3600),
          child: SvgPicture.string(svg(kind, dark: context.isDark), width: width, height: width * aspect),
        ),
      ),
    );
  }
}
