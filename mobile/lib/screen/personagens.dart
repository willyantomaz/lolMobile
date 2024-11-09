import 'package:flutter/material.dart';
import 'package:mobile/domain/personagemClass.dart';
import 'package:mobile/service/reqPersonagem.dart';
import 'package:http/http.dart' as http;

class Personagens extends StatefulWidget {
  const Personagens({super.key});

  @override
  State<Personagens> createState() => _PersonagensState();
}

class _PersonagensState extends State<Personagens> {
  List<Personagem>? personagem;

  @override
  void initState() {
    super.initState();
    pegarPersonagem();
  }

  pegarPersonagem() async {
    final personagem =
        await Reqpersonagem(client: http.Client()).fetchTodosPersonagens();
    setState(() {
      this.personagem = personagem;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personagens'),
      ),
      body: personagem == null
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: personagem!.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ExpansionTile(
                    leading: Image.network(personagem![index].icon),
                    title: Text(personagem![index].nome),
                    subtitle: Text(personagem![index].title),
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          personagem![index].description,
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
