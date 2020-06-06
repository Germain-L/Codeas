import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:reccomandations_app/models/project_template.dart';
import 'package:reccomandations_app/provider/navigation_provider.dart';
import 'package:reccomandations_app/provider/project_provider.dart';
import 'package:reccomandations_app/widgets/tags_row.dart';

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
    final navigationProvider = Provider.of<NavigationProvider>(context);
    final projectProvider = Provider.of<ProjectProvider>(context);
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      color: Theme.of(context).cardColor,
      child: InkWell(
        onTap: () {
          projectProvider.currentProject = project;
          navigationProvider.changePage('/project', project.name);
        },
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Container(
                decoration: BoxDecoration(
                    color: difficultyColor(project.difficulty),
                    borderRadius: BorderRadius.circular(3)),
                height: 15,
                width: 15,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    project.name,
                    style: Theme.of(context).textTheme.headline1,
                    textAlign: TextAlign.start,
                  ),
                  Divider(),
                  Text(
                    project.description,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Divider(),
                  Row(
                    children: [
                      Expanded(
                        flex: 75,
                        child: TagsRow(
                          tagsToDisplay: project.tags,
                        ),
                      ),
                      Expanded(
                        flex: 10,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(project.comments.length.toString()),
                            SizedBox(
                              width: 5,
                            ),
                            Icon(MdiIcons.commentText)
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
