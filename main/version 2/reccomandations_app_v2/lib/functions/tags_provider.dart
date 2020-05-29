import 'package:flutter/foundation.dart';


class Tags with ChangeNotifier {
  List tags = [];

  void addOrRemoveTag(String tag) {
    switch (tags.contains(tag)){
      case true:
        tags.remove(tag);
        break;
      
      case false:
        tags.add(tag);
        break;
    }

    notifyListeners();
  }

}