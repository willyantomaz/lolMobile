import 'package:flutter/material.dart';

class CreatePersonagem extends StatefulWidget {
  @override
  _CreatePersonagemState createState() => _CreatePersonagemState();
}

class _CreatePersonagemState extends State<CreatePersonagem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Personagem'),
      ),
      body: Center(
        child: Text('Create your personagem here!'),
      ),
    );
  }
}
