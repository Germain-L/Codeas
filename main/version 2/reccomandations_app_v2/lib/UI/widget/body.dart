import 'package:flutter/material.dart';
import 'package:reccomandations_app_v2/UI/widget/project_card.dart';
import 'package:reccomandations_app_v2/functions/projects_funcs.dart';
import 'package:reccomandations_app_v2/models/project_template.dart';

class Body extends StatefulWidget {
  final List<String> tags;
  Body({this.tags});
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getProjects(widget.tags),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext context, int index) {
              return ProjectCard(project: snapshot.data[index]);
            },
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
