import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meus_carros/controller/google_signup_button_controller.dart';

class GoogleSignupButton extends StatelessWidget {
  var controller = GoogleSignupButtonController();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      child: OutlinedButton.icon(
        label: Padding(
          padding: const EdgeInsets.symmetric( vertical: 12.0),
          child: Text(
            'Entrar com o Google',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Color(0xCDFFFFFF)
            )
          ),
        ),
        style: OutlinedButton.styleFrom(
          shape: StadiumBorder(),
          side: BorderSide(width: 1, color: Color(0xCCFFFFFF))
        ),
        icon: FaIcon(FontAwesomeIcons.google, color: Colors.blueAccent),
        onPressed: (){
          controller.login(context);
        },
      ),
    );
  }
}
