import 'package:flutter/material.dart';
import 'package:vermeer/home.dart';
import 'package:vermeer/login.dart';
import 'package:vermeer/publicacion.dart';
import 'package:vermeer/comentarios.dart';
import 'package:vermeer/carga.dart';
import 'package:vermeer/perfil.dart';

void main(List<String> args) {
  runApp(NavigationApp());
}

class NavigationApp extends StatelessWidget {
  const NavigationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Navegation App",
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => carga(),
        '/home': (context) => home(),
        '/login': (context) => login(),
        '/publicacion': (context) => publicacion(),
        '/comentarios': (context) => comentarios(),
        '/perfil': (context) => perfil()
      },
    );
  }
}
