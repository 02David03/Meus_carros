import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meus_carros/pages/authentication/provider/google_sign_in.dart';
import 'package:meus_carros/pages/authentication/widget/login.dart';
import 'package:meus_carros/pages/home/home.dart';
import 'package:provider/provider.dart';

class Authentication extends StatefulWidget {
  @override
  _AuthenticationState createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (context) => GoogleSignInProvider(),
        child: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            final provider = Provider.of<GoogleSignInProvider>(context);

            if (provider.isSignedIn) {
              return buildLoading();
            } else if (snapshot.hasData) {
              return Home();
            } else {
              return Login();
            }
          },
        ),
      ),
    );
  }
  Widget buildLoading() => Container(
    child:
      Center(
        child: CircularProgressIndicator(),
      )
  );
}
