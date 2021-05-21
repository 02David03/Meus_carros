import 'package:flutter/material.dart';
import 'package:meus_carros/controller/home_controller.dart';
import 'package:meus_carros/model/car.dart';
import 'package:meus_carros/pages/home/app_bar/app_bar.dart';
import 'package:meus_carros/pages/home/car/car_item.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var controller = HomeController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: HomeAppBar(),
        body: StreamBuilder<List<Car>>(
          stream: controller.getCars(),
          builder: (context, snapashot) {
            if (!snapashot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Padding(
                padding: const EdgeInsets.only(top: 24),
                child: ListView(
                  children: snapashot.data.map((car){
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                      child: CarItem(car: car),
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
