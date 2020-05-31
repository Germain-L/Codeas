import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class NavigationProvider with ChangeNotifier {
  String currentPageTitle = "Sign in methods";

  List<List<String>> previousPages = [];
  String currentPage = "/signInMethods";

  void changePage(String newPage, String title) {
    //keep track of previous poges
    previousPages.add([currentPage, currentPageTitle]);
    currentPage = newPage;

    //change appbar title
    currentPageTitle = title;
    notifyListeners();
  }

  void pop() {
    currentPage = previousPages.last[0];
    currentPageTitle = previousPages.last[1];

    previousPages.removeLast();
    notifyListeners();
  }

  void removePageHistory() {
    previousPages = [];
    notifyListeners();
  }
}