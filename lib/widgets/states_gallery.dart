import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart' show DateFormat;

import '../data/app_repo.dart';
import '../utils/app_theme.dart';
import '../utils/l10n.dart';
import 'glow_background.dart';
import 'states/skeletons.dart';
import 'states/state_views.dart';
import 'ui_kit.dart';

/// Pushed showcase of every error / empty / loading state. Retry buttons
/// really go loading → content (simulated), and you can bring the state back.
class StatesGallery extends StatefulWidget {
  const StatesGallery({super.key});

  @override
  State<StatesGallery> createState() => _StatesGalleryState();
}

enum _S { offline, perm, data, empty }

class _StatesGalleryState extends State<StatesGallery> {
  final Map<_S, ViewPhase> _phase = {for (final s in _S.values) s: ViewPhase.error};
  final Set<_S> _cached = {};
  bool _screenTime = false, _usage = false;
  int _attempts = 1;
  int _skelRun = 0;
  bool _skelLoading = true;
  final List<Timer> _timers = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    for (final t in _timers) {
      t.cancel();
    }
    super.dispose();
  }

  void _after(Duration d, VoidCallback f) => _timers.add(Timer(d, () {
        if (mounted) setState(f);
      }));

  void _retry(_S s, {bool cached = false, VoidCallback? onDone}) {
    setState(() {
      _phase[s] = ViewPhase.loading;
      if (s == _S.data && _attempts < 3) _attempts++;
    });
    _after(const Duration(milliseconds: 1600), () {
      _phase[s] = ViewPhase.content;
      cached ? _cached.add(s) : _cached.remove(s);
      onDone?.call();
    });
  }

  void _reset(_S s) => setState(() {
        _phase[s] = ViewPhase.error;
        if (s == _S.perm) _screenTime = _usage = false;
        if (s == _S.data) _attempts = 1;
      });

  void _replaySkeletons() {
    final run = ++_skelRun;
    setState(() => _skelLoading = true);
    _after(const Duration(seconds: 6), () {
      if (run == _skelRun) _skelLoading = false;
    });
  }

  void _snack(String t) => ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(SnackBar(content: Text(t)));

  Widget _section(String label, Color color, List<Widget> children) => Padding(
        padding: const EdgeInsets.only(top: 24),
        child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Row(children: [
            Container(width: 4, height: 16, decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(2))),
            const SizedBox(width: 8),
            Expanded(child: SectionLabel(label)),
          ]),
          const SizedBox(height: 12),
          for (var i = 0; i < children.length; i++) ...[if (i > 0) const SizedBox(height: 12), children[i]],
        ]),
      );

  Widget _done(String text, _S s, {Color color = Tone.green, String? sub, VoidCallback? onAgain}) => PCard(
        accent: color,
        child: Row(children: [
          IconBadge(icon: Icons.check_rounded, color: color),
          const SizedBox(width: 12),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(text, style: AppText.rowTitle.copyWith(color: context.colors.textPrimary)),
            if (sub != null) ...[const SizedBox(height: 2), Text(sub, style: AppText.rowSub.copyWith(color: context.colors.textSecondary))],
          ])),
          const SizedBox(width: 8),
          LinkText(onAgain == null ? context.l10n.statesShowAgain : context.l10n.statesReplay, onTap: onAgain ?? () => _reset(s)),
        ]),
      );

  Widget _spinCard(Color color) => PCard(
        accent: color,
        child: SizedBox(height: 120, child: Center(child: CircularProgressIndicator(color: color))),
      );

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final locale = Localizations.localeOf(context).toString();
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: GlowBackground(
        child: SafeArea(
          child: ListenableBuilder(
            listenable: AppRepo.instance,
            builder: (context, _) {
              final repo = AppRepo.instance;
              final week = fmtMinutes(repo.weekFocusMinutes.fold<int>(0, (a, b) => a + b), h: l.unitH, m: l.unitM);
              return ListView(
                padding: const EdgeInsets.only(bottom: 40),
                children: [
                  ScreenHeader(title: l.statesTitle, subtitle: l.statesSubtitle, onBack: () => Navigator.of(context).maybePop()),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: AppSpacing.gutter),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                      _section(l.statesNoInternet, Tone.red, [
                        AsyncStateSwitcher(
                          phase: _phase[_S.offline]!,
                          loading: _spinCard(Tone.red),
                          error: OfflineState(onRetry: () => _retry(_S.offline), onOpenSettings: () => _snack(l.statesOpenSettings)),
                          content: _done(l.statesBackOnline, _S.offline, sub: l.statesWeekFocus(week)),
                        ),
                        StateChecklist(
                          icon: Icons.wifi_off_rounded,
                          title: l.statesOfflineMode,
                          badge: _phase[_S.offline] == ViewPhase.content ? null : l.statesLimited,
                          items: [
                            StateCheckItem(l.statesCapSessions, ok: true),
                            StateCheckItem(l.statesCapApps, ok: true),
                            StateCheckItem(l.statesCapTimer, ok: true),
                            StateCheckItem(l.statesCapSync, ok: _phase[_S.offline] == ViewPhase.content),
                            StateCheckItem(l.statesCapAnalytics, ok: _phase[_S.offline] == ViewPhase.content),
                          ],
                        ),
                        StateNote(icon: Icons.info_outline_rounded, color: Tone.red, text: l.statesOfflineNote),
                      ]),
                      _section(l.statesPermDenied, Tone.amber, [
                        AsyncStateSwitcher(
                          phase: _phase[_S.perm]!,
                          loading: _spinCard(Tone.amber),
                          error: PermissionDeniedState(
                            onGrant: () => _retry(_S.perm, onDone: () => _screenTime = _usage = true),
                            onLearnMore: () => _snack(l.statesLearnMoreMsg),
                          ),
                          content: _done(l.statesAccessGranted, _S.perm),
                        ),
                        StateChecklist(
                          icon: Icons.checklist_rounded,
                          title: l.statesRequiredPerms,
                          color: Tone.amber,
                          badColor: Tone.amber,
                          items: [
                            StateCheckItem(l.statesPermNotif, ok: true, okLabel: l.statesGranted),
                            StateCheckItem(l.statesPermScreenTime, ok: _screenTime, okLabel: l.statesGranted, badLabel: l.statesDenied),
                            StateCheckItem(l.statesPermUsage, ok: _usage, okLabel: l.statesGranted, badLabel: l.statesDenied),
                            StateCheckItem(l.statesPermBio, ok: true, okLabel: l.statesGranted),
                          ],
                        ),
                        StateNote(icon: Icons.lock_outline_rounded, color: Tone.amber, text: l.statesPermNote),
                      ]),
                      _section(l.statesDataNA, Tone.violet, [
                        AsyncStateSwitcher(
                          phase: _phase[_S.data]!,
                          loading: const AnalyticsSkeleton(),
                          error: LoadFailedState(
                            onRetry: () => _retry(_S.data),
                            onUseCached: () => _retry(_S.data, cached: true),
                          ),
                          content: _done(_cached.contains(_S.data) ? l.statesCachedShown : l.statesDataLoaded, _S.data,
                              color: _cached.contains(_S.data) ? Tone.blue : Tone.green, sub: l.statesWeekFocus(week)),
                        ),
                        if (_phase[_S.data] != ViewPhase.content)
                          StateDetails(
                            title: l.statesErrorDetails,
                            trailing: '500',
                            rows: [
                              (l.statesErrorCode, 'ERR_FETCH_ANALYTICS'),
                              (l.statesTimestamp, DateFormat.yMMMd(locale).add_Hm().format(DateTime.now())),
                              (l.statesRetryCount, l.statesAttempts(_attempts)),
                            ],
                            footer: OutlinedButton.icon(
                              onPressed: () => _snack(l.statesReported),
                              icon: const Icon(Icons.chat_bubble_outline_rounded, size: 16),
                              label: Text(l.statesReport),
                              style: OutlinedButton.styleFrom(foregroundColor: context.colors.textSecondary, shape: const StadiumBorder(),
                                  side: BorderSide(color: context.colors.glassBorder)),
                            ),
                          ),
                        StateNote(icon: Icons.storage_rounded, text: l.statesCachedNote),
                      ]),
                      _section(l.statesEmpty, Tone.blue, [
                        AsyncStateSwitcher(
                          phase: _phase[_S.empty]!,
                          loading: _spinCard(Tone.blue),
                          error: EmptyState(
                            icon: Icons.timer_outlined,
                            title: l.statesEmptyTitle,
                            message: l.statesEmptyMsg,
                            actionLabel: l.statesStartFocus,
                            onAction: () => _retry(_S.empty),
                          ),
                          content: _done(l.statesWeekFocus(week), _S.empty),
                        ),
                      ]),
                      Padding(
                        padding: const EdgeInsets.only(top: 28),
                        child: Row(children: [
                          Expanded(child: Text(l.statesLoadingSection, style: AppText.cardTitle.copyWith(color: context.colors.textPrimary))),
                          LinkText(l.statesReplay, onTap: () => _skelLoading ? setState(() => _skelLoading = false) : _replaySkeletons()),
                        ]),
                      ),
                      ..._skeletonSection(l.statesDashLoading, Tone.violet, const DashboardSkeleton(), null),
                      ..._skeletonSection(l.statesAnalyticsLoading, Tone.violet, const AnalyticsSkeleton(), LoadingPill(l.statesCrunching)),
                      ..._skeletonSection(l.statesGoalsLoading, Tone.green, const GoalsSkeleton(), LoadingPill(l.statesLoadingGoals, color: Tone.green)),
                      ..._skeletonSection(l.statesProfileLoading, Tone.amber, const ProfileSkeleton(), LoadingPill(l.statesLoadingProfile, color: Tone.amber)),
                    ]),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  List<Widget> _skeletonSection(String label, Color color, Widget skeleton, Widget? pill) => [
        _section(label, color, [
          AsyncStateSwitcher(
            phase: _skelLoading ? ViewPhase.loading : ViewPhase.content,
            loading: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [skeleton, if (pill != null) ...[const SizedBox(height: 14), pill]]),
            error: const SizedBox.shrink(),
            content: _done(label, _S.empty, color: color, sub: context.l10n.statesWeekFocus(fmtMinutes(AppRepo.instance.weekFocusMinutes.fold<int>(0, (a, b) => a + b), h: context.l10n.unitH, m: context.l10n.unitM)), onAgain: _replaySkeletons),
          ),
        ]),
      ];
}
