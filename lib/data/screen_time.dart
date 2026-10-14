import 'dart:math';

import '../services/native_bridge.dart';
import 'app_repo.dart';
import 'models.dart';

/// Where per-app usage comes from.
///
/// Reading other apps' usage needs native code (Android UsageStatsManager,
/// iOS Screen Time / DeviceActivity). Until that is added, [DemoScreenTime]
/// returns stable sample numbers based on the managed apps, and screens show a
/// small "Sample data" tag (`ScreenTime.instance.isDemo`).
abstract class ScreenTimeSource {
  bool get isDemo;

  /// Per-app minutes on [day], biggest first.
  List<AppUsage> usageOn(DateTime day);

  int totalOn(DateTime day) => usageOn(day).fold(0, (a, u) => a + u.minutes);
}

class ScreenTime {
  static ScreenTimeSource instance = DemoScreenTime();
}

class DemoScreenTime extends ScreenTimeSource {
  @override
  bool get isDemo => true;

  static const _base = {
    'Instagram': 134,
    'YouTube': 102,
    'Twitter / X': 58,
    'TikTok': 71,
    'Reddit': 44,
    'Facebook': 39,
    'Netflix': 52,
    'Snapchat': 33,
    'WhatsApp': 47,
    'Shopping': 31,
    'Gaming Apps': 40,
  };

  @override
  List<AppUsage> usageOn(DateTime day) {
    final repo = AppRepo.instance;
    // On a phone only the user's own (installed) apps appear, even in sample data.
    final ids = {
      ...repo.apps.map((a) => a.id),
      if (!NativeBridge.instance.isAndroid) ...['Instagram', 'YouTube', 'Twitter / X', 'Reddit', 'Shopping'],
    };
    final seed = day.year * 1000 + day.month * 40 + day.day;
    final r = Random(seed);
    // Focus time pushes usage down a little, so the app "reacts" to the user.
    final focusFactor = 1 - min(0.35, repo.focusMinutesOn(day) / 600);
    final list = [
      for (final id in ids)
        AppUsage(id, AppRepo.catalog[id] ?? 'other', ((_base[id] ?? 30) * (0.7 + r.nextDouble() * 0.6) * focusFactor).round()),
    ]..sort((a, b) => b.minutes.compareTo(a.minutes));
    return list;
  }
}
