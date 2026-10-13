import 'package:flutter/material.dart';

import '../../../data/app_repo.dart';
import '../../../data/models.dart';
import '../../../utils/app_theme.dart';
import '../../../utils/l10n.dart';
import '../../../widgets/ui_kit.dart';
import '../../paywall/paywall_screen.dart';

/// Shared look + wording for goals (list, detail, sheet).
extension GoalUi on Goal {
  String displayTitle(AppLocalizations l) => title.trim().isNotEmpty ? title.trim() : defaultTitle(l, type, target);

  String description(AppLocalizations l) => switch (type) {
        GoalType.focusMinutes => l.goalsDescFocus(fmtMinutes(target, h: l.unitH, m: l.unitM)),
        GoalType.sessions => l.goalsDescSessions(target),
        GoalType.blockApps => l.goalsDescBlock(target),
        GoalType.phoneFree => l.goalsDescPhoneFree(target),
        GoalType.screenLimit => l.goalsDescScreen(fmtMinutes(target, h: l.unitH, m: l.unitM)),
      };

  IconData get icon => goalTypeIcon(type);
  Color get tone => goalTypeTone(type);

  /// Goals the user ticks off by hand.
  bool get isManual => type == GoalType.phoneFree || type == GoalType.screenLimit;

  /// Daily goals show today's progress; weekly-style ones show the week.
  bool get isDaily => type == GoalType.focusMinutes || type == GoalType.sessions;
}

String defaultTitle(AppLocalizations l, GoalType type, int target) => switch (type) {
      GoalType.focusMinutes => target % 60 == 0 ? l.goalsTitleFocusHours(target ~/ 60) : l.goalsTitleFocusDur(fmtMinutes(target, h: l.unitH, m: l.unitM)),
      GoalType.sessions => l.goalsTitleSessions(target),
      GoalType.blockApps => l.goalsTitleBlock,
      GoalType.phoneFree => l.goalsTitlePhoneFree,
      GoalType.screenLimit => l.goalsTitleScreen(fmtMinutes(target, h: l.unitH, m: l.unitM)),
    };

IconData goalTypeIcon(GoalType t) => switch (t) {
      GoalType.focusMinutes => Icons.bolt_rounded,
      GoalType.sessions => Icons.layers_rounded,
      GoalType.blockApps => Icons.shield_outlined,
      GoalType.phoneFree => Icons.nightlight_round,
      GoalType.screenLimit => Icons.smartphone_rounded,
    };

Color goalTypeTone(GoalType t) => switch (t) {
      GoalType.focusMinutes => Tone.violet,
      GoalType.sessions => AppPalette.violet,
      GoalType.blockApps => Tone.green,
      GoalType.phoneFree => Tone.amber,
      GoalType.screenLimit => Tone.red,
    };

String goalTypeLabel(AppLocalizations l, GoalType t) => switch (t) {
      GoalType.focusMinutes => l.goalsTypeFocus,
      GoalType.sessions => l.goalsTypeSessions,
      GoalType.blockApps => l.goalsTypeBlock,
      GoalType.phoneFree => l.goalsTypePhoneFree,
      GoalType.screenLimit => l.goalsTypeScreen,
    };

String goalCategoryLabel(AppLocalizations l, GoalCategory c) => switch (c) {
      GoalCategory.focus => l.goalsCatFocus,
      GoalCategory.discipline => l.goalsCatDiscipline,
      GoalCategory.wellness => l.goalsCatWellness,
    };

IconData goalCategoryIcon(GoalCategory c) => switch (c) {
      GoalCategory.focus => Icons.bolt_rounded,
      GoalCategory.discipline => Icons.shield_outlined,
      GoalCategory.wellness => Icons.spa_rounded,
    };

/// Progress the ring/bar shows (today for daily goals, week otherwise).
double goalShownProgress(AppRepo r, Goal g) => g.isDaily ? r.goalTodayProgress(g) : r.goalWeekProgress(g);

/// Progress 0..1 on one day.
double goalDayProgress(AppRepo r, Goal g, DateTime day) => switch (g.type) {
      GoalType.focusMinutes => (r.focusMinutesOn(day) / (g.target < 1 ? 1 : g.target)).clamp(0.0, 1.0),
      GoalType.sessions => (r.completedSessionsOn(day) / (g.target < 1 ? 1 : g.target)).clamp(0.0, 1.0),
      _ => r.goalMetOn(g, day) ? 1.0 : 0.0,
    };

/// Weekly denominator (days that count as "the week's target").
int goalWeekTarget(Goal g) => (g.type == GoalType.blockApps || g.type == GoalType.phoneFree) ? g.target : 7;

