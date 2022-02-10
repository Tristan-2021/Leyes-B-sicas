import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:testflutter/src/clean/blocs/page2/bloc/page2_bloc.dart';
import 'package:testflutter/src/clean/model/cat.dart';
import 'package:testflutter/src/page/pages_bloc_principal/homepage.dart';
import 'package:testflutter/src/page/pages_bloc_secundary/pages_secundary.dart';

import '../../mocks/mocks.dart';

void main() {
  late MockPage2Bloc blocCat;
  setUpAll(() {
    registerFallbackValue(FakePage2Evetns());
    registerFallbackValue(Fakepage2state());
  });

  setUp(() {
    blocCat = MockPage2Bloc();
  });

  group('Page2Page states', () {
    testWidgets(
        'rende FailureCAntRadomView when stae is [RandomCatState.faiulure]',
        (tester) async {
      when(() => blocCat.state)
          .thenReturn(const Page2States(state: Page2Status.failure));
      await mockNetworkImagesFor(
          () => tester.pumpWidget(BlocProvider<Page2Bloc>(
                create: (_) => blocCat,
                lazy: false,
                child: const MaterialApp(
                  home: ViewPage2(),
                ),
              )));
      expect(find.text('Error'), findsOneWidget);
    });

    testWidgets(
        'rende FailureCAntRadomView when stae is [RandomCatState.loading]',
        (tester) async {
      when(() => blocCat.state)
          .thenReturn(const Page2States(state: Page2Status.loading));
      await mockNetworkImagesFor(
          () => tester.pumpWidget(BlocProvider<Page2Bloc>(
                create: (_) => blocCat,
                lazy: false,
                child: const MaterialApp(
                  home: ViewPage2(),
                ),
              )));

      expect(find.byType(Text), findsOneWidget);
    });

    testWidgets(
        'rende FailureCAntRadomView when stae is [RandomCatState.succes]',
        (tester) async {
      when(() => blocCat.state)
          .thenReturn(const Page2States(state: Page2Status.succes));
      await mockNetworkImagesFor(
          () => tester.pumpWidget(BlocProvider<Page2Bloc>(
                create: (_) => blocCat,
                lazy: false,
                child: const MaterialApp(
                  home: ViewPage2(),
                ),
              )));
      expect(find.byType(Text), findsOneWidget);
    });
  });

  group('Call to SearchRandomCat on BlocListener ', () {
    const cat = Cat(id: '1', breeds: [], width: 1, height: 1, url: 'www');
    testWidgets('call Page2EmpthyEvent', (tester) async {
      whenListen(
          blocCat,
          Stream.fromIterable([
            const Page2States(),
            const Page2States(state: Page2Status.empthyName, cat: cat),
          ]));

      when(() => blocCat.state).thenReturn(
          const Page2States(state: Page2Status.empthyName, cat: cat));

      await mockNetworkImagesFor(
          () => tester.pumpWidget(BlocProvider<Page2Bloc>(
                lazy: false,
                create: (_) => blocCat,
                child: const MaterialApp(
                  home: ViewPage2(),
                ),
              )));
      verify(() => blocCat.add(PageData())).called(1);
    });
  });
}
