import 'package:flutter/material.dart';
import 'package:mobile/domain/personagemClass.dart';
import 'package:mobile/screen/dialogAtualizaPersonagem.dart';
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
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) =>
                                    Dialogatualizapersonagem(
                                        id: personagem![index].id));
                            setState(() {
                              pegarPersonagem();
                            });
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            Reqpersonagem(client: http.Client())
                                .deletarPersonagem(personagem![index].id);
                            setState(() {
                              personagem!.removeAt(index);
                            });
                          },
                        ),
                      ],
                    ),
                    children: [
                      Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              Text('Tags: ${personagem![index].tags}'),
                              Text(
                                  'Descrição: ${personagem![index].description}'),
                            ],
                          )),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
