import 'package:flutter_test/flutter_test.dart';
import 'package:testflutter/src/clean/blocs/tabs/bloc/bottonnavigator_bloc.dart';

void main() {
  group('comparations values State', () {
    test('state is comparations', () {
      expect(
          const BottonnavigatorLoaded(
            name: 's',
            index: 1,
          ),
          const BottonnavigatorLoaded(
            name: 's',
            index: 1,
          ));
    });
  });
}
