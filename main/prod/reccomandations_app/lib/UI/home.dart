import 'package:flutter/material.dart';
import 'package:reccomandations_app/UI/widget/project_card.dart';
import 'package:reccomandations_app/main.dart';
import 'package:reccomandations_app/models/project_template.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Project> projects = [];

  List<String> tags = ["numbers"];

  Widget getProjects() {
    return ListView.builder(
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: projects.length,
        itemBuilder: (BuildContext context, int index) =>
            ProjectCard(project: projects[index]));
  }

  Future<void> refresh() async {
    var temp = [];

    switch (tags.isEmpty) {
      case true:
        temp = (await databaseReference.collection("challenges").getDocuments())
            .documents;
        break;

      case false:
        temp = (await databaseReference
                .collection("challenges")
                .where("tags", arrayContainsAny: tags)
                .getDocuments())
            .documents;
    }

    setState(() => projects = temp
        .map<Project>(
          (e) => Project.fromFirebase({
            "difficulty": e.data["difficulty"],
            "name": e.data["name"],
            "description": e.data["description"],
            "tags": e.data["tags"],
          }),
        )
        .toList());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 1,
          title: Text("CodEas"),
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
      ),
    );
  }
}
