/* //TODO 
  Realizar una clase que sea una pantalla que despliegue la información del elemento
  con un boton para regresar a la pantalla principal.
*/

import 'dart:html';
import 'dart:io';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class statScreen extends StatefulWidget {
  statScreen({Key? key}) : super(key: key);

  @override
  State<statScreen> createState() => _statScreenState();
}

class _statScreenState extends State<statScreen> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: new IconButton(
        onPressed: () => Navigator.pop(context), 
        icon: Icon(Icons.arrow_back)),
        title: Text('holaxd')
    );
  }
}

