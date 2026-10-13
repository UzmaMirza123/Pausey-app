import 'dart:convert';
import 'dart:math';

import 'package:shared_preferences/shared_preferences.dart';

/// Guest profile kept on the device.
class GuestProfile {
  const GuestProfile({required this.id, required this.name, required this.createdAt});

  final String id;
  final String name;
  final DateTime createdAt;

  Map<String, dynamic> toJson() => {'id': id, 'name': name, 'createdAt': createdAt.toIso8601String()};

  factory GuestProfile.fromJson(Map<String, dynamic> j) => GuestProfile(
        id: j['id'] as String,
        name: (j['name'] as String?) ?? '',
        createdAt: DateTime.tryParse(j['createdAt'] as String? ?? '') ?? DateTime.now(),
      );
}

/// Everything the app saves on the phone (shared_preferences).
///
/// Call [LocalStore.init] once in `main()` before `runApp`.
class LocalStore {
  LocalStore._(this._prefs);

  static LocalStore? _instance;
  static LocalStore get instance {
    final i = _instance;
    if (i == null) throw StateError('Call LocalStore.init() in main() first');
    return i;
  }

  final SharedPreferences _prefs;

  static Future<LocalStore> init() async => _instance ??= LocalStore._(await SharedPreferences.getInstance());

  static const _kGuest = 'guest_profile';
  static const _kOnboardingDone = 'onboarding_done';
  static const _kAnswers = 'onboarding_answers';
  static const _kThemeDark = 'theme_dark';
  static const _kLocale = 'locale_override';

  // ---- Guest -------------------------------------------------------------

  GuestProfile? get guest {
    final raw = _prefs.getString(_kGuest);
    if (raw == null) return null;
    try {
      return GuestProfile.fromJson(jsonDecode(raw) as Map<String, dynamic>);
    } catch (_) {
      return null;
    }
  }

  Future<GuestProfile> createGuest({String name = ''}) async {
    final existing = guest;
    if (existing != null) return existing;
    final r = Random.secure();
    final id = 'guest_${DateTime.now().millisecondsSinceEpoch}_${r.nextInt(0x7fffffff).toRadixString(16)}';
    final g = GuestProfile(id: id, name: name, createdAt: DateTime.now());
    await _prefs.setString(_kGuest, jsonEncode(g.toJson()));
    return g;
  }

  Future<void> updateGuestName(String name) async {
    final g = guest;
    if (g == null) return;
    await _prefs.setString(_kGuest, jsonEncode(GuestProfile(id: g.id, name: name, createdAt: g.createdAt).toJson()));
  }

  /// Signs the guest out and deletes their local data.
  Future<void> clearGuest() async {
    await _prefs.remove(_kGuest);
    await _prefs.remove(_kAnswers);
    await _prefs.remove('app_state');
  }

  // ---- Onboarding --------------------------------------------------------

  bool get onboardingDone => _prefs.getBool(_kOnboardingDone) ?? false;
  Future<void> setOnboardingDone([bool v = true]) => _prefs.setBool(_kOnboardingDone, v);

  /// Answers from onboarding (screen time, occupation, goal, locked apps …).
  Map<String, dynamic> get answers {
    final raw = _prefs.getString(_kAnswers);
    if (raw == null) return {};
    try {
      return Map<String, dynamic>.from(jsonDecode(raw) as Map);
    } catch (_) {
      return {};
    }
  }

  /// Save one answer. [value] must be JSON-friendly (String, num, bool, List, Map).
  Future<void> saveAnswer(String key, Object? value) async {
    final a = answers..[key] = value;
    await _prefs.setString(_kAnswers, jsonEncode(a));
  }

  // ---- Raw access (used by AppRepo) -------------------------------------

  String? getRaw(String key) => _prefs.getString(key);
  Future<void> setRaw(String key, String value) => _prefs.setString(key, value);
  Future<void> removeRaw(String key) => _prefs.remove(key);

  // ---- Settings ----------------------------------------------------------

  bool? get themeDark => _prefs.getBool(_kThemeDark);
  Future<void> setThemeDark(bool dark) => _prefs.setBool(_kThemeDark, dark);

  /// Language chosen by the user; null = follow the phone's language.
  String? get localeOverride => _prefs.getString(_kLocale);
  Future<void> setLocaleOverride(String? code) =>
      code == null ? _prefs.remove(_kLocale) : _prefs.setString(_kLocale, code);
}
