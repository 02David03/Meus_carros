import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meus_carros/pages/authentication/provider/google_sign_in.dart';
import 'package:meus_carros/styles/gradients.dart';
import 'package:provider/provider.dart';

class HomeAppBar extends PreferredSize  {
  HomeAppBar(User user, context) : super(
      preferredSize: Size.fromHeight(250),
      child: SafeArea(
        child: Container(
          child: Container(
            height: 100,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
                gradient: Gradients.linearGrey
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 250,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text.rich(
                          TextSpan(
                              text:'Seja bem vindo(a) ',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white
                              ),
                              children:[
                                TextSpan(
                                    text: user.displayName,
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold
                                    )
                                )
                              ]
                          )
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(
                          'Email: ' + user.email,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white
                        ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image: NetworkImage(
                              user.photoURL
                          )
                      )
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 55, left: 57),
                    child: IconButton(
                      icon: Icon(Icons.logout, color: Colors.white),
                      onPressed: (){
                        final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
                        provider.logout();
                      }
                ),
                  ),
                ),
              ],
            ),
          ),
        ),
      )
  );
}
