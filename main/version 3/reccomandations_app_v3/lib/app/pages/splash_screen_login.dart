import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reccomandations_app_v3/provider/login_provider.dart';


class SplashLoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final login = Provider.of<LoginProvider>(context);
    
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(login.user == null ? "Not sign in":"Signed in as ${login.user.displayName}"),
          FlatButton(
            onPressed: () => login.googleSignIn(),
            child: Text("Sign in with google"),
          ),
          FlatButton(
            onPressed: () => null,
            child: Text("Sign in with email"),
          ),
          FlatButton(
            onPressed: () => null,
            child: Text("Sign up with email"),
          ),
        ],
      ),
    );
  }
}