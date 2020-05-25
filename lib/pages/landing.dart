import 'package:flutter/material.dart';
import 'package:reccomandations_app/pages/login.dart';


class Landing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Card(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                children: [
                  Text("CodePro", style: TextStyle(fontSize: 35),),
                  Text("learn by doing", style: TextStyle(fontSize: 18),),
                ],
              ),
            ),
          ),

          Login()
        ],
      )
    );
  }
}