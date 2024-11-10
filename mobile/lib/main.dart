import 'package:flutter/material.dart';
import 'package:mobile/screen/home.dart';
import 'package:mobile/screen/personagens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.blue,
            secondary: const Color.fromARGB(255, 228, 212, 44)),
        useMaterial3: true,
      ),
      home: const Home(),
    );
  }
}
