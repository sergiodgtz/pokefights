import 'dart:io';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class mainScreen extends StatelessWidget {

    final Color color;
    const mainScreen({ required this.color});

  @override
  Widget build(BuildContext context) {
    
    
    return GridView.count(
      crossAxisCount: 3,
      children: [
        Container(
          decoration: BoxDecoration(
            color: color,
            border: Border.all(
              width: 5,
              color: Colors.cyan,
            ),
          ),
          child: Image(
            image: AssetImage('elements/grass.png'),
            height: 5,
            width: 5,
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: color,
            border: Border.all(
              width: 5,
              color: Colors.cyan,
            ),
          ),
          child: Image(
            image: AssetImage('elements/normal.png'),
            height: 5,
            width: 5,
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: color,
            border: Border.all(
              width: 5,
              color: Colors.cyan,
            ),
          ),
          child: Image(
            image: AssetImage('elements/water.png'),
            height: 5,
            width: 5,
          ),
        ),
      ],
      
    );
  }
}