import 'package:animations/animations.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:reccomandations_app/main.dart';
import 'package:reccomandations_app/pages/post.dart';
import 'package:reccomandations_app/provider/firebase.dart';
import 'package:reccomandations_app/widgets/projectCard.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future getPosts() async {
    List<Project> projects = [];

    final List<DocumentSnapshot> posts =
        (await databaseReference.collection("projects").getDocuments())
            .documents;

    projects = posts.map<Project>((e) => Project.fromMap(e.data)).toList();

    return projects;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 3,
        title: Text("CodePro"),
      ),
      floatingActionButton: OpenContainer(
        transitionType: ContainerTransitionType.fade,
        openBuilder: (BuildContext context, VoidCallback _) {
          return PostProject();
        },
        closedElevation: 6.0,
        closedShape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(56 / 2),
          ),
        ),
        closedColor: Theme.of(context).colorScheme.secondary,
        closedBuilder: (BuildContext context, VoidCallback openContainer) {
          return SizedBox(
            height: 56,
            width: 56,
            child: Center(
              child: Icon(
                Icons.add,
                color: Theme.of(context).colorScheme.onSecondary,
              ),
            ),
          );
        },
      ),
      body: StreamBuilder(
        stream:
            databaseReference.collection("projects").getDocuments().asStream(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return Center(
                child: Text("Error occured, check connection"),
              );
            case ConnectionState.waiting:
              return Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            case ConnectionState.active:
              List<DocumentSnapshot> docs = snapshot.data.documents;
              List<Project> projects =
                  docs.map<Project>((e) => Project.fromMap(e.data)).toList();
              return ListView.builder(
                itemCount: projects.length,
                itemBuilder: (BuildContext context, int index) {
                  return ProjectCard(
                    project: projects[index],
                  );
                },
              );
            case ConnectionState.done:
              List<DocumentSnapshot> docs = snapshot.data.documents;
              List<Project> projects =
                  docs.map<Project>((e) => Project.fromMap(e.data)).toList();
              return ListView.builder(
                itemCount: projects.length,
                itemBuilder: (BuildContext context, int index) {
                  return ProjectCard(
                    project: projects[index],
                  );
                },
              );
          }

          return Container();
        },
      ),
    );
  }
}
