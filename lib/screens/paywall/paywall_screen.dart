import 'package:flutter/material.dart';

import '../../data/app_repo.dart';
import '../../utils/app_theme.dart';
import '../../utils/l10n.dart';
import '../../widgets/glow_background.dart';
import '../../widgets/ui_kit.dart';

enum PaywallPlan { monthly, yearly, lifetime }

/// Pausey Pro paywall. Purchases are local for now (AppRepo.setPremium); store billing comes later.
class PaywallScreen extends StatefulWidget {
  const PaywallScreen({super.key});

  @override
  State<PaywallScreen> createState() => _PaywallScreenState();
}

class _PaywallScreenState extends State<PaywallScreen> {
  PaywallPlan _plan = PaywallPlan.yearly;

  // Display prices; replace with store product prices when billing is added.
  static const _monthly = r'$9.99', _yearlyPerMonth = r'$2.99', _yearly = r'$35.99', _lifetime = r'$79.99';
  static const _savePct = 70;

  void _close() {
    final nav = Navigator.of(context);
    if (nav.canPop()) nav.pop();
  }

  Future<void> _buy() async {
    final messenger = ScaffoldMessenger.of(context);
    final l = context.l10n;
    await AppRepo.instance.setPremium(true);
    messenger.showSnackBar(SnackBar(content: Text(l.homePwWelcome)));
    if (mounted) _close();
  }

