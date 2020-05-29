// import 'package:animations/animations.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:reccomandations_app_v2/UI/widget/project_card.dart';
// import 'package:reccomandations_app_v2/functions/tags_provider.dart';
// import 'package:reccomandations_app_v2/main.dart';
// import 'package:reccomandations_app_v2/models/project_template.dart';
// import 'package:strings/strings.dart';

// class HomeTop extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (context) => Tags(),
//       child: Home(),
//     );
//   }
// }

// class Home extends StatefulWidget {
//   @override
//   _HomeState createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   Map<String, List<Project>> projects = {
//     "algorithms": [],
//     "classes": [],
//     "data" "structures": [],
//     "db": [],
//     "file": [],
//     "graph": [],
//     "graphical": [],
//     "network": [],
//     "numbers": [],
//     "security": [],
//     "text": [],
//     "threading": [],
//     "web": []
//   };
//   static const List tags = [
//     "algorithms",
//     "classes",
//     "data" "structures",
//     "db",
//     "file",
//     "graph",
//     "graphical",
//     "network",
//     "numbers",
//     "security",
//     "text",
//     "threading",
//     "web"
//   ];
//   List selectedTags = [];
//   List<bool> checkboxValues = [
//     false,
//     false,
//     false,
//     false,
//     false,
//     false,
//     false,
//     false,
//     false,
//     false,
//     false,
//     false,
//   ];

//   Future<void> refresh() async {
//     List<DocumentSnapshot> temp = [];
//     temp = (await databaseReference.collection("challenges").getDocuments())
//         .documents;

//     temp.forEach((DocumentSnapshot value) {
//       projects[value.data[tags]].add(Project.fromFirebase({
//         "name": value.data["name"],
//         "description": value.data["description"],
//         "tags": value.data["tags"],
//         "difficulty": value.data["difficulty"],
//       }));
//     });

//   Widget projectsListview() {
//     return Column(
//       children: [
//         Expanded(
//           child: ListView.builder(
//               physics: const AlwaysScrollableScrollPhysics(),
//               itemCount: projects.length,
//               itemBuilder: (BuildContext context, int index) =>
//                   ProjectCard(project: projects[index])),
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Container(
//               width: MediaQuery.of(context).size.width * 0.78,
//               child: SingleChildScrollView(
//                 scrollDirection: Axis.horizontal,
//                 child: Row(
//                   children: tags.map<Widget>((e) {
//                     return Chip(
//                       avatar: selectedTags.contains(e)
//                           ? Icon(Icons.check)
//                           : Icon(Icons.clear),
//                       label: Text(e.toString()),
//                     );
//                   }).toList(),
//                 ),
//               ),
//             ),
//             FlatButton(
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10)),
//               color: Theme.of(context).accentColor,
//               onPressed: () => null,
//               child: Text("Apply"),
//             )
//           ],
//         ),
//       ],
//     );
//   }

//   @override
//   void initState() {
//     super.initState();
//     refresh();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           elevation: 1,
//           title: Text("Codeas"),
//           actions: [
//             IconButton(
//               icon: Icon(Icons.sort),
//               onPressed: () {
//                 // showModalBottomSheet(
//                 //     context: context,
//                 //     builder: (BuildContext context) {
//                 //       return modalSheetSort();
//                 //     });
//               },
//             )
//           ],
//         ),
//         body: Container(
//           color: Colors.white10,
//           child: RefreshIndicator(
//             child: projectsListview(),
//             onRefresh: refresh,
//           ),
//         ),
//       ),
//     );
//   }
// }
