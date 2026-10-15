import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Re-colours the dark-theme Figma illustrations (ob3 / ob4) for light mode:
/// white strokes/fills become dark ink and the near-black card fills become
/// white, so every line and label stays readable on the light background.
/// Gradient stops are left untouched.
class Ob3LightSvgMapper extends ColorMapper {
  const Ob3LightSvgMapper();

  static const Color _ink = Color(0xFF1B1838);

  @override
  Color substitute(String? id, String elementName, String attributeName, Color color) {
    if (attributeName == 'stop-color') return color;
    final rgb = color.toARGB32() & 0xFFFFFF;
    if (rgb == 0xFFFFFF || rgb == 0x000000) return _ink.withValues(alpha: color.a);
    if (rgb == 0x0F0F23 || rgb == 0x0C0C1E || rgb == 0x080818) {
      return const Color(0xFFFFFFFF).withValues(alpha: color.a);
    }
    return color;
  }
}

/// SvgPicture.asset that applies [Ob3LightSvgMapper] in light mode.
Widget ob3ThemedSvg(BuildContext context, String asset, {double? width, double? height, bool dark = true}) {
  return SvgPicture.asset(asset, width: width, height: height, colorMapper: dark ? null : const Ob3LightSvgMapper());
}
