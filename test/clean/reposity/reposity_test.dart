import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:testflutter/src/clean/error/excapetion.dart';
import 'package:testflutter/src/clean/model/cat.dart';
import 'package:testflutter/src/clean/reposity/reposity.dart';
import 'package:testflutter/src/clean/service/service.dart';

class MockService extends Mock implements CatService {}

void main() {
  group('Cat Repository', () {
    late MockService service;
    late CatReposiy catRepository;

    setUp(() {
      service = MockService();
      catRepository = CatReposiy(catService: service);
    });
    test('instantiates CatRepository with a required carService', () {
      expect(catRepository, isNotNull);
    });

    group('searchs n ext cat', () {
      test('calls search method ', () async {
        const Cat s = Cat(width: 100, height: 100, id: '1', url: 'https');
        when(() => service.search()).thenAnswer((_) => Future.value(s));

        var d = await catRepository.search();
        expect(d, isA<Cat>());
      });

      test('throws Result exception when search fails ', () async {
        final error = ErrorSearchingCat();

        when(() => service.search()).thenThrow(error);
        var s = catRepository.search();
        // var ss = await catRepository.search();

        expect(s, throwsA(error));
      });
    });
  });
}
