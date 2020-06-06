import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reccomandations_app/main.dart';
import 'package:reccomandations_app/provider/login_provider.dart';
import 'package:reccomandations_app/provider/navigation_provider.dart';
import 'package:reccomandations_app/widgets/floating_action.dart';
import 'package:reccomandations_app/widgets/navbar.dart';

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
  };

  List<Widget> pagesList = [
    accountPage,
    homePage,
    projectPage,
    signInEmailPage,
    signInMethodsPage,
    signUpEmailPage,
    aboutPage,
    newProjectPage,
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
        body: IndexedStack(
          children: pagesList,
          index: pagesMap[navigationProvider.currentPage],
        ),
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