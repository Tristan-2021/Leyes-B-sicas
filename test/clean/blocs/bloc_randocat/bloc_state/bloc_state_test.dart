import 'package:flutter_test/flutter_test.dart';
import 'package:testflutter/src/clean/blocs/page2/bloc/page2_bloc.dart';

void main() {
  group('Page2Status Initial ', () {
    test('Page2Status Initial ', () {
      const isInitial = Page2Status.initial;
      expect(isInitial.isInitial, isTrue);
      expect(isInitial.isLoading, isFalse);
      expect(isInitial.isSucces, isFalse);
      expect(isInitial.isEmptyName, isFalse);
      expect(isInitial.isfailure, isFalse);
    });

    test('Page2Status Loading ', () {
      const isInitial = Page2Status.loading;

      expect(isInitial.isInitial, isFalse);
      expect(isInitial.isLoading, isTrue);
      expect(isInitial.isSucces, isFalse);
      expect(isInitial.isEmptyName, isFalse);
      expect(isInitial.isfailure, isFalse);
    });
    test('Page2Status Succes ', () {
      const isInitial = Page2Status.succes;

      expect(isInitial.isInitial, isFalse);
      expect(isInitial.isLoading, isFalse);
      expect(isInitial.isSucces, isTrue);
      expect(isInitial.isEmptyName, isFalse);
      expect(isInitial.isfailure, isFalse);
    });

    test('Page2Status failure ', () {
      const isInitial = Page2Status.failure;

      expect(isInitial.isInitial, isFalse);
      expect(isInitial.isLoading, isFalse);
      expect(isInitial.isSucces, isFalse);
      expect(isInitial.isEmptyName, isFalse);
      expect(isInitial.isfailure, isTrue);
    });
    test('Page2Status empthyName ', () {
      const isInitial = Page2Status.empthyName;

      expect(isInitial.isInitial, isFalse);
      expect(isInitial.isLoading, isFalse);
      expect(isInitial.isSucces, isFalse);
      expect(isInitial.isEmptyName, isTrue);
      expect(isInitial.isfailure, isFalse);
    });
  });
}
