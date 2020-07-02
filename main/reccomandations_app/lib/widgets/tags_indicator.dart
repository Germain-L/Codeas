import 'package:flutter/material.dart';

class TagsIndicator extends StatelessWidget {
  final String tagName;
  TagsIndicator({@required this.tagName});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Theme.of(context).accentColor, width: 2),
      ),
      child: Center(
        child: Text(tagName),
      ),
    );
  }
}
