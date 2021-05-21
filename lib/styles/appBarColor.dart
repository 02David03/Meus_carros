import 'package:flutter/material.dart';

class AppBarColor {
  final String carModel;

  AppBarColor(this.carModel);
  // ignore: non_constant_identifier_names
  Colors(){
    switch(carModel){
      case 'Fusca':{
        return Color(0xFFAA1A13);
      }
      break;
      case 'Cadillac Seville':{
        return Color(0xFFAC8378);
      }
      break;
      case 'Hilux':{
        return Color(0X8A000000);
      }
      break;
      case 'Toyota Corolla':{
        return Color(0xFF3E4668);
      }
      break;
      case 'Saveiro':{
        return Color(0xFFBBB7B7);
      }
      break;
      case 'Gol':{
        return Color(0xFFE02816);
      }
      break;

      default: {
        return Color(0xFF3F5DA0);
      }
    }
  }
}