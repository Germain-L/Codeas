import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class NavigationProvider with ChangeNotifier {
  String currentPage = "Home";


  changePage() {
    notifyListeners();
  }
}