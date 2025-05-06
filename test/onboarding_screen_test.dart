import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:montra_expense_tracker/features/view/onboarding/onboarding_view/onboarding_view1.dart';

class MockFlutterSecureStorage extends Mock implements FlutterSecureStorage {}

void main() {

  testWidgets('Onboarding screen tests', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: OnboardingView1()));

    expect(find.byType(Image), findsOneWidget);
    expect(find.text('Gain total control \n of your money'), findsOneWidget);

    expect(
      find.text('Become your own money manager \n and make every cent count'),
      findsOneWidget,
    );

    expect(find.byType(TextButton), findsOneWidget);
    expect(find.text('Next'), findsOneWidget);

    await tester.tap(find.byType(TextButton));
    await tester.pumpAndSettle();

    expect(find.byType(Image), findsOneWidget);
  });
}
