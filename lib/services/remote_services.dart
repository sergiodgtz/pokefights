import 'dart:io';
import 'package:pokefights/models/type.dart';
import 'package:http/http.dart' as http;

class RemoteService {
  Future<Type?> getType(String strType) async {
    var client = http.Client();

    var uri = Uri.parse('https://pokeapi.co/api/v2/type/' + strType + '/');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return typeFromJson(json);
    }
  }
}
