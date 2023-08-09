import 'package:flutter/material.dart';

class perfil extends StatelessWidget {
     final String nombre;
      perfil({required this.nombre});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            CircleAvatar(
              radius: 70,
              backgroundImage: NetworkImage(
                'https://example.com/imagen_perfil.jpg', 
              ),
            ),
            SizedBox(height: 20),
            Text(
              nombre,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Usuario Arista',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Divider(),
            ListTile(
              leading: Icon(Icons.email),
              title: Text(nombre+'@gmail.com'), 
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.location_on),
              title: Text('La piedad, Michoacan'), 
            ),
            Divider(),
            
          ],
        ),
      ),
    );
  }
}