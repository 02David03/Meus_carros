import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meus_carros/styles/appBarColor.dart';

class CarDetails extends StatefulWidget {
  final dynamic car;
  final dynamic url;
  const CarDetails({Key key, this.car, this.url}) : super(key: key);
  @override
  _CarDetailsState createState() => _CarDetailsState();

}

class _CarDetailsState extends State<CarDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.car['modelo']),
        centerTitle: true,
        backgroundColor: AppBarColor(widget.car['modelo']).Colors(),
      ),
      body:SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(8),
          child: Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16))),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8)
                  ),
                  child: Image.network(widget.url, fit: BoxFit.fill),
                ),
                ListTile(
                  title: Text('Modelo'),
                  subtitle: Text(widget.car['modelo']),
                ),
                ListTile(
                  title: Text('Marca'),
                  subtitle: Text(widget.car['marca']),
                ),
                ListTile(
                  title: Text('Ano de Fabricação'),
                  subtitle: Text(widget.car['anoFabricacao']),
                ),
                ListTile(
                  title: Text('Ano do Modelo'),
                  subtitle: Text(widget.car['anoModelo']),
                ),
                ListTile(
                  title: Text('Placa'),
                  subtitle: Text(widget.car['placa']),
                )
              ],
            ),
          ),
        ),
      )
    );
  }
}
