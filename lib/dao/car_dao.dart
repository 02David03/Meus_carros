import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meus_carros/model/car.dart';

class CarDao {
  var db = FirebaseFirestore.instance;
  Stream<List<Car>> getCars () {
    return db.collection('cars').snapshots().map((snapShot) =>
          snapShot.docs.map((documentSnapShot) =>
              Car.fromMap(documentSnapShot.data())
          ).toList()
    );
  }
}