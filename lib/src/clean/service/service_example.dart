import 'package:testflutter/src/clean/error/excapetion.dart';
import 'package:testflutter/src/clean/model/exmappleentity.dart';

class ServiceExmple {
  final String name;

  const ServiceExmple({this.name = 'VaLOR'});

  Future<ExmappleEntity> getaDat(String vacio) async {
    if (vacio.isNotEmpty) {
      print('que pasasa  $vacio');
      await Future.delayed(Duration(seconds: 3));
      return Future.value(ExmappleEntity(entero: 1, name: vacio));
    } else {
      throw ErrorSearchingCat();
    }
  }
}
