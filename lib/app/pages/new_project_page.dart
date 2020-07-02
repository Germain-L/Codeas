import 'package:flutter/material.dart';

class NewProjectPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).canvasColor,
      child: ListView.builder(
        itemCount: 50,
        itemBuilder: (BuildContext context, int index) => ListTile(
          title: Text(
            index.toString(),
          ),
        ),
      ),
    );
  }
}
