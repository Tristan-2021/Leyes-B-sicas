import 'package:flutter_test/flutter_test.dart';
import 'package:testflutter/src/clean/blocs/page2/bloc/page2_bloc.dart';

void main() {
  group('RandomCatEvent', () {
    test('supports comparisons', () {
      expect(const Page2Event(), const Page2Event());
    });

    group('SearchRandomCat', () {
      test('supports comparisons', () {
        expect(PageData(), PageData());
      });
    });
  });
}
