class Project {
  String difficulty;
  String name;
  String description;
  List<dynamic> tags;
  List<dynamic> comments;

  Project.fromFirebase(Map data) {
    difficulty = data["difficulty"];
    name = data["name"];
    description = data["description"];
    tags = data["tags"];
  }
}