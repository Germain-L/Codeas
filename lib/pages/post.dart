import 'package:flutter/material.dart';
import 'package:reccomandations_app/main.dart';

class PostProject extends StatefulWidget {
  @override
  _PostProjectState createState() => _PostProjectState();
}

class _PostProjectState extends State<PostProject> {
  TextEditingController name;
  TextEditingController description;
  String difficulty = "Easy";
  String errorMessage = "";
  List<String> tags = [];

  FocusNode nameFocus = FocusNode();
  FocusNode descFocus = FocusNode();

  @override
  void initState() {
    super.initState();
    name = TextEditingController();
    description = TextEditingController();
  }

  Widget tagButton(String tag) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: FlatButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(
                color: tags.contains(tag)
                    ? Theme.of(context).primaryColor
                    : Colors.grey[700],
                width: 2)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(tag),
        ),
        onPressed: () {
          setState(() {
            if (tags.contains(tag)) {
              tags.remove(tag);
              print("$tag removed");
            } else {
              tags.add(tag);
              print("$tag added");
            }
          });
        },
      ),
    );
  }

  void postProject(String name, String description, String difficulty,
      List<String> tags, BuildContext context) async {
    if (name.isEmpty) {
      setState(() {
        errorMessage = "Name cannot be empty";
      });
    } else if (description.isEmpty) {
      setState(() {
        errorMessage = "Description cannot be empty";
      });
    } else if (tags.isEmpty) {
      setState(() {
        errorMessage = "Add at least one tag";
      });
    } else {
      await databaseReference.collection("projects").document().setData({
        "name": name,
        "description": description,
        "difficulty": difficulty,
        "tags": tags
      });
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 3,
        title: Text("Post an idea"),
      ),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Center(
                    child: Text(
                      errorMessage,
                      style: TextStyle(color: Colors.redAccent),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: TextFormField(
                      focusNode: nameFocus,
                      onEditingComplete: () {
                        FocusScope.of(context).requestFocus(descFocus);
                      },
                      expands: false,
                      controller: name,
                      decoration: InputDecoration(
                          labelText: "Name of project idea",
                          icon: Icon(Icons.text_fields)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: TextFormField(
                      focusNode: descFocus,
                      controller: description,
                      onEditingComplete: () {
                        FocusScope.of(context).unfocus();
                      },
                      expands: false,
                      minLines: 1,
                      maxLines: 5,
                      decoration: InputDecoration(
                          labelText: "Description of project idea",
                          icon: Icon(Icons.description)),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text("Difficulty:"),
                      DropdownButton<String>(
                        value: difficulty,
                        onChanged: (String newValue) {
                          setState(() {
                            difficulty = newValue;
                          });
                        },
                        icon: Icon(Icons.arrow_drop_down),
                        items: <String>["Easy", "Medium", "Hard"]
                            .map<DropdownMenuItem<String>>((String value) =>
                                DropdownMenuItem<String>(
                                    child: Text(value), value: value))
                            .toList(),
                      ),
                    ],
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: <Widget>[
                        tagButton("Social"),
                        tagButton("AI"),
                        tagButton("Mobile"),
                        tagButton("Science"),
                        tagButton("Desktop"),
                        tagButton("Web"),
                        tagButton("OS"),
                        tagButton("Database"),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.check),
                    iconSize: 50,
                    onPressed: () {
                      postProject(name.text, description.text, difficulty, tags,
                          context);
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
