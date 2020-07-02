import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../provider/login_provider.dart';
import '../../provider/navigation_provider.dart';

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
          Text(
            loginProvider.errorMessage,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.redAccent),
          ),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelStyle: TextStyle(
                color: navigationProvider.isLightTheme
                    ? Colors.black
                    : Colors.white,
              ),
              border: InputBorder.none,
              icon: Icon(
                MdiIcons.email,
                color: Theme.of(context).iconTheme.color,
              ),
              labelText: "Email",
              contentPadding: const EdgeInsets.only(
                left: 15,
                bottom: 11,
                top: 11,
                right: 15,
              ),
            ),
            style: TextStyle(
              color:
                  navigationProvider.isLightTheme ? Colors.black : Colors.white,
            ),
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
            keyboardType: TextInputType.visiblePassword,
            style: TextStyle(
              color:
                  navigationProvider.isLightTheme ? Colors.black : Colors.white,
            ),
            decoration: InputDecoration(
              labelStyle: TextStyle(
                color: navigationProvider.isLightTheme
                    ? Colors.black
                    : Colors.white,
              ),
              border: InputBorder.none,
              icon: Icon(
                MdiIcons.lock,
                color: Theme.of(context).iconTheme.color,
              ),
              labelText: "Password",
              contentPadding: const EdgeInsets.only(
                left: 15,
                bottom: 11,
                top: 11,
                right: 15,
              ),
            ),
            autocorrect: false,
            obscureText: true,
            controller: passwordController,
            focusNode: passwordNode,
            onFieldSubmitted: (String value) async {
              print(value);
              FocusScope.of(context).unfocus();
              await loginProvider.emailSignIn(
                emailController.text,
                passwordController.text,
              );
              if (loginProvider.user != null) {
                navigationProvider.changePage(
                  "/home",
                  "Home",
                );
                navigationProvider.removePageHistory();
              }
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlatButton(
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  "Create an account",
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                onPressed: () {
                  navigationProvider.changePage(
                    "/signUpEmail",
                    "Sign up with email",
                  );
                },
              ),
              SizedBox(width: 15,),
              FlatButton(
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  "Forgot password",
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                onPressed: () => {
                  navigationProvider.changePage(
                    '/forgotPassword',
                    'Password reset',
                  )
                },
              ),
            ],
          ),
          FlatButton(
            shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(10),
                ),
            child: Text(
              "Sign in",
              style: Theme.of(context).textTheme.bodyText1,
            ),
            onPressed: () async {
              loginProvider.emailSignIn(
                  emailController.text, passwordController.text);
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
