import 'package:flutter/material.dart';
import 'package:reccomandations_app/models/project_template.dart';

class ProjectCard extends StatelessWidget {
  final Project project;
  ProjectCard({this.project});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      color: Theme.of(context).primaryColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(project.name, style: Theme.of(context).textTheme.headline1, textAlign: TextAlign.start,),
            Divider(),
            Text(project.description, maxLines: 3, overflow: TextOverflow.ellipsis,)
          ],
        ),
      ),
    );
  }
}
