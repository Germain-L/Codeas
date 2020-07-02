import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/login_provider.dart';
import '../provider/navigation_provider.dart';
import '../widgets/floating_action.dart';
import '../widgets/navbar.dart';
import 'pages/about_page.dart';
import 'pages/account_page.dart';
import 'pages/forgot_password_page.dart';
import 'pages/home_page.dart';
import 'pages/new_project_page.dart';
import 'pages/project_page.dart';
import 'pages/sign_in_email_page.dart';
import 'pages/sign_in_methods_page.dart';
import 'pages/sign_up_email_page.dart';

class Scaffolding extends StatelessWidget {
  static Map<String, int> pagesMap = {
    "/account": 0,
    "/home": 1,
    "/project": 2,
    "/signInEmail": 3,
    "/signInMethods": 4,
    "/signUpEmail": 5,
    "/about" : 6,
    "/newProject": 7,
    "/forgotPassword" : 8,
  };

  static List<Widget> pagesList = [
    AccountPage(),
    HomePage(),
    ProjectPage(),
    SignInEmailPage(),
    SignInMethodsPage(),
    SignUpEmailPage(),
    AboutPage(),
    NewProjectPage(),
    ForgotPasswordPage()
  ];

  Widget currentFab(String page) {
    switch (page) {
      case "/home":
        return HomeSortFAB();
      case "/project":
        return ProjectCommentFAB();
      default:
        return Container();
    }
  }
  
  @override
  Widget build(BuildContext context) {
    final navigationProvider = Provider.of<NavigationProvider>(context);
    final loginProvider = Provider.of<LoginProvider>(context);


    return WillPopScope(
      onWillPop: () async {
        navigationProvider.pop();
        loginProvider.errorMessage = "";
        return false;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 0,
          title: Text(
            navigationProvider.currentPageTitle,
            style: Theme.of(context).textTheme.headline2
          ),
        ),
        body: pagesList[pagesMap[navigationProvider.currentPage]],
        
        floatingActionButton: currentFab(navigationProvider.currentPage),
        bottomNavigationBar: loginProvider.user == null
            ? Container(
              height: 1,
              color: Theme.of(context).canvasColor,
            )
            : CustomNavBar()
      ),
    );
  }
}