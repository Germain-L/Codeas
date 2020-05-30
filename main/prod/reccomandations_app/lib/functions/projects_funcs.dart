import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:reccomandations_app/main.dart';
import 'package:reccomandations_app/models/project_template.dart';



Future<List<Project>> getProjects(List<String> tags) async {

  //get docuements with projects from firebase
  QuerySnapshot querySnapshot = await databaseReference.collection("challenges").getDocuments();
  List<DocumentSnapshot> projectsArrayAsMap = querySnapshot.documents;

  // convert to custom dart objects<Project> and store in a List
  List<Project> projectsArray = projectsArrayAsMap.map<Project>((project) {
    return Project.fromFirebase({
      "difficulty": project["difficulty"],
      "name": project["name"],
      "description": project["description"],
      "tags": project["tags"],
    });
  }).toList();


  // add each project to a Map such as {"algebra" : [project]}
  Map<String, List> tagsMap = Map();

  for (Project project in projectsArray) {
    String newTag = project.tags[0];
    if (!tagsMap.containsKey(newTag)){
      tagsMap[newTag] = [project];
    } else {
      tagsMap[newTag].add(project);
    }
  }


  // create a List<Project> and add only wanted tags lists 
  List<Project> projectsOnlyTagged = [];

  for (String tag in tags) {
    tagsMap[tag].forEach((element) => projectsOnlyTagged.add(element));
  }


  return projectsOnlyTagged;
}