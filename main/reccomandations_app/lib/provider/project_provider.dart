import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:reccomandations_app/main.dart';
import 'package:reccomandations_app/models/project_template.dart';

class ProjectProvider with ChangeNotifier {
  Map projectsToDisplay = Map();

  void getProjet(List<String> tags) async {
    QuerySnapshot querySnapshot = await databaseReference.collection("challenges").getDocuments();
    List<DocumentSnapshot> projectSnapShotsList = querySnapshot.documents;
    
    Map<String, List<Project>> mapOfProjectsByTags = Map();

    for (DocumentSnapshot projectSnapshot in projectSnapShotsList) {
      Project currentProject = Project.fromFirebase({
        "name": projectSnapshot.data["name"],
        "difficulty": projectSnapshot.data["difficulty"],
        "description": projectSnapshot.data["description"],
        "tags": projectSnapshot.data["tags"],
        "comments": projectSnapshot.data["comments"],
      });

      

      currentProject.tags.forEach((tag) {
        if (!mapOfProjectsByTags.containsKey(tag)) {
          mapOfProjectsByTags[tag] = List<Project>();
        }
      });

      mapOfProjectsByTags[currentProject.tags[0]].add(currentProject);
    }

    mapOfProjectsByTags.forEach((key, value) {
      if(tags.contains(key)){
        projectsToDisplay[key] = mapOfProjectsByTags[key];
      }
    });
    notifyListeners();
  }
}