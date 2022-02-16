import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:testflutter/src/page/pages_bloc_secundary/pages_secundary.dart';

void main() {
  group('Scroll test', () {
    testWidgets('list Scroll testing ', (tester) async {
      await tester.pumpWidget(MaterialApp(
        home: ListScroll(
          indexString: List.generate(5, (index) => '$index Dato'),
        ),
      ));
      await tester.drag(find.byType(ListView), const Offset(0, -300));
      await tester.pump();
      await tester.tap(find.byKey(const Key('key 4')));
      final textfind = find.text('4 Dato');

      expect(textfind, findsOneWidget);
    });
  });
}