/// "3h 28m / 4h", "2 / 3 sessions", "4 / 7 days".
String goalProgressText(AppLocalizations l, AppRepo r, Goal g) {
  final t = dateOnly(r.now());
  return switch (g.type) {
    GoalType.focusMinutes =>
      '${fmtMinutes(r.focusMinutesOn(t), h: l.unitH, m: l.unitM)} / ${fmtMinutes(g.target, h: l.unitH, m: l.unitM)}',
    GoalType.sessions => l.goalsProgressSessions(r.completedSessionsOn(t), g.target),
    _ => l.goalsProgressDays(r.goalDaysThisWeek(g).clamp(0, goalWeekTarget(g)), goalWeekTarget(g)),
  };
}

/// Opens the add sheet, or the paywall when the free limit is reached.
Future<void> openNewGoal(BuildContext context) async {
  if (!AppRepo.instance.canAddGoal) {
    await Navigator.of(context).push(MaterialPageRoute(builder: (_) => const PaywallScreen()));
    return;
  }
  await showGoalSheet(context);
}

/// Toggle a manual goal for today, with feedback.
Future<void> checkInGoal(BuildContext context, Goal g) async {
  final l = context.l10n;
  final messenger = ScaffoldMessenger.of(context);
  await AppRepo.instance.toggleGoalToday(g);
  final on = AppRepo.instance.goalMetOn(g, dateOnly(AppRepo.instance.now()));
  messenger
    ..hideCurrentSnackBar()
    ..showSnackBar(SnackBar(content: Text(on ? l.goalsCheckedSnack : l.goalsUncheckedSnack)));
}

/// Confirm, then delete. Returns true when deleted.
Future<bool> confirmDeleteGoal(BuildContext context, Goal g) async {
  final l = context.l10n;
  final messenger = ScaffoldMessenger.of(context);
  final ok = await showDialog<bool>(
    context: context,
    builder: (ctx) => AlertDialog(
      title: Text(l.goalsDeleteQ),
      content: Text(l.goalsDeleteMsg),
      actions: [
        TextButton(onPressed: () => Navigator.pop(ctx, false), child: Text(l.cancel)),
        TextButton(
          onPressed: () => Navigator.pop(ctx, true),
          style: TextButton.styleFrom(foregroundColor: Tone.red),
          child: Text(l.goalsDelete),
        ),
      ],
    ),
  );
  if (ok != true) return false;
  await AppRepo.instance.deleteGoal(g.id);
  messenger.showSnackBar(SnackBar(content: Text(l.goalsDeletedSnack)));
  return true;
}

/// Add (goal == null) or edit a goal.
Future<void> showGoalSheet(BuildContext context, {Goal? goal}) {
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (_) => _GoalSheet(goal: goal),
  );
}

class _GoalSheet extends StatefulWidget {
  const _GoalSheet({this.goal});
  final Goal? goal;

  @override
  State<_GoalSheet> createState() => _GoalSheetState();
}

class _GoalSheetState extends State<_GoalSheet> {
  late GoalType _type = widget.goal?.type ?? GoalType.focusMinutes;
  late GoalCategory _cat = widget.goal?.category ?? GoalCategory.focus;
  late int _target = widget.goal?.target ?? _defaultTarget(_type);
  late final _title = TextEditingController(text: widget.goal?.title ?? '');

  static int _defaultTarget(GoalType t) => switch (t) {
        GoalType.focusMinutes => 120,
        GoalType.sessions => 3,
        GoalType.blockApps => 5,
        GoalType.phoneFree => 3,
        GoalType.screenLimit => 120,
      };

  static GoalCategory _defaultCat(GoalType t) => switch (t) {
        GoalType.focusMinutes || GoalType.sessions => GoalCategory.focus,
        GoalType.blockApps => GoalCategory.discipline,
        _ => GoalCategory.wellness,
      };

  // (min, max, step) per type.
  (int, int, int) get _range => switch (_type) {
        GoalType.focusMinutes => (15, 600, 15),
        GoalType.sessions => (1, 12, 1),
        GoalType.blockApps || GoalType.phoneFree => (1, 7, 1),
        GoalType.screenLimit => (30, 600, 15),
      };

  String _targetText(AppLocalizations l) => switch (_type) {
        GoalType.focusMinutes || GoalType.screenLimit => fmtMinutes(_target, h: l.unitH, m: l.unitM),
        _ => '$_target',
      };

  String _unitText(AppLocalizations l) => switch (_type) {
        GoalType.focusMinutes || GoalType.sessions => l.goalsPerDay,
        GoalType.screenLimit => l.goalsMaxPerDay,
        _ => l.goalsPerWeek,
      };

