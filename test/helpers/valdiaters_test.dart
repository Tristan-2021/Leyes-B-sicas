import 'package:flutter_test/flutter_test.dart';
import 'package:testflutter/src/clean/helpers/validator/validator.dart';

void main() {
  group('username validated ', () {
    test('wrong  name has numbers  ', () {
      String name = 'JHon67';
      var text = validatenombre(name);

      expect(text, 'nombre incorrecto, no usar tíldes');
    });
    test('wrong  name has accents  ', () {
      String name = 'JHon rodríguez';
      var text = validatenombre(name);

      expect(text, 'nombre incorrecto, no usar tíldes');
    });
  });
}