  void _restore() {
    final l = context.l10n;
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(AppRepo.instance.premium ? l.homePwRestored : l.homePwNothingToRestore)));
  }

  void _soon() {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(context.l10n.homePwLinkSoon)));
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final c = context.colors;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: GlowBackground(
        child: SafeArea(
          child: ListenableBuilder(
            listenable: AppRepo.instance,
            builder: (context, _) {
              final premium = AppRepo.instance.premium;
              return ListView(
                padding: const EdgeInsets.fromLTRB(AppSpacing.gutter, 8, AppSpacing.gutter, 32),
                children: [
                  Align(
                    alignment: AlignmentDirectional.centerEnd,
                    child: RoundIconButton(icon: Icons.close_rounded, tooltip: l.homePwClose, onTap: _close),
                  ),
                  const SizedBox(height: 4),
                  Center(
                    child: TweenAnimationBuilder<double>(
                      tween: Tween(begin: 0.6, end: 1),
                      duration: const Duration(milliseconds: 600),
                      curve: Curves.easeOutBack,
                      builder: (_, s, ch) => Transform.scale(scale: s, child: ch),
                      child: Container(
                        width: 64,
                        height: 64,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          gradient: const LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [Color(0xFFFFC94D), Tone.amber]),
                          boxShadow: [BoxShadow(color: Tone.amber.withValues(alpha: 0.4), blurRadius: 24, offset: const Offset(0, 8))],
                        ),
                        child: const Icon(Icons.workspace_premium_rounded, size: 34, color: Color(0xFF3A2400)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    l.homePwTitle,
                    textAlign: TextAlign.center,
                    style: AppText.screenTitle.copyWith(color: c.textPrimary),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    l.homePwSubtitle,
                    textAlign: TextAlign.center,
                    style: AppText.rowSub.copyWith(fontSize: 14, color: c.textSecondary),
                  ),
                  const SizedBox(height: 22),
                  if (premium) ...[
                    PCard(
                      accent: Tone.green,
                      child: Row(
                        children: [
                          const IconBadge(icon: Icons.verified_rounded, color: Tone.green),
                          const SizedBox(width: 14),
                          Expanded(
                            child: Text(l.homePwYouArePro, style: AppText.rowTitle.copyWith(color: c.textPrimary)),
                          ),
                        ],
                      ),
                    ),
                  ] else ...[
                    _PlanCard(
                      selected: _plan == PaywallPlan.monthly,
                      title: l.homePwMonthly,
                      sub: l.homePwBilledMonthly,
                      price: _monthly,
                      unit: l.homePwPerMonth,
                      onTap: () => setState(() => _plan = PaywallPlan.monthly),
                    ),
                    const SizedBox(height: 12),
                    _PlanCard(
                      selected: _plan == PaywallPlan.yearly,
                      title: l.homePwYearly,
                      badges: [
                        Pill(l.homePwPopular, filled: true),
                        Pill(l.homePwSave(_savePct), color: Tone.green),
                      ],
                      sub: l.homePwBilledYearly(_yearly),
                      price: _yearlyPerMonth,
                      unit: l.homePwPerMonth,
                      onTap: () => setState(() => _plan = PaywallPlan.yearly),
                    ),
                    const SizedBox(height: 12),
                    _PlanCard(
                      selected: _plan == PaywallPlan.lifetime,
                      title: l.homePwLifetime,
                      badges: [Pill(l.homePwBestValue, color: Tone.amber)],
                      sub: l.homePwPayOnce,
                      price: _lifetime,
                      unit: l.homePwOnce,
                      onTap: () => setState(() => _plan = PaywallPlan.lifetime),
                    ),
                    const SizedBox(height: 18),
                    _BuyButton(key: const ValueKey('paywall_buy'), label: _plan == PaywallPlan.lifetime ? l.homePwBuyLifetime : l.homePwStartTrial, onTap: _buy),
                    const SizedBox(height: 8),
                    Text(
                      _plan == PaywallPlan.lifetime ? l.homePwOneTime : l.homePwNoCharge,
                      textAlign: TextAlign.center,
                      style: AppText.rowSub.copyWith(fontSize: 12, color: c.textMuted),
                    ),
                  ],
                  const SizedBox(height: 22),
                  const _FeatureTable(),
                  const SizedBox(height: 18),
                  IntrinsicHeight(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: _Trust(icon: Icons.verified_user_rounded, color: Tone.green, label: l.homePwSecure),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: _Trust(icon: Icons.autorenew_rounded, color: Tone.green, label: l.homePwCancelAnytime),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: _Trust(icon: Icons.lock_rounded, color: Tone.green, label: l.homePwPrivacyFirst),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 18),
                  Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 6,
                    runSpacing: 4,
                    children: [
                      _FooterLink(key: const ValueKey('paywall_restore'), text: l.homePwRestore, onTap: _restore),
                      _FooterLink(text: l.homePwTerms, onTap: _soon),
                      _FooterLink(text: l.homePwPrivacyPolicy, onTap: _soon),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class _PlanCard extends StatelessWidget {
  const _PlanCard({required this.selected, required this.title, required this.sub, required this.price, required this.unit, required this.onTap, this.badges = const []});

  final bool selected;
  final String title, sub, price, unit;
  final List<Widget> badges;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final r = BorderRadius.circular(AppRadius.card);
    return Semantics(
      selected: selected,
      button: true,
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          onTap: onTap,
          borderRadius: r,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 220),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            decoration: BoxDecoration(
              borderRadius: r,
              color: selected ? AppPalette.accent.withValues(alpha: context.isDark ? 0.22 : 0.10) : (context.isDark ? const Color(0xFF14122C) : Colors.white),
              border: Border.all(color: selected ? AppPalette.violet : c.glassBorder, width: selected ? 1.5 : 1),
            ),
            child: Row(
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 220),
                  width: 22,
                  height: 22,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: selected ? AppPalette.violet : Colors.transparent,
                    border: Border.all(color: selected ? AppPalette.violet : c.textMuted, width: 1.5),
                  ),
                  child: selected ? const Center(child: CircleAvatar(radius: 4, backgroundColor: Colors.white)) : null,
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Wrap(
                        spacing: 6,
                        runSpacing: 4,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Text(
                            title,
                            style: AppText.rowTitle.copyWith(fontWeight: FontWeight.w800, color: c.textPrimary),
                          ),
                          ...badges,
                        ],
                      ),
                      const SizedBox(height: 3),
                      Text(sub, style: AppText.rowSub.copyWith(fontSize: 12, color: c.textMuted)),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(price, style: AppText.tileValue.copyWith(color: c.textPrimary)),
                    Text(unit, style: AppText.rowSub.copyWith(fontSize: 12, color: c.textMuted)),
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

class _FeatureTable extends StatelessWidget {
  const _FeatureTable();

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final c = context.colors;
    final maxApps = l.homePwMax(AppRepo.freeMaxApps);
    final maxGoals = l.homePwMax(AppRepo.freeMaxGoals);
    // (icon, label, free value: null = no, '' = yes, text = limit)
    final rows = <(IconData, String, String?)>[
      (Icons.shield_outlined, l.homePwFeatBlocking, maxApps),
      (Icons.bolt_rounded, l.homePwFeatSessions, null),
      (Icons.track_changes_rounded, l.homePwFeatGoals, maxGoals),
      (Icons.bar_chart_rounded, l.homePwFeatAnalytics, null),
      (Icons.local_fire_department_outlined, l.homePwFeatStreak, null),
      (Icons.nightlight_round, l.homePwFeatSchedule, null),
      (Icons.lock_outline_rounded, l.homePwFeatFaceId, null),
      (Icons.notifications_none_rounded, l.homePwFeatNotif, ''),
    ];
    Widget yes() => const CircleAvatar(
      radius: 11,
      backgroundColor: Color(0x337C5CFC),
      child: Icon(Icons.check_rounded, size: 14, color: AppPalette.violet),
    );
    Widget no() => CircleAvatar(
      radius: 11,
      backgroundColor: c.glassFill,
      child: Icon(Icons.close_rounded, size: 12, color: c.textMuted),
    );
    const colW = 64.0;
    return PCard(
      padding: EdgeInsets.zero,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16, 14, 8, 12),
            child: Row(
              children: [
                const Expanded(child: SizedBox()),
                SizedBox(
                  width: colW,
                  child: Text(
                    l.homePwFree,
                    textAlign: TextAlign.center,
                    style: AppText.rowSub.copyWith(fontSize: 12, color: c.textMuted),
                  ),
                ),
                SizedBox(
                  width: colW,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.workspace_premium_rounded, size: 14, color: Tone.amber),
                      const SizedBox(width: 3),
                      Text(
                        l.homePwProCol,
                        style: AppText.rowSub.copyWith(fontSize: 12, fontWeight: FontWeight.w700, color: Tone.amber),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          for (final r in rows) ...[
            Divider(height: 1, thickness: 1, color: c.divider),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(16, 11, 8, 11),
              child: Row(
                children: [
                  Icon(r.$1, size: 16, color: c.textSecondary),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(r.$2, style: AppText.rowSub.copyWith(color: c.textPrimary)),
                  ),
                  SizedBox(
                    width: colW,
                    child: Center(
                      child: r.$3 == null
                          ? no()
                          : r.$3!.isEmpty
                          ? yes()
                          : Text(
                              r.$3!,
                              textAlign: TextAlign.center,
                              style: AppText.rowSub.copyWith(fontSize: 12, color: c.textMuted),
                            ),
                    ),
                  ),
                  SizedBox(
                    width: colW,
                    child: Center(child: yes()),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _Trust extends StatelessWidget {
  const _Trust({required this.icon, required this.color, required this.label});
  final IconData icon;
  final Color color;
  final String label;

  @override
  Widget build(BuildContext context) {
    return PCard(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 14),
      child: Column(
        children: [
          Icon(icon, size: 20, color: color),
          const SizedBox(height: 6),
          Text(
            label,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: AppText.rowSub.copyWith(fontSize: 12, color: context.colors.textSecondary),
          ),
        ],
      ),
    );
  }
}

class _FooterLink extends StatelessWidget {
  const _FooterLink({super.key, required this.text, required this.onTap});
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => InkWell(
    onTap: onTap,
    borderRadius: BorderRadius.circular(8),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      child: Text(text, style: AppText.rowSub.copyWith(fontSize: 12, color: context.colors.textMuted)),
    ),
  );
}

class _BuyButton extends StatelessWidget {
  const _BuyButton({super.key, required this.label, required this.onTap});
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppRadius.chip),
        boxShadow: [BoxShadow(color: AppPalette.accent.withValues(alpha: 0.35), blurRadius: 22, offset: const Offset(0, 8))],
      ),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(AppRadius.chip),
          child: Ink(
            height: 58,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppRadius.chip),
              gradient: const LinearGradient(colors: [AppPalette.accent, AppPalette.violet]),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.bolt_rounded, color: Colors.white, size: 22),
                  const SizedBox(width: 10),
                  Flexible(
                    child: Text(
                      label,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppText.button.copyWith(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
