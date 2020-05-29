import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:reccomandations_app_v2/main.dart';
import 'package:reccomandations_app_v2/models/project_template.dart';



Future<Map<String, List<Object>>> getProjects(List tags) async {
  QuerySnapshot querySnapshot = await databaseReference.collection("challenges").getDocuments();

  List<DocumentSnapshot> projectsArrayAsMap = querySnapshot.documents;

  List<Project> projectsArray = projectsArrayAsMap.map<Project>((project) {
    return Project.fromFirebase({
      "difficulty": project["difficulty"],
      "name": project["name"],
      "description": project["description"],
      "tags": project["tags"],
    });
  }).toList();

  Map<String, List> tagsMap = Map();

  for (Project project in projectsArray) {
    String newTag = project.tags[0];
    if (!tagsMap.containsKey(newTag)){
      tagsMap[newTag] = [project];
    } else {
      tagsMap[newTag].add(project);
    }
  }

  //TODO: return only list in tagsMap where tags is

  print(tagsMap);
  return tagsMap;
}