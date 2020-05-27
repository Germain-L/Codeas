import 'package:flutter/material.dart';
import 'package:reccomandations_app_v2/UI/home.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/home',
    
    routes: {
      '/home': (context) => Home(),
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
