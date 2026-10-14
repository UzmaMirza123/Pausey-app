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

  testWidgets('My apps card lists locked apps; Manage apps opens App Lock; Unblock opens the sheet', (tester) async {
    tester.view.physicalSize = const Size(412 * 3, 1600 * 3);
    tester.view.devicePixelRatio = 3;
    addTearDown(tester.view.reset);
    await tester.pumpWidget(const PauseyApp(home: AppShell()));
    await tester.pump(const Duration(seconds: 1));
    final locked = AppRepo.instance.apps.where((a) => a.locked).toList();
    expect(find.text('My apps'), findsOneWidget);
    expect(find.text('${locked.length} apps locked'), findsOneWidget);
    expect(find.textContaining(locked.first.name), findsWidgets);

    await tester.ensureVisible(find.byKey(const ValueKey('home_unblock')));
    await tester.tap(find.byKey(const ValueKey('home_unblock')));
    await tester.pump(const Duration(milliseconds: 600));
    expect(find.text('Unblock apps'), findsNWidgets(2)); // pill + sheet title
    Navigator.of(tester.element(find.text('Unblock apps').last)).pop();
    await tester.pump(const Duration(milliseconds: 600));

    await tester.tap(find.text('Manage apps'));
    await tester.pump(const Duration(milliseconds: 600));
    expect(find.text('App Lock'), findsWidgets);
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
