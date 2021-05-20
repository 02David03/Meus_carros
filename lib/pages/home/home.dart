import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meus_carros/pages/home/app_bar/app_bar.dart';
import 'package:meus_carros/pages/home/car/car_item.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final db = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: HomeAppBar(FirebaseAuth.instance.currentUser, context),
        body: StreamBuilder<QuerySnapshot>(
          stream: db.collection('cars').snapshots(),
          builder: (context, snapashot) {
            if (!snapashot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Padding(
                padding: const EdgeInsets.only(top: 24),
                child: ListView(
                  children: snapashot.data.docs.map((doc){
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                      child: CarItem(car: doc),
                    );
                  }).toList(),
                ),
              );
            }
          },
        )
    );
  }
}
