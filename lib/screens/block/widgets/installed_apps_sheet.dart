import 'package:flutter/material.dart';

import '../../../data/app_repo.dart';
import '../../../utils/app_theme.dart';
import '../../../utils/l10n.dart';
import '../../../widgets/ui_kit.dart';
import 'applock_ui.dart';

/// Android: pick apps installed on the phone (search, real icons, multi-select).
/// Returns the number of apps added.
Future<int?> showInstalledAppsSheet(BuildContext context) {
  return showModalBottomSheet<int>(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    backgroundColor: Colors.transparent,
    builder: (_) => const _InstalledAppsSheet(),
  );
}

class _InstalledAppsSheet extends StatefulWidget {
  const _InstalledAppsSheet();

  @override
  State<_InstalledAppsSheet> createState() => _InstalledAppsSheetState();
}

class _InstalledAppsSheetState extends State<_InstalledAppsSheet> {
  final _picked = <String>{};
  String _query = '';

  InstalledAppsCache get _cache => InstalledAppsCache.instance;

  @override
  void initState() {
    super.initState();
    _cache.ensureLoaded(force: true);
  }

  Future<void> _add() async {
    final nav = Navigator.of(context);
    final chosen = [
      for (final a in _cache.apps)
        if (_picked.contains(a.packageName)) (packageName: a.packageName, label: a.label),
    ];
    await AppRepo.instance.addInstalledApps(chosen);
    nav.pop(chosen.length);
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final c = context.colors;
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.85,
      child: SheetFrame(
        scroll: false,
        child: ListenableBuilder(
          listenable: _cache,
          builder: (context, _) {
            final managed = {for (final a in AppRepo.instance.apps) ?a.packageName};
            final q = _query.trim().toLowerCase();
            final list = [
              for (final a in _cache.apps)
                if (q.isEmpty || a.label.toLowerCase().contains(q) || a.packageName.toLowerCase().contains(q)) a,
            ];
            return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
              Text(l.alPickerTitle, style: AppText.cardTitle.copyWith(fontSize: 20, color: c.textPrimary)),
              const SizedBox(height: 12),
              TextField(
                key: const Key('installedSearch'),
                onChanged: (v) => setState(() => _query = v),
                style: AppText.rowTitle.copyWith(color: c.textPrimary),
                decoration: alFieldDecoration(context, hint: l.alSearchHint, prefixIcon: Icon(Icons.search_rounded, color: c.textMuted), radius: AppRadius.chip),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: !_cache.loaded
                    ? const Center(child: CircularProgressIndicator())
                    : list.isEmpty
                        ? Center(child: Text(l.alPickerEmpty, style: AppText.rowSub.copyWith(color: c.textMuted)))
                        : ListView.builder(
                            itemCount: list.length,
                            itemBuilder: (context, i) {
                              final a = list[i];
                              final already = managed.contains(a.packageName);
                              final on = already || _picked.contains(a.packageName);
                              return InkWell(
                                borderRadius: BorderRadius.circular(AppRadius.tile),
                                onTap: already ? null : () => setState(() => _picked.contains(a.packageName) ? _picked.remove(a.packageName) : _picked.add(a.packageName)),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                                  child: Row(children: [
                                    InstalledIcon(a.icon, size: 40),
                                    const SizedBox(width: 12),
                                    Expanded(
                                      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                        Text(a.label, style: AppText.rowTitle.copyWith(color: c.textPrimary), maxLines: 1, overflow: TextOverflow.ellipsis),
                                        Text(already ? l.alPickerAdded : a.packageName,
                                            style: AppText.small.copyWith(color: c.textMuted), maxLines: 1, overflow: TextOverflow.ellipsis),
                                      ]),
                                    ),
                                    Checkbox(
                                      value: on,
                                      onChanged: already ? null : (_) => setState(() => _picked.contains(a.packageName) ? _picked.remove(a.packageName) : _picked.add(a.packageName)),
                                      activeColor: AppPalette.accent,
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                                    ),
                                  ]),
                                ),
                              );
                            },
                          ),
              ),
              const SizedBox(height: 12),
              SheetButton(label: l.alPickerAdd(_picked.length), onPressed: _picked.isEmpty ? null : _add),
            ]);
          },
        ),
      ),
    );
  }
}

/// Inline link row "Choose from installed apps" (shown on Android only).
class InstalledAppsLink extends StatelessWidget {
  const InstalledAppsLink({super.key, required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final c = context.colors;
    return PCard(
      key: const Key('installedAppsLink'),
      onTap: onTap,
      padding: const EdgeInsetsDirectional.fromSTEB(14, 12, 12, 12),
      child: Row(children: [
        const IconBadge(icon: Icons.apps_rounded, color: Tone.blue, size: 36),
        const SizedBox(width: 12),
        Expanded(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(l.alFromInstalled, style: AppText.rowTitle.copyWith(color: c.textPrimary), maxLines: 2, overflow: TextOverflow.ellipsis),
            Text(l.alFromInstalledSub, style: AppText.rowSub.copyWith(color: c.textMuted), maxLines: 2, overflow: TextOverflow.ellipsis),
          ]),
        ),
        Icon(Icons.chevron_right_rounded, color: c.textMuted),
      ]),
    );
  }
}
