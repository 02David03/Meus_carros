import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Meus\n     Carros',
                style: GoogleFonts.teko(
                    textStyle:TextStyle(
                      color: Color(0xEBFFFFFF),
                      fontSize: 60,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                    )
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
