import 'package:flutter/material.dart';
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

  bool verify() {
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
      autocorrect: autocorrect,
      obscureText: obscure,
      controller: controller,
      focusNode: currentNode,
      onFieldSubmitted: (String value) {
        print(value);

        nextNode != null
            ? FocusScope.of(context).requestFocus(nextNode)
            : FocusScope.of(context).unfocus();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    FocusScope.of(context).requestFocus(email1Node);
    final loginProvider = Provider.of<LoginProvider>(context);
    final navigationProvider = Provider.of<NavigationProvider>(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedOpacity(
            duration: Duration(milliseconds: 350),
            child: Text(errorText),
            opacity: opacity,
          ),
          inputBox(
              "Email", Icon(MdiIcons.email), email1, email1Node, email2Node),
          inputBox("Confirm email", Icon(MdiIcons.emailCheck), email2,
              email2Node, password1Node),
          inputBox("Password", Icon(MdiIcons.lock), password1, password1Node,
              password2Node),
          inputBox("Confirm password", Icon(Icons.lock_outline), password2,
              password2Node, null),
          FlatButton(
            child: Text("Submit"),
            onPressed: () {
              verify();
            },
          )
        ],
      ),
    );
  }
}
