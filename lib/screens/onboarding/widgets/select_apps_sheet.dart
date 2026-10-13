import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../utils/app_theme.dart';

/// What the user picked in the "Select Apps" sheet.
class SelectAppsResult {
  const SelectAppsResult({
    required this.apps,
    required this.schedules,
    required this.unlockMethod,
    this.skipped = false,
  });

  /// Names of the apps to lock (e.g. "Instagram").
  final Set<String> apps;

  /// Names of the active lock windows (e.g. "Work").
  final Set<String> schedules;

  /// "PIN Code", "Face ID" or "Touch ID".
  final String unlockMethod;

  /// True when the user tapped "Skip" inside the sheet.
  final bool skipped;
}

/// Figma: "Select Apps" sheet (727:43344), opened from onboarding 2.
///
/// Returns the choices when "Confirm Lock" (or "Skip") is tapped, or null when
/// the sheet is closed with the back button / a swipe down.
Future<SelectAppsResult?> showSelectAppsSheet(BuildContext context) {
  return showModalBottomSheet<SelectAppsResult>(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    backgroundColor: Colors.transparent,
    barrierColor: Colors.black.withValues(alpha: context.isDark ? 0.6 : 0.35),
    builder: (_) => const SelectAppsSheet(),
  );
}

// ---------------------------------------------------------------------------
// Colours. Dark values are the exact Figma colours; light values are derived
// from the app theme so the sheet stays readable on the light background.
// ---------------------------------------------------------------------------

class _SheetColors {
  _SheetColors(BuildContext context)
      : dark = context.isDark,
        c = context.colors;

  final bool dark;
  final AppColors c;

  Color get title => dark ? const Color(0xFFF0ECFF) : c.textPrimary;
  Color get itemOn => dark ? const Color(0xFFE8E4FF) : c.textPrimary;
  Color get itemOff => dark ? const Color(0xFF7B749E) : c.textSecondary;
  Color get sub => dark ? const Color(0xFF3E3860) : c.textMuted;
  Color get subOn => dark ? const Color(0xFF6B5E9B) : const Color(0xFF6B5E9B);
  Color get section => dark ? const Color(0xFF5E5882) : c.textMuted;
  Color get skip => dark ? const Color(0xFF5A5278) : c.textMuted;
  Color get hint => dark ? const Color(0xFF3E3860) : c.textMuted;
  Color get footer => dark ? const Color(0xFF2E2B4E) : c.textMuted;
  Color get statLabel => dark ? const Color(0xFF6B5E9B) : const Color(0xFF6B5E9B);
  Color get statCaption => dark ? const Color(0xFF4A3F72) : c.textMuted;

  /// Plain (unselected) card / field / chip.
  Color get card => dark ? const Color(0xFF13112A) : c.glassFill;
  Color get cardBorder => dark ? const Color(0xFF1E1B38) : c.glassBorder;
  Color get fieldBorder => dark ? const Color(0xFF23204A) : c.glassBorder;

  /// Small square icon tile when off.
  Color get tile => dark ? const Color(0xFF1A1830) : AppPalette.accent.withValues(alpha: 0.05);
  Color get tileBorder => dark ? const Color(0xFF2A2650) : c.glassBorder;

  /// Toggle (off) and inactive dots / bars.
  Color get track => dark ? const Color(0xFF1E1B38) : c.dotInactive;
  Color get trackBorder => dark ? const Color(0xFF2E2B54) : c.glassBorder;
  Color get knobOff => dark ? const Color(0xFF3E3860) : Colors.white;
  Color get inactive => dark ? const Color(0xFF1E1B38) : c.dotInactive;

  Color get iconOff => dark ? const Color(0xFF3E3860) : c.textMuted;

  /// Back button.
  Color get backFill => dark ? const Color(0xFF1E1B38) : c.glassFill;
  Color get backBorder => dark ? const Color(0xFF2E2B54) : c.glassBorder;

  /// Round app-icon holder.
  Color get appHolder => dark ? const Color(0xFF1E1A3A) : Colors.white;

  /// Selected card gradient (Figma: #2A1F6E → #3D2A9E at 13%).
  List<Color> get selectedGradient => dark
      ? const [Color(0x222A1F6E), Color(0x223D2A9E)]
      : [AppPalette.accent.withValues(alpha: 0.08), AppPalette.violet.withValues(alpha: 0.12)];

  List<Color> get sheetBackground =>
      dark ? const [Color(0xFF060512), Color(0xFF0D0A20), Color(0xFF060512)] : [c.background[0], c.background[1], c.background[3]];
}

const _accentGradient = LinearGradient(colors: [AppPalette.accent, AppPalette.violet]);
const _accentGradientDiagonal = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [AppPalette.accent, AppPalette.violet],
);
const _green = Color(0xFF34D399);
const _amber = Color(0xFFFBBF24);

TextStyle _t(double size, FontWeight w, Color color, {double? height, double ls = 0}) => TextStyle(
      fontFamily: AppText.fontFamily,
      fontSize: size,
      fontWeight: w,
      height: height == null ? null : height / size,
      letterSpacing: ls,
      color: color,
    );

// ---------------------------------------------------------------------------
// Data
// ---------------------------------------------------------------------------

