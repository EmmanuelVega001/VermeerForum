import 'package:flutter/material.dart';
import 'package:vermeer/home.dart';
import 'package:vermeer/login.dart';
import 'package:vermeer/publicacion.dart';

class carga extends StatelessWidget {
  const carga({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 5), (){
<<<<<<< HEAD
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => login()),
=======
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => home()),
>>>>>>> de6b7e3b44a9bf136ae1922c479c2e681338c509
      );
    });

    return Scaffold(
      appBar: AppBar(

      ),
      body: const Center(
        child: Text(
          'VERMEER FORUM',
          style: TextStyle(
            fontSize: 52, 
            fontFamily: 'Bebas Neue', 
            color: Color.fromRGBO(192, 63, 63, 1),
            fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}