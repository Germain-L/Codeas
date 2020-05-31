import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginProvider with ChangeNotifier {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  LoginProvider({FirebaseAuth firebaseAuth, GoogleSignIn googleSignin})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
        _googleSignIn = googleSignin ?? GoogleSignIn();
  FirebaseUser user;

  Future<void> googleSignIn() async {
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
    notifyListeners();
  }

  Future<void> emailSignIn(String email, String password) async {
    final result = await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    user = result.user;
    notifyListeners();
  }

  Future<void> emailSignUp(String email, String password) async {
    final result = await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    user = result.user;
    notifyListeners();
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
