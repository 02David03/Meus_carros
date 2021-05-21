import 'package:meus_carros/dao/car_dao.dart';
import 'package:meus_carros/model/car.dart';

class HomeController {

  CarDao carDao = CarDao();

  Stream<List<Car>> getCars() {
    return carDao.getCars();
  }
}