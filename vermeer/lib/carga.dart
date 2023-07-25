import 'package:flutter/material.dart';
import 'package:vermeer/login.dart';

class carga extends StatelessWidget {
  const carga({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 5), (){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => login()),
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