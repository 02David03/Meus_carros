import 'package:flutter/material.dart';
import 'package:meus_carros/controller/car_item_controller.dart';
import 'package:meus_carros/model/car.dart';
import 'package:meus_carros/pages/details/car_details.dart';

class CarItem extends StatefulWidget {
  final Car car;
  CarItem({Key key, this.car}):super(key: key);
  @override
  _CarItemState createState() => _CarItemState();
}

class _CarItemState extends State<CarItem> {

  var controller = CarItemController();

  @override
  void initState() {
    controller.init(widget.car);
    super.initState();
  }

  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: controller.getImageDownloadURL(),
      builder: (context, Snapshot) {
        if (!Snapshot.hasData) {
          return Container();
        }
        return buildCar(Snapshot.data);
      },
    );
  }

  Widget buildCar(String url) =>
      GestureDetector(
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.fromBorderSide(BorderSide(
                  color: Colors.grey
              ))
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                      child: CircleAvatar(
                          radius: 35,
                          backgroundImage: NetworkImage(url)
                      )
                  ),
                  VerticalDivider(
                    thickness: 2,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: Text(
                          widget.car.modelo,
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      Text(
                        widget.car.anoFabricacao,
                        style: TextStyle(
                            fontStyle: FontStyle.italic
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context, PageRouteBuilder(
              opaque: false,
              pageBuilder: (BuildContext context, _, __) {
                return CarDetails(car: widget.car, url: url,);
              },
              transitionsBuilder: (context, animation, secondaryAnimation,
                  child) {
                var begin = Offset(0.0, 1.0);
                var end = Offset.zero;
                var curve = Curves.ease;
                var tween = Tween(begin: begin, end: end).chain(
                    CurveTween(curve: curve));
                return SlideTransition(
                  position: animation.drive(tween),
                  child: child,
                );
              })
          );
        },
      );
}