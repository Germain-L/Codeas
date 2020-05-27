import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

final databaseReference = Firestore.instance;

void main() {
  runApp(MaterialApp(
    home: Material(child: Home()),
  ));
}

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {

  List<DocumentSnapshot> projects = [];


  void getProjects() async {
    List<DocumentSnapshot> temp = (await databaseReference.collection("projects").getDocuments()).documents;


    setState(() {
      projects = temp;
    });
  }

  @override
  void initState() {
    super.initState();
    getProjects();
  }


  Color difficultyColor(String string) {
    switch (string.toLowerCase()) {
      case "easy":
        return Colors.greenAccent;
      case "medium":
        return Colors.orangeAccent;
      case "hard":
        return Colors.redAccent;
    }
    return Colors.transparent;
  }

  

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: projects.map<Widget>((e) => Container(
        child: Card(
          elevation: 3,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.topRight,
                  child: SizedBox(
                    height: 15,
                    width: 15,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: difficultyColor(e.data["difficulty"]),
                      ),
                      child: Text(""),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(e.data["name"], style: TextStyle(fontSize: 25)),
                    Divider(),
                    Text(e.data["description"], style: TextStyle(fontSize: 19)),
                    Divider(),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: e.data["tags"].map<Container>((tag) => Container(
                          padding: EdgeInsets.all(5),
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.black38)
                          ),
                          child: Text(tag.toString()),
                        )).toList(),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: FlatButton(
                        child: Text("Remove"),
                        onPressed: () async {
                          databaseReference.runTransaction((Transaction transaction) async {
                            await transaction.delete(e.reference);
                          });
                          getProjects();
                        },
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        )
      )).toList(),
    );
  }
}