class _App {
  const _App(this.name, this.category, this.icon);
  final String name;
  final String category;
  final String icon;
}

const _apps = [
  _App('Instagram', 'Social', 'assets/svg/sheet_instagram.png'),
  _App('Twitter / X', 'Social', 'assets/svg/sheet_x.png'),
  _App('YouTube', 'Entertainment', 'assets/svg/sheet_youtube.png'),
  _App('TikTok', 'Entertainment', 'assets/svg/sheet_tiktok.png'),
  _App('Facebook', 'Social', 'assets/svg/sheet_facebook.png'),
  _App('Netflix', 'Entertainment', 'assets/svg/sheet_netflix.png'),
];

const _categories = ['All', 'Social', 'Entertainment', 'Games'];

/// A lock window: when the selected apps are locked.
class _Schedule {
  const _Schedule(this.name, this.start, this.end, {this.days = const {1, 2, 3, 4, 5, 6, 7}, this.custom = false});

  final String name;
  final TimeOfDay start;
  final TimeOfDay end;

  /// Weekdays it runs on (1 = Monday … 7 = Sunday).
  final Set<int> days;

  /// Made by the user with "Custom" (can be removed).
  final bool custom;

  String get label {
    final time = '${_fmtTime(start)} – ${_fmtTime(end)}';
    return custom ? '$time · ${_fmtDays(days)}' : time;
  }
}

String _fmtTime(TimeOfDay t) {
  final h = t.hourOfPeriod == 0 ? 12 : t.hourOfPeriod;
  final ampm = t.period == DayPeriod.am ? 'AM' : 'PM';
  return t.minute == 0 ? '$h $ampm' : '$h:${t.minute.toString().padLeft(2, '0')} $ampm';
}

const _dayLetters = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];
const _dayNames = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

String _fmtDays(Set<int> d) {
  if (d.length == 7) return 'Every day';
  if (d.length == 5 && d.containsAll({1, 2, 3, 4, 5})) return 'Weekdays';
  if (d.length == 2 && d.containsAll({6, 7})) return 'Weekends';
  final sorted = d.toList()..sort();
  return sorted.map((i) => _dayNames[i - 1]).join(', ');
}

const _defaultSchedules = [
  _Schedule('Morning', TimeOfDay(hour: 6, minute: 0), TimeOfDay(hour: 9, minute: 0)),
  _Schedule('Work', TimeOfDay(hour: 9, minute: 0), TimeOfDay(hour: 17, minute: 0)),
  _Schedule('Evening', TimeOfDay(hour: 20, minute: 0), TimeOfDay(hour: 23, minute: 0)),
];

const _methods = [
  ('PIN Code', '4-digit PIN', 'assets/svg/sheet_pin.svg', 20.0, 20.0),
  ('Face ID', 'Biometric', 'assets/svg/sheet_face.svg', 20.0, 20.0),
  ('Touch ID', 'Fingerprint', 'assets/svg/sheet_fingerprint.svg', 18.6, 18.67),
];

// ---------------------------------------------------------------------------
// Sheet
// ---------------------------------------------------------------------------

class SelectAppsSheet extends StatefulWidget {
  const SelectAppsSheet({super.key});

  @override
  State<SelectAppsSheet> createState() => _SelectAppsSheetState();
}

class _SelectAppsSheetState extends State<SelectAppsSheet> {
  final Set<String> _selectedApps = {'Instagram', 'Twitter / X', 'YouTube'};
  final List<_Schedule> _schedules = List.of(_defaultSchedules);
  final Set<String> _activeSchedules = {'Work', 'Evening'};
  String _method = 'PIN Code';
  String _category = 'All';
  String _query = '';

  List<_App> get _visibleApps => _apps
      .where((a) => _category == 'All' || a.category == _category)
      .where((a) => a.name.toLowerCase().contains(_query.trim().toLowerCase()))
      .toList();

  void _toggleApp(String name) => setState(() {
        if (!_selectedApps.remove(name)) _selectedApps.add(name);
      });

  void _toggleSchedule(String name) => setState(() {
        if (!_activeSchedules.remove(name)) _activeSchedules.add(name);
      });

