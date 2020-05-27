import 'package:flutter/material.dart';
import 'package:reccomandations_app_v2/UI/widget/project_card.dart';
import 'package:reccomandations_app_v2/main.dart';
import 'package:reccomandations_app_v2/models/project_template.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Project> projects = [];

  Widget getProjects() {
    // Widget currentWidget;
    // projects.isEmpty
    //     ? currentWidget = Container(
    //         child: Center(
    //           child: Text("Nothing to display"),
    //         ),
    //       )
    //     : currentWidget = ListView.builder(
    //         physics: const AlwaysScrollableScrollPhysics(),
    //         itemCount: projects.length,
    //         itemBuilder: (BuildContext context, int index) => ProjectCard(
    //           project: projects[index],
    //         ),
    //       );
    return ListView.builder(
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: projects.length,
        itemBuilder: (BuildContext context, int index) =>
            ProjectCard(project: projects[index]));
  }

  Future<void> refresh() async {
    var temp = (await databaseReference.collection("challenges").getDocuments())
        .documents;

    setState(() {
      projects = temp.map<Project>(
        (e) => Project.fromFirebase({
          "difficulty": e.data["difficulty"],
          "name": e.data["name"],
          "description": e.data["description"],
          "tags": e.data["tags"],
        }),
      ).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Text("Codeas"),
        actions: [
          IconButton(
            icon: Icon(Icons.sort),
            onPressed: () => print("sorting"),
          )
        ],
      ),
      body: Container(
        color: Colors.white10,
        child: RefreshIndicator(
          child: getProjects(),
          onRefresh: refresh,
        ),
      ),
    );
  }
}
