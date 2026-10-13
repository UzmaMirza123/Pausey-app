import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:pausey/data/app_repo.dart';
import 'package:pausey/data/models.dart';
import 'package:pausey/screens/profile/settings_screen.dart';
import 'package:pausey/screens/profile/streaks_screen.dart';
import 'package:pausey/services/local_store.dart';
import 'package:pausey/utils/app_theme.dart';
import 'package:pausey/utils/l10n.dart';

Widget _app(Widget home) => MaterialApp(
      theme: AppTheme.dark,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: home,
    );

void main() {
  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    await LocalStore.init();
    AppRepo.instance.load();
  });

  testWidgets('Settings toggle persists to AppRepo', (tester) async {
    await tester.binding.setSurfaceSize(const Size(412, 2400));
    await tester.pumpWidget(_app(const SettingsScreen()));
    await tester.pumpAndSettle();
    final before = AppRepo.instance.settings.push;
    await tester.tap(find.text('Push notifications'));
    await tester.pumpAndSettle();
    expect(AppRepo.instance.settings.push, !before);
  });

  testWidgets('Streaks shows the current streak', (tester) async {
    final now = DateTime.now();
    for (var i = 0; i < 3; i++) {
      await AppRepo.instance.addSession(FocusSession(
        start: now.subtract(Duration(days: i, minutes: 30)),
        plannedMinutes: 25,
        focusedSeconds: 25 * 60,
        mode: FocusMode.pomodoro,
        completed: true,
      ));
    }
    await tester.binding.setSurfaceSize(const Size(412, 2600));
    await tester.pumpWidget(_app(const StreaksScreen()));
    await tester.pumpAndSettle();
    expect(AppRepo.instance.streak, 3);
    expect(find.text('3'), findsWidgets);
  });
}
