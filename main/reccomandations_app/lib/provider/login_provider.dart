import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginProvider with ChangeNotifier {
  //used for firebase sign in
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;
  FirebaseUser user;

  String errorMessage = "";

  double loaderOpacity = 0;

  //instantiate class with parameters
  LoginProvider({FirebaseAuth firebaseAuth, GoogleSignIn googleSignin})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
        _googleSignIn = googleSignin ?? GoogleSignIn();

  void getLastUser() async {
    Fluttertoast.showToast(msg: "Getting last user");
    user = await _firebaseAuth.currentUser();

    if (user != null) {
      Fluttertoast.showToast(msg: "Found a user");
    }

    notifyListeners();
  }

  // used to show or not show a CircularProgressIndicator
  void changeLoader() {
    loaderOpacity == 0 ? loaderOpacity = 1 : loaderOpacity = 0;
    notifyListeners();
  }

  void resetError() {
    errorMessage = "";
    notifyListeners();
  }

  Future<void> googleSignIn() async {
    resetError();
    changeLoader();

    // show pop up and await user to select an account
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();

    // retrieves selected account data
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    // create firebase credentials with given google account's data
    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // try to sign in with credentials created
    try {
      final AuthResult result =
          await _firebaseAuth.signInWithCredential(credential);

      user = result.user;
    } on PlatformException catch (exception) {
      errorMessage = exception.message;
      changeLoader();
      notifyListeners();
    } catch (error) {
      errorMessage = error.toString();
      changeLoader();
      notifyListeners();
    }
    notifyListeners();
  }

  Future<void> emailSignIn(String email, String password) async {
    resetError();
    changeLoader();
    try {
      final result = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      user = result.user;
      notifyListeners();
    } on PlatformException catch (exception) {
      errorMessage = exception.message;
      changeLoader();
      notifyListeners();
    } catch (error) {
      errorMessage = error.toString();
      changeLoader();
      notifyListeners();
    }
  }

  Future<void> emailSignUp(String email, String password) async {
    resetError();
    changeLoader();
    try {
      final result = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = result.user;
      notifyListeners();
    } on PlatformException catch (exception) {
      errorMessage = exception.message;
      changeLoader();
      notifyListeners();
    } catch (error) {
      errorMessage = error.toString();
      changeLoader();
      notifyListeners();
    }
  }

  Future<void> emailForgotPassword(String email) async {
    resetError();
    changeLoader();
    await _firebaseAuth.sendPasswordResetEmail(
      email: email,
    );
    try {
      await _firebaseAuth.sendPasswordResetEmail(
        email: email,
      );
      notifyListeners();
    } on PlatformException catch (exception) {
      errorMessage = exception.message;
      changeLoader();
      notifyListeners();
    } catch (error) {
      errorMessage = error.toString();
      changeLoader();
      notifyListeners();
    }
  }
}
