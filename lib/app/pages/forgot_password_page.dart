import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../../provider/login_provider.dart';
import '../../provider/navigation_provider.dart';


class ForgotPasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navigationProvider = Provider.of<NavigationProvider>(context);
    final loginProvider = Provider.of<LoginProvider>(context);
    return Container(
      color: Theme.of(context).canvasColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Enter an email address"),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: TextFormField(
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
                border: OutlineInputBorder(),
                labelText: "Email",
                contentPadding: const EdgeInsets.only(
                  left: 15,
                  bottom: 11,
                  top: 11,
                  right: 15,
                ),
              ),
              
              autocorrect: true,
              obscureText: false,
              onFieldSubmitted: (String address) {
                loginProvider.emailForgotPassword(address);
                Fluttertoast.showToast(msg: "Email should be sent, redirecting to sign in page", toastLength: Toast.LENGTH_LONG);
                Timer(Duration(seconds: 1), () {
                  navigationProvider.removePageHistory();
                  navigationProvider.changePage("/signInEmail", "Sign in with email");
                });
              },
            ),
          ),
          SizedBox(height: 100),
        ],
      )
    );
  }
}