import 'package:flutter/material.dart';

//Clase  creada para el  winget...
class AppTitle extends StatelessWidget {
  //Se declara si es
  final String title;

  const AppTitle(
    this.title, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    //Se  eliminoel const del  return
    return Text('INICIAR SECCION',
        textAlign: TextAlign.center,
        //Se agrego el const en el style.
        style: const TextStyle(
          color: Colors.brown,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ));
  }
}
