import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../model/cat.dart';
import '../../../reposity/reposity.dart';

part 'page2_event.dart';
part 'page2_state.dart';

class Page2Bloc extends Bloc<Page2Event, Page2States> {
  final String name = 'jhon';
  final CatReposiy reposervice;

  Page2Bloc({required this.reposervice}) : super(const Page2States()) {
    // on<PageData>((event, emit) {
    //   //return emit(Page2Loaded(event.data, false));
    //   if (event.v) {
    //     return emit(state.copyWith(
    //       state: Page2Status.loading,
    //       v: true,
    //     ));
    //     // añadir un Cat pata qye se actualize
    //   }
    //   return emit(state.copyWith(state: Page2Status.initial));
    // });
    // on<PageData2>((event, emit) {
    //   return emit(state.copyWith(
    //       name: 'Resultado positivo', v: true, state: Page2Status.loading));
    // });

    on<PageData>((event, emit) => _mapstateEvent(event, emit));
  }
  _mapstateEvent(PageData event, Emitter<Page2States> emit) async {
    try {
      emit(state.copyWith(state: Page2Status.loading));
      final cat = await reposervice.search();
      if (cat.breeds == null || cat.breeds!.isEmpty) {
        emit(state.copyWith(state: Page2Status.empthyName));
      } else {
        emit(state.copyWith(state: Page2Status.succes, cat: cat));
      }
    } catch (e) {
      emit(state.copyWith(state: Page2Status.failure));
    }
  }
}
