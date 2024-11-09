import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mobile/domain/personagemClass.dart';
import 'package:mobile/service/reqPersonagem.dart';
import 'package:mocktail/mocktail.dart';

final class HttpClientMock extends Mock implements http.Client {}

void main() {
  late HttpClientMock tHttpClientMock;
  late Reqpersonagem tReqPersonagem;
  late String tUri;

  setUpAll(() {
    tUri = 'http://localhost:3000/personagens/1';
    tHttpClientMock = HttpClientMock();
    tReqPersonagem = Reqpersonagem(client: tHttpClientMock);
  });

  test(
    'pegar um personagem',
    () async {
      when(() => tHttpClientMock.get(Uri.parse(tUri))).thenAnswer((_) async =>
          http.Response(
              jsonEncode({
                'id': 1,
                'name': 'Personagem 1',
                'local': 'local do Personagem 1'
              }),
              200));
      final result = await tReqPersonagem.fetchPersonagem(1);

      expect(result, isA<Personagem>());
      expect(result.id, 1);
      expect(result.name, 'Personagem 1');
      expect(result.local, 'local do Personagem 1');
    },
  );

  test('criar um personagem', () async {
    when(() => tHttpClientMock.post(
          Uri.parse('http://localhost:3000/personagens'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, String>{
            'name': 'Personagem 1',
            'local': 'local do Personagem 1',
          }),
        )).thenAnswer((_) async => http.Response('', 201));

    final personagem =
        Personagem(id: 1, name: 'Personagem 1', local: 'local do Personagem 1');
    await tReqPersonagem.criarPersonagem(personagem);
  });
}
