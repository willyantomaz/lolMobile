import 'dart:math';

import 'package:http/http.dart' as http;
import 'package:mobile/domain/personagemClass.dart';
import 'dart:convert';

class Reqpersonagem {
  final http.Client client;

  Reqpersonagem({required this.client});

  Future<List<Personagem>> fetchTodosPersonagens() async {
    final response =
        await client.get(Uri.parse('http://localhost:3000/personagens'));

    if (response.statusCode == 200) {
      List<dynamic> personagensJson = json.decode(response.body);
      List<Personagem> personagens = personagensJson
          .map((personagem) => Personagem.fromJson(personagem))
          .toList();
      return personagens;
    } else {
      throw Exception('Failed to load personagens');
    }
  }

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
      body: jsonEncode(<String, dynamic>{
        'nome': personagem.nome,
        'title': personagem.title,
        'tags': personagem.tags,
        'icon': personagem.icon,
        'description': personagem.description,
      }),
    );

    if (response.statusCode != 201) {
      throw Exception('Failed to create personagem');
    } else {
      print('Personagem criado com sucesso');
    }
  }

  Future<void> deletarPersonagem(String id) async {
    final response =
        await client.delete(Uri.parse('http://localhost:3000/personagens/$id'));

    if (response.statusCode != 200) {
      throw Exception('Failed to delete personagem');
    } else {
      print('Personagem deletado com sucesso');
    }
  }

  Future<void> atualizarPersonagem(Personagem personagem) async {
    final response = await client.put(
      Uri.parse('http://localhost:3000/personagens/${personagem.id}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'nome': personagem.nome,
        'title': personagem.title,
        'tags': personagem.tags,
        'icon': personagem.icon,
        'description': personagem.description,
      }),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to update personagem');
    } else {
      print(personagem.nome);
      print('Personagem atualizado com sucesso');
    }
  }
}
