import 'package:belajar_flutter_andalas/main.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    Future.delayed(
        Duration(seconds: 3),
        (){
          Navigator.pushReplacement(context,
              MaterialPageRoute(
                builder: (context)=> MainAplikasi()
              ));
        }
    );


    return Scaffold(
      body: Center(
        child: Container(
            width: 250,
            child: Image.asset('images/logo.png')),
      ),
    );
  }


}