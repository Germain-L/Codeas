import 'package:flutter/material.dart';
import 'package:reccomandations_app_v2/models/project_template.dart';

class ProjectPage extends StatelessWidget {
  final Project project;

  Color difficultyColor(String string) {
    switch (string.toLowerCase()) {
      case "easy":
        return Colors.greenAccent;
      case "medium":
        return Colors.orangeAccent;
      case "hard":
        return Colors.redAccent;
    }
    return Colors.transparent;
  }

  static const double horizontalPaddingSize = 10;
  static const double verticalPaddingSize = 4;

  ProjectPage({@required this.project});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: Text(
                project.difficulty,
                style: TextStyle(
                    fontSize: 25, color: difficultyColor(project.difficulty)),
              ),
            ),
          )
        ],
        elevation: 2,
        title: Text(project.name),
      ),
      body: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: horizontalPaddingSize, vertical: verticalPaddingSize),
              child: Text(
                "What the projet consists of:",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
              ),
            ),
            Divider(
              indent: 5,
              endIndent: 5,
              color: Colors.black,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: horizontalPaddingSize),

              child: Text(
                project.description,
                style: TextStyle(fontSize: 20),
              ),
            ),
            Divider(
              indent: 5,
              endIndent: 5,
              color: Colors.black,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Comments:",style:TextStyle(fontSize: 25, fontWeight: FontWeight.w600),),
            ),
            Expanded(
              child: ListView.separated(
                separatorBuilder: (BuildContext context, int index) {
                  return Divider(indent: 20, endIndent: 20,);
                },
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("This is a comment", style: TextStyle(fontSize: 18),),
                  );
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => null,
        child: Icon(Icons.comment),
      ),
    );
  }
}
