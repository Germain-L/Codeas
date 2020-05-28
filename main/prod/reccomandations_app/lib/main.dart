import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:reccomandations_app/UI/home.dart';
import 'package:reccomandations_app/UI/login.dart';

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
    ),

    darkTheme: ThemeData(
      primaryColor: Colors.grey[800],
      accentColor: Colors.amberAccent[700]
    ),
  ));
}
