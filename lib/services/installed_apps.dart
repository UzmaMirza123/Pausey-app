import 'dart:typed_data';

import 'package:flutter/widgets.dart';

import '../data/app_repo.dart';
import 'native_bridge.dart';

/// The apps really installed on this phone (Android), read once and refreshed
/// whenever Pausey comes back to the foreground (an app may have been installed or
/// removed meanwhile). Used by onboarding, App Lock and the icons everywhere.
///
/// When the list is known, managed apps that are not installed are dropped, so
/// the app only ever shows apps the user actually has.
class InstalledAppsCache extends ChangeNotifier with WidgetsBindingObserver {
  InstalledAppsCache._();
  static final InstalledAppsCache instance = InstalledAppsCache._();

  List<InstalledApp> apps = const [];

  /// A list was read successfully (it may still be empty on a broken device).
  bool loaded = false;

  /// The last read failed or returned nothing on Android.
  bool failed = false;
  bool _loading = false;
  bool _observing = false;

  bool get loading => _loading;

  /// Only Android exposes installed apps; elsewhere the app falls back to popular apps, labelled as such.
  bool get supported => NativeBridge.instance.isAndroid;

  Set<String> get packages => {for (final a in apps) a.packageName};

  bool isInstalled(String? pkg) => pkg != null && packages.contains(pkg);

  Uint8List? iconFor(String? pkg) {
    if (pkg == null) return null;
    for (final a in apps) {
      if (a.packageName == pkg) return a.icon;
    }
    return null;
  }

  /// Reads the list (no-op off Android). [force] re-reads even when loaded.
  Future<void> ensureLoaded({bool force = false}) async {
    if (!_observing && supported) {
      _observing = true;
      WidgetsBinding.instance.addObserver(this);
    }
    if (_loading || (loaded && !force) || !supported) return;
    _loading = true;
    notifyListeners();
    try {
      final list = await NativeBridge.instance.installedApps();
      failed = list.isEmpty;
      if (list.isNotEmpty) {
        apps = list;
        loaded = true;
        await AppRepo.instance.keepOnlyInstalled(packages);
      }
    } finally {
      _loading = false;
      notifyListeners();
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) ensureLoaded(force: true);
  }
}
