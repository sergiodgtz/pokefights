import 'dart:io';
import 'package:flutter/material.dart';
import 'info_screen.dart';

var imagenes = [
  "bug.PNG",
  "fire.PNG",
  "grass.PNG",
  "rock.PNG",
  "water.PNG",
  "ice.PNG"
];

class mainScreen extends StatelessWidget {
  final Color color;
  const mainScreen({required this.color});

  @override
  Widget build(BuildContext context) {
    List<Widget> typeElement = [];

    for (var i = 0; i < imagenes.length; i++) {
      typeElement.insert(
          i,
          ImagenElemento(
              imagen_elemento: "elements/" + imagenes[i],
              color: Colors.orangeAccent,
              id: i + 1));
    }

    return Container(
      color: color,
      child: GridView.count(
        crossAxisCount: 2,
        children: typeElement,
        crossAxisSpacing: 10,
        mainAxisSpacing: 15,
      ),
    );
  }
}

class ImagenElemento extends StatefulWidget {
  final String imagen_elemento;
  final Color color;
  final int id;

  ImagenElemento(
      {required this.imagen_elemento, required this.color, required this.id});

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
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return new statScreen(widget.id);
        }));
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.teal,
          borderRadius: BorderRadius.circular(100),
          border: Border.all(
            width: 15,
            color: Color.fromARGB(255, 195, 187, 33),
          ),
        ),
        child: AnimatedOpacity(
          duration: Duration(milliseconds: 300),
          opacity: 1.0,
          child: Image.asset(
            widget.imagen_elemento,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
