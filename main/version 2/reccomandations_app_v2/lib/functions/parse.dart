import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:reccomandations_app_v2/main.dart';

const List<String> txts = [
  "algorithm.txt",
  "classes.txt",
  "data structures.txt",
  "file.txt",
  "graphical.txt",
  "text.txt",
  "web.txt",
  "db.txt",
  "graph.txt",
  "network.txt",
  "numbers.txt",
  "security.txt",
  "threading.txt",
];

Future<String> loadAsset(String name) async {
  return await rootBundle.loadString(name);
}

void writeToFire() async {
  for (String fileName in txts) {
    String file = await loadAsset("assets/$fileName");
    List splitLines = file.split("\n");
    List splitNameCategory = splitLines.map((e) => e.split(" - ")).toList();

    List tags = [fileName.substring(0, fileName.length -4)];
    
    for (List project in splitNameCategory) {
      String name = project[0];
      String description = project[1];

      await databaseReference.collection("challenges").document().setData({
        "name": name,
        "description": description,
        "difficulty": "Easy",
        "tags": tags
      });
    }
  }
}
