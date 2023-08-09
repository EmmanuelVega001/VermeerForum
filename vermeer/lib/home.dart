import 'package:flutter/material.dart';
import 'package:vermeer/carga.dart';
import 'package:vermeer/perfil.dart';
import 'package:vermeer/publicacion.dart';
import 'package:vermeer/publicacion2.dart';
import 'package:vermeer/publicacion3.dart';

class home extends StatefulWidget {
  const home({Key? key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  String nombre = " ";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home $nombre'),
        leading: IconButton(
          icon: Icon(Icons.man_2_outlined),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => perfil(nombre: nombre)),
            );
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: SingleChildScrollView(
          child: CardList(),
        ),
      ),
    );
  }
}

class CardList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        HomeCard(
          title: 'La Gioconda',
          image: 'images/gioconda.jpg',
          description: 'Monita de Da Vinci',
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => publicacion()),
            );
          },
        ),
        SizedBox(height: 16),
        HomeCard(
          title: 'La Última Cena',
          image: 'images/cena.jpg',
          description: 'Pobre yisus',
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => publicacion2()),
            );
          },
        ),
        SizedBox(height: 16),
        HomeCard(
          title: 'La Noche Estrellada',
          image: 'images/noche.jpg',
          description: 'Que noche tan estrellada:o',
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => publicacion3()),
            );
          },
        ),
      ],
    );
  }
}

class HomeCard extends StatelessWidget {
  final String title;
  final String image;
  final String description;
  final VoidCallback onPressed;

  const HomeCard({
    required this.title,
    required this.image,
    required this.description,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16), //radio de los bordes
        side: BorderSide(color: Colors.grey, width: 1), //borde
      ),
      child: Column(
        children: [
          Padding(padding: const EdgeInsets.all(16.0),
            child: Image.asset(image,
              width: 130.0,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20), //espacio entre el título y la descripción
                Text(description),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: (){
              onPressed();
            },
            child: Text("Me interesa"),
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.all(25), //padding del botón
            ),
          ),
        ],
      ),
    );
  }
}
