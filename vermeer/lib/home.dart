import 'package:flutter/material.dart';
import 'package:vermeer/publicacion.dart';
import 'package:vermeer/publicacion2.dart';
import 'package:vermeer/publicacion3.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CardList(),
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
      child: Column(
        children: [
          Image.asset(image,
          width: 130.0,),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(description),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: onPressed,
            child: Text('Me interesa...'),
          ),
        ],
      ),
    );
  }
}

