// ignore_for_file: prefer_const_constructors, prefer_final_fields, camel_case_types

import 'package:flutter/material.dart';

class publicacion2 extends StatefulWidget {
  const publicacion2({super.key});

  @override
  State<publicacion2> createState() => _publicacion2State();
}

class _publicacion2State extends State<publicacion2> {
  
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
              'assets/images/cena.jpg', // Replace with the actual image URL
              height: 450,
              width: 450,
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'LA ULTIMA CENA \n\n Lorem ipsum dolor sit amet consectetur. Lorem nulla purus orci dignissim pulvinar laoreet est. Maecenas natoque faucibus egestas risus. Diam in duis pellentesque interdum. Purus sed vel aliquet euismod gravida. Consectetur amet.', // Replace with the actual description
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
    );
  }
}