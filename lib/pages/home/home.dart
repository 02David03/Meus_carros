import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:meus_carros/pages/home/app_bar/app_bar.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: HomeAppBar(FirebaseAuth.instance.currentUser, context),
        body:Container()
    );
  }
}

/*Future upload() async {
  await Firebase.initializeApp();

  final ref = FirebaseFirestore.instance.collection('cars').doc();
  await ref.set(
      {
        'anoFabricacao' : '2000',
        'anoModelo' : '1995',
        'modelo' : 'gol',
        'marca' : 'chefrolet',
        'placa' : 'suna-5411',
        'foto' : 'https://static.kbb.com.br/pkw/t/VOLKSWAGEN/GOL/2000/5HA.JPG'
      }
      );
} */