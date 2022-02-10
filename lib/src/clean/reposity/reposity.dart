import '../model/cat.dart';
import '../service/service.dart';

class CatReposiy {
  final CatService catService;
  const CatReposiy({required this.catService});

  Future<Cat> search() async {
    return catService.search();
  }

  Future<Cat> search1() async {
    return catService.search1();
  }
}
