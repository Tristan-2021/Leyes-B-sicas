import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockingjay/mockingjay.dart';
import 'package:testflutter/src/clean/cubits/cubitpage/cubit/cubtiexample_cubit.dart';
import 'package:testflutter/src/clean/model/exmappleentity.dart';
import 'package:testflutter/src/clean/service/service_example.dart';
import 'package:testflutter/src/page/pages_bloc_secundary/page_cubit.dart';

import '../../mocks/mocks.dart';

void main() {
  Key key = Key('valor_container');

  group('Find widget test', () {
    List<String> indexString = [
      '1 Dato',
      '2 Dato',
      '3 Dato',
      '4 Dato',
      '5 Dato',
    ];
    late MockNavigator navigator;
    late ServiceExmple mockService;
    late CubtiexampleCubit cubitExample;
    //late ExmappleEntity exmappleEntity;
    const valorkey = Key('keyTap');
    Key keyTap = const Key('tap_onmpres');

    var exmappleEntity = const ExmappleEntity(entero: 1, name: '2');
    var ss = StatesCubit();
    setUp(() {
      mockService = MockService();
      navigator = MockNavigator();
      cubitExample = FakecubitPage();
      // when(() => mockService.getaDat('vacio'))
      //     .thenAnswer((_) async => exmappleEntity);
      when(() => cubitExample.getDataBack(
          //StatesCubit(statess: Status.laoded, name: exmappleEntity)
          )).thenAnswer((_) async => Future.value());
      when(() => cubitExample.name).thenAnswer((_) => '1');

      when(() => cubitExample.state).thenReturn(const StatesCubit());
    });

    Widget buidwidget() {
      return BlocProvider.value(
        value: cubitExample,
        child: const MaterialApp(
          home: Pagecubit(),
        ),
      );
    }

    testWidgets('Renders type Widget Pagecubit', (tester) async {
      await tester.pumpWidget(
        buidwidget(),
      );
      expect(find.byType(Pagecubit), findsOneWidget);
    });
    testWidgets('Renders type Widget Pagecubit center', (tester) async {
      await tester.pumpWidget(
        buidwidget(),
      );
      expect(find.byKey(key), findsOneWidget);
    });

    testWidgets('Renders type Widget Pagecubit onTap FloationBotton',
        (tester) async {
      await tester.pumpWidget(
        buidwidget(),
      );

      await tester.tap(find.byKey(Key('1')));
      //await tester.tap(find.byKey(keyTap));

      //await Future.delayed(const Duration(seconds: 1));
      // verify(() => cubitExample.getDataBack(
      //     //StatesCubit(statess: Status.laoded, name: exmappleEntity))
      //     )).called(1);

      // expec t(find.byKey(key), findsOneWidget);
    });
    //TODO: testing de pageBuilder que debo implemetnar
    testWidgets('Renders type Widget scrollViePage onTap FloationBotton',
        (tester) async {
      await tester.pumpWidget(
        BlocProvider.value(
          value: cubitExample,
          child: const MaterialApp(
            home: Pagecubit(),
          ),
        ),
      );
      final gesture = await tester
          .startGesture(const Offset(0, 600)); //Position of the scrollview
      await gesture.moveBy(const Offset(0, -600)); //How much to scroll by
      await tester.pump();

      expect(find.text('vacio'), findsOneWidget);
    });
  });
}
