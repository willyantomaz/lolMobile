import 'package:flutter/material.dart';
import 'package:mobile/domain/personagemClass.dart';
import 'package:mobile/service/reqPersonagem.dart';
import 'package:http/http.dart' as http;

class Dialogatualizapersonagem extends StatefulWidget {
  final String id;

  const Dialogatualizapersonagem({super.key, required this.id});

  @override
  State<Dialogatualizapersonagem> createState() =>
      _DialogatualizapersonagemState();
}

class _DialogatualizapersonagemState extends State<Dialogatualizapersonagem> {
  final _formKey = GlobalKey<FormState>();
  String? id = '';
  String? nome;
  String? title;
  String? tags;
  String? icon;
  String? description;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: 300,
        width: 300,
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text('Atualize seu personagem do LOL'),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Nome'),
                onSaved: (value) => nome = value,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Title'),
                onSaved: (value) => title = value,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Tags'),
                onSaved: (value) => tags = value,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Icon'),
                onSaved: (value) => icon = value,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Description'),
                onSaved: (value) => description = value,
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    id = widget.id;
                    Navigator.pop(context);
                    Reqpersonagem(client: http.Client()).atualizarPersonagem(
                      Personagem(
                        id: id!,
                        nome: nome!,
                        title: title!,
                        tags: tags!,
                        icon: icon!,
                        description: description!,
                      ),
                    );
                  }
                },
                child: const Text('Atualizar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
