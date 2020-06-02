import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reccomandations_app/provider/login_provider.dart';


class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context);
    String nameToDisplay = loginProvider.user.displayName ?? loginProvider.user.email;
    return Container(
      child: Center(
        child: Text(nameToDisplay),
      ),
    );
  }
}