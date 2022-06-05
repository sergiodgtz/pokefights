import 'dart:html';
import 'dart:io';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'info_screen.dart';

var imagenes= ["bug.PNG", "dark.PNG", "dragon.PNG", "electric.PNG", "fairy.PNG", "fighting.PNG", "fire.PNG", "flying.PNG"];

class mainScreen extends StatelessWidget {

    final Color color;
    const mainScreen({ required this.color});

  @override
  Widget build(BuildContext context) {
    List<Widget> typeElement = [];

    for(var i = 0; i<imagenes.length; i++){
      typeElement.insert(i, ImagenElemento(imagen_elemento: "elements/"+imagenes[i], color: Colors.orangeAccent, id: i+1));
    }
    
    return Container(
      color: color,
      child: GridView.count(
        crossAxisCount: 3,
        children: typeElement,
        
      ),
    );
  } 
}

class ImagenElemento extends StatefulWidget {

  final String imagen_elemento;
  final Color color;
  final int id;

   ImagenElemento({ required this.imagen_elemento, required this.color, required this.id});

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
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => statScreen()),
         );
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