  /// "Custom" badge: pick a time window and days, then add it switched on.
  Future<void> _addCustomSchedule() async {
    final existing = _schedules.map((e) => e.name).toSet();
    final made = await showModalBottomSheet<_Schedule>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      backgroundColor: Colors.transparent,
      builder: (_) => _CustomScheduleSheet(takenNames: existing),
    );
    if (made == null || !mounted) return;
    setState(() {
      _schedules.add(made);
      _activeSchedules.add(made.name);
    });
  }

  void _removeSchedule(_Schedule sch) => setState(() {
        _schedules.remove(sch);
        _activeSchedules.remove(sch.name);
      });

  void _finish({bool skipped = false}) {
    Navigator.of(context).pop(SelectAppsResult(
      apps: skipped ? const {} : Set.of(_selectedApps),
      schedules: skipped ? const {} : Set.of(_activeSchedules),
      unlockMethod: _method,
      skipped: skipped,
    ));
  }

  @override
  Widget build(BuildContext context) {
    final s = _SheetColors(context);
    final media = MediaQuery.of(context);
    // About 1.07 h saved per locked app — "3.2h" for the 3 apps in the design.
    final saved = _selectedApps.length * 3.2 / 3;

    return Padding(
      padding: EdgeInsets.only(bottom: media.viewInsets.bottom),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: media.size.height * 0.94),
        child: ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(28)),
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: const Alignment(-0.18, -1),
                end: const Alignment(0.18, 1),
                colors: s.sheetBackground,
                stops: const [0, 0.5, 1],
              ),
            ),
            child: Stack(
              children: [
                // Star field + soft violet glow at the top.
                Positioned.fill(
                  child: IgnorePointer(
                    child: Opacity(
                      opacity: s.c.starsOpacity,
                      child: SvgPicture.asset(
                        'assets/svg/sheet_stars.svg',
                        fit: BoxFit.cover,
                        alignment: Alignment.topCenter,
                        colorFilter: s.dark ? null : const ColorFilter.mode(AppPalette.accent, BlendMode.srcIn),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: -40,
                  left: 0,
                  right: 0,
                  child: IgnorePointer(
                    child: Center(
                      child: Container(
                        width: 280,
                        height: 280,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: RadialGradient(
                            colors: [
                              AppPalette.accent.withValues(alpha: s.dark ? 0.1 : 0.12),
                              AppPalette.accent.withValues(alpha: 0),
                            ],
                            stops: const [0, 0.7],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                // Hairline glass edge along the rounded top.
                Positioned.fill(
                  child: IgnorePointer(
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.vertical(top: Radius.circular(28)),
                        border: Border(top: BorderSide(color: s.c.glassBorder)),
                      ),
                    ),
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _Header(onBack: () => Navigator.of(context).pop(), onSkip: () => _finish(skipped: true)),
                    Flexible(
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        padding: const EdgeInsets.only(bottom: 4),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const SizedBox(height: 16),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: IntrinsicHeight(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    Expanded(
                                      child: _StatCard(
                                        icon: 'assets/svg/sheet_lock_stat.svg',
                                        iconSize: const Size(12.5, 13.67),
                                        label: 'Total Locked',
                                        value: '${_selectedApps.length}',
                                        valueColor: s.title,
                                        caption: 'apps selected',
                                        border: AppPalette.accent.withValues(alpha: 0.21),
                                        gradient: s.dark
                                            ? const [Color(0xFF1A1040), Color(0xFF221556)]
                                            : [AppPalette.accent.withValues(alpha: 0.08), AppPalette.accent.withValues(alpha: 0.16)],
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    Expanded(
                                      child: _StatCard(
                                        icon: 'assets/svg/sheet_clock_stat.svg',
                                        iconSize: const Size(13.67, 13.67),
                                        label: 'Time Saved',
                                        value: '${saved.toStringAsFixed(1)}h',
                                        valueColor: _green,
                                        caption: 'per day avg',
                                        border: _green.withValues(alpha: 0.19),
                                        gradient: s.dark
                                            ? const [Color(0xFF0E1E2A), Color(0xFF0C2030)]
                                            : [_green.withValues(alpha: 0.07), _green.withValues(alpha: 0.13)],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: _SearchField(onChanged: (v) => setState(() => _query = v)),
                            ),
                            const SizedBox(height: 12),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                children: [
                                  for (final cat in _categories) ...[
                                    if (cat != _categories.first) const SizedBox(width: 8),
                                    _Chip(label: cat, selected: cat == _category, onTap: () => setState(() => _category = cat)),
                                  ],
                                ],
                              ),
                            ),
                            const SizedBox(height: 16),
                            _SectionHeader(
                              label: 'APPS',
                              trailing: _Badge(
                                icon: 'assets/svg/sheet_lock_small.svg',
                                gap: 6,
                                text: '${_selectedApps.length} selected',
                                color: AppPalette.violet,
                                fill: AppPalette.accent.withValues(alpha: 0.1),
                                border: AppPalette.accent.withValues(alpha: 0.25),
                                fontSize: 11,
                                lineHeight: 14.67,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: AnimatedSize(
                                duration: const Duration(milliseconds: 220),
                                curve: Curves.easeOut,
                                alignment: Alignment.topCenter,
                                child: _visibleApps.isEmpty
                                    ? Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 18),
                                        child: Text(
                                          'No apps found',
                                          textAlign: TextAlign.center,
                                          style: _t(13, FontWeight.w500, s.itemOff, height: 18.57),
                                        ),
                                      )
                                    : Column(
                                        children: [
                                          for (final app in _visibleApps) ...[
                                            if (app != _visibleApps.first) const SizedBox(height: 8),
                                            _AppRow(
                                              app: app,
                                              selected: _selectedApps.contains(app.name),
                                              onTap: () => _toggleApp(app.name),
                                            ),
                                          ],
                                        ],
                                      ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            _SectionHeader(
                              label: 'LOCK SCHEDULE',
                              padTop: 0,
                              padBottom: 0,
                              trailing: _TapScale(
                                onTap: _addCustomSchedule,
                                semanticLabel: 'Add a custom lock schedule',
                                child: _Badge(
                                  icon: 'assets/svg/sheet_calendar.svg',
                                  gap: 4,
                                  text: '+ Custom',
                                  color: _amber,
                                  fill: _amber.withValues(alpha: 0.08),
                                  border: _amber.withValues(alpha: 0.21),
                                  fontSize: 10,
                                  lineHeight: 15,
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: Column(
                                children: [
                                  for (final sch in _schedules) ...[
                                    if (sch != _schedules.first) const SizedBox(height: 8),
                                    _AppearIn(
                                      key: ValueKey(sch.name),
                                      child: _ScheduleRow(
                                        name: sch.name,
                                        time: sch.label,
                                        active: _activeSchedules.contains(sch.name),
                                        onTap: () => _toggleSchedule(sch.name),
                                        onRemove: sch.custom ? () => _removeSchedule(sch) : null,
                                      ),
                                    ),
                                  ],
                                ],
                              ),
                            ),
                            const SizedBox(height: 20),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: Text('UNLOCK METHOD', style: _t(11, FontWeight.w700, s.section, height: 14.67, ls: 1.1)),
                            ),
                            const SizedBox(height: 8),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                children: [
                                  for (final m in _methods) ...[
                                    if (m != _methods.first) const SizedBox(width: 12),
                                    Expanded(
                                      child: _MethodCard(
                                        title: m.$1,
                                        subtitle: m.$2,
                                        icon: m.$3,
                                        iconSize: Size(m.$4, m.$5),
                                        selected: _method == m.$1,
                                        onTap: () => setState(() => _method = m.$1),
                                      ),
                                    ),
                                  ],
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Pinned footer: dots, Confirm Lock, small note.
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 20, 20, 16 + media.padding.bottom),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const _SheetDots(count: 5, index: 0),
                          const SizedBox(height: 20),
                          _ConfirmButton(onPressed: _finish),
                          const SizedBox(height: 12),
                          Text(
                            'You can always change this later',
                            textAlign: TextAlign.center,
                            style: _t(11, FontWeight.w400, s.footer, height: 14.67),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Pieces
// ---------------------------------------------------------------------------

class _Header extends StatelessWidget {
  const _Header({required this.onBack, required this.onSkip});

  final VoidCallback onBack;
  final VoidCallback onSkip;

  @override
  Widget build(BuildContext context) {
    final s = _SheetColors(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: Row(
        children: [
          Semantics(
            button: true,
            label: 'Back',
            child: InkResponse(
              onTap: onBack,
              radius: 22,
              child: Container(
                width: 32,
                height: 32,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: s.backFill,
                  border: Border.all(color: s.backBorder),
                ),
                child: SvgPicture.asset('assets/svg/sheet_back.svg', width: 15, height: 15),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Text('Select Apps', style: _t(15, FontWeight.w700, s.title, height: 22.5)),
          const Spacer(),
          TextButton(
            onPressed: onSkip,
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
              minimumSize: Size.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            child: Text('Skip', style: _t(13, FontWeight.w500, s.skip, height: 18.57)),
          ),
        ],
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  const _StatCard({
    required this.icon,
    required this.iconSize,
    required this.label,
    required this.value,
    required this.valueColor,
    required this.caption,
    required this.border,
    required this.gradient,
  });

  final String icon;
  final Size iconSize;
  final String label;
  final String value;
  final Color valueColor;
  final String caption;
  final Color border;
  final List<Color> gradient;

  @override
  Widget build(BuildContext context) {
    final s = _SheetColors(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 13),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: border),
        gradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: gradient),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(
                width: 14,
                height: 14,
                child: Center(child: SvgPicture.asset(icon, width: iconSize.width, height: iconSize.height)),
              ),
              const SizedBox(width: 8),
              Text(label, style: _t(11, FontWeight.w600, s.statLabel, height: 16.5)),
            ],
          ),
          const SizedBox(height: 4),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            transitionBuilder: (child, a) => FadeTransition(
              opacity: a,
              child: SlideTransition(
                position: Tween(begin: const Offset(0, 0.3), end: Offset.zero).animate(a),
                child: child,
              ),
            ),
            layoutBuilder: (current, previous) => Stack(alignment: Alignment.centerLeft, children: [...previous, ?current]),
            child: Text(
              value,
              key: ValueKey(value),
              style: _t(22, FontWeight.w800, valueColor, height: 22),
            ),
          ),
          const SizedBox(height: 4),
          Text(caption, style: _t(10, FontWeight.w500, s.statCaption, height: 15)),
        ],
      ),
    );
  }
}

class _SearchField extends StatelessWidget {
  const _SearchField({required this.onChanged});

  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    final s = _SheetColors(context);
    return Container(
      height: 46,
      padding: const EdgeInsets.symmetric(horizontal: 17),
      decoration: BoxDecoration(
        color: s.card,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: s.fieldBorder),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 16,
            height: 16,
            child: Center(child: SvgPicture.asset('assets/svg/sheet_search.svg', width: 14, height: 14)),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: TextField(
              onChanged: onChanged,
              cursorColor: AppPalette.violet,
              textInputAction: TextInputAction.search,
              style: _t(13, FontWeight.w500, s.itemOn, height: 18.57),
              decoration: InputDecoration(
                isCollapsed: true,
                border: InputBorder.none,
                hintText: 'Search apps...',
                hintStyle: _t(13, FontWeight.w400, s.hint, height: 18.57),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Chip extends StatelessWidget {
  const _Chip({required this.label, required this.selected, required this.onTap});

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final s = _SheetColors(context);
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 7),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(99),
          gradient: selected ? _accentGradientDiagonal : null,
          color: selected ? null : s.card,
          border: Border.all(color: selected ? Colors.transparent : s.fieldBorder),
          boxShadow: selected
              ? [BoxShadow(color: AppPalette.accent.withValues(alpha: 0.27), blurRadius: 7, offset: const Offset(0, 4))]
              : const [],
        ),
        child: Text(
          label,
          style: _t(11, FontWeight.w600, selected ? Colors.white : s.skip, height: 14.67),
        ),
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({required this.label, required this.trailing, this.padTop = 0, this.padBottom = 0});

  final String label;
  final Widget trailing;
  final double padTop;
  final double padBottom;

  @override
  Widget build(BuildContext context) {
    final s = _SheetColors(context);
    return Padding(
      padding: EdgeInsets.fromLTRB(20, padTop, 20, padBottom),
      child: Row(
        children: [
          Text(label, style: _t(11, FontWeight.w700, s.section, height: 14.67, ls: 1.1)),
          const Spacer(),
          trailing,
        ],
      ),
    );
  }
}

class _Badge extends StatelessWidget {
  const _Badge({
    required this.icon,
    required this.gap,
    required this.text,
    required this.color,
    required this.fill,
    required this.border,
    required this.fontSize,
    required this.lineHeight,
  });

  final String icon;
  final double gap;
  final String text;
  final Color color;
  final Color fill;
  final Color border;
  final double fontSize;
  final double lineHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 5),
      decoration: BoxDecoration(
        color: fill,
        borderRadius: BorderRadius.circular(99),
        border: Border.all(color: border),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 11,
            height: 11,
            child: Center(child: SvgPicture.asset(icon, width: 10.25, height: 11.17)),
          ),
          SizedBox(width: gap),
          Text(text, style: _t(fontSize, FontWeight.w700, color, height: lineHeight)),
        ],
      ),
    );
  }
}

/// Card shared by app rows and schedule rows: gradient + violet border when on.
class _ToggleCard extends StatelessWidget {
  const _ToggleCard({required this.on, required this.onTap, required this.child});

  final bool on;
  final VoidCallback onTap;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final s = _SheetColors(context);
    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 220),
          curve: Curves.easeOut,
          padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 13),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: on ? null : s.card,
            gradient: on
                ? LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: s.selectedGradient)
                : null,
            border: Border.all(color: on ? AppPalette.accent.withValues(alpha: 0.25) : s.cardBorder),
          ),
          child: child,
        ),
      ),
    );
  }
}

class _AppRow extends StatelessWidget {
  const _AppRow({required this.app, required this.selected, required this.onTap});

  final _App app;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final s = _SheetColors(context);
    return Semantics(
      toggled: selected,
      label: app.name,
      child: _ToggleCard(
        on: selected,
        onTap: onTap,
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: s.appHolder,
                border: Border.all(color: AppPalette.accent.withValues(alpha: 0.4)),
                boxShadow: [BoxShadow(color: AppPalette.accent.withValues(alpha: 0.2), blurRadius: 10)],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(app.icon, width: 32, height: 32, filterQuality: FilterQuality.medium),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AnimatedDefaultTextStyle(
                    duration: const Duration(milliseconds: 200),
                    style: _t(13, FontWeight.w600, selected ? s.itemOn : s.itemOff, height: 18.57),
                    child: Text(app.name),
                  ),
                  const SizedBox(height: 2),
                  Text(app.category, style: _t(11, FontWeight.w400, s.sub, height: 14.67)),
                ],
              ),
            ),
            _Toggle(on: selected),
          ],
        ),
      ),
    );
  }
}

