import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInProvider extends ChangeNotifier {
  final googleSignIn = GoogleSignIn();
  bool _isSignedIn = false;

  bool get isSignedIn => _isSignedIn;

  set isSignedIn(bool value) {
    _isSignedIn = value;
    notifyListeners();
  }

  Future login() async{
    isSignedIn = true;

    final user = await googleSignIn.signIn();
    if(user == null) {
      isSignedIn = false;
      return;
    } else {
      final googleAuth = await user.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);

      isSignedIn = false;
    }
  }

  void logout() async {
    await googleSignIn.disconnect();
    FirebaseAuth.instance.signOut();
  }
}