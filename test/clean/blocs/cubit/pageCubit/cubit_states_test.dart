import 'package:flutter_test/flutter_test.dart';
import 'package:testflutter/src/clean/cubits/cubitpage/cubit/cubtiexample_cubit.dart';

void main() {
  group('cubitStatus status', () {
    test('test Status initla', () {
      const isnital = Status.initial;
      expect(isnital.isFailure, isFalse);
      expect(isnital.isInitial, isTrue);
      expect(isnital.isLoaded, isFalse);
      expect(isnital.isLoading, isFalse);
    });

    test('test Status loading', () {
      const isnital = Status.loading;
      expect(isnital.isFailure, isFalse);
      expect(isnital.isInitial, isFalse);
      expect(isnital.isLoaded, isFalse);
      expect(isnital.isLoading, isTrue);
    });

    test('test Status laodend', () {
      const isnital = Status.laoded;
      expect(isnital.isFailure, isFalse);
      expect(isnital.isInitial, isFalse);
      expect(isnital.isLoaded, isTrue);
      expect(isnital.isLoading, isFalse);
    });
    test('test Status failure', () {
      const isnital = Status.failure;
      expect(isnital.isFailure, isTrue);
      expect(isnital.isInitial, isFalse);
      expect(isnital.isLoaded, isFalse);
      expect(isnital.isLoading, isFalse);
    });
  });
}
