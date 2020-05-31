import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reccomandations_app/app/pages/account_page.dart';
import 'package:reccomandations_app/app/pages/home_page.dart';
import 'package:reccomandations_app/app/pages/project_page.dart';
import 'package:reccomandations_app/app/pages/sign_in_email_page.dart';
import 'package:reccomandations_app/app/pages/sign_in_methods_page.dart';
import 'package:reccomandations_app/app/pages/sign_up_email_page.dart';
import 'package:reccomandations_app/provider/navigation_provider.dart';

class Scaffolding extends StatelessWidget {
  static Map<String, Widget> pages = {
    "/account": AccountPage(),
    "/home": HomePage(),
    "/project": ProjectPage(),
    "/signInEmail": SignInEmailPage(),
    "/signInMethods": SignInMethodsPage(),
    "/signUpEmail": SignUpEmailPage()
  };

  @override
  Widget build(BuildContext context) {
    final navigationProvider = Provider.of<NavigationProvider>(context);
    return WillPopScope(
      onWillPop: () async {
        navigationProvider.pop();
        return false;
      },
      child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            title: Text(
              navigationProvider.currentPageTitle,
              style: TextStyle(
                  fontSize: 35,
                  color: Colors.black,
                  fontWeight: FontWeight.w700),
            ),
          ),
          body: pages[navigationProvider.currentPage]),
    );
  }
}
