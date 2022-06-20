// This is an example Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.
//import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:bristol_exchange/Registerpage.dart';
// Visit https://flutter.dev/docs/cookbook/testing/widget/introduction for
// more information about Widget testing.
//import 'package:flutter/B/material.dart';
//import "package:BRISTOL_EXCHANGE/widget_test.dart";
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // group('MyWidget', () {
  //   testWidgets('should display a string of text', (WidgetTester tester) async {
  //     // Define a Widget
  //     const myWidget = MaterialApp(
  //       home: Scaffold(
  //         body: Text('Hello'),
  //       ),
  //     );

  //     // Build myWidget and trigger a frame.
  //     await tester.pumpWidget(myWidget);

  //     // Verify myWidget shows some text
  //     expect(find.byType(Text), findsOneWidget);

  //     // Enter 'hi' into the TextField.
  //     await tester.enterText(find.byType(TextField), 'hi');
  //   });
  // });
  //declare current widget
  const myWidget = MaterialApp(
    home: Scaffold(
      body: Text('Hello'),
    ),
  );

  testWidgets('validate email check error message',
      (WidgetTester tester) async {
    await tester.pumpWidget(myWidget);

    final buttonFinder = find.text('Register');
    final emailErrorFinder = find.text('An E-mail is required to register.');

    await tester.tap(buttonFinder);
    print('register button click ok..');
    await tester.pump(const Duration(milliseconds: 100)); // add delay
    expect(emailErrorFinder, findsOneWidget);
    print('required email error check ok..');
  });
}
