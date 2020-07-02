import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/project_template.dart';
import '../../provider/navigation_provider.dart';
import '../../provider/project_provider.dart';
import '../../widgets/project_cards.dart';

class HomePage extends StatelessWidget {
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
        physics: BouncingScrollPhysics(),
        itemCount: selectedProjects.length,
        itemBuilder: (BuildContext context, int index) {
          return ProjectCard(
            project: selectedProjects[index],
          );
        },
      );
    }
    return Container(
      color: Theme.of(context).canvasColor,
      child: currentWidget,
    );
  }
}
