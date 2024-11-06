import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile/personagemClass.dart';
import 'package:mobile/personagens.dart';

void main() {
  testWidgets('Personagens widget test', (WidgetTester tester) async {
    // Arrange
    final personagem =
        Personagem(id: 1, name: 'Personagem 1', local: 'local do Personagem 1');

    // Act
    await tester.pumpWidget(MaterialApp(home: Personagens()));

    // Simulate the asynchronous operation
    await tester.runAsync(() async {
      await Future.delayed(const Duration(seconds: 1));
    });

    // Rebuild the widget after the state has changed
    await tester.pump();

    // Assert
    expect(find.text('Personagens'), findsOneWidget);
    expect(find.text('Personagem 1'), findsOneWidget);
    expect(find.text('local do Personagem 1'), findsOneWidget);
  });
}
