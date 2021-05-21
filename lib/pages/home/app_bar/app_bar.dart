import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meus_carros/controller/home_app_bar_controller.dart';
import 'package:meus_carros/styles/gradients.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {

  var controller = HomeAppBarController();

  @override
  Size get preferredSize =>  Size.fromHeight(250);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                                  text: controller.getUserDisplayName() ,
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
                        'Email: ' + controller.getUserEmail(),
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
                            controller.getUserURL()
                        )
                    )
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 55, left: 57),
                  child: IconButton(
                      icon: Icon(Icons.logout, color: Colors.white),
                      onPressed: (){
                        controller.logOut(context);
                      }
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
