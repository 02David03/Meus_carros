import 'package:firebase_auth/firebase_auth.dart';
import 'package:meus_carros/pages/authentication/provider/google_sign_in.dart';
import 'package:provider/provider.dart';

class HomeAppBarController{

  User get currentUser => FirebaseAuth.instance.currentUser;

  String getUserDisplayName() {
    return currentUser.displayName;
  }

  String getUserEmail() {
    return currentUser.email;
  }

  String getUserURL() {
    return currentUser.photoURL;
  }

  void logOut(context){
    final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
    provider.logout();
  }
}