import 'dart:io';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'main_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  int currentPage = 0;
  final PageController pageController = new PageController(initialPage: 0);
  
  //Función para cambiar el título de las páginas
  String tituloDePagina(int currentPage){

      String s = "";

      if(currentPage == 0)
        s = "Tipos de Pokemon";
      else
        s = "Desarrolladores";

      return s;

  }

  @override
  Widget build(BuildContext context) {
    //* scaffold principal
    return  Scaffold(
         appBar: AppBar(
          title: Text(
            tituloDePagina(currentPage),
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w900
              ),
          ),
          backgroundColor: Color.fromARGB(255, 6, 106, 119),
          elevation: 0,
        ),
         body:
         PageView(
           controller: pageController,
           physics: NeverScrollableScrollPhysics(),
          children: [
            mainScreen(color: Colors.cyan),
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
            BottomNavigationBarItem(icon: Icon(Icons.air_rounded),
            label: 'Elementos'
            ),
            BottomNavigationBarItem(icon: Icon(Icons.developer_mode_rounded),
            label: 'Desarrolladores'
            ),
          ],
          ),
       );
  }
}

//Página de los autores
class customScreen extends StatelessWidget {

  final Color color;

  const customScreen({ required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Color.fromARGB(255, 0, 0, 0),
                width: 4
              ),
              color: Colors.red[500],
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(200),
                topRight: Radius.circular(200),
              )
            ),
            height: 200,
            child: const Center(
              child: Text(
                'Gamiño Gonzales Jose Luis\n\n\nGutierrez Sergio',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w900
                  ),
                )
              ),
          ),
          Container(
            height: 25,
            color: Colors.black,
            child: const Center(
              child: Text(
                'Mekibes Malok',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w900,
                  backgroundColor: Colors.white,
                  height: 2,
                  wordSpacing: 5,
                  
                  ),
                )
              ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Color.fromARGB(255, 0, 0, 0),
                width: 4
              ),
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(200),
                bottomRight: Radius.circular(200),
              )
            ),
            height: 200,
            child: const Center(child: Text(
              'Oropeza Castañeda Angel Eduardo\n\n\nZazueta Sebastian',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w900
                )
              )
            ),
          ),
        ],
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