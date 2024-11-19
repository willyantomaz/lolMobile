import 'package:flutter/material.dart';
import 'package:mobile/domain/personagemClass.dart';
import 'package:mobile/service/reqPersonagem.dart';
import 'package:http/http.dart' as http;

class Dialogatualizapersonagem extends StatefulWidget {
  final String id;
  final Personagem personagem;

  const Dialogatualizapersonagem(
      {super.key, required this.id, required this.personagem});

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
  void initState() {
    super.initState();
    if (widget.personagem != null) {
      nome = widget.personagem.nome;
      title = widget.personagem.title;
      tags = widget.personagem.tags;
      icon = widget.personagem.icon;
      description = widget.personagem.description;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: 350,
        width: 350,
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text('Atualize seu personagem do LOL'),
              Card(
                child: TextFormField(
                  initialValue: nome,
                  decoration: const InputDecoration(labelText: 'Nome'),
                  onSaved: (value) => nome = value,
                ),
              ),
              Card(
                child: TextFormField(
                  initialValue: title,
                  decoration: const InputDecoration(labelText: 'Title'),
                  onSaved: (value) => title = value,
                ),
              ),
              Card(
                child: TextFormField(
                  initialValue: tags,
                  decoration: const InputDecoration(labelText: 'Tags'),
                  onSaved: (value) => tags = value,
                ),
              ),
              Card(
                child: TextFormField(
                  initialValue: icon,
                  decoration: const InputDecoration(labelText: 'Icon'),
                  onSaved: (value) => icon = value,
                ),
              ),
              Card(
                child: TextFormField(
                  initialValue: description,
                  decoration: const InputDecoration(labelText: 'Description'),
                  onSaved: (value) => description = value,
                ),
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
