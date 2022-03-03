import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:testflutter/src/clean/blocs/tabs_principal/bloc/bottonnavigator_bloc.dart';

void main() {
  group('BottonNavigatorBloc ', () {
    test('state bottonNavigato[0]', () {
      // probamos el estado inicial del bloc, que está definido en su constructor
      expect(BottonnavigatorBloc().state,
          const BottonnavigatorLoaded(name: 'vacío', index: 0));
    });

    blocTest<BottonnavigatorBloc, BottonnavigatorState>('state is 1',
        setUp: () {
          //sepUp nos ayuda establecer un comportamiento y ello descencadenan acciones
          // when(() => 0).thenReturn(0);
          // when(() => 0).thenAnswer((_) => 0);
        },
        build: () => BottonnavigatorBloc(),
        act: (bloc) => bloc.add(const TabChangeEvent(0)),
        expect: () {
          return <BottonnavigatorState>[
            const BottonnavigatorLoaded(name: 'null', index: 0),
          ];
        });

    blocTest<BottonnavigatorBloc, BottonnavigatorState>('state is 2',
        setUp: () {
          //sepUp es parab establecer un comportamiento
          // when(() => 0).thenReturn(0);
          // when(() => 0).thenAnswer((_) => 0);
        },
        build: () => BottonnavigatorBloc(),
        act: (bloc) => bloc.add(const TabChangeEvent(2)),
        expect: () {
          return <BottonnavigatorState>[
            const BottonnavigatorLoaded(name: 'null', index: 2),
          ];
        });
  });
}
