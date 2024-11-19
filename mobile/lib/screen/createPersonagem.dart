import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mobile/domain/personagemClass.dart';
import 'package:mobile/screen/home.dart';
import 'package:mobile/service/reqPersonagem.dart';
import 'package:http/http.dart' as http;

class CreatePersonagem extends StatefulWidget {
  const CreatePersonagem({super.key});

  @override
  State<CreatePersonagem> createState() => _CreatepersonagemState();
}

class _CreatepersonagemState extends State<CreatePersonagem> {
  final _formKey = GlobalKey<FormState>();

  String? nome;
  String? title;
  String? tags;
  String? icon;
  String? description;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Criar Personagem',
            style: TextStyle(color: Colors.amber, fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.secondary,
        actions: [
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const Home()),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text('Crie seu personagem do LOL',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.blueGrey,
                  ),
                  textAlign: TextAlign.center),
              Center(
                child: Container(
                  child: Column(
                    children: [
                      Card(
                        child: TextFormField(
                          decoration: const InputDecoration(labelText: 'Nome'),
                          onSaved: (value) => nome = value,
                        ),
                      ),
                      Card(
                        child: TextFormField(
                          decoration: const InputDecoration(labelText: 'Title'),
                          onSaved: (value) => title = value,
                        ),
                      ),
                      Card(
                        child: TextFormField(
                          decoration: const InputDecoration(labelText: 'Tags'),
                          onSaved: (value) => tags = value,
                        ),
                      ),
                      Card(
                        child: TextFormField(
                          decoration: const InputDecoration(labelText: 'Icon'),
                          onSaved: (value) => icon = value,
                        ),
                      ),
                      Card(
                        child: TextFormField(
                          decoration:
                              const InputDecoration(labelText: 'Description'),
                          onSaved: (value) => description = value,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            int idInte = Random().nextInt(100);
                            Reqpersonagem(client: http.Client())
                                .criarPersonagem(
                              Personagem(
                                id: "$idInte",
                                nome: nome!,
                                title: title!,
                                tags: tags!,
                                icon: icon!,
                                description: description!,
                              ),
                            );
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Home()),
                            );
                          }
                        },
                        child: const Text("Criar Personagem"),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
