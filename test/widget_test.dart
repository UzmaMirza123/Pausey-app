import 'package:flutter_test/flutter_test.dart';

import 'package:pausey/main.dart';

void main() {
  testWidgets('App starts on the splash screen', (tester) async {
    await tester.pumpWidget(const PauseyApp());
    await tester.pump(const Duration(milliseconds: 500));
    expect(find.text('Version 2.0 · App Store Edition'), findsOneWidget);
    await tester.pump(const Duration(seconds: 3));
  });
}
