import 'package:flutter/material.dart';

import '../../utils/app_theme.dart';
import '../../utils/l10n.dart';
import '../../widgets/glow_background.dart';
import '../block/block_screen.dart';
import '../focus/focus_screen.dart';
import '../home/home_screen.dart';
import '../insights/insights_screen.dart';
import '../profile/profile_screen.dart';

/// Main app after sign-in: 5 tabs with the floating bottom bar.
///
/// Switch tab from anywhere: `AppShell.of(context)?.goTab(AppTab.focus)`.
enum AppTab { home, block, focus, insights, profile }

class AppShell extends StatefulWidget {
  const AppShell({super.key, this.initialTab = AppTab.home});

  final AppTab initialTab;

  /// Tab to open the next time the shell is built (set at the end of onboarding).
  static AppTab? pendingTab;

  static AppShellState? of(BuildContext context) =>
      context.findAncestorStateOfType<AppShellState>() ?? AppShellState._current;

  @override
  State<AppShell> createState() => AppShellState();
}

class AppShellState extends State<AppShell> {
  late AppTab _tab = AppShell.pendingTab ?? widget.initialTab;
  static AppShellState? _current;

  @override
  void initState() {
    super.initState();
    _current = this;
    AppShell.pendingTab = null;
  }

  @override
  void dispose() {
    if (_current == this) _current = null;
    super.dispose();
  }

  // Pages are built once and kept alive (timer keeps running when you switch tab).
  final _pages = const [HomeScreen(), BlockScreen(), FocusScreen(), InsightsScreen(), ProfileScreen()];

  AppTab get tab => _tab;

  void goTab(AppTab t) {
    // Called from a pushed screen too: close pushed routes first.
    Navigator.of(context).popUntil((r) => r.isFirst);
    setState(() => _tab = t);
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: _tab == AppTab.home,
      onPopInvokedWithResult: (didPop, _) {
        if (!didPop) goTab(AppTab.home);
      },
      child: Scaffold(
        backgroundColor: Colors.transparent,
        extendBody: true,
        body: GlowBackground(
          child: SafeArea(
            bottom: false,
            child: IndexedStack(index: _tab.index, children: _pages),
          ),
        ),
        bottomNavigationBar: _NavBar(current: _tab, onTap: goTab),
      ),
    );
  }
}

class _NavBar extends StatelessWidget {
  const _NavBar({required this.current, required this.onTap});

  final AppTab current;
  final ValueChanged<AppTab> onTap;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final c = context.colors;
    final dark = context.isDark;
    final items = [
      (AppTab.home, Icons.home_rounded, l.navHome),
      (AppTab.block, Icons.shield_outlined, l.navBlock),
      (AppTab.focus, Icons.bolt_rounded, l.navFocus),
      (AppTab.insights, Icons.bar_chart_rounded, l.navInsights),
      (AppTab.profile, Icons.person_outline_rounded, l.navProfile),
    ];
    return Container(
      decoration: BoxDecoration(
        color: dark ? const Color(0xF20D0B22) : const Color(0xF7FFFFFF),
        border: Border(top: BorderSide(color: c.glassBorder)),
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8, 8, 8, 6),
          child: Row(
            children: [
              for (final (t, icon, label) in items)
                Expanded(
                  child: Semantics(
                    selected: t == current,
                    button: true,
                    label: label,
                    child: InkResponse(
                      onTap: () => onTap(t),
                      radius: 32,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 250),
                            curve: Curves.easeOutCubic,
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: t == current
                                  ? const LinearGradient(colors: [Color(0xFF9B7BFF), AppPalette.accent])
                                  : null,
                              boxShadow: t == current
                                  ? [BoxShadow(color: AppPalette.accent.withValues(alpha: 0.45), blurRadius: 14, offset: const Offset(0, 4))]
                                  : null,
                            ),
                            child: Icon(icon, size: 21, color: t == current ? Colors.white : c.textMuted),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            label,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: AppText.small.copyWith(
                              letterSpacing: 0,
                              fontWeight: t == current ? FontWeight.w800 : FontWeight.w600,
                              color: t == current ? c.textPrimary : c.textMuted,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
