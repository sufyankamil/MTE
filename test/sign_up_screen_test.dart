import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:montra_expense_tracker/features/view/onboarding/signup/sign_up_view.dart';

void main() {
  testWidgets('Signup tests', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: SignUpView()));

    expect(find.byType(TextFormField), findsNWidgets(3));
    await tester.enterText(find.byKey(const Key("nameField")), "user");
    // Pump the widget tree to update the UI
    await tester.pump();
    // Verify that the text field is empty
    expect(find.text("user"), findsOneWidget);

    await tester.enterText(
      find.byKey(const Key("emailField")),
      "user@gmail.com",
    );
    // Pump the widget tree to update the UI
    await tester.pump();
    // Verify that the text field is empty
    expect(find.text("user@gmail.com"), findsOneWidget);

    await tester.enterText(find.byKey(const Key("passwordField")), "password");
    // Pump the widget tree to update the UI
    await tester.pump();
    // Verify that the text field is empty
    expect(find.text("password"), findsOneWidget);
  });

  testWidgets('Checkbox test', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: SignUpView()));

    // Find the checkbox widget
    final checkboxFinder = find.byKey(const Key("checkbox"));
    // Verify that the checkbox is not checked initially
    expect(tester.widget<Checkbox>(checkboxFinder).value, false);
    // Tap the checkbox to check it
    await tester.tap(checkboxFinder);
    // Pump the widget tree to update the UI
    await tester.pump();

    // Verify that the checkbox is now checked
    expect(tester.widget<Checkbox>(checkboxFinder).value, true);
    // Tap the checkbox again to uncheck it
    await tester.tap(checkboxFinder);
    // Pump the widget tree to update the UI
    await tester.pump();
  });
}
