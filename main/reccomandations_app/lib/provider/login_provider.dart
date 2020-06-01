import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginProvider with ChangeNotifier {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  double loaderOpacity = 0;

  LoginProvider({FirebaseAuth firebaseAuth, GoogleSignIn googleSignin})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
        _googleSignIn = googleSignin ?? GoogleSignIn();
  FirebaseUser user;

  Future<void> googleSignIn() async {
    loaderOpacity = 1;
    notifyListeners();
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final AuthResult result =
        await _firebaseAuth.signInWithCredential(credential);
    user = result.user;
    loaderOpacity = 0;
    notifyListeners();
  }

  Future<Map> emailSignIn(String email, String password) async {
    loaderOpacity = 1;
    notifyListeners();
    Map didSucceed = Map.from({"success": false});
    try {
      final result = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      print(result);

      user = result.user;
      didSucceed["success"] = true;
      notifyListeners();

      return didSucceed;
    } on PlatformException catch (exception) {
      didSucceed["exception"] = exception;
      notifyListeners();
      return didSucceed;
    }
  }

  Future<Map> emailSignUp(String email, String password) async {
    loaderOpacity = 1;
    notifyListeners();
    Map didSucceed = Map.from({"success": false});
    try {
      final result = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = result.user;
      didSucceed["success"] = true;
      notifyListeners();
    } on PlatformException catch (exception) {
      didSucceed["exception"] = exception;
      loaderOpacity = 0;
      notifyListeners();
      return didSucceed;
    } catch (error) {
      print(error);
      didSucceed["success"] = false;
      loaderOpacity = 0;
      notifyListeners();
    }
    loaderOpacity = 0;
    notifyListeners();
    return didSucceed;
  }

  Future<void> emailForgotPassword(String email) async {
    await _firebaseAuth.sendPasswordResetEmail(
      email: email,
    );
    notifyListeners();
  }

  Future<void> anonymousSignIn() async {
    final result = await _firebaseAuth.signInAnonymously();
    user = result.user;
    notifyListeners();
  }
}
