import 'package:bristol_exchange/Login_Page.dart';
import 'package:bristol_exchange/Registerpage.dart';
import 'package:bristol_exchange/ui/frontend/list.dart';
import 'package:bristol_exchange/ui/frontend/list_products.dart';
import 'package:flutter/material.dart';
import 'package:bristol_exchange/Constant_Colors.dart';
import 'src/app.dart';

import 'src/settings/settings_controller.dart';
import 'src/settings/settings_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'dart:convert';

//import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:developer' as developer;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
/////////////
/////////////
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Bristol Exchange',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: bgColor,
          primarySwatch: Colors.blue,
          primaryColor: kPrimaryColor,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: "Gordita",
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          textTheme: const TextTheme(
            bodyText2: TextStyle(color: Colors.black54),
          ),
        ),
        //home: const Login(),
        home: Builder(builder: (context) {
          return const Login();
        }));
  }
}
/*
class CheckAuth extends StatefulWidget {
  @override
  _CheckAuthState createState() => _CheckAuthState();
}

class _CheckAuthState extends State<CheckAuth> {
  bool isAuth = false;
  @override
  void initState() {
    _checkIfLoggedIn();
    super.initState();
  }

  void _checkIfLoggedIn() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('token');
    if (token != null) {
      setState(() {
        isAuth = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget child;
    if (isAuth) {
      child = ProductsPage(); //Redirect to dash...
    } else {
      child = ProductsPage();
    }
    return Scaffold(
      body: child,
    );
  }
}
*/
