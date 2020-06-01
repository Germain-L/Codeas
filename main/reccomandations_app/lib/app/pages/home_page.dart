import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reccomandations_app/provider/login_provider.dart';


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context);
    return Container(
      color: Theme.of(context).canvasColor,
      child: Center(
        child: Text(loginProvider.user.email),
      ),
    );
  }
}