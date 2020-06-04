import 'package:flutter/material.dart';
import 'package:reccomandations_app/models/project_template.dart';

class ProjectCard extends StatelessWidget {
  final Project project;
  ProjectCard({this.project});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      color: Colors.white,
      child: Column(
        children: [
          Text(project.name),
          Text(project.description, maxLines: 3,)
        ],
      ),
    );
  }
}
