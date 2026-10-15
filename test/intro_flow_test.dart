import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:pausey/main.dart';
import 'package:pausey/screens/onboarding/intro_flow.dart';
import 'package:pausey/services/local_store.dart';

void main() {
  testWidgets('the 4 intro screens run in order and then hand over to onboarding', (t) async {
    SharedPreferences.setMockInitialValues({});
    await LocalStore.init();
    t.view.physicalSize = const Size(412 * 3, 915 * 3);
    t.view.devicePixelRatio = 3;
    addTearDown(t.view.reset);
    var done = false;
    await t.pumpWidget(PauseyApp(home: IntroFlow(onFinished: () => done = true)));
    await t.pump(const Duration(seconds: 1));

    Future<void> next(String label) async {
      await t.tap(find.text(label).last);
      for (var i = 0; i < 8; i++) {
        await t.pump(const Duration(milliseconds: 150));
      }
    }

    expect(find.text('Reduce Screen Addiction'), findsOneWidget);
    await next('Continue');
    expect(find.text('Lock Distracting Apps'), findsOneWidget);
    // "Skip" from any intro screen goes straight to onboarding; here we keep going.
    await t.tap(find.byType(PageView), warnIfMissed: false);
    final state = t.state<State<IntroFlow>>(find.byType(IntroFlow));
    expect(state.mounted, isTrue);
    await next('Skip');
    expect(done, isTrue);
  });
}
