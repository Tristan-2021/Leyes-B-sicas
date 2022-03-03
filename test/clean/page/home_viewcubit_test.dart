import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockingjay/mockingjay.dart';
import 'package:testflutter/src/clean/blocs/tabs_principal/views/tabs_secundary_pages/otro_cosa.dart';
import 'package:testflutter/src/clean/cubits/cubit/cubitprincipal/home_cubit.dart';
import 'package:testflutter/src/clean/cubits/home_cubit/view/homepage.dart';
import 'package:testflutter/src/clean/cubits/home_cubit/view/view0.dart';

import '../../mocks/mocks.dart';

void main() {
  group('HomeVieCubit ', () {
    late HomeCubit cubit;

    late MockNavigator navigator;
    setUp(() {
      cubit = FakeIndexCubit();
      navigator = MockNavigator();
      when(() => navigator.push(any())).thenAnswer((_) async => null);
      // cubit = FakeIndexCubit();
      // when(() => cubit.state).thenReturn(const HomeState());
    });
    Widget buildSubject() {
      return MockNavigatorProvider(
        navigator: navigator,
        child: BlocProvider.value(
          value: cubit,
          child: const MaterialApp(
            home: Scaffold(body: HomePage()),
          ),
        ),
      );
    }

    testWidgets('renders ViewPage0', (tester) async {
      when(() => cubit.state).thenReturn(const HomeState());
      await tester.pumpWidget(
        buildSubject(),
      );

      expect(find.byType(ViewPage1), findsOneWidget);
    });
    testWidgets('renders ViewPage1', (tester) async {
      when(() => cubit.state).thenReturn(const HomeState(tab: Hometab.state));
      await tester.pumpWidget(
        BlocProvider<HomeCubit>(
            lazy: false,
            create: (_) => cubit,
            child: const MaterialApp(
                home: Scaffold(
              body: HomePage(),
            ))),
      );

      expect(find.byType(ViewPage0), findsOneWidget);
    });
  });
}


    // testWidgets('renders ViewPage0', (tester) async {
    //   when(() => cubit.state).thenReturn(const HomeState());
    //   await tester.pumpWidget(BlocProvider<HomeCubit>(
    //     create: (_) => cubit,
    //     lazy: false,
    //     child: const MaterialApp(
    //       home: ViewPage0(),
    //     ),
    //   ));
    //   expect(find.byType(ViewPage0), findsOneWidget);
    // });