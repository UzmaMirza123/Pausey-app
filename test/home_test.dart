import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:pausey/data/app_repo.dart';
import 'package:pausey/data/restrictions/restriction_repo.dart';
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

  testWidgets('My apps card lists locked apps; Manage apps opens App Lock', (tester) async {
    tester.view.physicalSize = const Size(412 * 3, 1600 * 3);
    tester.view.devicePixelRatio = 3;
    addTearDown(tester.view.reset);
    await tester.pumpWidget(const PauseyApp(home: AppShell()));
    await tester.pump(const Duration(seconds: 1));
    final locked = AppRepo.instance.apps.where((a) => a.locked).toList();
    expect(find.text('My apps'), findsOneWidget);
    expect(find.text('${locked.length} apps locked'), findsOneWidget);
    expect(find.textContaining(locked.first.name), findsWidgets);

    await tester.tap(find.text('Manage apps'));
    await tester.pump(const Duration(milliseconds: 600));
    expect(find.text('App Lock'), findsWidgets);
    await tester.pump(const Duration(seconds: 3));
  });

  testWidgets('Unblock apps: sheet with 1-15 min, Skip closes, Continue unblocks; the badge counts down', (tester) async {
    tester.view.physicalSize = const Size(412 * 3, 915 * 3);
    tester.view.devicePixelRatio = 3;
    addTearDown(tester.view.reset);
    const pkg = 'com.example.scrolly';
    await AppRepo.instance.addInstalledApps([(packageName: pkg, label: 'Scrolly')]);
    await tester.pumpWidget(const PauseyApp(home: AppShell()));
    await tester.pump(const Duration(seconds: 1));

    // Floating badge above the bottom bar: 2 icons, then "+N" for the other locked apps.
    final locked = AppRepo.instance.apps.where((a) => a.locked).length;
    expect(find.text('Unblock apps'), findsOneWidget);
    expect(find.text('+${locked - 2}'), findsOneWidget);

    // Skip just closes the sheet.
    await tester.tap(find.byKey(const ValueKey('home_unblock')));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 600));
    expect(find.text('Unblock all apps for…'), findsOneWidget);
    expect(find.text('5 minutes'), findsOneWidget);
    await tester.tap(find.text('Skip'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 600));
    expect(find.text('Unblock all apps for…'), findsNothing);
    expect(RestrictionRepo.instance.unlockedNow, isEmpty);

    // Continue unblocks for the picked time.
    await tester.tap(find.byKey(const ValueKey('home_unblock')));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 600));
    await tester.tap(find.text('Continue'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 800));
    await tester.pump(const Duration(milliseconds: 400));
    expect(RestrictionRepo.instance.unlockedNow, contains(pkg));
    expect(find.textContaining('Unblocked'), findsOneWidget);
    expect(find.textContaining('left'), findsOneWidget);

    // End it (as the timer would) so nothing is left running.
    for (final p in RestrictionRepo.instance.unlockedNow) {
      await RestrictionRepo.instance.endUnlock(p);
    }
    await tester.pump(const Duration(milliseconds: 300));
    expect(find.text('Unblock apps'), findsOneWidget);
    await tester.pumpWidget(const SizedBox());
    await tester.pump(const Duration(seconds: 1)); // let the native-sync debounce run
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
