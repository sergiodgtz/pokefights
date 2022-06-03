import 'dart:html';
import 'dart:io';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class mainScreen extends StatelessWidget {

    final Color color;
    const mainScreen({ required this.color});

  @override
  Widget build(BuildContext context) {
    
    
    return Container(
      color: color,
      child: GridView.count(
        crossAxisCount: 3,
        children: [
          ImagenElemento(imagen_elemento: 'elements/grass.png', color: Colors.orangeAccent),
          ImagenElemento(imagen_elemento: 'elements/normal.png', color: Colors.orangeAccent),
          ImagenElemento(imagen_elemento: 'elements/fire.png', color: Colors.orangeAccent)
        ],
        
      ),
    );
  }
}

class ImagenElemento extends StatefulWidget {

  final String imagen_elemento;
  final Color color;

   ImagenElemento({ required this.imagen_elemento, required this.color});

  @override
  State<ImagenElemento> createState() => _ImagenElementoState();
}

class _ImagenElementoState extends State<ImagenElemento> {
  Color color_aux = Colors.cyan;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print("Container ${widget.imagen_elemento} was tapped!");
      },
      child: Container(
            decoration: BoxDecoration(
              color: Colors.orangeAccent,
              borderRadius: BorderRadius.circular(30),
              border: Border.all(
                width: 5,
                color: Colors.cyan,
              ),
            ),
            child: AnimatedOpacity(
              duration: Duration(milliseconds: 300),
              opacity: 1.0,
              child: Image.asset(
                widget.imagen_elemento,
              ),
            ),
          ),
    );
  }


}