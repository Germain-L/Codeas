import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:reccomandations_app/app/home.dart';
import 'package:reccomandations_app/app/pages/splash_screen_login.dart';
import 'package:reccomandations_app/provider/login_provider.dart';
import 'package:reccomandations_app/provider/navigation_provider.dart';
import 'package:reccomandations_app/provider/project_provider.dart';


// Font styles match:
// {
//   FontWeight.w100: 'Thin',
//   FontWeight.w200: 'ExtraLight',
//   FontWeight.w300: 'Light',
//   FontWeight.w400: 'Regular',
//   FontWeight.w500: 'Medium',
//   FontWeight.w600: 'SemiBold',
//   FontWeight.w700: 'Bold',
//   FontWeight.w800: 'ExtraBold',
//   FontWeight.w900: 'Black',
// }

Firestore databaseReference = Firestore.instance;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProjectProvider()
        ),
        ChangeNotifierProvider(
          create: (context) => LoginProvider()
        ),
        ChangeNotifierProvider(
          create: (context) => NavigationProvider()
        ),
      ],
      child: MaterialApp(
        title: 'Codeas',
        theme: ThemeData(
          textTheme: GoogleFonts.openSansTextTheme(
            Theme.of(context).textTheme,
          )
        ),
        home: SplashLoginPage()
      ),
    );
  }
}