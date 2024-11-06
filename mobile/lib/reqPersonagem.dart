import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:mobile/personagemClass.dart';

class Reqpersonagem {
  Future<Personagem> fetchPersonagens() async {
    final response =
        await http.get(Uri.parse('http://localhost:3000/personagens'));

    if (response.statusCode == 200) {
      return Personagem.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load personagens');
    }
  }
}
