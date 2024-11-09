import 'package:flutter/material.dart';
import 'package:mobile/screen/personagens.dart';

class CreatePersonagem extends StatefulWidget {
  const CreatePersonagem({super.key});

  @override
  State<CreatePersonagem> createState() => _CreatepersonagemState();
}

class _CreatepersonagemState extends State<CreatePersonagem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Criar Personagem'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.secondary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              'Crie seu personagem',
            ),
            Center(
              child: Container(
                width: 200,
                height: 200,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
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
