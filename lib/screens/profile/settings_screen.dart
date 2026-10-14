import 'dart:convert';

import 'package:flutter/material.dart';

import '../../widgets/time_picker.dart';
import 'package:flutter/services.dart';

import '../../data/app_repo.dart';
import '../../services/auth_service.dart';
import '../../utils/app_theme.dart';
import '../../utils/l10n.dart';
import '../../utils/theme_controller.dart';
import '../../widgets/glow_background.dart';
import '../../widgets/ui_kit.dart';
import '../paywall/paywall_screen.dart';
import 'widgets/profile_kit.dart';

/// Settings (from Profile). Every switch persists through AppRepo.updateSettings.
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  static const textScales = [0.9, 1.0, 1.15, 1.3];

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: GlowBackground(
        child: SafeArea(
          child: ListenableBuilder(
            listenable: Listenable.merge([AppRepo.instance, AuthService.instance, ThemeController.instance, LocaleController.instance]),
            builder: (context, _) {
              final r = AppRepo.instance;
              final s = r.settings;
              final dark = ThemeController.instance.isDark;
              final loc = LocaleController.instance.value;
              final name = profileName(context);
              final hasName = AuthService.instance.value.displayName.trim().isNotEmpty;
              final mins = l.profileMinutes;
              return ListView(
                padding: const EdgeInsets.only(bottom: 40),
                children: [
                  ScreenHeader(title: l.profileSettings, onBack: () => Navigator.of(context).maybePop()),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(AppSpacing.gutter, 8, AppSpacing.gutter, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        PCard(
                          onTap: isGuest ? () => editGuestName(context) : null,
                          padding: const EdgeInsets.all(14),
                          child: Row(children: [
                            ProfileAvatar(name: hasName ? name : null, size: 48, online: false),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                Text(name, maxLines: 1, overflow: TextOverflow.ellipsis, style: AppText.rowTitle.copyWith(color: context.colors.textPrimary)),
                                Text(profileEmail ?? l.profileGuestBadge, maxLines: 1, overflow: TextOverflow.ellipsis, style: AppText.rowSub.copyWith(fontSize: 12, color: context.colors.textMuted)),
                              ]),
                            ),
                            const SizedBox(width: 8),
                            InkWell(
                              onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const PaywallScreen())),
                              child: r.premium
                                  ? const Pill('Pro', color: Tone.amber, icon: Icons.workspace_premium_rounded)
                                  : Pill(l.profileUpgrade, color: Tone.violet, icon: Icons.workspace_premium_rounded),
                            ),
                          ]),
                        ),
                        SectionLabel(l.profileSecNotifications),
                        PGroup(children: [
                          _toggle(Icons.notifications_rounded, Tone.violet, l.profilePush, l.profilePushSub, s.push, (v) => r.updateSettings((x) => x.push = v)),
                          PListTile(
                            icon: Icons.bolt_rounded,
                            color: Tone.amber,
                            title: l.profileReminder,
                            subtitle: s.focusReminder ? l.profileReminderSub(_time(context, s.reminderMinutes)) : l.profileOff,
                            onTap: () => _pickTime(context),
                            trailing: PSwitch(value: s.focusReminder, color: Tone.amber, onChanged: (v) => r.updateSettings((x) => x.focusReminder = v)),
                          ),
                          _toggle(Icons.local_fire_department_rounded, Tone.amber, l.profileStreakAlerts, l.profileStreakAlertsSub, s.streakAlerts, (v) => r.updateSettings((x) => x.streakAlerts = v)),
                          _toggle(Icons.track_changes_rounded, Tone.green, l.profileGoalMilestones, l.profileGoalMilestonesSub, s.goalMilestones, (v) => r.updateSettings((x) => x.goalMilestones = v)),
                        ]),
                        SectionLabel(l.profileSecAppearance),
                        PGroup(children: [
                          _toggle(Icons.dark_mode_rounded, Tone.violet, l.profileDarkMode, dark ? l.profileOn : l.profileOff, dark,
                              (v) => ThemeController.instance.set(v ? ThemeMode.dark : ThemeMode.light)),
                          PListTile(
                            icon: Icons.text_fields_rounded,
                            color: Tone.blue,
                            title: l.profileTextSize,
                            subtitle: _scaleName(l, s.textScale),
                            onTap: () => _pickTextSize(context),
                          ),
                          PListTile(
                            icon: Icons.language_rounded,
                            color: Tone.pink,
                            title: l.language,
                            subtitle: loc == null ? l.phoneLanguage : LocaleController.names[loc.languageCode],
                            onTap: () => _pickLanguage(context),
                          ),
                        ]),
                        SectionLabel(l.profileSecFocus),
                        PGroup(children: [
                          PListTile(icon: Icons.timer_rounded, title: l.profilePomodoroLen, subtitle: mins(s.pomodoroMinutes),
                              onTap: () => _pickNumber(context, l.profilePomodoroLen, const [15, 20, 25, 30, 45, 50, 60], s.pomodoroMinutes, mins, (v) => r.updateSettings((x) => x.pomodoroMinutes = v))),
                          PListTile(icon: Icons.coffee_rounded, color: Tone.green, title: l.profileBreakLen, subtitle: mins(s.breakMinutes),
                              onTap: () => _pickNumber(context, l.profileBreakLen, const [3, 5, 10, 15, 20], s.breakMinutes, mins, (v) => r.updateSettings((x) => x.breakMinutes = v))),
                          _toggle(Icons.face_rounded, Tone.blue, l.profileFaceIdUnlock, l.profileFaceIdUnlockSub, r.faceIdProtection, (v) => r.setFaceIdProtection(v)),
                          PListTile(
                            icon: Icons.emergency_rounded,
                            color: Tone.red,
                            title: l.profileBypass,
                            subtitle: s.emergencyBypass ? l.profileBypassSub(s.bypassPerDay) : l.profileOff,
                            onTap: s.emergencyBypass
                                ? () => _pickNumber(context, l.profileBypass, const [1, 2, 3, 4, 5], s.bypassPerDay, l.profileBypassSub, (v) => r.updateSettings((x) => x.bypassPerDay = v))
                                : null,
                            trailing: PSwitch(value: s.emergencyBypass, color: Tone.red, onChanged: (v) => r.updateSettings((x) => x.emergencyBypass = v)),
                          ),
                        ]),
                        SectionLabel(l.profileSecPrivacy),
                        PGroup(children: [
                          _toggle(Icons.lock_rounded, Tone.green, l.profileAppLock, l.profileAppLockSub, s.biometricLock, (v) => r.updateSettings((x) => x.biometricLock = v), Tone.green),
                          _toggle(Icons.visibility_off_rounded, Tone.violet, l.profileHideUsage, l.profileHideUsageSub, s.hideUsage, (v) => r.updateSettings((x) => x.hideUsage = v)),
                          PListTile(icon: Icons.delete_rounded, title: l.profileClearData, subtitle: l.profileClearDataSub, destructive: true, onTap: () => _clear(context)),
                        ]),
                        SectionLabel(l.profileSecAccount),
                        PGroup(children: [
                          PListTile(
                            icon: Icons.credit_card_rounded,
                            color: Tone.amber,
                            title: l.profileSubscription,
                            subtitle: r.premium ? l.profileProActive : l.profileFree,
                            onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const PaywallScreen())),
                          ),
                          PListTile(icon: Icons.download_rounded, title: l.profileExport, subtitle: l.profileExportSub, onTap: () => _export(context)),
                        ]),
                        const SizedBox(height: 20),
                        Text(l.versionLabel, textAlign: TextAlign.center, style: AppText.tiny.copyWith(color: context.colors.textMuted)),
                        const SizedBox(height: 16),
                        SignOutCard(onTap: () => confirmSignOut(context)),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _toggle(IconData icon, Color color, String title, String sub, bool value, ValueChanged<bool> onChanged, [Color? switchColor]) => PListTile(
        icon: icon,
        color: color,
        title: title,
        subtitle: sub,
        onTap: () => onChanged(!value),
        trailing: PSwitch(value: value, color: switchColor ?? (color == Tone.violet ? AppPalette.accent : color), onChanged: onChanged),
      );

  static String _time(BuildContext context, int m) =>
      MaterialLocalizations.of(context).formatTimeOfDay(TimeOfDay(hour: m ~/ 60, minute: m % 60), alwaysUse24HourFormat: MediaQuery.of(context).alwaysUse24HourFormat);

  static String _scaleName(AppLocalizations l, double v) => switch (textScales.indexWhere((x) => (x - v).abs() < 0.01)) {
        0 => l.profileTextSmall,
        2 => l.profileTextLarge,
        3 => l.profileTextHuge,
        _ => l.profileTextMedium,
      };

  Future<void> _pickTime(BuildContext context) async {
    final r = AppRepo.instance;
    final m = r.settings.reminderMinutes;
    final t = await showPTimePicker(context, initial: PTime.fromMinutes(m));
    if (t == null) return;
    await r.updateSettings((x) {
      x.reminderMinutes = t.hour * 60 + t.minute;
      x.focusReminder = true;
    });
  }

  Future<void> _sheet(BuildContext context, String title, List<(String, bool, VoidCallback)> options) {
    return showModalBottomSheet(
      context: context,
      showDragHandle: true,
      isScrollControlled: true,
      builder: (ctx) => SafeArea(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: MediaQuery.of(ctx).size.height * 0.7),
          child: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.fromLTRB(AppSpacing.gutter, 0, AppSpacing.gutter, 16),
            children: [
              Padding(padding: const EdgeInsets.only(bottom: 8), child: Text(title, style: AppText.cardTitle.copyWith(color: ctx.colors.textPrimary))),
              for (final (label, selected, onTap) in options)
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                  title: Text(label, style: AppText.rowTitle.copyWith(color: ctx.colors.textPrimary)),
                  trailing: selected ? const Icon(Icons.check_circle_rounded, color: AppPalette.accent) : null,
                  onTap: () {
                    onTap();
                    Navigator.pop(ctx);
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }

  void _pickTextSize(BuildContext context) {
    final l = context.l10n;
    final r = AppRepo.instance;
    _sheet(context, l.profileTextSize, [
      for (final v in textScales) (_scaleName(l, v), (r.settings.textScale - v).abs() < 0.01, () => r.updateSettings((x) => x.textScale = v)),
    ]);
  }

  void _pickLanguage(BuildContext context) {
    final l = context.l10n;
    final cur = LocaleController.instance.value?.languageCode;
    _sheet(context, l.language, [
      (l.phoneLanguage, cur == null, () => LocaleController.instance.set(null)),
      for (final e in LocaleController.names.entries) (e.value, cur == e.key, () => LocaleController.instance.set(e.key)),
    ]);
  }

  void _pickNumber(BuildContext context, String title, List<int> values, int current, String Function(int) label, ValueChanged<int> onPick) {
    _sheet(context, title, [for (final v in values) (label(v), v == current, () => onPick(v))]);
  }

  Future<void> _clear(BuildContext context) async {
    final l = context.l10n;
    final messenger = ScaffoldMessenger.of(context);
    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(l.profileClearTitle),
        content: Text(l.profileClearBody),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx, false), child: Text(l.cancel)),
          FilledButton(style: FilledButton.styleFrom(backgroundColor: Tone.red), onPressed: () => Navigator.pop(ctx, true), child: Text(l.profileClear)),
        ],
      ),
    );
    if (ok != true) return;
    await AppRepo.instance.clearActivity();
    messenger.showSnackBar(SnackBar(content: Text(l.profileCleared)));
  }

  Future<void> _export(BuildContext context) async {
    final l = context.l10n;
    final messenger = ScaffoldMessenger.of(context);
    final r = AppRepo.instance;
    final data = const JsonEncoder.withIndent('  ').convert({
      'exported': DateTime.now().toIso8601String(),
      'sessions': [for (final s in r.sessions) s.toJson()],
      'goals': [for (final g in r.goals) g.toJson()],
      'apps': [for (final a in r.apps) a.toJson()],
      'schedule': r.schedule.toJson(),
      'settings': r.settings.toJson(),
    });
    await Clipboard.setData(ClipboardData(text: data));
    messenger.showSnackBar(SnackBar(content: Text(l.profileExported)));
  }
}
