import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:http/http.dart' as http;
import 'package:testflutter/src/clean/error/excapetion.dart';
import 'package:testflutter/src/clean/model/cat.dart';
import 'package:testflutter/src/clean/service/service.dart';
import 'package:testflutter/src/clean/utils/uilstes.dart';

class MockHttp extends Mock implements http.Client {}

class MockResponse extends Mock implements http.Response {}

class FakeUri extends Fake implements Uri {}

// en estos test lo que hago es simular la llamda http y su respuesta
// po lo que a la función real  se le inyectará la llamda simulada (Mock) para verificar
// que  hace el trabajo correctamente
void main() {
  group('Service', () {
    late CatService catService;
    late MockHttp httpClient;

    setUpAll(() {
      registerFallbackValue(FakeUri());
    });
    setUp(() {
      httpClient = MockHttp();
      // le inyecto el http mock
      catService = CatService(httpClient: httpClient);
    });

    group('constructor', () {
      test('does not required a httpClient', () {
        expect(CatService(), isNotNull);
      });
    });

    group('catSearch', () {
      String uri = 'https://api.thecatapi.com/v1/images/search?has_breeds=true';

      test(
          'make correct http request with response'
          'throw[ErrorEmptyResponse]', () async {
        final response = MockResponse();
        when(() => httpClient.get(any())).thenAnswer((_) async {
          return response;
        });
        when(() => response.statusCode).thenReturn(200);
        when(() => response.body).thenReturn('');

        try {
          await catService.search();

          fail('should throw error empty body');
        } catch (e) {
          expect(e, isA<ErrorEmptyResponse>());
        }

        verify(
          () => httpClient.get(
            Uri.parse(uri),
          ),
        ).called(1);
      });

      test('error de server statuscode 404', () async {
        final response = MockResponse();

        when(() => httpClient.get(any())).thenAnswer((_) async => response);
        when(() => response.statusCode).thenReturn(404);
        var s = catService.search();
        print(s);

        expect(s, throwsA(isA<ErrorSearchingCat>()));
      });

      test('resposnse válido', () async {
        final response = MockResponse();

        when(() => httpClient.get(any())).thenAnswer((_) async => response);
        when(() => response.statusCode).thenReturn(200);
        when(() => response.body).thenReturn(TestHelper.searchs);
        //await catService.search();

        expect(Cat.fromJson(json.decode(response.body)[0]), isA<Cat>());
      });
    });
  });
}
