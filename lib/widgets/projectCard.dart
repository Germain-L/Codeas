import 'package:flutter/material.dart';
import 'package:reccomandations_app/provider/firebase.dart';


class ProjectCard extends StatelessWidget {
  final Project project;
  ProjectCard({this.project});

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

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.topRight,
                child: SizedBox(
                  height: 15,
                  width: 15,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: difficultyColor(project.difficulty),
                    ),
                    child: Text(""),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(project.name, style: TextStyle(fontSize: 25)),
                  Divider(),
                  Text(project.description, style: TextStyle(fontSize: 19)),
                  Divider(),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: project.tags.map<Container>((tag) => Container(
                        padding: EdgeInsets.all(5),
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black38)
                        ),
                        child: Text(tag.toString()),
                      )).toList(),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      )
    );
  }
}