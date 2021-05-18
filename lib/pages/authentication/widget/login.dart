import 'package:flutter/material.dart';
import 'package:meus_carros/pages/authentication/widget/google_signup_button.dart';
import 'package:meus_carros/styles/gradients.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: Gradients.linearGrey
      ),
      child: Column(
        children: [
          Spacer(),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Meus\n    Carros',
                style: TextStyle(
                    color: Color(0xCCFFFFFF),
                    fontSize: 35,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),
          Spacer(),
          GoogleSignupButton(),
          SizedBox(height: 12),
          Text(
            'Entrar para continuar',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white38
            ),
          ),
          Spacer()
        ],
      ),
    );
  }
}
