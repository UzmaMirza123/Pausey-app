import 'package:flutter/material.dart';

import '../utils/app_theme.dart';

/// Soft, out-of-focus leaves along the bottom-left and bottom-right edges of the
/// onboarding screens (cut from the reference design, transparent PNGs).
/// Purely decorative: behind the content and the buttons, never takes touches.
///
/// Inside the intro PageView pass the page's [controller] and [index]: the leaves
/// then cancel the page's slide (and stay clipped to the page), so while pages
/// change they stand still, like the footer.
class CornerLeaves extends StatelessWidget {
  const CornerLeaves({super.key, this.controller, this.index = 0});

  final PageController? controller;
  final int index;

  // Size of the reference screen the leaves were cut from.
  static const _refWidth = 498.0, _refHeight = 261.0, _leftW = 40.0, _rightW = 60.0;

  @override
  Widget build(BuildContext context) {
    final dark = context.isDark;
    final width = MediaQuery.sizeOf(context).width;
    final s = (width / _refWidth).clamp(0.7, 1.3);
    Widget leaf(String side, double w) {
      Widget img = Image.asset('assets/onboarding/corner_leaves_$side.png', width: w * s, height: _refHeight * s, fit: BoxFit.fill, filterQuality: FilterQuality.medium);
      // Dark theme: the same leaves, dimmer and deeper purple.
      if (dark) {
        img = Opacity(
          opacity: 0.55,
          child: ColorFiltered(colorFilter: const ColorFilter.mode(Color(0xFF8C82E0), BlendMode.modulate), child: img),
        );
      }
      return img;
    }

    final Widget layer = Stack(
      children: [
        Positioned(left: 0, bottom: 0, child: leaf('left', _leftW)),
        Positioned(right: 0, bottom: 0, child: leaf('right', _rightW)),
      ],
    );
    final c = controller;
    return IgnorePointer(
      child: ExcludeSemantics(
        child: c == null
            ? layer
            : ClipRect(
                child: AnimatedBuilder(
                  animation: c,
                  builder: (context, child) {
                    final paged = c.hasClients && c.position.haveDimensions;
                    final delta = paged ? (c.page ?? index.toDouble()) - index : 0.0;
                    return Transform.translate(offset: Offset(delta * width, 0), child: child);
                  },
                  child: layer,
                ),
              ),
      ),
    );
  }
}
