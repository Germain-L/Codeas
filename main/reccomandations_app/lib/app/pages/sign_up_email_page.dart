import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:reccomandations_app/provider/login_provider.dart';
import 'package:reccomandations_app/provider/navigation_provider.dart';

class SignUpEmailPage extends StatefulWidget {
  @override
  _SignUpEmailPageState createState() => _SignUpEmailPageState();
}

class _SignUpEmailPageState extends State<SignUpEmailPage> {
  TextEditingController email1;
  TextEditingController email2;
  TextEditingController password1;
  TextEditingController password2;
  FocusNode email1Node = FocusNode();
  FocusNode email2Node = FocusNode();
  FocusNode password1Node = FocusNode();
  FocusNode password2Node = FocusNode();

  String errorText = "";

  double opacity = 0;

  @override
  void initState() {
    super.initState();
    email1 = TextEditingController();
    email2 = TextEditingController();
    password1 = TextEditingController();
    password2 = TextEditingController();
  }

  bool isValid() {
    bool isEmailCorrect = false;
    bool isPasswordCorrect = false;

    if (email1.text == email2.text) {
      isEmailCorrect = true;
    } else {
      setState(() {
        errorText = "Emails don't match";
        opacity = 1;
      });
    }

    if (password1.text == password2.text) {
      isPasswordCorrect = true;
    } else {
      setState(() {
        errorText = "Passwords don't match";
      });
    }

    if (isEmailCorrect && isPasswordCorrect) {
      setState(() {
        errorText = "";
        opacity = 0;
      });
      return true;
    }
    return false;
  }

  Widget inputBox(String name, Icon icon, TextEditingController controller,
      FocusNode currentNode, FocusNode nextNode) {
    bool autocorrect =
        name == "Email" || name == "Confirm email" ? false : true;

    bool obscure = name == "Email" || name == "Confirm email" ? false : true;
    return TextFormField(
      decoration: InputDecoration(
        labelText: name,
        icon: icon,
      ),
      autofocus: false,
      autocorrect: autocorrect,
      obscureText: obscure,
      controller: controller,
      focusNode: currentNode,
      onFieldSubmitted: (String value) {
        print(value);

        FocusScope.of(context).requestFocus(nextNode);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    FocusScope.of(context).requestFocus(email1Node);
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
            child: Text(
              errorText,
              style: TextStyle(color: Colors.redAccent),
            ),
            opacity: opacity,
          ),
          inputBox(
              "Email", Icon(MdiIcons.email), email1, email1Node, email2Node),
          inputBox("Confirm email", Icon(MdiIcons.emailCheck), email2,
              email2Node, password1Node),
          inputBox("Password", Icon(MdiIcons.lock), password1, password1Node,
              password2Node),
          TextFormField(
            decoration: InputDecoration(
              labelText: "Confirm password",
              icon: Icon(Icons.lock_outline),
            ),
            autocorrect: false,
            obscureText: true,
            controller: password2,
            focusNode: password2Node,
            onFieldSubmitted: (String value) {
              isValid();
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FlatButton(
                child: Text("Have an account ?"),
                onPressed: () {
                  navigationProvider.changePage(
                      "/signInEmail", "Sign in with email");
                },
              ),
              FlatButton(
                child: Text("Submit"),
                onPressed: () async  {

                  if (isValid()) {
                    Map returnedValue = await loginProvider.emailSignUp(email1.text, password1.text);
                    if (!returnedValue["success"]) {
                      setState(() {
                        errorText = returnedValue["exception"].message;
                        opacity = 1;
                      });
                    } else if (returnedValue["success"]) {
                      Fluttertoast.showToast(msg: "Accont creation successful");
                      navigationProvider.changePage(
                      "/signInEmail", "Sign in with email");
                      navigationProvider.removePageHistory();
                    }
                  } else {
                    setState(() {
                      errorText = "Something failed";
                      opacity = 1;
                    });
                  }
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}
