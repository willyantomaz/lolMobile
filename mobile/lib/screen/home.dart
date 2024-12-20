import 'package:flutter/material.dart';
import 'package:mobile/screen/createPersonagem.dart';
import 'package:mobile/screen/personagens.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wike Personagens'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.secondary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              'Bem vindo ao Wike Personagens do LoL',
            ),
            Center(
              child: Container(
                width: 200,
                height: 200,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.blue,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Personagens()));
                      },
                      child: const Text("Visualizar Personagens"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const CreatePersonagem()));
                      },
                      child: const Text("Criar Personagem"),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
