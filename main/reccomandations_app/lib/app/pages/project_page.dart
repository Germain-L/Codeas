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

    Project project = projectProvider.currentProject;
    return Container(
      color: Theme.of(context).canvasColor,
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Divider(thickness: 2),
          Text(
            "What's the task?",
            style: Theme.of(context).textTheme.headline1,
          ),
          Text(
            project.description,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          Divider(thickness: 2),
          Text(
            "Comments",
            style: Theme.of(context).textTheme.headline1,
          ),
          Expanded(
            // child: ListView.builder(
            //   itemCount: project.comments.length,
            //   physics: BouncingScrollPhysics(),
            //   itemBuilder: (BuildContext context, int index) {
            //     return Text(project.comments[index].toString());
            //   }
            // ),
            child: project.comments.isEmpty
                ? Center(
                    child: Text("No comments yet"),
                  )
                : ListView.builder(
                    itemCount: project.comments.length,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return Text(project.comments[index].toString());
                    }),
          )
        ],
      ),
    );
  }
}
