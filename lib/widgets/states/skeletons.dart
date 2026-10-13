import 'package:flutter/material.dart';

import '../../utils/app_theme.dart';
import '../ui_kit.dart';

/// Loading skeleton layouts (Loading States design). Each mirrors the shape of a
/// real screen so content doesn't jump when it arrives.

class _Card extends StatelessWidget {
  const _Card({required this.child, this.accent});
  final Widget child;
  final Color? accent;
  @override
  Widget build(BuildContext context) => PCard(accent: accent, child: child);
}

class _Gap extends SizedBox {
  const _Gap([double h = 12]) : super(height: h);
}

/// Tile skeleton: dot + two lines.
class SkeletonTile extends StatelessWidget {
  const SkeletonTile({super.key, this.accent});
  final Color? accent;
  @override
  Widget build(BuildContext context) => _Card(
        accent: accent,
        child: const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: [Skeleton(height: 22, circle: true), SizedBox(width: 8), Expanded(child: Skeleton(height: 10))]),
          _Gap(14),
          Skeleton(width: 60, height: 18),
          _Gap(10),
          Skeleton(height: 6),
        ]),
      );
}

/// List-card skeleton with [rows] avatar rows.
class SkeletonList extends StatelessWidget {
  const SkeletonList({super.key, this.rows = 3, this.header = true});
  final int rows;
  final bool header;
  @override
  Widget build(BuildContext context) => _Card(
        child: Column(children: [
          if (header) const Row(children: [Expanded(child: Skeleton(height: 12)), SizedBox(width: 80), Skeleton(width: 40, height: 10)]),
          for (var i = 0; i < rows; i++) ...[
            const _Gap(16),
            const Row(children: [
              Skeleton(height: 34, circle: true),
              SizedBox(width: 12),
              Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Skeleton(height: 11), SizedBox(height: 6), Skeleton(width: 90, height: 9)])),
              SizedBox(width: 24),
              Skeleton(width: 34, height: 10),
            ]),
          ],
        ]),
      );
}

Widget _row3(List<Widget> w) => Row(children: [
      for (var i = 0; i < w.length; i++) ...[if (i > 0) const SizedBox(width: 10), Expanded(child: w[i])],
    ]);

/// Home / dashboard skeleton.
class DashboardSkeleton extends StatelessWidget {
  const DashboardSkeleton({super.key});
  @override
  Widget build(BuildContext context) => Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        const Row(children: [
          Skeleton(height: 44, circle: true),
          SizedBox(width: 12),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Skeleton(height: 12), SizedBox(height: 6), Skeleton(width: 80, height: 9)])),
          SizedBox(width: 40),
          SizedBox(width: 22, height: 22, child: CircularProgressIndicator(strokeWidth: 2, color: Tone.violet)),
        ]),
        const _Gap(AppSpacing.section),
        _row3([SkeletonTile(accent: Tone.violet), SkeletonTile(accent: Tone.amber), SkeletonTile(accent: Tone.green)].cast<Widget>()),
        const _Gap(AppSpacing.section),
        PCard(
          gradient: heroGradient,
          child: const Row(children: [
            Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Skeleton(width: 120, height: 12), _Gap(10), Skeleton(height: 9), _Gap(16), Skeleton(width: 130, height: 34, radius: 99),
            ])),
            SizedBox(width: 20),
            SizedBox(width: 30, height: 30, child: CircularProgressIndicator(strokeWidth: 2.5, color: Colors.white70)),
          ]),
        ),
        const _Gap(AppSpacing.section),
        _Card(child: Column(children: [
          const Row(children: [Skeleton(width: 120, height: 12), Spacer(), Skeleton(width: 40, height: 10)]),
          const _Gap(16),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            for (var i = 0; i < 5; i++) const Column(children: [Skeleton(height: 34, circle: true), SizedBox(height: 6), Skeleton(width: 24, height: 8)]),
          ]),
        ])),
        const _Gap(AppSpacing.section),
        const SkeletonList(),
      ]);
}

