import 'package:flutter/material.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter_test/flutter_test.dart';
//import 'package:firebase_core/firebase_core.dart';
//import 'package:BristolFirebasedblink';
//1
import 'package:bristol_exchange/main.dart';
//2
//import 'package:flutter/material.dart';

void main() {
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  if (binding is LiveTestWidgetsFlutterBinding) {
    binding.framePolicy = LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;
  }

  group('MyWidget', () {
    final timeBasedEmail =
        DateTime.now().microsecondsSinceEpoch.toString() + '@test.com';
    testWidgets('Authentication Testing', (WidgetTester tester) async {
      //TODO: add Firebase Initialization Here
      //await Firebase.initializeApp();

      await tester.pumpWidget(MyApp());
      await tester.pumpAndSettle();
      //register  button
      await tester.tap(find.byType(TextButton));
//TODO: Add code here
//1
      tester.printToConsole('SignUp screen opens');
//2
      await tester.pumpAndSettle();
//3
      await tester.enterText(
          find.byKey(const Key('personSignUpField')), timeBasedEmail);
//add the other register FormTextField widgets phone,email,password,confirm password.
//TODO: Add here
//1
      await tester.enterText(
          find.byKey(const ValueKey('passwordSignUpField')), 'test123');

      await tester.enterText(
          find.byKey(const ValueKey('confirmPasswordSignUpField')), 'test123');

//2
      await tester.tap(find.byType(ElevatedButton));

//TODO: add addDelay() statement here Waiting for 24 seconds for a user to fill the form.
      await addDelay(24000);
      //execute next task after all sceen animations have settled.
      await tester.pumpAndSettle();
      //user is authenticated and redirectd to profile.
      expect(find.text('Profile'), findsOneWidget);
      expect(find.text('Logout'), findsOneWidget);

//TODO: call logout function here
      await logout(tester);
    });
    //authenticate and modify profile
    //1
    testWidgets('Modifying Features test', (WidgetTester tester) async {
      //2 change with your api auth endpoint logic.
     // await Firebase.initializeApp();

      //3 load login window here..
      await tester.pumpWidget(MyApp());
      await tester.pumpAndSettle();
      //4
      await addDelay(10000);
      // TODO: add code here
      //load login window..
      //1
      //test fake auth...where credentials match...
      await tester.enterText(
          find.byKey(const ValueKey('emailLoginField')), timeBasedEmail);
      await tester.enterText(
          find.byKey(const ValueKey('passwordLoginField')), 'test123');
      await tester.tap(find.byType(ElevatedButton));

//2
      await addDelay(18000);
      await tester.pumpAndSettle();
      ////1 to do redirect user to profile
      tester.printToConsole('loads user profile');
      await tester.tap(find.byType(FloatingActionButton));
      await addDelay(2000);
      tester.printToConsole('dummy user profile action');
      await tester.pumpAndSettle();
      //logout action again.

//2
      //await tester.enterText(
      //   find.byKey(const ValueKey('newIdeaField')), 'New Book');
      // await tester.enterText(
      //find.byKey(const ValueKey('inspirationField')), 'Elon');
//3
      //await addDelay(1000);
      //Ensuring visibility of action button
      await tester.ensureVisible(find.byType(ElevatedButton));
      await tester.pumpAndSettle();
      await tester.tap(find.byType(ElevatedButton));
//TODO: add code here
    });

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
    //     await tester.enterText(find.byType(TextField), 'Onyango Ed.');
    //   });
  });
} //End main

//delay global
//delay simulation
Future<void> addDelay(int ms) async {
  await Future<void>.delayed(Duration(milliseconds: ms));
}

//1
Future<void> logout(WidgetTester tester) async {
  //2
  await addDelay(8000);

  //3
  await tester.tap(find.byKey(
    const ValueKey('LogoutKey'),
  ));

  //4
  await addDelay(8000);
  tester.printToConsole('Login screen opens');
  await tester.pumpAndSettle();
}
