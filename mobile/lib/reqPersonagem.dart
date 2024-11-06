import 'dart:math';

import 'package:http/http.dart' as http;
import 'package:mobile/personagemClass.dart';
import 'dart:convert';

class Reqpersonagem {
  final http.Client client;

  Reqpersonagem({required this.client});

  Future<Personagem> fetchPersonagem(int id) async {
    final response =
        await client.get(Uri.parse('http://localhost:3000/personagens/$id'));

    if (response.statusCode == 200) {
      return Personagem.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load personagem');
    }
  }

  Future<void> criarPersonagem(Personagem personagem) async {
    final response = await client.post(
      Uri.parse('http://localhost:3000/personagens'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'name': personagem.name,
        'local': personagem.local,
      }),
    );

    if (response.statusCode != 201) {
      throw Exception('Failed to create personagem');
    } else {
      print('Personagem criado com sucesso');
    }
  }
}
