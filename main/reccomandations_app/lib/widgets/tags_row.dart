import 'package:flutter/material.dart';
import 'package:reccomandations_app/widgets/tags_indicator.dart';

class TagsRow extends StatelessWidget {
  final List<String> tagsToDisplay;

  TagsRow({@required this.tagsToDisplay});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: tagsToDisplay.map<Widget>((String tag) {
            return TagsIndicator(
              tagName: tag,
            );
          }).toList(),
        ),
      ),
    );
  }
}
