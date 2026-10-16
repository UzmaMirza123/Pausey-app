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

    expect(find.bySemanticsLabel('Reduce Screen Addiction'), findsOneWidget);
    await next('Continue');
    expect(find.bySemanticsLabel('Lock Distracting Apps'), findsOneWidget);
    // Screen 2's button is now "Next" and goes straight on (no app-picker sheet).
    expect(find.text('Select Apps'), findsNothing);
    await next('Next');
    expect(find.bySemanticsLabel('Stay Focused Every Day'), findsOneWidget);
    expect(find.byType(BottomSheet), findsNothing);
    await next('Continue');
    expect(find.bySemanticsLabel('Track Your Progress'), findsOneWidget);
    await next('Continue');
    expect(done, isTrue);
  });
}
