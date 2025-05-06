import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:montra_expense_tracker/features/view/onboarding/onboarding_view/onbaording_view3.dart';

void main() {
  testWidgets('Onboarding screen3 tests', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: OnboardingView3()));

    expect(find.byType(Image), findsOneWidget);
    expect(find.text('Planning ahead'), findsOneWidget);

    expect(
      find.text('Setup your budget for each category \n so you in control'),
      findsOneWidget,
    );

    expect(find.byType(ElevatedButton).first, findsWidgets);
    expect(find.text('Sign Up'), findsOneWidget);

    await tester.tap(find.byType(ElevatedButton).first);
    await tester.pumpAndSettle();

    await tester.tap(find.byType((ElevatedButton)).at(2), warnIfMissed: false,);
    await tester.pumpAndSettle();
  });
}
