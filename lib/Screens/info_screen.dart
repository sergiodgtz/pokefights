import 'dart:io';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pokefights/services/remote_services.dart';
import 'package:pokefights/models/type.dart';

class statScreen extends StatefulWidget {

  final String tipo;

  statScreen({required this.tipo});

  @override
  State<statScreen> createState() => _statScreenState(tipo: tipo);
}

class _statScreenState extends State<statScreen> {
  var isLoaded = false;
  Type? type;
  final String tipo;

  _statScreenState({required this.tipo});


  @override
  void initState() {
    super.initState();
    
    // get Data from pokeapi
    getData();
  }

  getData() async{
    type = await RemoteService().getType("bug");
    if (type != null){
      setState(() {
        isLoaded = true;
      });
    }
  }

  List<String> dmgToList(List<Generation> dmg){
    List<String> strList = [];

    for(var i = 0; i<dmg.length; i++){
      strList.add(dmg[i].name!);
    }

    return strList;
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      appBar: AppBar(
        leading: new IconButton(
          onPressed: () => Navigator.pop(context), 
          icon: Icon(Icons.arrow_back)),
          title: Text("Atrás"),
      ),
      body: 
       FutureBuilder<>// EJEMPLO DE COMO FUNCIONA LA CLASE DE CARD FINAL
       cardFinal(
        type: type!.name!,
        doubleDmgTo: dmgToList(type!.damageRelations!.doubleDamageTo!), 
        halfDmgTo: dmgToList(type!.damageRelations!.halfDamageTo!) , 
        noDmgTo: dmgToList(type!.damageRelations!.noDamageTo!), 
        doubleDmgFrom: dmgToList(type!.damageRelations!.doubleDamageFrom!), 
        halfDmgFrom: dmgToList(type!.damageRelations!.halfDamageFrom!), 
        noDmgFrom: dmgToList(type!.damageRelations!.noDamageFrom!)),
    );
  }
}

//Gridview de tarjetas
class cardFinal extends StatelessWidget {

  List<cardType> cardArray = [];

   final String type;
   final  List<String>doubleDmgTo;
   final  List<String>halfDmgTo;
   final  List<String>noDmgTo;
   final  List<String>doubleDmgFrom;
   final  List<String>halfDmgFrom;
   final  List<String>noDmgFrom;

  cardFinal({required this.type, required this.doubleDmgTo,
     required this.halfDmgTo, required this.noDmgTo, required this.doubleDmgFrom,
       required this.halfDmgFrom ,required this.noDmgFrom});


  @override
  Widget build(BuildContext context) {

    return GridView.count(crossAxisCount: 2,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      padding: const EdgeInsets.all(20),
      children: 
        createGrid(cardArray, type, doubleDmgTo, halfDmgTo, noDmgTo, doubleDmgFrom, halfDmgFrom, noDmgFrom)
    );
  }

  List<Widget> createGrid(List<cardType> cardArray, String type, List<String> doubleDmgTo, List<String> halfDmgTo,
    List<String> noDmgTo, List<String> doubleDmgFrom, List<String> halfDmgFrom, List<String> noDmgFrom ){
    
      int counter = 1;
      cardArray.add(cardType(dmgType: type, index: counter, datos: doubleDmgTo));
      counter++;
      cardArray.add(cardType(dmgType: type, index: counter, datos: halfDmgTo));
      counter++;
      cardArray.add(cardType(dmgType: type, index: counter, datos: noDmgTo));
      counter++;
      cardArray.add(cardType(dmgType: type, index: counter, datos: doubleDmgFrom));
      counter++;
      cardArray.add(cardType(dmgType: type, index: counter, datos: halfDmgFrom));
      counter++;
      cardArray.add(cardType(dmgType: type, index: counter, datos: noDmgFrom));

    return cardArray;
  }

}


//Elemento simple de Tarjeta
class cardType extends StatelessWidget {

  final int index;
  final String dmgType;
  final List<String> datos;

  cardType({required this.dmgType, required this.index, required this.datos});

  List<String> info = [];

  @override
  Widget build(BuildContext context) {

    info = creaCardInfo(index, datos);
    return Card(
      child: ListTile(
        leading: Icon(Icons.info, color: Colors.white, size: 70),
        minVerticalPadding: 20,
        title: Text(info[0],
          style: TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold )
        ),
        hoverColor: Colors.cyan,
        subtitle: Text(info[1],
        style: TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.w100,  )
        ),
        
        ),
      color: Colors.orangeAccent,
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.orangeAccent)
      )
    );
  }

  List<String> creaCardInfo(int i, List<String> lista){

    List<String> s = [];
    String elementos = "";

    switch (i) {
      case 1:
        s.add("Hace el doble de daño a:\n");
        for (var i = 0; i < lista.length; i++) {
          elementos += "${lista[i]}\n";
        }
        s.add(elementos);

        break;

      case 2:
        s.add("Hace la mitad de daño a:\n");
        for (var i = 0; i < lista.length; i++) {
          elementos += "${lista[i]}\n";
        }
        s.add(elementos);
        
        break;
      case 3:
        s.add("No le hace daño a:\n");
        for (var i = 0; i < lista.length; i++) {
          elementos += "${lista[i]}\n";
        }
        s.add(elementos);
        break;

      case 4:
        s.add("Recibe el doble de daño de: \n");
        for (var i = 0; i < lista.length; i++) {
          elementos += "${lista[i]}\n";
        }
        s.add(elementos);
        break;

      case 5:
        s.add("Recibe la mitad de daño de: \n");
        for (var i = 0; i < lista.length; i++) {
          elementos += "${lista[i]}\n";
        }
        s.add(elementos);
        break;
      case 6:
        s.add("No recibe daño de: \n");
        for (var i = 0; i < lista.length; i++) {
          elementos += "${lista[i]}\n";
        }
        s.add(elementos);
        break;

      default:
    }

    return s;
  }

}