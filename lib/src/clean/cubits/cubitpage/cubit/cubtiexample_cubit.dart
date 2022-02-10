import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:testflutter/src/clean/model/exmappleentity.dart';
import '../../../service/service_example.dart';

part 'cubtiexample_state.dart';

// testing with Abstract clas de CubitexamppleStates

// class CubtiexampleCubit extends Cubit<CubtiexampleState> {
//   final ServiceExmple serviceExmple;

//   CubtiexampleCubit({required this.serviceExmple})
//       : super(CubtiexampleInitial());

//   String name = 'data';

//   Future<void> getDataBack() async {
//     emit(CubtiexampleInitial());
//     try {
//       final data = await serviceExmple.getaDat(name);
//       if (data == 'data') {
//         print(data);
//         emit(CubtiexampleLoaded(name: data));
//       } else {
//         emit(const CubtiexampleError(error: 'Error'));
//       }
//     } catch (e) {
//       print(e);

//       emit(const CubtiexampleError(error: 'Error'));
//     }
//   }
// }
// testing with statesCubit

class CubtiexampleCubit extends Cubit<StatesCubit> {
  final ServiceExmple serviceExmple;

  CubtiexampleCubit({required this.serviceExmple}) : super(const StatesCubit());

  String name = '1';
  int valor = 0;

  Future<void> getDataBack() async {
    print('valorewsss');
    valor++;
    emit(state.copyWith(status: Status.initial));
    final data = await serviceExmple.getaDat(name);
    emit(state.copyWith(name: data, status: Status.laoded));

    // print(name);
    // switch (name) {
    //   case '1':
    //     var d = await failureOrData();
    //     emit(d);
    //     break;
    //   case '2':
    //     var d = await failureOrData();
    //     emit(d);
    //     break;
    //   case '3':
    //     var d = await failureOrData();
    //     emit(d);
    //     break;
    //   case '4':
    //     valor = 1;
    //     var d = await failureOrData();
    //     emit(d);
    //     break;

    //   default:
    // }
  }

  Future<StatesCubit> failureOrData() async {
    try {
      final data = await serviceExmple.getaDat(name);

      return StatesCubit(name: data, statess: Status.laoded);

      // ignore: unused_catch_clause
    } on Exception catch (e) {
      return const StatesCubit(statess: Status.failure);
    }
  }
}
