import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reccomandations_app/provider/navigation_provider.dart';
class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final navigation = Provider.of<NavigationProvider>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(navigation.currentPage, style: TextStyle(fontSize: 35, color: Colors.black, fontWeight: FontWeight.w700),),
      ),
      body: Center(
        child: FlatButton(
          onPressed: () => navigation.changePage(),
          child: Text("Switch")
        ),
      ),
    );
  }
}