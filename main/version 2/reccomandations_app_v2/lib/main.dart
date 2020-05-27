import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:reccomandations_app_v2/UI/home.dart';
import 'package:reccomandations_app_v2/UI/login.dart';

final databaseReference = Firestore.instance;

void main() {
  runApp(MaterialApp(
    initialRoute: '/home',
    
    routes: {
      '/home': (context) => Material(child: LoginPage()),
    },

    theme: ThemeData(
      primaryColor: Colors.white,
      accentColor: Colors.amberAccent,
    ),

    // darkTheme: ThemeData(
    //   primaryColor: Colors.grey[800],
    //   accentColor: Colors.blueGrey[700]
    // ),
  ));
}