class _ScheduleRow extends StatelessWidget {
  const _ScheduleRow({required this.name, required this.time, required this.active, required this.onTap, this.onRemove});

  final String name;
  final String time;
  final bool active;
  final VoidCallback onTap;

  /// Shown as a small × for custom schedules.
  final VoidCallback? onRemove;

  @override
  Widget build(BuildContext context) {
    final s = _SheetColors(context);
    return Semantics(
      toggled: active,
      label: '$name $time',
      child: _ToggleCard(
        on: active,
        onTap: onTap,
        child: Row(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 220),
              width: 36,
              height: 36,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: active ? AppPalette.accent.withValues(alpha: 0.09) : s.tile,
                border: Border.all(color: active ? AppPalette.accent.withValues(alpha: 0.33) : s.tileBorder),
              ),
              child: SvgPicture.asset(
                active ? 'assets/svg/sheet_clock_on.svg' : 'assets/svg/sheet_clock_off.svg',
                width: 14.5,
                height: 14.5,
                colorFilter: active || s.dark ? null : ColorFilter.mode(s.iconOff, BlendMode.srcIn),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AnimatedDefaultTextStyle(
                    duration: const Duration(milliseconds: 200),
                    style: _t(13, FontWeight.w600, active ? s.itemOn : s.itemOff, height: 18.57),
                    child: Text(name),
                  ),
                  const SizedBox(height: 2),
                  Text(time, style: _t(11, FontWeight.w400, active ? s.subOn : s.sub, height: 14.67)),
                ],
              ),
            ),
            if (onRemove != null) ...[
              Semantics(
                button: true,
                label: 'Remove $name',
                child: InkResponse(
                  onTap: onRemove,
                  radius: 18,
                  child: Padding(
                    padding: const EdgeInsets.all(6),
                    child: Icon(Icons.close_rounded, size: 16, color: s.itemOff),
                  ),
                ),
              ),
              const SizedBox(width: 6),
            ],
            _Toggle(on: active),
          ],
        ),
      ),
    );
  }
}

