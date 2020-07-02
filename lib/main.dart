import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

import 'app/home.dart';
import 'models/themes.dart';
import 'provider/login_provider.dart';
import 'provider/navigation_provider.dart';
import 'provider/project_provider.dart';


Firestore databaseReference = Firestore.instance;

void main() {
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('OpenSans/LICENSE.txt');
    yield LicenseEntryWithLineBreaks(['OpenSans'], license);
  });
  runApp(ProviderWidget());
}

class ProviderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProjectProvider()),
        ChangeNotifierProvider(
          create: (context) => LoginProvider(
            firebaseAuth: FirebaseAuth.instance,
            googleSignin: GoogleSignIn(),
          ),
        ),
        ChangeNotifierProvider(create: (context) => NavigationProvider()),
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final navigationProvider = Provider.of<NavigationProvider>(context);
    print("light theme ? ${navigationProvider.isLightTheme}");
    return MaterialApp(
      title: 'Codeas',
      theme: navigationProvider.isLightTheme ? lightThemeData : darkThemeData,
      home: Scaffolding(),
    );
  }
}