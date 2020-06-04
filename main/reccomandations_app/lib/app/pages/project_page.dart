import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reccomandations_app/models/project_template.dart';
import 'package:reccomandations_app/provider/navigation_provider.dart';
import 'package:reccomandations_app/provider/project_provider.dart';
import 'package:reccomandations_app/widgets/project_cards.dart';

class ProjectPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final projectProvider = Provider.of<ProjectProvider>(context);
    final navigationProvider = Provider.of<NavigationProvider>(context);
    Widget currentWidget = Container(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
    if (projectProvider.projectsToDisplay.isNotEmpty) {
      List<Project> selectedProjects = [];
      projectProvider.projectsToDisplay.forEach((key, value) {
        projectProvider.projectsToDisplay[key].forEach((e) {
          selectedProjects.add(e);
        });
      });
      currentWidget = ListView.builder(
        itemCount: selectedProjects.length,
        itemBuilder: (BuildContext context, int index) {
          return ProjectCard(
            project: selectedProjects[index],
          );
        },
      );
    }
    return currentWidget;
  }
}