/// 40×24 switch: violet gradient + white knob when on, dark track when off.
class _Toggle extends StatelessWidget {
  const _Toggle({required this.on});

  final bool on;

  @override
  Widget build(BuildContext context) {
    final s = _SheetColors(context);
    return AnimatedContainer(
      duration: const Duration(milliseconds: 220),
      curve: Curves.easeOut,
      width: 40,
      height: 24,
      padding: const EdgeInsets.symmetric(horizontal: 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(99),
        gradient: on ? _accentGradient : null,
        color: on ? null : s.track,
        border: on ? null : Border.all(color: s.trackBorder),
        boxShadow: on ? [BoxShadow(color: AppPalette.accent.withValues(alpha: 0.33), blurRadius: 4)] : const [],
      ),
      child: AnimatedAlign(
        duration: const Duration(milliseconds: 220),
        curve: Curves.easeOutBack,
        alignment: on ? Alignment.centerRight : Alignment.centerLeft,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 220),
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: on ? Colors.white : s.knobOff,
            boxShadow: !on && !s.dark ? [BoxShadow(color: Colors.black.withValues(alpha: 0.12), blurRadius: 3)] : null,
          ),
        ),
      ),
    );
  }
}

class _MethodCard extends StatelessWidget {
  const _MethodCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.iconSize,
    required this.selected,
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final String icon;
  final Size iconSize;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final s = _SheetColors(context);
    return Semantics(
      selected: selected,
      button: true,
      label: title,
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 220),
          curve: Curves.easeOut,
          height: 140.5,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: selected ? null : s.card,
            gradient: selected
                ? LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: s.selectedGradient)
                : null,
            border: Border.all(color: selected ? AppPalette.accent.withValues(alpha: 0.33) : s.cardBorder),
          ),
          child: Column(
            children: [
              const SizedBox(height: 15),
              AnimatedContainer(
                duration: const Duration(milliseconds: 220),
                width: 44,
                height: 44,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: selected ? AppPalette.accent.withValues(alpha: 0.1) : s.tile,
                  border: Border.all(color: selected ? AppPalette.accent.withValues(alpha: 0.33) : s.tileBorder),
                ),
                child: SvgPicture.asset(
                  icon,
                  width: iconSize.width,
                  height: iconSize.height,
                  colorFilter: ColorFilter.mode(selected ? AppPalette.violet : s.iconOff, BlendMode.srcIn),
                ),
              ),
              const SizedBox(height: 7),
              AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 200),
                style: _t(13, FontWeight.w700, selected ? s.itemOn : s.itemOff, height: 19.5),
                child: Text(title, maxLines: 1, overflow: TextOverflow.ellipsis),
              ),
              const SizedBox(height: 9),
              Text(subtitle, style: _t(10, FontWeight.w400, selected ? s.subOn : s.sub, height: 15)),
              const SizedBox(height: 8),
              AnimatedContainer(
                duration: const Duration(milliseconds: 220),
                width: 20,
                height: 4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  gradient: selected ? _accentGradient : null,
                  color: selected ? null : s.inactive,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Sheet page dots: active 22×6 violet pill, others 6×6 (gap 6).
class _SheetDots extends StatelessWidget {
  const _SheetDots({required this.count, required this.index});

  final int count;
  final int index;

  @override
  Widget build(BuildContext context) {
    final s = _SheetColors(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (var i = 0; i < count; i++) ...[
          if (i > 0) const SizedBox(width: 6),
          Container(
            width: i == index ? 22 : 6,
            height: 6,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(99),
              gradient: i == index ? _accentGradient : null,
              color: i == index ? null : s.inactive,
            ),
          ),
        ],
      ],
    );
  }
}