  @override
  void dispose() {
    _title.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    final l = context.l10n;
    final messenger = ScaffoldMessenger.of(context);
    final nav = Navigator.of(context);
    final g = widget.goal;
    if (g == null) {
      await AppRepo.instance.addGoal(Goal(
        id: 'g_${DateTime.now().microsecondsSinceEpoch}',
        title: _title.text.trim(),
        type: _type,
        category: _cat,
        target: _target,
      ));
    } else {
      g
        ..title = _title.text.trim()
        ..type = _type
        ..category = _cat
        ..target = _target;
      await AppRepo.instance.updateGoal(g);
    }
    nav.pop();
    messenger.showSnackBar(SnackBar(content: Text(g == null ? l.goalsCreatedSnack : l.goalsSavedSnack)));
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final c = context.colors;
    final (lo, hi, step) = _range;
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.viewInsetsOf(context).bottom),
      child: Container(
        decoration: BoxDecoration(
          color: context.isDark ? const Color(0xFF14122C) : Colors.white,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(AppRadius.card)),
          border: Border.all(color: c.glassBorder),
        ),
        child: SafeArea(
          top: false,
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(AppSpacing.gutter, 12, AppSpacing.gutter, AppSpacing.gutter),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: Container(width: 40, height: 4, decoration: BoxDecoration(color: c.dotInactive, borderRadius: BorderRadius.circular(2))),
                ),
                const SizedBox(height: 16),
                Text(widget.goal == null ? l.goalsNewGoal : l.goalsEditGoal, style: AppText.cardTitle.copyWith(fontSize: 20, color: c.textPrimary)),
                const SizedBox(height: 18),
                _label(l.goalsType),
                Wrap(spacing: 8, runSpacing: 8, children: [
                  for (final t in GoalType.values)
                    ChoiceChipP(
                      label: goalTypeLabel(l, t),
                      icon: goalTypeIcon(t),
                      selected: _type == t,
                      onTap: () => setState(() {
                        if (_type == t) return;
                        _type = t;
                        _target = _defaultTarget(t);
                        _cat = _defaultCat(t);
                      }),
                    ),
                ]),
                const SizedBox(height: 18),
                _label(l.goalsCategory),
                Wrap(spacing: 8, runSpacing: 8, children: [
                  for (final cat in GoalCategory.values)
                    ChoiceChipP(label: goalCategoryLabel(l, cat), icon: goalCategoryIcon(cat), selected: _cat == cat, onTap: () => setState(() => _cat = cat)),
                ]),
                const SizedBox(height: 18),
                _label(l.goalsTarget),
                PCard(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Row(children: [
                    RoundIconButton(icon: Icons.remove_rounded, onTap: () => setState(() => _target = (_target - step).clamp(lo, hi))),
                    Expanded(
                      child: Column(children: [
                        Text(_targetText(l), style: AppText.tileValue.copyWith(color: c.textPrimary)),
                        Text(_unitText(l), style: AppText.rowSub.copyWith(color: c.textMuted), maxLines: 1, overflow: TextOverflow.ellipsis),
                      ]),
                    ),
                    RoundIconButton(icon: Icons.add_rounded, onTap: () => setState(() => _target = (_target + step).clamp(lo, hi))),
                  ]),
                ),
                const SizedBox(height: 18),
                _label(l.goalsTitleOptional),
                TextField(
                  controller: _title,
                  maxLength: 40,
                  style: AppText.rowTitle.copyWith(color: c.textPrimary),
                  decoration: InputDecoration(
                    hintText: defaultTitle(l, _type, _target),
                    hintStyle: AppText.rowTitle.copyWith(color: c.textMuted),
                    counterText: '',
                    filled: true,
                    fillColor: c.glassFill,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(AppRadius.tile), borderSide: BorderSide(color: c.glassBorder)),
                    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(AppRadius.tile), borderSide: BorderSide(color: c.glassBorder)),
                    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(AppRadius.tile), borderSide: const BorderSide(color: AppPalette.violet)),
                  ),
                ),
                const SizedBox(height: 22),
                FilledButton(
                  key: const Key('goalSheetSave'),
                  onPressed: _save,
                  style: FilledButton.styleFrom(
                    backgroundColor: AppPalette.accent,
                    foregroundColor: Colors.white,
                    minimumSize: const Size.fromHeight(54),
                    shape: const StadiumBorder(),
                    textStyle: AppText.button,
                  ),
                  child: Text(widget.goal == null ? l.goalsCreate : l.goalsSave),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _label(String t) => Padding(
        padding: const EdgeInsetsDirectional.only(bottom: 8, start: 2),
        child: Text(t, style: AppText.rowSub.copyWith(fontWeight: FontWeight.w700, color: context.colors.textSecondary)),
      );
}

/// Small "Done" pill.
class GoalDonePill extends StatelessWidget {
  const GoalDonePill({super.key});
  @override
  Widget build(BuildContext context) => Pill(context.l10n.goalsDone, color: Tone.green, icon: Icons.check_rounded);
}

/// Progress bar (same look as PBar; fill always visible — see lead report).
class GoalBar extends StatelessWidget {
  const GoalBar({super.key, required this.value, this.color = Tone.violet, this.height = 8});
  final double value;
  final Color color;
  final double height;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(height),
      child: SizedBox(
        height: height,
        width: double.infinity,
        child: Stack(fit: StackFit.expand, children: [
          ColoredBox(color: context.colors.dotInactive),
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
        ]),
      ),
    );
  }
}
