import 'package:flutter/material.dart';

import '../utils/app_theme.dart';
import '../widgets/common.dart';
import '../widgets/glow_background.dart';
import '../widgets/pausey_logo.dart';

/// Splash: the Pausey logo builds itself (stem rises, ring draws, pause button
/// pops with a ripple), the name rises in letter by letter, then the app moves on.
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key, required this.onFinished, this.delay = const Duration(milliseconds: 3200)});

  final VoidCallback onFinished;
  final Duration delay;

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  late final AnimationController _intro =
      AnimationController(vsync: this, duration: const Duration(milliseconds: 2300))..forward();
  late final AnimationController _breath =
      AnimationController(vsync: this, duration: const Duration(milliseconds: 2200));

  @override
  void initState() {
    super.initState();
    _intro.addStatusListener((s) {
      if (s == AnimationStatus.completed) _breath.repeat(reverse: true);
    });
    Future.delayed(widget.delay, () {
      if (mounted) widget.onFinished();
    });
  }

  @override
  void dispose() {
    _intro.dispose();
    _breath.dispose();
    super.dispose();
  }

  double _seg(double begin, double end, [Curve curve = Curves.easeOutCubic]) {
    final t = ((_intro.value - begin) / (end - begin)).clamp(0.0, 1.0);
    return curve.transform(t);
  }

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: GlowBackground(
        blobs: Blob.splash,
        starsAsset: 'assets/svg/splash_stars.svg',
        child: LayoutBuilder(
          builder: (context, box) {
            final logoSize = (box.maxWidth * 0.62).clamp(180.0, 280.0);
            return Stack(
              children: [
                Positioned(
                  top: box.maxHeight * 0.32,
                  left: 0,
                  right: 0,
                  child: const _GlowLine(colors: [
                    Color(0x006C8FFF), Color(0x2E6C8FFF), Color(0x38A78BFA), Color(0x1F34D9C3), Color(0x0034D9C3),
                  ], stops: [0, 0.3, 0.5, 0.7, 1]),
                ),
                Positioned(
                  top: box.maxHeight * 0.7188,
                  left: 0,
                  right: 0,
                  child: const _GlowLine(colors: [
                    Color(0x0034D9C3), Color(0x1A34D9C3), Color(0x296C8FFF), Color(0x006C8FFF),
                  ], stops: [0, 0.3, 0.5, 1]),
                ),
                const Positioned(top: 8, right: 16, child: SafeArea(child: ThemeToggleButton())),
                Center(
                  child: AnimatedBuilder(
                    animation: Listenable.merge([_intro, _breath]),
                    builder: (context, _) {
                      final pulse = Curves.easeInOut.transform(_breath.value);
                      final buttonT = _seg(0.30, 0.62, Curves.easeOutBack);
                      final ripple = _seg(0.36, 0.95, Curves.easeOutCubic);
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            width: logoSize * 1.5,
                            height: logoSize * 1.02,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                // ripple that leaves the button as it pops
                                if (ripple > 0 && ripple < 1)
                                  Transform.translate(
                                    offset: Offset(logoSize * 0.035, -logoSize * 0.09),
                                    child: Container(
                                      width: logoSize * (0.45 + 0.9 * ripple),
                                      height: logoSize * (0.45 + 0.9 * ripple),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: AppPalette.violet.withValues(alpha: 0.55 * (1 - ripple)),
                                          width: 2,
                                        ),
                                      ),
                                    ),
                                  ),
                                PauseyLogo(
                                  size: logoSize,
                                  progress: LogoProgress(
                                    glow: _seg(0.0, 0.5),
                                    stem: _seg(0.0, 0.32),
                                    ring: _seg(0.16, 0.6, Curves.easeInOutCubic),
                                    button: buttonT,
                                    bars: _seg(0.48, 0.72, Curves.easeOutBack),
                                    pulse: pulse,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          PauseyWordmark(t: _seg(0.52, 1.0, Curves.linear)),
                          const SizedBox(height: 10),
                          Opacity(
                            opacity: _seg(0.78, 1.0),
                            child: Column(
                              children: [
                                Container(
                                  width: 40 * _seg(0.78, 1.0),
                                  height: 1.5,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(99),
                                    gradient: const LinearGradient(
                                      colors: [Color(0x006C8FFF), Color(0x996C8FFF), Color(0x006C8FFF)],
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 12),
                                Text(
                                  'Take back your time',
                                  style: AppText.body.copyWith(color: c.textSecondary, fontSize: 14, height: 20 / 14),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: logoSize * 0.2),
                        ],
                      );
                    },
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 40,
                  child: SafeArea(
                    top: false,
                    child: FadeTransition(
                      opacity: CurvedAnimation(parent: _intro, curve: const Interval(0.7, 1)),
                      child: Text(
                        'Version 2.0 · App Store Edition',
                        textAlign: TextAlign.center,
                        style: AppText.tiny.copyWith(color: c.textMuted.withValues(alpha: context.isDark ? 0.22 : 0.45)),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _GlowLine extends StatelessWidget {
  const _GlowLine({required this.colors, required this.stops});

  final List<Color> colors;
  final List<double> stops;

  @override
  Widget build(BuildContext context) {
    return Container(height: 1, decoration: BoxDecoration(gradient: LinearGradient(colors: colors, stops: stops)));
  }
}
