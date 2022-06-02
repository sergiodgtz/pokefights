import 'dart:io';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  int currentPage = 0;
  final PageController pageController = new PageController(initialPage: 0);
  
  String tituloDePagina(int currentPage){

      String s = "";

      if(currentPage == 0)
        s = "Tipos de Pokémon y sus características!";
      else
        s = "Autores de la aplicación";

      return s;

  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
         appBar: AppBar(
          title: Text(tituloDePagina(currentPage)),
          backgroundColor: Colors.cyan,
          elevation: 0,
        ),
         body:
         PageView(
           controller: pageController,
           physics: NeverScrollableScrollPhysics(),
          children: [
            mainScreen(color: Colors.orangeAccent),
            customScreen(color: Colors.cyan)
          ],
         ),
        //*tabs
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentPage,
          onTap: (index) {
            currentPage = index;

            pageController.animateToPage(index, duration: 
              new Duration(milliseconds: 300), curve: Curves.easeOut);
            setState(() {});
          },
          backgroundColor: Colors.cyan,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white.withOpacity(0.5),
          elevation: 0,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.verified_user),
            label: 'Usuario'
            ),
            BottomNavigationBarItem(icon: Icon(Icons.settings),
            label: 'Configuracion'
            ),
          ],
          ),
       );
  }
}

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

class customScreen extends StatelessWidget {

  final Color color;

  const customScreen({ required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: 
        [
        new Container(
          alignment: Alignment.topCenter,
          child: Text("Autores",
          style: TextStyle(color: Colors.white, fontSize: 35),
          textAlign: TextAlign.center,
          ),    
        ),
        new Container(
          child: Text('Gutierrez Sergio\nGamiño Luis\nSebastian Zazueta\nMekibes Meza Malik\nÁngel Gonzalez',
          textAlign: TextAlign.center,
          overflow:  TextOverflow.clip,
          style: new TextStyle(color: Colors.white, fontSize: 35),
          
        ),
      ),
        ] 
    )
    );
  }
}

class AppScrollBehavior extends MaterialScrollBehavior{
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
  };
}