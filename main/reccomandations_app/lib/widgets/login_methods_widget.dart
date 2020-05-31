import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';


class LoginMethod extends StatelessWidget {
  final String text;
  final Icon icon;
  final void Function() onTap;
  LoginMethod({@required this.text, @required this.onTap, @required this.icon});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5),
      child: ListTile(
        title: Text(text),
        trailing: icon,
        onTap: onTap,
      ),
    );
  }
}