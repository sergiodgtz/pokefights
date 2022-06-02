import 'package:flutter/material.dart';
import 'package:pokefights/Screens/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: AppScrollBehavior(),
      title: 'Material App',
      home: HomeScreen()
    );
  }
}



