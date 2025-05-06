import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:montra_expense_tracker/features/view/onboarding/splash/splash_screen_view.dart';

void main() {
  testWidgets('Splash screen displays text & navigates to next screen after delay', (WidgetTester tester) async {
  await tester.pumpWidget(const MaterialApp(home: SplashScreenView()));

  expect(find.byType(Text), findsOneWidget);

  expect(find.text('montra'), findsOneWidget);

  await tester.pump(const Duration(seconds: 3));

  await tester.pumpAndSettle();

  expect(find.text('Gain total control \n of your money'), findsOneWidget);
  expect(find.byType(Image), findsOneWidget);
  });
}