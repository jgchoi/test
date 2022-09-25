// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_iam_poc/views/login_view.dart';

void main() {
  test("This is test of test", () {
    expect(1, 1);
  });

  testWidgets("Sample Widget Test", (tester) async {
    final testWidget = MediaQuery(
      data: MediaQueryData(),
      child: MaterialApp(
        home: MaterialApp(
          home: LoginView(),
        ),
      ),
    );
    await tester.pumpWidget(testWidget);
    final textFinder = find.textContaining("Welcome");

    expect(textFinder, findsOneWidget);
    await expectLater(
        find.byType(LoginView), matchesGoldenFile('loginPAge.png'));
  });
}
