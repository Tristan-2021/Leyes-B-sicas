import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:testflutter/src/clean/blocs/page2/bloc/page2_bloc.dart';
import 'package:testflutter/src/clean/error/excapetion.dart';
import 'package:testflutter/src/clean/model/breed.dart';
import 'package:testflutter/src/clean/model/cat.dart';
import 'package:testflutter/src/clean/reposity/reposity.dart';

class MockRepository extends Mock implements CatReposiy {}

class MockCat extends Mock implements Cat {}

void main() {
  group('RandomCatBloc', () {
    late CatReposiy reposiy;
    late Cat catMock;
    setUp(() {
      reposiy = MockRepository();
      catMock = MockCat();
    });

    test('initial state of the bloc is [RandomCatstatui.initial]', () {
      expect(Page2Bloc(reposervice: reposiy).state, const Page2States());
    });

    blocTest<Page2Bloc, Page2States>(
        'emitss [Page2States.Stats.loading, Page2States.status.emptyBreeds]',
        setUp: () {
          when(() => catMock.breeds).thenReturn([]);
          when(() => reposiy.search()).thenAnswer((_) async => catMock);
        },
        build: () => Page2Bloc(reposervice: reposiy),
        act: (bloc) {
          bloc.add(PageData());
        },
        expect: () {
          return <Page2States>[
            const Page2States(state: Page2Status.loading),
            const Page2States(state: Page2Status.empthyName),
          ];
        });
    blocTest<Page2Bloc, Page2States>(
        'emitss [Page2States.Stats.loading, Page2States.status.emptyBreeds] state when cat.breeds are null',
        setUp: () {
          when(() => catMock.breeds).thenReturn(null);
          when(() => reposiy.search()).thenAnswer((_) async => catMock);
        },
        build: () => Page2Bloc(reposervice: reposiy),
        act: (bloc) {
          bloc.add(PageData());
        },
        expect: () {
          return <Page2States>[
            const Page2States(state: Page2Status.loading),
            const Page2States(state: Page2Status.empthyName),
          ];
        });

    blocTest<Page2Bloc, Page2States>(
        'emitss [Page2States.Stats.loading, Page2States.status.emptyBreeds] state is succesfull',
        setUp: () {
          const Breed breeds = Breed(id: '1');
          when(() => catMock.breeds)
              .thenReturn(List.generate(1, (index) => breeds));
          when(() => reposiy.search()).thenAnswer((_) async => catMock);
        },
        build: () => Page2Bloc(reposervice: reposiy),
        act: (bloc) {
          bloc.add(PageData());
        },
        expect: () {
          return <Page2States>[
            const Page2States(state: Page2Status.loading),
            Page2States(state: Page2Status.succes, cat: catMock),
          ];
        });

    blocTest<Page2Bloc, Page2States>(
        'emitss [Page2States.Stats.loading, Page2States.status.failure] ',
        setUp: () {
          //when(() => catMock.breeds).thenReturn(null);
          when(() => reposiy.search()).thenThrow(ErrorSearchingCat());
        },
        build: () => Page2Bloc(reposervice: reposiy),
        act: (bloc) {
          bloc.add(PageData());
        },
        expect: () {
          return <Page2States>[
            const Page2States(state: Page2Status.loading),
            const Page2States(state: Page2Status.failure),
          ];
        });
  });
}
