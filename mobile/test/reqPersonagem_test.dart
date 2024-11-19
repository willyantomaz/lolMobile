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
      when(() => tHttpClientMock.get(Uri.parse(tUri)))
          .thenAnswer((_) async => http.Response(
              jsonEncode({
                "id": "9",
                "nome": "Fiddlesticks",
                "title": "the Ancient Fear",
                "tags": "Mage - Support",
                "icon":
                    "http://ddragon.leagueoflegends.com/cdn/10.23.1/img/champion/Fiddlesticks.png",
                "description":
                    "Something has awoken in Runeterra. Something ancient. Something terrible. The ageless horror known as Fiddlesticks stalks the edges of mortal society, drawn to areas thick with paranoia where it feeds upon terrorized victims. Wielding a jagged scythe..."
              }),
              200));
      final result = await tReqPersonagem.fetchPersonagem(1);

      expect(result, isA<Personagem>());
      expect(result.id, "9");
      expect(result.nome, 'Fiddlesticks');
      expect(result.title, 'the Ancient Fear');
    },
  );

  test('criar um personagem', () async {
    when(() => tHttpClientMock.post(
          Uri.parse('http://localhost:3000/personagens'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, String>{
            "id": "9",
            "nome": "Fiddlesticks",
            "title": "the Ancient Fear",
            "tags": "Mage - Support",
            "icon":
                "http://ddragon.leagueoflegends.com/cdn/10.23.1/img/champion/Fiddlesticks.png",
            "description":
                "Something has awoken in Runeterra. Something ancient. Something terrible. The ageless horror known as Fiddlesticks stalks the edges of mortal society, drawn to areas thick with paranoia where it feeds upon terrorized victims. Wielding a jagged scythe..."
          }),
        )).thenAnswer((_) async => http.Response('', 201));

    final personagem = Personagem(
        id: "9",
        nome: 'Fiddlesticks',
        title: 'the Ancient Fear',
        tags: 'Mage - Support',
        icon:
            'http://ddragon.leagueoflegends.com/cdn/10.23.1/img/champion/Fiddlesticks.png',
        description:
            'Something has awoken in Runeterra. Something ancient. Something terrible. The ageless horror known as Fiddlesticks stalks the edges of mortal society, drawn to areas thick with paranoia where it feeds upon terrorized victims. Wielding a jagged scythe...');
    await tReqPersonagem.criarPersonagem(personagem);
  });
}