/// Full-width violet gradient pill: "Confirm Lock" + arrow in a 28px circle.
class _ConfirmButton extends StatefulWidget {
  const _ConfirmButton({required this.onPressed, this.label = 'Confirm Lock'});

  final VoidCallback onPressed;
  final String label;

  @override
  State<_ConfirmButton> createState() => _ConfirmButtonState();
}

class _ConfirmButtonState extends State<_ConfirmButton> {
  bool _down = false;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: widget.label,
      child: GestureDetector(
        onTapDown: (_) => setState(() => _down = true),
        onTapCancel: () => setState(() => _down = false),
        onTapUp: (_) => setState(() => _down = false),
        onTap: widget.onPressed,
        child: AnimatedScale(
          scale: _down ? 0.97 : 1,
          duration: const Duration(milliseconds: 120),
          child: Container(
            width: double.infinity,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(99),
              gradient: _accentGradient,
              boxShadow: [
                BoxShadow(color: AppPalette.accent.withValues(alpha: 0.4), blurRadius: 20, offset: const Offset(0, 8)),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(widget.label, style: AppText.button.copyWith(color: Colors.white, letterSpacing: 0)),
                const SizedBox(width: 8),
                Container(
                  width: 28,
                  height: 28,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(shape: BoxShape.circle, color: Color(0x33FFFFFF)),
                  child: SvgPicture.asset('assets/svg/sheet_arrow.svg', width: 15, height: 15),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


// ---------------------------------------------------------------------------
// Custom schedule
// ---------------------------------------------------------------------------

/// Shrinks a little while pressed; used for small tappable badges.
class _TapScale extends StatefulWidget {
  const _TapScale({required this.child, required this.onTap, required this.semanticLabel});

  final Widget child;
  final VoidCallback onTap;
  final String semanticLabel;

  @override
  State<_TapScale> createState() => _TapScaleState();
}

class _TapScaleState extends State<_TapScale> {
  bool _down = false;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: widget.semanticLabel,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTapDown: (_) => setState(() => _down = true),
        onTapCancel: () => setState(() => _down = false),
        onTapUp: (_) => setState(() => _down = false),
        onTap: widget.onTap,
        child: Padding(
          // bigger touch area than the badge itself
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 2),
          child: AnimatedScale(
            scale: _down ? 0.92 : 1,
            duration: const Duration(milliseconds: 120),
            child: widget.child,
          ),
        ),
      ),
    );
  }
}

/// New rows slide and fade in once.
class _AppearIn extends StatefulWidget {
  const _AppearIn({super.key, required this.child});

  final Widget child;

  @override
  State<_AppearIn> createState() => _AppearInState();
}

class _AppearInState extends State<_AppearIn> with SingleTickerProviderStateMixin {
  late final AnimationController _c = AnimationController(vsync: this, duration: const Duration(milliseconds: 380))..forward();

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final a = CurvedAnimation(parent: _c, curve: Curves.easeOutCubic);
    return SizeTransition(
      sizeFactor: a,
      alignment: Alignment.topCenter,
      child: FadeTransition(
        opacity: a,
        child: SlideTransition(position: Tween(begin: const Offset(0, 0.25), end: Offset.zero).animate(a), child: widget.child),
      ),
    );
  }
}

/// Bottom sheet for making a custom lock window: name, start, end and days.
class _CustomScheduleSheet extends StatefulWidget {
  const _CustomScheduleSheet({required this.takenNames});

