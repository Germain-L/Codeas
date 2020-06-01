import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:reccomandations_app/provider/login_provider.dart';
import 'package:reccomandations_app/provider/navigation_provider.dart';

class SignInEmailPage extends StatefulWidget {
  @override
  _SignInEmailPageState createState() => _SignInEmailPageState();
}

class _SignInEmailPageState extends State<SignInEmailPage> {
  TextEditingController emailController;
  TextEditingController passwordController;
  FocusNode emailNode = FocusNode();
  FocusNode passwordNode = FocusNode();

  String errorText = "";
  double opacity = 0;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context);
    final navigationProvider = Provider.of<NavigationProvider>(context);
    return Container(
      color: Theme.of(context).canvasColor,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedOpacity(
            duration: Duration(milliseconds: 350),
            child: Text(errorText, textAlign: TextAlign.center, style: TextStyle(color: Colors.redAccent),),
            opacity: opacity,
          ),
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
            autocorrect: false,
            obscureText: true,
            controller: passwordController,
            focusNode: passwordNode,
            onFieldSubmitted: (String value) async {
              print(value);
              FocusScope.of(context).unfocus();
              Map returnedValue = await loginProvider.emailSignIn(emailController.text, passwordController.text);

              if (loginProvider.user != null) {
                navigationProvider.changePage("/home", "Home");
                navigationProvider.removePageHistory();
              }
 
              if (!returnedValue["success"]) {
                setState(() {
                  errorText = returnedValue["exception"].message;
                  opacity = 1;
                });
              }
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
            onPressed: () async {
              Map returnedValue = await loginProvider.emailSignIn(emailController.text, passwordController.text);

              if (loginProvider.user != null) {
                navigationProvider.changePage("/home", "Home");
                navigationProvider.removePageHistory();
              }

              if (!returnedValue["success"]) {
                setState(() {
                  errorText = returnedValue["exception"].message;
                  opacity = 1;
                });
              }
            },
          ),
          AnimatedOpacity(
            opacity: loginProvider.loaderOpacity,
            duration: Duration(milliseconds: 350),
            child: CircularProgressIndicator(),
          )
        ],
      ),
    );
  }
}
