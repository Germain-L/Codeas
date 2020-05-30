import 'package:flutter/material.dart';
import 'package:reccomandations_app_v2/UI/project_page.dart';
import 'package:reccomandations_app_v2/models/project_template.dart';

class ProjectCard extends StatelessWidget {
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

  ProjectCard({@required this.project});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      child: InkWell(
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) => ProjectPage(project: project),
          ),
        ),
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
                    child: Container(),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(project.name,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1
                          .merge(TextStyle(fontSize: 18))),
                  Divider(
                    color: Theme.of(context).dividerColor,
                  ),
                  Text(
                    project.description,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        .merge(TextStyle(fontSize: 15)),
                  ),
                  Divider(
                    color: Theme.of(context).dividerColor,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: project.tags
                          .map<Container>((tag) => Container(
                                padding: EdgeInsets.all(5),
                                margin: EdgeInsets.symmetric(horizontal: 5),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: Theme.of(context).cursorColor)),
                                child: Text(tag.toString(),
                                    style:
                                        Theme.of(context).textTheme.bodyText1),
                              ))
                          .toList(),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
