import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile/domain/personagemClass.dart';
import 'package:mobile/screen/personagens.dart';

void main() {
  testWidgets('Personagens widget test', (WidgetTester tester) async {
    final personagensWidget = Personagens();

    await tester.pumpWidget(MaterialApp(home: personagensWidget));

    await tester.runAsync(() async {
      await Future.delayed(const Duration(seconds: 1));
    });

    await tester.pump();

    expect(find.text('Personagens'), findsOneWidget);
    expect(find.text('Personagem 1'), findsOneWidget);
  });
}