/// Insights / analytics skeleton.
class AnalyticsSkeleton extends StatelessWidget {
  const AnalyticsSkeleton({super.key});
  static const _bars = [24.0, 44.0, 26.0, 62.0, 32.0, 48.0, 18.0];
  @override
  Widget build(BuildContext context) => Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        const Row(children: [
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Skeleton(width: 110, height: 12), SizedBox(height: 6), Skeleton(width: 70, height: 9)])),
          Skeleton(width: 44, height: 28, radius: 99), SizedBox(width: 6), Skeleton(width: 44, height: 28, radius: 99), SizedBox(width: 6), Skeleton(width: 44, height: 28, radius: 99),
        ]),
        const _Gap(AppSpacing.section),
        _Card(child: Column(children: [
          const Row(children: [Skeleton(width: 120, height: 12), Spacer(), Skeleton(width: 50, height: 10)]),
          const _Gap(18),
          SizedBox(
            height: 80,
            child: Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
              for (final h in _bars) Expanded(child: Padding(padding: const EdgeInsets.symmetric(horizontal: 4), child: Skeleton(height: h, radius: 10))),
            ]),
          ),
        ])),
        const _Gap(AppSpacing.section),
        Row(children: const [Expanded(child: SkeletonTile(accent: Tone.violet)), SizedBox(width: 10), Expanded(child: SkeletonTile(accent: Tone.green))]),
        const _Gap(AppSpacing.section),
        _Card(child: Row(children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: context.colors.dotInactive, width: 9)),
          ),
          const SizedBox(width: 20),
          Expanded(child: Column(children: [
            for (final col in [Tone.violet, Tone.blue, Tone.green])
              Padding(padding: const EdgeInsets.symmetric(vertical: 5), child: Row(children: [
                Container(width: 8, height: 8, decoration: BoxDecoration(shape: BoxShape.circle, color: col.withValues(alpha: 0.7))),
                const SizedBox(width: 10),
                const Expanded(child: Skeleton(height: 9)),
              ])),
          ])),
        ])),
      ]);
}

/// Goals list skeleton.
class GoalsSkeleton extends StatelessWidget {
  const GoalsSkeleton({super.key, this.count = 3});
  final int count;
  static const _tones = [Tone.green, Tone.violet, Tone.amber];
  static const _fill = [0.72, 0.38, 0.9];
  @override
  Widget build(BuildContext context) => Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Row(children: [for (var i = 0; i < 4; i++) ...[if (i > 0) const SizedBox(width: 8), const Expanded(child: Skeleton(height: 30, radius: 99))]]),
        for (var i = 0; i < count; i++) ...[
          const _Gap(AppSpacing.section),
          _Card(
            accent: _tones[i % 3],
            child: Column(children: [
              Row(children: [
                Container(width: 34, height: 34, decoration: BoxDecoration(shape: BoxShape.circle, color: _tones[i % 3].withValues(alpha: 0.25))),
                const SizedBox(width: 12),
                const Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Skeleton(height: 11), SizedBox(height: 6), Skeleton(width: 80, height: 9)])),
                const SizedBox(width: 30),
                const Skeleton(width: 34, height: 18, radius: 99),
              ]),
              const _Gap(14),
              PBar(value: _fill[i % 3], color: _tones[i % 3].withValues(alpha: 0.6)),
            ]),
          ),
        ],
      ]);
}

/// Profile skeleton.
class ProfileSkeleton extends StatelessWidget {
  const ProfileSkeleton({super.key});
  @override
  Widget build(BuildContext context) => Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        PCard(
          gradient: heroGradient,
          child: Column(children: [
            Row(children: [
              Container(width: 64, height: 64, decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white.withValues(alpha: 0.18))),
              const SizedBox(width: 16),
              const Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Skeleton(width: 110, height: 12), _Gap(8), Skeleton(height: 9), _Gap(10), Skeleton(width: 70, height: 18, radius: 99),
              ])),
            ]),
            const _Gap(18),
            Row(children: [for (var i = 0; i < 3; i++) ...[if (i > 0) const SizedBox(width: 8), const Expanded(child: Skeleton(height: 24, radius: 99))]]),
          ]),
        ),
        const _Gap(AppSpacing.section),
        Row(children: const [Expanded(child: SkeletonTile(accent: Tone.violet)), SizedBox(width: 10), Expanded(child: SkeletonTile(accent: Tone.green))]),
        const _Gap(10),
        Row(children: const [Expanded(child: SkeletonTile(accent: Tone.amber)), SizedBox(width: 10), Expanded(child: SkeletonTile(accent: Tone.blue))]),
        const _Gap(AppSpacing.section),
        const SkeletonList(rows: 4, header: false),
      ]);
}
