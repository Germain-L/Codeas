import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class NavigationProvider with ChangeNotifier {
  String currentPageTitle = "Sign in methods";

  bool isLightTheme = true;

  List<List<String>> previousPages = [];
  String currentPage = "/signInMethods";

  void changeTheme(bool newTheme) {
    isLightTheme = newTheme;
    notifyListeners();
  }

  void changePage(String newPage, String title) {
    //keep track of previous poges
    previousPages.add([currentPage, currentPageTitle]);
    currentPage = newPage;

    //change appbar title
    currentPageTitle = title;
    notifyListeners();
  }

  void pop() {
    switch (previousPages.isEmpty) {
      case true:
        Fluttertoast.showToast(msg: "You've reached the end", );
        break;
      case false:
        currentPage = previousPages.last[0];
        currentPageTitle = previousPages.last[1];

        previousPages.removeLast();
        notifyListeners();
        break;
    }
  }

  void removePageHistory() {
    previousPages.clear();
    notifyListeners();
  }
}