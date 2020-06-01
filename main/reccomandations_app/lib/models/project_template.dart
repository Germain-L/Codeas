import 'package:reccomandations_app/models/comment_template.dart';

class Project {
  String difficulty;
  String name;
  String description;
  List<dynamic> tags;
  List<Comment> comments;

  Project.fromFirebase(Map data) {
    difficulty = data["difficulty"];
    name = data["name"];
    description = data["description"];
    tags = data["tags"];
    comments = data["comments"].map<Comment>(
      (commentFromFirebase) => Comment(
          name: commentFromFirebase["name"],
          comment: commentFromFirebase["comment"]),
    );
  }
}
