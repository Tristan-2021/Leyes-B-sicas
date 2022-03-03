import 'package:flutter_test/flutter_test.dart';
import 'package:testflutter/src/clean/blocs/tabs_principal/bloc/bottonnavigator_bloc.dart';

void main() {
  group('botton BlocEvent', () {
    test('supports compartions  Eventbotton', () {
      expect(
          const TabChangeEvent(0).newIndex, const TabChangeEvent(0).newIndex);
    });

    test('supports event bottonEven2', () {
      expect(const TabChangeEventS(1, ''), const TabChangeEventS(1, ''));
    });
  });
}
