import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class CarItem extends StatefulWidget {
  final dynamic car;
  CarItem({Key key, this.car}):super(key: key);
  @override
  _CarItemState createState() => _CarItemState();
}

class _CarItemState extends State<CarItem> {
  bool isImageLoaded = false;
  String url;
  getImage() async{
    final package = FirebaseStorage.instance.ref('images').child(widget.car['foto']);
    var urlAux = await package.getDownloadURL();
    setState(() {
      url = urlAux;
      isImageLoaded = urlAux != null;
    });
  }
  @override
  void initState(){
    super.initState();
    getImage();
  }
  Widget build(BuildContext context) {
    return Container(
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
                child: isImageLoaded ? buildAvatarImage() : buildIcon()
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
                      widget.car['modelo'],
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  Text(
                    widget.car['anoFabricacao'],
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
    );
  }
  Widget buildAvatarImage() => CircleAvatar(
      radius: 35,
      backgroundImage: NetworkImage(url)
  );
  Widget buildIcon() => Center(
    child: Icon(Icons.car_repair),
  );
}
