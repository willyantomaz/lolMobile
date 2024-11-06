import 'package:flutter/material.dart';
import 'package:mobile/personagemClass.dart';
import 'package:mobile/reqPersonagem.dart';
import 'package:http/http.dart' as http;

class Personagens extends StatefulWidget {
  const Personagens({super.key});

  @override
  State<Personagens> createState() => _PersonagensState();
}

class _PersonagensState extends State<Personagens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personagens'),
      ),
      body: const Center(
        child: Text('Personagens'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final http.Client client = http.Client();
          Personagem personagem =
              await Reqpersonagem(client: client).fetchPersonagem(1);
          print("${personagem.toString()}");
        },
        child: const Icon(Icons.settings_input_component_sharp),
      ),
    );
  }
}
