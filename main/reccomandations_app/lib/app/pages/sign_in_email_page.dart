import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class SignInEmailPage extends StatefulWidget {
  @override
  _SignInEmailPageState createState() => _SignInEmailPageState();
}

class _SignInEmailPageState extends State<SignInEmailPage> {
  TextEditingController emailController;
  TextEditingController passwordController;
  FocusNode emailNode = FocusNode();
  FocusNode passwordNode = FocusNode();

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            decoration: InputDecoration(
              labelText: "Email",
              icon: Icon(MdiIcons.email),
            ),
            autofocus: true,
            autocorrect: true,
            obscureText: false,
            controller: emailController,
            focusNode: emailNode,
            onFieldSubmitted: (String value) {
              print(value);
              FocusScope.of(context).requestFocus(passwordNode);
            },
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: "Password",
              icon: Icon(MdiIcons.lock),
            ),
            autofocus: false,
            autocorrect: true,
            obscureText: false,
            controller: passwordController,
            focusNode: passwordNode,
            onFieldSubmitted: (String value) {
              print(value);
              FocusScope.of(context).requestFocus(passwordNode);
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlatButton(
                child: Text("Create an account"),
                onPressed: () => null,
              ),
              FlatButton(
                child: Text("Forgot password"),
                onPressed: () => null,
              ),
            ],
            
          ),
          FlatButton(
            child: Text("Sign in"),
            onPressed: () => null,
          ),
        ],
      ),
    );
  }
}
