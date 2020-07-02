import 'package:flutter/material.dart';

ThemeData darkThemeData = ThemeData(
  cardColor: Colors.grey[800],
  primaryColor: Colors.grey[900],
  backgroundColor: Color.fromRGBO(255, 255, 255, 0.11),
  canvasColor: Color.fromRGBO(255, 255, 255, 0.11),
  appBarTheme: AppBarTheme(color: Color.fromRGBO(255, 255, 255, 0.11)),
  accentColor: Colors.white,
  fontFamily: "OpenSans",
  iconTheme: IconThemeData(
    color: Colors.white
  ),
  textTheme: TextTheme(
    bodyText1: TextStyle(
      fontSize: 20,
      color: Colors.white,
    ),
    bodyText2: TextStyle(
      fontSize: 16,
      color: Colors.white,
    ),
    headline2: TextStyle(
      fontSize: 35,
      color: Colors.white,
      fontWeight: FontWeight.w700,
    ),
    headline1: TextStyle(
      fontSize: 25,
      color: Colors.white,
      fontWeight: FontWeight.w500,
    ),
    headline3: TextStyle(
      fontSize: 20,
      color: Colors.black,
      fontWeight: FontWeight.w600
    ),
  ),
);

ThemeData lightThemeData = ThemeData(
  cardColor: Colors.white,
  primaryColor: Colors.black,
  backgroundColor: Color.fromRGBO(255, 255, 255, 0.82),
  canvasColor: Color.fromRGBO(255, 255, 255, 0.82),
  appBarTheme: AppBarTheme(color: Color.fromRGBO(255, 255, 255, 0.82)),
  accentColor: Colors.black,
  fontFamily: "OpenSans",
  textTheme: TextTheme(
    bodyText1: TextStyle(fontSize: 20),
    bodyText2: TextStyle(fontSize: 16),
    headline2: TextStyle(
      fontSize: 35,
      color: Colors.black,
      fontWeight: FontWeight.w700,
    ),
    headline1: TextStyle(
      fontSize: 25,
      color: Colors.black,
      fontWeight: FontWeight.w500,
    ),
    headline3: TextStyle(
      fontSize: 20,
      color: Colors.black,
      fontWeight: FontWeight.w600
    ),
  ),
);
