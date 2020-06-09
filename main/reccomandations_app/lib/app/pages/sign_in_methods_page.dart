import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:reccomandations_app/provider/login_provider.dart';
import 'package:reccomandations_app/provider/navigation_provider.dart';
import 'package:reccomandations_app/widgets/login_methods_widget.dart';

class SignInMethodsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navigationProvider = Provider.of<NavigationProvider>(context);
    final loginProvider = Provider.of<LoginProvider>(context);
    return Material(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(loginProvider.errorMessage, textAlign: TextAlign.center, style: TextStyle(color: Colors.redAccent),),
            LoginMethod(
              text: "Sign in with google",
              icon: Icon(MdiIcons.google),
              onTap: () async {
                await loginProvider.googleSignIn();
                if (loginProvider.user != null) {
                  navigationProvider.changePage("/home", "Home",);
                  navigationProvider.removePageHistory();
                }
              }
            ),
            LoginMethod(
              text: "Sign in with email",
              icon: Icon(MdiIcons.email),
              onTap: () {
                navigationProvider.changePage("/signInEmail", "Sign in with email");
              },
            ),
            LoginMethod(
              text: "Sign up with email",
              icon: Icon(MdiIcons.emailPlus),
              onTap: () {
                navigationProvider.changePage("/signUpEmail", "Sign up with email");
              },
            ),
            SizedBox(height: 10,),
            AnimatedOpacity(
              opacity: loginProvider.loaderOpacity,
              duration: Duration(milliseconds: 350),
              child: CircularProgressIndicator(),
            )
          ],
        ),
      ),
    );
  }
}
