import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockingjay/mockingjay.dart';
import 'package:testflutter/src/clean/cubits/cubitpage/cubit/cubtiexample_cubit.dart';
import 'package:testflutter/src/clean/model/exmappleentity.dart';
import 'package:testflutter/src/clean/service/service_example.dart';
import 'package:testflutter/src/page/page_bloc_and_cubir.dart';

import '../../mocks/mocks.dart';

void main() {
  Key key = const Key('valor_container');

  group('Find widget test', () {
    List<String> indexString = [
      '0 Dato',
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
        child: MaterialApp(
          home: Pagecubit(
            indexString: indexString,
          ),
        ),
      );
    }

    testWidgets('Renders type Widget Pagecubit', (tester) async {
      await tester.pumpWidget(
        buidwidget(),
      );
      expect(find.byType(Pagecubit), findsOneWidget);
    });

    //TODO: testing de pageBuilder que debo implemetnar
    testWidgets('Renders type Widget scrollViePage onTap FloationBotton',
        (tester) async {
      await tester.pumpWidget(
        BlocProvider.value(
          value: cubitExample,
          child: MaterialApp(
            home: Pagecubit(
              indexString: List.generate(6, (index) => '$index Dato'),
            ),
          ),
        ),
      );

      await tester.scrollUntilVisible(find.byKey(const Key('0')), 3.0);
      await tester.pumpAndSettle();
      await tester.pump();
      await tester.tap(find.byKey(const Key('0'), skipOffstage: false));

      expect(find.text('0 Dato', skipOffstage: false), findsOneWidget);

      await tester.scrollUntilVisible(find.byKey(const Key('1')), 3.1);
      await tester.pumpAndSettle();
      await tester.pump();
      await tester.tap(find.byKey(const Key('1'), skipOffstage: false));

      expect(find.text('1 Dato', skipOffstage: false), findsOneWidget);
    });
  });
}
 //final gesture = await tester.startGesture(
      //  const Offset(880.0, 106.0)); //Position of the scrollview

      // await tester.getCenter(find.byType(Viewport));
      // final Offset scrollEventLocation =
      //     tester.getCenter(find.byType(Viewport));
      // PointerDeviceKind kind = PointerDeviceKind.touch;
      // final TestPointer testPointer = TestPointer(1, kind);
      // // Create a hover event so that |testPointer| has a location when generating the scroll.
      // testPointer.hover(scrollEventLocation);
      // final gesture = await tester
      //     .startGesture(const Offset(0, 300)); //Position of the scrollview
      // await gesture.moveBy(const Offset(0, 600));
      // await tester.pump();
      // final Offset point = tester.getCenter(find.byKey(const Key('1')));
      //
      // await tester    .ensureVisible(find.byKey(const Key('1'), skipOffstage: false));
      //await tester.drag(find.byType(PageView), const Offset(0, -500));
      // await tester.scrollUntilVisible(find.byKey(const Key('2')), 2);
      // await tester.pumpAndSettle();

      // await tester.dragUntilVisible(
      //     find.text('0 Dato'), find.byType(PageView), const Offset(0, 60));
      // // await gesture.moveBy(const Offset(880.0, 106.0)); //How much to scroll by
      // await tester.pump();
      // await tester.tap(find.byKey(const Key('0'), skipOffstage: false));

      // expect(find.text('0 Dato', skipOffstage: false), findsOneWidget);
      // await tester.dragUntilVisible(
      //     find.text('1 Dato'), find.byType(PageView), const Offset(60, 90));
      // // await gesture.moveBy(const Offset(880.0, 106.0)); //How much to scroll by
      // await tester.pump();
      // await tester.tap(find.byKey(const Key('1'), skipOffstage: false));

      // expect(find.text('1 Dato', skipOffstage: false), findsOneWidget);