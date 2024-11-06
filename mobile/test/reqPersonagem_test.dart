import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mobile/personagemClass.dart';
import 'package:mobile/reqPersonagem.dart';
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

  test('should return a Personagem if the http call completes successfully',
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
  });
}
