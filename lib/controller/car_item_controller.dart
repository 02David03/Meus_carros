import 'package:firebase_storage/firebase_storage.dart';
import 'package:meus_carros/model/car.dart';

class CarItemController {

  Car car;

  void init(car){
    this.car = car;
  }

  Future<String> getImageDownloadURL() async {
    final package = FirebaseStorage.instance.ref('images').child(car.foto);
    var url = await package.getDownloadURL();
    return url;
  }

}