// This is an example Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.
//import 'package:flutter/material.dart';
// Visit https://flutter.dev/docs/cookbook/testing/widget/introduction for
// more information about Widget testing.
//import 'package:flutter/B/material.dart';
//import "package:BRISTOL_EXCHANGE/widget_test.dart";
//import 'package:provider/provider.dart';
//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:bristol_exchange/main.dart';
import 'package:bristol_exchange/Registerpage.dart';
import 'package:bristol_exchange/Login_Page.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final timeBasedEmail =
      DateTime.now().microsecondsSinceEpoch.toString() + '@test.com';

  group('MyWidget', () {
    //   testWidgets('should display a string of text', (WidgetTester tester) async {
    //     // Define a Widget
    //     const myWidget = MaterialApp(
    //       home: Scaffold(
    //         body: Text('Hello'),
    //       ),
    //     );
    const loginWidget = MaterialApp(home: Login());
    //     // Build myWidget and trigger a frame.
    //     await tester.pumpWidget(myWidget);

    //     // Verify myWidget shows some text
    //     expect(find.byType(Text), findsOneWidget);

    //     // Enter 'hi' into the TextField.
    //     await tester.enterText(find.byType(TextField), 'hi');
    //   });
    // });
    //declare current widget

    // const myWidget = MaterialApp(
    //   home: Scaffold(
    //     body: Text('Hello'),
    //   ),
    // );

    // testWidgets('validate Fullname required check error message',
    //     (WidgetTester tester) async {
    //   await tester.pumpWidget(myWidget);

    //   final buttonFinder = find.text('Register');
    //   final emailErrorFinder = find.text('Please Enter Name');

    //   await tester.tap(buttonFinder);
    //   //omit print in production
    //   print('register button click ok..');
    //   await tester.pump(const Duration(milliseconds: 100)); // add delay
    //   expect(emailErrorFinder, findsOneWidget);
    //   print('required email error check ok..');
    testWidgets('test registration screen formtextfield widgets',
        (tester) async {
      // Build the widget
      await tester.pumpWidget(loginWidget);
      //expect(find.text('Email'), findsNothing);
      //TextField and TextFormField are same.
      expect(find.byType(TextFormField), findsNWidgets(2));

      expect(find.text('LOGIN'), findsOneWidget);
      expect(find.text('REGISTER'), findsOneWidget);
      // Enter 'hi' into the TextField.
      tester.printToConsole("done checking Login widgets");
      //await tester.enterText(find.byIcon(Icons.person), 'Onyango Ed');
      // expect(find.byType(Text), findsOneWidget);
    });

    testWidgets('test login screen button widgets', (tester) async {
      // Build the widget

      await tester.pumpWidget(const MaterialApp(home: Login()));
      // expect(find.text('LOGO'), findsNothing);

      // expect(find.text('LOGIN'), findsOneWidget);
      expect(find.text('REGISTER'), findsOneWidget);
      // Enter 'hi' into the TextField.

      // tester.enterText(find.byIcon(Icons.person), 'Onyango Ed');
      // expect(find.byType(Text), findsOneWidget);
    });
    testWidgets('input email widget validation on empty submit check..',
        (tester) async {
      await tester.pumpWidget(loginWidget);
      //by key
      expect(find.byKey(const Key('emailLoginField')), findsOneWidget);
      //check widget exists  by icon
      expect(find.byIcon(Icons.email), findsOneWidget);
      print('Email check.. ok..');
      //Load element afresh.
    });

    testWidgets("login action test ", (tester) async {
      // Build the widget

      await tester.pumpWidget(const MaterialApp(home: Login()));
      var buttonFinder = find.text('Login');

      expect(find.text('LOGIN'), findsOneWidget);
      // expect(buttonFinder, findsOneWidget);
      await tester.tap(find.text('LOGIN'));
      await tester.pumpAndSettle();
      print('login action on..');
    });
    testWidgets('email input entry check..', (tester) async {
      await tester.pumpWidget(loginWidget);
      // print('Email check.. ok..');
      //Load element afresh.
      //await tester.pumpWidget($loginWidget);
// //by key
      var varkey = find.byKey(const Key('emailLoginField'));
      // expect(varkey, findsOneWidget);
      //check widget exists  by icon
      //expect(find.byIcon(Icons.email), findsOneWidget);

      await tester.enterText(varkey, timeBasedEmail);
      // await tester.pumpAndSettle();
      expect(find.text("onyash_8080@test.net"), findsNothing);
    });
    testWidgets("valid login test..", (tester) async {
      await tester.pumpWidget(loginWidget);
      final emailErrorFinder = find.text('Please Enter Name'); //.toString()
      tester.printToConsole(
          'SignUp screen opens $emailErrorFinder'); //Interpolation //concartenate with +''
      //   await tester.tap(buttonFinder);
    });
  });
}
