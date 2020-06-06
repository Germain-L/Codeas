import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:reccomandations_app/app/home.dart';
import 'package:reccomandations_app/app/pages/about_page.dart';
import 'package:reccomandations_app/app/pages/account_page.dart';
import 'package:reccomandations_app/app/pages/home_page.dart';
import 'package:reccomandations_app/app/pages/new_project_page.dart';
import 'package:reccomandations_app/app/pages/project_page.dart';
import 'package:reccomandations_app/app/pages/sign_in_email_page.dart';
import 'package:reccomandations_app/app/pages/sign_in_methods_page.dart';
import 'package:reccomandations_app/app/pages/sign_up_email_page.dart';
import 'package:reccomandations_app/models/themes.dart';
import 'package:reccomandations_app/provider/login_provider.dart';
import 'package:reccomandations_app/provider/navigation_provider.dart';
import 'package:reccomandations_app/provider/project_provider.dart';

AccountPage accountPage = AccountPage();
HomePage homePage = HomePage();
ProjectPage projectPage = ProjectPage();
SignInEmailPage signInEmailPage = SignInEmailPage();
SignInMethodsPage signInMethodsPage = SignInMethodsPage();
SignUpEmailPage signUpEmailPage = SignUpEmailPage();
AboutPage aboutPage = AboutPage();
NewProjectPage newProjectPage = NewProjectPage();

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

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navigationProvider = Provider.of<NavigationProvider>(context);
    return MaterialApp(
      title: 'Codeas',
      theme: navigationProvider.isLightTheme ? lightThemeData : darkThemeData,
      home: Scaffolding(),
    );
  }
}