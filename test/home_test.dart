import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:pausey/data/app_repo.dart';
import 'package:pausey/main.dart';
import 'package:pausey/screens/paywall/paywall_screen.dart';
import 'package:pausey/screens/shell/app_shell.dart';
import 'package:pausey/services/local_store.dart';

void main() {
  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    await LocalStore.init();
    AppRepo.instance.load();
    await AppRepo.instance.setPremium(false);
  });

  testWidgets('Home lock icon is status only (tap does nothing)', (tester) async {
    tester.view.physicalSize = const Size(412 * 3, 1600 * 3);
    tester.view.devicePixelRatio = 3;
    addTearDown(tester.view.reset);
    await tester.pumpWidget(const PauseyApp(home: AppShell()));
    await tester.pump(const Duration(seconds: 1));
    final app = AppRepo.instance.apps.first;
    final before = app.locked;
    final toggle = find.byKey(ValueKey('home_lock_${app.id}'));
    await tester.ensureVisible(toggle);
    await tester.tap(toggle, warnIfMissed: false);
    await tester.pump(const Duration(milliseconds: 300));
    expect(AppRepo.instance.apps.first.locked, before);
    await tester.pump(const Duration(seconds: 3));
  });

  testWidgets('Paywall buy sets premium', (tester) async {
    tester.view.physicalSize = const Size(412 * 3, 2400 * 3);
    tester.view.devicePixelRatio = 3;
    addTearDown(tester.view.reset);
    await tester.pumpWidget(const PauseyApp(home: PaywallScreen()));
    await tester.pump(const Duration(seconds: 1));
    await tester.tap(find.byKey(const ValueKey('paywall_buy')));
    await tester.pump(const Duration(milliseconds: 300));
    expect(AppRepo.instance.premium, isTrue);
    await tester.pump(const Duration(seconds: 5));
  });
}