  final Set<String> takenNames;

  @override
  State<_CustomScheduleSheet> createState() => _CustomScheduleSheetState();
}

class _CustomScheduleSheetState extends State<_CustomScheduleSheet> {
  final _name = TextEditingController();
  TimeOfDay _start = const TimeOfDay(hour: 13, minute: 0);
  TimeOfDay _end = const TimeOfDay(hour: 15, minute: 0);
  final Set<int> _days = {1, 2, 3, 4, 5};

  @override
  void dispose() {
    _name.dispose();
    super.dispose();
  }

  int get _minutes {
    final a = _start.hour * 60 + _start.minute;
    final b = _end.hour * 60 + _end.minute;
    return (b - a + 24 * 60) % (24 * 60);
  }

  String get _durationText {
    final m = _minutes;
    if (m == 0) return 'Start and end are the same';
    final h = m ~/ 60, r = m % 60;
    final d = h == 0 ? '${r}m' : (r == 0 ? '${h}h' : '${h}h ${r}m');
    final overnight = (_end.hour * 60 + _end.minute) <= (_start.hour * 60 + _start.minute);
    return 'Locked for $d${overnight ? ' (overnight)' : ''}';
  }

  bool get _valid => _minutes > 0 && _days.isNotEmpty;

  Future<void> _pick(bool start) async {
    final dark = context.isDark;
    final picked = await showTimePicker(
      context: context,
      initialTime: start ? _start : _end,
      helpText: start ? 'LOCK STARTS AT' : 'LOCK ENDS AT',
      builder: (ctx, child) {
        final base = Theme.of(ctx);
        return Theme(
          data: base.copyWith(
            colorScheme: base.colorScheme.copyWith(
              primary: AppPalette.accent,
              onPrimary: Colors.white,
              surface: dark ? const Color(0xFF13112A) : Colors.white,
              onSurface: dark ? const Color(0xFFE8E4FF) : const Color(0xFF1B1838),
            ),
            timePickerTheme: TimePickerThemeData(
              backgroundColor: dark ? const Color(0xFF13112A) : Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
              dialBackgroundColor: dark ? const Color(0xFF1E1B38) : const Color(0xFFF1EEFF),
              hourMinuteShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              dayPeriodColor: WidgetStateColor.resolveWith(
                (states) => states.contains(WidgetState.selected)
                    ? AppPalette.accent.withValues(alpha: 0.25)
                    : Colors.transparent,
              ),
              dayPeriodTextColor: WidgetStateColor.resolveWith(
                (states) => states.contains(WidgetState.selected)
                    ? (dark ? Colors.white : AppPalette.accent)
                    : (dark ? const Color(0xFF7B749E) : const Color(0xFF625D86)),
              ),
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) setState(() => start ? _start = picked : _end = picked);
  }

  void _save() {
    var name = _name.text.trim().isEmpty ? 'Custom' : _name.text.trim();
    final base = name;
    var n = 2;
    while (widget.takenNames.contains(name)) {
      name = '$base $n';
      n++;
    }
    Navigator.of(context).pop(_Schedule(name, _start, _end, days: Set.of(_days), custom: true));
  }

  @override
  Widget build(BuildContext context) {
    final s = _SheetColors(context);
    final media = MediaQuery.of(context);
    return Padding(
      padding: EdgeInsets.only(bottom: media.viewInsets.bottom),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(28)),
          gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: s.sheetBackground),
          border: Border(top: BorderSide(color: AppPalette.violet.withValues(alpha: 0.25))),
        ),
        child: SafeArea(
          top: false,
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(AppSpacing.gutter, 10, AppSpacing.gutter, 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(
                  child: Container(
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(color: s.track, borderRadius: BorderRadius.circular(99)),
                  ),
                ),
                const SizedBox(height: 18),
                Text('Custom schedule', style: _t(20, FontWeight.w800, s.title, height: 26)),
                const SizedBox(height: 4),
                Text('Your selected apps stay locked during this time.', style: _t(13, FontWeight.w400, s.itemOff, height: 18)),
                const SizedBox(height: 18),
                _label(s, 'NAME'),
                const SizedBox(height: 8),
                TextField(
                  controller: _name,
                  textCapitalization: TextCapitalization.sentences,
                  maxLength: 20,
                  style: _t(14, FontWeight.w600, s.itemOn),
                  decoration: InputDecoration(
                    hintText: 'e.g. Study time',
                    hintStyle: _t(14, FontWeight.w400, s.hint),
                    counterText: '',
                    filled: true,
                    fillColor: s.card,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: BorderSide(color: s.fieldBorder)),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: const BorderSide(color: AppPalette.accent, width: 1.5),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(child: _TimeTile(label: 'Starts', time: _start, onTap: () => _pick(true))),
                    const SizedBox(width: 12),
                    Expanded(child: _TimeTile(label: 'Ends', time: _end, onTap: () => _pick(false))),
                  ],
                ),
                const SizedBox(height: 8),
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 200),
                  child: Text(
                    _durationText,
                    key: ValueKey(_durationText),
                    style: _t(12, FontWeight.w600, _minutes == 0 ? const Color(0xFFFF6B6B) : _amber, height: 16),
                  ),
                ),
                const SizedBox(height: 16),
                _label(s, 'REPEAT ON'),
                const SizedBox(height: 8),
                Row(
                  children: [
                    for (var i = 1; i <= 7; i++) ...[
                      if (i > 1) const SizedBox(width: 6),
                      Expanded(
                        child: _DayChip(
                          letter: _dayLetters[i - 1],
                          name: _dayNames[i - 1],
                          on: _days.contains(i),
                          onTap: () => setState(() => _days.contains(i) ? _days.remove(i) : _days.add(i)),
                        ),
                      ),
                    ],
                  ],
                ),
                const SizedBox(height: 22),
                AnimatedOpacity(
                  duration: const Duration(milliseconds: 200),
                  opacity: _valid ? 1 : 0.45,
                  child: IgnorePointer(
                    ignoring: !_valid,
                    child: _ConfirmButton(onPressed: _save, label: 'Add schedule'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _label(_SheetColors s, String text) => Text(text, style: _t(11, FontWeight.w700, s.section, height: 14.67, ls: 1.1));
}

class _TimeTile extends StatelessWidget {
  const _TimeTile({required this.label, required this.time, required this.onTap});

  final String label;
  final TimeOfDay time;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final s = _SheetColors(context);
    return Semantics(
      button: true,
      label: '$label ${_fmtTime(time)}. Change time',
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16),
          child: Ink(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: s.selectedGradient),
              border: Border.all(color: AppPalette.accent.withValues(alpha: 0.3)),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(label, style: _t(11, FontWeight.w600, s.section, height: 14.67)),
                      const SizedBox(height: 4),
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 200),
                        child: Text(
                          _fmtTime(time),
                          key: ValueKey(time),
                          style: _t(20, FontWeight.w800, s.itemOn, height: 24).copyWith(
                            fontFeatures: const [FontFeature.tabularFigures()],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Icon(Icons.schedule_rounded, size: 18, color: AppPalette.violet),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _DayChip extends StatelessWidget {
  const _DayChip({required this.letter, required this.name, required this.on, required this.onTap});

  final String letter;
  final String name;
  final bool on;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final s = _SheetColors(context);
    return Semantics(
      button: true,
      toggled: on,
      label: name,
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOut,
          height: 40,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: on ? _accentGradientDiagonal : null,
            color: on ? null : s.card,
            border: Border.all(color: on ? Colors.transparent : s.cardBorder),
            boxShadow: on ? [BoxShadow(color: AppPalette.accent.withValues(alpha: 0.3), blurRadius: 10, offset: const Offset(0, 3))] : null,
          ),
          child: Text(letter, style: _t(13, FontWeight.w800, on ? Colors.white : s.itemOff)),
        ),
      ),
    );
  }
}
