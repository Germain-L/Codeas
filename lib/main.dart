import 'package:flutter/material.dart';
import 'package:reccomandations_app/pages/home.dart';
import 'package:reccomandations_app/pages/landing.dart';
import 'package:reccomandations_app/pages/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Codepro',
      theme: ThemeData(
        primaryColor: Color.fromRGBO(120, 140, 255, 1),
        accentColor: Color.fromRGBO(255, 152, 0, 1),
        fontFamily: "Oxygen",
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => Material(child: Landing()),
        '/login': (context) => Material(child: Login()),
        '/home': (context) => Material(child: Home()),
      },
    );
  }
}