import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:pausey/main.dart';
import 'package:pausey/services/local_store.dart';

void main() {
  testWidgets('App starts on the splash screen', (tester) async {
    SharedPreferences.setMockInitialValues({});
    await LocalStore.init();
    await tester.pumpWidget(const PauseyApp());
    await tester.pump(const Duration(milliseconds: 500));
    expect(find.text('Version 2.0 · App Store Edition'), findsOneWidget);
    await tester.pump(const Duration(seconds: 4));
  });

  test('Guest data is stored locally', () async {
    SharedPreferences.setMockInitialValues({});
    final store = await LocalStore.init();
    await store.createGuest(name: 'Usman');
    await store.saveAnswer('dailyGoalHours', 2);
    expect(store.guest?.name, 'Usman');
    expect(store.answers['dailyGoalHours'], 2);
    await store.clearGuest();
    expect(store.guest, isNull);
  });
}
