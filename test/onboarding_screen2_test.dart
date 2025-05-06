import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:montra_expense_tracker/features/view/onboarding/onboarding_view/onboarding_view2.dart';

void main() {
  testWidgets('Onboarding screen2 tests', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: OnboardingView2()));

    expect(find.byType(Image), findsOneWidget);
    expect(find.text('Know where your \n money goes'), findsOneWidget);

    expect(
      find.text(
        'Track your transaction easily, \n with categories and financial report',
      ),
      findsOneWidget,
    );

    expect(find.byType(TextButton), findsNWidgets(2));
    expect(find.text('Prev'), findsOneWidget);
    expect(find.text('Next'), findsOneWidget);

    await tester.tap(find.byKey(const Key("prevButton")));
    await tester.pumpAndSettle();
  });
}
