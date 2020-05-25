import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reccomandations_app/pages/post.dart';
import 'package:reccomandations_app/provider/firebase.dart';

class HomeTopLevel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => FirebaseProjects(),
          )
        ],
        child: Home(),
      ),
    );
  }
}



class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final projectsProvider = Provider.of<FirebaseProjects>(context);
    return Container(
      child: PostProject()
    );
  }
}