import 'package:flutter/material.dart';
import 'package:reccomandations_app_v2/UI/widget/body.dart';

class HomeV2 extends StatefulWidget {
  @override
  _HomeV2State createState() => _HomeV2State();
}

class _HomeV2State extends State<HomeV2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Codeas"),
      ),
      body: Body(),
    );
  }
}