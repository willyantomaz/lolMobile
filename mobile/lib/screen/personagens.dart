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
  Personagem? personagem;

  @override
  void initState() {
    super.initState();
    pegarPersonagem();
  }

  pegarPersonagem() async {
    final personagem =
        await Reqpersonagem(client: http.Client()).fetchPersonagem(1);
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (personagem != null) ...[
              Text(personagem!.name),
              Text(personagem!.local),
            ],
          ],
        ),
      ),
    );
  }
}
