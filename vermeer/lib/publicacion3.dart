// ignore_for_file: prefer_const_constructors, prefer_final_fields, camel_case_types

import 'package:flutter/material.dart';
import 'package:vermeer/comentarios.dart';
import 'package:vermeer/publicacion.dart';
import 'package:vermeer/publicacion2.dart';

class publicacion3 extends StatefulWidget {
  const publicacion3({super.key});

  @override
  State<publicacion3> createState() => _publicacion3State();
}

class _publicacion3State extends State<publicacion3> {
  
  TextEditingController _searchController = TextEditingController();
  List<String> _originalList = ["La Gioconda", "La noche estrellada", "La última cena"];
  List<String> _filteredList = [];

  @override
  void initState() {
    super.initState();
    _filteredList.addAll(_originalList);
  }

  @override
  void dispose(){
    _searchController.dispose();
    super.dispose();
  }

  void _filterList(String searchText) {
    _filteredList.clear();

    if (searchText.isEmpty) {
      _filteredList.addAll(_originalList);
    } else {
      for (var item in _originalList) {
        if (item.toLowerCase().contains(searchText.toLowerCase())) {
          _filteredList.add(item);
        }
      }

      // Si no se encontraron resultados, mostrar una alerta
      if (_filteredList.isEmpty) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Búsqueda no encontrada"),
              content: Text("No se encontraron resultados para: $searchText"),
              actions: <Widget>[
                TextButton(
                  child: Text("Cerrar"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
        } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Elemento encontrado en la base de datos"),
              content: Text("Se encontró el siguiente elemento: ${_filteredList[0]}"),
              actions: <Widget>[
                TextButton(
                  child: Text("Vamos a ella"),
                  onPressed: () {
                    Navigator.of(context).pop();

                    if ("${_filteredList[0]}" == "La última cena"){
                      Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => publicacion2()),
                      );
                    }
                    else if ("${_filteredList[0]}" == "La Gioconda"){
                      Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => publicacion()),
                      );
                    }
                  },
                ),
              ],
            );
          },
        );
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Row(
            children: [
              SizedBox(width: 10),
              Icon(Icons.search),
              SizedBox(width: 8),
              Expanded(
                child: TextField(
                  controller: _searchController,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    icon: Icon(Icons.search),
                    hintText: "Search...",
                    border: InputBorder.none,
                  ),
                  onChanged: (value) {
                    if (value.length > 0){
                      _filterList(value);
                    }
                  }
                ),
              ),
              SizedBox(width: 10),
            ],
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              'assets/images/noche.jpg', // Replace with the actual image URL
              height: 450,
              width: 450,
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'LA NOCHE ESTRELLADA \n\n La noche estrellada es un cuadro pintado en el año 1889 por el artista neerlandés Vincent van Gogh (1853-1890). Es considerado uno de los cuadros más importantes del pintor por su estilo único y original, el cual marcó un punto de inflexión en el arte postimpresionista.',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        width: double.infinity,
        padding: EdgeInsets.only(top: 16.0),
        child: ElevatedButton(
          onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => comentarios()),
              );
          },
          child: Text("Escribenos tu opinion"),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}