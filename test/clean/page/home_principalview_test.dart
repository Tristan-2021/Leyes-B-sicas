import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockingjay/mockingjay.dart';
import 'package:testflutter/src/clean/blocs/tabs_principal/bloc/bottonnavigator_bloc.dart';
import 'package:testflutter/src/clean/blocs/tabs_principal/views/View_principal.dart';
import 'package:testflutter/src/clean/blocs/tabs_principal/views/tabs_secundary_pages/otro_cosa.dart';

import 'package:testflutter/src/clean/cubits/home_cubit/view/view0.dart';
import 'package:testflutter/src/clean/cubits/home_cubit/view/pages_secundary.dart';

import '../../mocks/mocks.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

void main() {
  late MockBottonBloc blocBotton;
  late MockNavigatorObserver mockObserver;
  setUpAll(() {
    registerFallbackValue(FakeBottonEvents());
    registerFallbackValue(FakeBottonState());
  });
  late MockNavigator navigator;

  group('HomeView', () {
    late MockNavigator navigator;
    setUp(() {
      navigator = MockNavigator();
      when(() => navigator.push(any())).thenAnswer((_) async => null);

      mockObserver = MockNavigatorObserver();
      blocBotton = MockBottonBloc();
    });
    const valorkey = Key('keyTap');

    testWidgets('render BottonLoading[0]', (tester) async {
      when(() => blocBotton.state)
          .thenReturn(const BottonnavigatorLoaded(index: 0, name: 'vacío'));

      await tester.pumpWidget(BlocProvider<BottonnavigatorBloc>(
        create: (_) => blocBotton,
        lazy: false,
        child: const MaterialApp(
          home: HomeView(),
        ),
      ));
      expect(find.byType(ViewPage0), findsOneWidget);
    });
    testWidgets('render BottonLoading[1]', (tester) async {
      when(() => blocBotton.state)
          .thenReturn(const BottonnavigatorLoaded(index: 1, name: ''));

      await tester.pumpWidget(BlocProvider<BottonnavigatorBloc>(
        create: (_) => blocBotton,
        lazy: false,
        child: const MaterialApp(
          home: HomeView(),
        ),
      ));
      expect(find.byType(ViewPage1), findsOneWidget);
    });
    testWidgets('render BottonLoading[1] botton onTap FloatingActionButton',
        (tester) async {
      when(() => blocBotton.state)
          .thenReturn(const BottonnavigatorLoaded(index: 1, name: ''));

      await tester.pumpWidget(BlocProvider<BottonnavigatorBloc>(
        create: (_) => blocBotton,
        lazy: false,
        child: const MaterialApp(
          home: HomeView(),
        ),
      ));
      expect(
          find.descendant(
              of: find.byKey(valorkey), matching: find.byIcon(Icons.more)),
          findsOneWidget);
    });
//  Widget buildSubject() {
//       return MockNavigatorProvider(
//         navigator: navigator,
//         child: BlocProvider.value(
//           value: cubit,
//           child: const HomeView(),
//         ),
//       );
//     }
    testWidgets('navigates to the Pagecubit when pressed', (tester) async {
      when(() => blocBotton.state)
          .thenReturn(const BottonnavigatorLoaded(index: 1, name: ''));

      await tester.pumpWidget(MockNavigatorProvider(
        navigator: navigator,
        child: BlocProvider<BottonnavigatorBloc>(
          create: (_) => blocBotton,
          lazy: false,
          child: const MaterialApp(
            // routes: {
            //   '/': (BuildContext context) => const HomeView(),
            //   'Valors': (BuildContext context) => const ViewPage2(),
            //   'pagecubit': (BuildContext context) => const Pagecubit(),
            // },
            // //navigatorObservers: [mockObserver],
            // initialRoute: '/',
            home: HomeView(),
          ),
        ),
      ));
      await tester.tap(
        find.byKey(valorkey),
      );
      //verify(() async => mockObserver.navigator!.pushNamed('routeName'));
      verify(() => navigator.push(any(that: isRoute<void>()))).called(1);
      //verify(() => navigator.pushNamed('pagecubit')).called(0);
      // verifyNever(() => navigator.push(any(that: isRoute<void>())));
    });
    testWidgets('render BottonLoading[1] Icon onTap FloatingActionButton',
        (tester) async {
      when(() => blocBotton.state)
          .thenReturn(const BottonnavigatorLoaded(index: 1, name: ''));

      await tester.pumpWidget(BlocProvider<BottonnavigatorBloc>(
        create: (_) => blocBotton,
        lazy: false,
        child: const MaterialApp(
          home: HomeView(),
        ),
      ));
      expect(find.byKey(valorkey), findsOneWidget);
      final addTodoFloatingActionButton = tester.widget(find.byKey(valorkey));
      expect(
        addTodoFloatingActionButton,
        isA<FloatingActionButton>(),
      );
    });

    testWidgets('render BottonLoading[2]', (tester) async {
      when(() => blocBotton.state)
          .thenReturn(const BottonnavigatorLoaded(index: 2, name: ''));

      await tester.pumpWidget(BlocProvider<BottonnavigatorBloc>(
        create: (_) => blocBotton,
        lazy: false,
        child: const MaterialApp(
          home: HomeView(),
        ),
      ));
      expect(find.byType(ViewPage2), findsOneWidget);
    });
  });
}
