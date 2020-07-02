import 'package:flutter/material.dart';


class LoginMethod extends StatelessWidget {
  final String text;
  final Icon icon;
  final void Function() onTap;
  LoginMethod({@required this.text, @required this.onTap, @required this.icon});
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10)
      ),
      color: Colors.white,
      onPressed: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text, style: Theme.of(context).textTheme.headline3,),
          icon
        ],
      ),
    );
  }
}