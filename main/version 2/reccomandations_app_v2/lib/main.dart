import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:reccomandations_app_v2/UI/home.dart';

final databaseReference = Firestore.instance;

void main() {
  runApp(MaterialApp(
    initialRoute: '/home',
    
    routes: {
      '/home': (context) => Material(child: Home()),
    },

    theme: ThemeData(
      primaryColor: Colors.white,
      accentColor: Colors.amberAccent,
      cursorColor: Colors.black,
      canvasColor: Colors.grey[100],
      dividerColor: Colors.black,
      cardColor: Colors.white,
      textTheme: TextTheme(
        bodyText1: TextStyle(color: Colors.black)
      ),
    ),

    darkTheme: ThemeData(
      primaryColor: Colors.grey[700],
      accentColor: Colors.blueGrey[700],
      cursorColor: Colors.white,
      canvasColor: Colors.grey[850],
      cardColor: Colors.grey[700],
      dividerColor: Colors.white,
      textTheme: TextTheme(
        bodyText1: TextStyle(color: Colors.white)
      ),
    ),
  ));
}
