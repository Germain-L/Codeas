import 'package:flutter/material.dart';
import 'package:reccomandations_app_v2/UI/widget/project_card.dart';
import 'package:reccomandations_app_v2/models/project_template.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
        child: ListView.builder(
          itemCount: 50,
          itemBuilder: (BuildContext context, int index) {
            return ProjectCard(
              project: Project.fromFirebase(
                {
                  "name": "Test number ${index.toString()}",
                  "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. \n Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                  "difficulty" : index % 5 < 1 ? "easy" : "medium",
                  "tags": <String>["Social", "Test"]
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
