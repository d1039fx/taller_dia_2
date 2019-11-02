import 'package:flutter/material.dart';

class Listas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ejemplo listas'),
      ),
      body: ContenidoLista(),
    );
  }
}

class ContenidoLista extends StatelessWidget {
  final List<Widget> listaEjemplo = [
    Text(
      'valor 1',
      style: TextStyle(fontSize: 60),
    ),
    Text(
      'valor 2',
      style: TextStyle(fontSize: 60),
    ),
    Text(
      'valor 3',
      style: TextStyle(fontSize: 60),
    ),
    Text(
      'valor 4',
      style: TextStyle(fontSize: 60),
    ),
    Text(
      'valor 5',
      style: TextStyle(fontSize: 60),
    ),
    Text(
      'valor 6',
      style: TextStyle(fontSize: 60),
    ),
    Text(
      'valor 7',
      style: TextStyle(fontSize: 60),
    ),
    Text(
      'valor 8',
      style: TextStyle(fontSize: 60),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(

      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: listaEjemplo.length,
        itemBuilder: (context, index) => Container(
          width: 100,
          child: ListTile(
            title: listaEjemplo[index],
            subtitle: Text(
              index.toString(),
              style: TextStyle(fontSize: 30),
            ),
          ),
        ),
      ),
    );
  }
}
