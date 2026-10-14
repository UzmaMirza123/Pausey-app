import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

/// An app installed on the phone (Android only).
class InstalledApp {
  const InstalledApp({required this.packageName, required this.label, this.icon});
  final String packageName;
  final String label;

  /// PNG bytes of the launcher icon.
  final Uint8List? icon;
}

/// What the phone currently allows Pausey to do.
class NativeStatus {
  const NativeStatus({
    this.supported = false,
    this.usageAccess = false,
    this.overlay = false,
    this.notifications = false,
    this.accessibility = false,
    this.batteryUnrestricted = false,
    this.serviceRunning = false,
    this.manufacturer = '',
  });

  /// Android device with the native plugin present.
  final bool supported;

  /// "Usage access" (PACKAGE_USAGE_STATS) granted: real usage numbers and foreground-app detection.
  final bool usageAccess;

  /// "Display over other apps" (SYSTEM_ALERT_WINDOW) granted: Pausey can show its block screen.
  final bool overlay;
  final bool notifications;

  /// Pausey's Accessibility Service is switched on: instant, reliable detection of the app on screen
  /// (it only reads which app is open — never screen content).
  final bool accessibility;
  final bool batteryUnrestricted;
  final bool serviceRunning;
  final String manufacturer;

  /// What blocking needs: usage access (time used + the app on screen) and a way to show the pause
  /// screen on top — "display over other apps" or the Accessibility Service.
  bool get canEnforce => supported && usageAccess && (overlay || accessibility);

  factory NativeStatus.fromMap(Map m) => NativeStatus(
        supported: true,
        usageAccess: m['usageAccess'] == true,
        overlay: m['overlay'] == true,
        notifications: m['notifications'] == true,
        accessibility: m['accessibility'] == true,
        batteryUnrestricted: m['batteryUnrestricted'] == true,
        serviceRunning: m['serviceRunning'] == true,
        manufacturer: (m['manufacturer'] as String? ?? '').toLowerCase(),
      );
}

/// Thin wrapper around the `pausey/native` MethodChannel (android/app/src/main/kotlin/.../NativeChannel.kt).
///
/// Every call is safe on web/iOS/tests: it returns an "unsupported" answer instead of throwing.
class NativeBridge {
  NativeBridge._();
  static final NativeBridge instance = NativeBridge._();

  static const _ch = MethodChannel('pausey/native');

  bool get _android => !kIsWeb && defaultTargetPlatform == TargetPlatform.android;

  /// Running on an Android phone (the only platform with the native side).
  bool get isAndroid => _android;

  Future<T?> _call<T>(String method, [Object? args]) async {
    if (!_android) return null;
    try {
      return await _ch.invokeMethod<T>(method, args);
    } on MissingPluginException {
      return null;
    } on PlatformException catch (e) {
      debugPrint('NativeBridge.$method failed: ${e.message}');
      return null;
    }
  }

  Future<NativeStatus> status() async {
    final m = await _call<Map>('status');
    return m == null ? const NativeStatus() : NativeStatus.fromMap(m);
  }

  Future<void> openUsageAccessSettings() => _call<void>('openUsageAccess');
  Future<void> openOverlaySettings() => _call<void>('openOverlay');
  Future<void> openNotificationSettings() => _call<void>('openNotifications');
  Future<void> openAccessibilitySettings() => _call<void>('openAccessibility');

  /// Android 13+: shows the system "Allow notifications?" dialog (opens settings if it was denied before).
  Future<void> requestNotifications() => _call<void>('requestNotifications');
  Future<void> openBatterySettings() => _call<void>('openBattery');

  Future<List<InstalledApp>> installedApps() async {
    final list = await _call<List>('installedApps') ?? const [];
    return [
      for (final e in list.cast<Map>())
        InstalledApp(packageName: e['pkg'] as String, label: e['label'] as String? ?? e['pkg'] as String, icon: e['icon'] as Uint8List?),
    ]..sort((a, b) => a.label.toLowerCase().compareTo(b.label.toLowerCase()));
  }

  /// Foreground minutes per package since local midnight, or null when usage access is missing.
  Future<Map<String, int>?> usageToday(Iterable<String> packages) async {
    final m = await _call<Map>('usageToday', {'packages': packages.toList()});
    if (m == null || m['granted'] != true) return null;
    final ms = Map<String, dynamic>.from(m['usage'] as Map? ?? const {});
    return {for (final e in ms.entries) e.key: ((e.value as num) / 60000).floor()};
  }

  /// Hands the full policy to the native enforcement service (it keeps working while Flutter is closed).
  Future<void> syncPolicy(Map<String, dynamic> policy) => _call<void>('syncPolicy', {'json': jsonEncode(policy)});
}
