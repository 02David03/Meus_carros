import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:meus_carros/pages/authentication/authentication.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'meus_carros',
        home: Authentication()
    );
  }
}
