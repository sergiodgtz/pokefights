import 'dart:io';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pokefights/services/remote_services.dart';
import 'package:pokefights/models/type.dart';
import 'package:auto_size_text/auto_size_text.dart';

var tipos = [
  [1, "bug"],
  [2, "fire"],
  [3, "grass"],
  [4, "rock"],

];
String parametro = '';
List<String> urls = [];

class statScreen extends StatefulWidget {
  int id;

  statScreen(this.id);

  @override
  State<statScreen> createState() => _statScreenState();
}

class _statScreenState extends State<statScreen> {
  _statScreenState();
  var isLoaded = false;
  Type? type;

  @override
  void initState() {
    super.initState();

    // get Data from pokeapi
    getData();
  }

  getData() async {
    for (var i = 0; i < tipos.length; i++) {
      if (tipos[i][0] == widget.id) {
        parametro = tipos[i][1].toString();
      }
    }
    type = await RemoteService().getType(parametro);
    if (type != null) {
      setState(() {
        isLoaded = true;
      });
    }

    for (int i = 1; i < 7; i++) {
      var poke = type!.pokemon![i].pokemon!;
      var pokeurl = poke.url.toString();
      var pokemonID = pokeurl.substring(34, pokeurl.length - 1);
      urls.add(pokemonID);
    }
  }

  List<String> dmgToList(List<Generation> dmg) {
    List<String> strList = [];

    for (var i = 0; i < dmg.length; i++) {
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
        title: Text(parametro),
      ),
      body: // EJEMPLO DE COMO FUNCIONA LA CLASE DE CARD FINAL
          cardFinal(
              type: type!.name ?? 'default',
              doubleDmgTo: dmgToList(type!.damageRelations!.doubleDamageTo!),
              halfDmgTo: dmgToList(type!.damageRelations!.halfDamageTo!),
              noDmgTo: dmgToList(type!.damageRelations!.noDamageTo!),
              doubleDmgFrom:
                  dmgToList(type!.damageRelations!.doubleDamageFrom!),
              halfDmgFrom: dmgToList(type!.damageRelations!.halfDamageFrom!),
              noDmgFrom: dmgToList(type!.damageRelations!.noDamageFrom!)),
    );
  }
}

//Gridview de tarjetas
class cardFinal extends StatelessWidget {
  List<Widget> cardArray = [];

  final String type;
  final List<String> doubleDmgTo;
  final List<String> halfDmgTo;
  final List<String> noDmgTo;
  final List<String> doubleDmgFrom;
  final List<String> halfDmgFrom;
  final List<String> noDmgFrom;

  cardFinal(
      {required this.type,
      required this.doubleDmgTo,
      required this.halfDmgTo,
      required this.noDmgTo,
      required this.doubleDmgFrom,
      required this.halfDmgFrom,
      required this.noDmgFrom});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        padding: const EdgeInsets.all(20),
        children: createGrid(cardArray, type, doubleDmgTo, halfDmgTo, noDmgTo,
            doubleDmgFrom, halfDmgFrom, noDmgFrom));
  }

  List<Widget> createGrid(
      List<Widget> cardArray,
      String type,
      List<String> doubleDmgTo,
      List<String> halfDmgTo,
      List<String> noDmgTo,
      List<String> doubleDmgFrom,
      List<String> halfDmgFrom,
      List<String> noDmgFrom) {
    int counter = 1;
    cardArray.add(cardType(dmgType: type, index: counter, datos: doubleDmgTo));
    counter++;
    cardArray.add(cardType(dmgType: type, index: counter, datos: halfDmgTo));
    counter++;
    cardArray.add(cardType(dmgType: type, index: counter, datos: noDmgTo));
    counter++;
    cardArray
        .add(cardType(dmgType: type, index: counter, datos: doubleDmgFrom));
    counter++;
    cardArray.add(cardType(dmgType: type, index: counter, datos: halfDmgFrom));
    counter++;
    cardArray.add(cardType(dmgType: type, index: counter, datos: noDmgFrom));
    for (int i = 1; i < 7; i++) {
      counter++;
      cardArray.add(cardImage(
          url:
              "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/" +
                  urls[i] +
                  ".png"));
    }
    urls = [];
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
        //imagen

        child: ListTile(
          leading: Icon(Icons.info, color: Colors.white, size: 40),
          minVerticalPadding: 20,
          title: AutoSizeText(info[0],
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
              presetFontSizes: [20, 16, 14],
                  ),
          hoverColor: Colors.cyan,
          subtitle: AutoSizeText(info[1],
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w100,
              ),
              presetFontSizes: [20, 16, 14],
              maxLines: 5,
              ),
        ),
        color: Colors.orangeAccent,
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.orangeAccent)));
  }

  List<String> creaCardInfo(int i, List<String> lista) {
    List<String> s = [];
    String elementos = "";

    switch (i) {
      case 1:
        s.add("Hace el doble de daño a:\n");
        for (var i = 0; i < lista.length; i++) {
          elementos += "${lista[i]} ";
        }
        s.add(elementos);
        if(s[1] == "")
          s[1] = "N/A";

        break;

      case 2:
        s.add("Hace la mitad de daño a:\n");
        for (var i = 0; i < lista.length; i++) {
          elementos += "${lista[i]} ";
        }
                s.add(elementos);
        if(s[1] == "")
          s[1] = "N/A";

        break;
      case 3:
        s.add("No le hace daño a:\n");
        for (var i = 0; i < lista.length; i++) {
          elementos += "${lista[i]} ";
        }
        s.add(elementos);
        if(s[1] == "")
          s[1] = "N/A";
        break;

      case 4:
        s.add("Recibe el doble de daño de: \n");
        for (var i = 0; i < lista.length; i++) {
          elementos += "${lista[i]} ";
        }
               s.add(elementos);
        if(s[1] == "")
          s[1] = "N/A";

        break;

      case 5:
        s.add("Recibe la mitad de daño de: \n");
        for (var i = 0; i < lista.length; i++) {
          elementos += "${lista[i]} ";
        }
        s.add(elementos);
        if(s[1] == "")
          s[1] = "N/A";
        break;
      case 6:
        s.add("No recibe daño de: \n");
        for (var i = 0; i < lista.length; i++) {
          elementos += "${lista[i]} ";
        }
        s.add(elementos);
        if(s[1] == "")
          s[1] = "N/A";
        break;

      default:
    }

    return s;
  }
}

class cardImage extends StatelessWidget {
  final String url;

  cardImage({required this.url});

  @override
  Widget build(BuildContext context) {
    return Card(
        //imagen

        child: Image.network(
          url,
          fit: BoxFit.contain,
          width: 200,
        ),
        color: Color.fromARGB(255, 255, 0, 0),
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(1000),
            borderSide: BorderSide(color: Color.fromARGB(255, 255, 0, 0))));
  }
}
