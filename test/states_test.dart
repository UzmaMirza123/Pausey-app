import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:pausey/data/app_repo.dart';
import 'package:pausey/l10n/app_localizations.dart';
import 'package:pausey/services/local_store.dart';
import 'package:pausey/utils/app_theme.dart';
import 'package:pausey/widgets/states_gallery.dart';

void main() {
  testWidgets('Offline retry goes loading -> content -> back', (tester) async {
    SharedPreferences.setMockInitialValues({});
    await LocalStore.init();
    AppRepo.instance.load();
    tester.view.physicalSize = const Size(412, 2400);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);
    await tester.pumpWidget(MaterialApp(
      theme: AppTheme.dark,
      localizationsDelegates: const [AppLocalizations.delegate, GlobalMaterialLocalizations.delegate, GlobalWidgetsLocalizations.delegate, GlobalCupertinoLocalizations.delegate],
      supportedLocales: AppLocalizations.supportedLocales,
      home: const StatesGallery(),
    ));
    await tester.pump();
    expect(find.text("You're offline"), findsOneWidget);
    await tester.tap(find.text('Try again'));
    await tester.pump(const Duration(milliseconds: 500));
    expect(find.byType(CircularProgressIndicator), findsWidgets);
    await tester.pump(const Duration(seconds: 2));
    await tester.pump(const Duration(milliseconds: 500));
    expect(find.text('Back online – everything is synced'), findsOneWidget);
    expect(find.text("You're offline"), findsNothing);
    await tester.tap(find.text('Show state again').first);
    await tester.pump(const Duration(milliseconds: 500));
    expect(find.text("You're offline"), findsOneWidget);
    await tester.pumpWidget(const SizedBox());
    await tester.pump(const Duration(seconds: 3));
  });
}
