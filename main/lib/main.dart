import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:reccomandations_app/pages/home.dart';

final databaseReference = Firestore.instance;

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
        accentColor: Color.fromRGBO(255, 179, 47, 1),
        fontFamily: "Oxygen",
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/home',
      routes: {
        '/home': (context) => Material(child: Home()),
      },
    );
  }
}