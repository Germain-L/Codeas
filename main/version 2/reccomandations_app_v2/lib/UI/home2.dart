import 'package:filter_list/filter_list.dart';
import 'package:flutter/material.dart';
import 'package:reccomandations_app_v2/UI/widget/body.dart';

class HomeV2 extends StatefulWidget {
  @override
  _HomeV2State createState() => _HomeV2State();
}

class _HomeV2State extends State<HomeV2> {
  static const List<String> tags = [
    "algorithm",
    "classes",
    "data structures",
    "db",
    "file",
    "graph",
    "graphical",
    "network",
    "numbers",
    "security",
    "text",
    "threading",
    "web"
  ];
  List<String> selectedTags = [
    "algorithm",
    "classes",
    "data structures",
    "db",
    "file",
    "graph",
    "graphical",
    "network",
    "numbers",
    "security",
    "text",
    "threading",
    "web"
  ];

  void openFilter() async {
    var list = await FilterList.showFilterList(
      context,
      height: 355,
      allTextList: tags,
      borderRadius: 10,
      headlineText: "Select categories",
      selectedTextList: selectedTags,
      hideSearchField: true,
      hidecloseIcon: true,
      hideSelectedTextCount: true,
      // hideheader: true,
      // hideheaderText: true
    );

    if (list != null) {
      setState(() {
        selectedTags = List.from(list);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Codeas"),
        actions: [
          IconButton(
            onPressed: openFilter,
            icon: Icon(Icons.sort),
          )
        ],
      ),
      body: Body(tags: selectedTags),
    );
  }
}
