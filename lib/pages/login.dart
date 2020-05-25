import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn _googleSignIn = GoogleSignIn();

class Login extends StatelessWidget {
  Future<FirebaseUser> _handleGoogleSignIn() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      idToken: googleAuth.accessToken,
      accessToken: googleAuth.idToken,
    );

    final AuthResult results = await _auth.signInWithCredential(credential);
    final FirebaseUser user = results.user;

    return user;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          children: [
            FlatButton(
              child: Text("Github"),
              onPressed: () => null,
            ),
            FlatButton(
              child: Text("Google"),
              onPressed: () => _handleGoogleSignIn(),
            ),
          ],
        ),
      ),
    );
  }
}
