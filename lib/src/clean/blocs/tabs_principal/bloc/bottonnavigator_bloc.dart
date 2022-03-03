import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'bottonnavigator_event.dart';
part 'bottonnavigator_state.dart';

class BottonnavigatorBloc
    extends Bloc<BottonnavigatorEvent, BottonnavigatorState> {
  BottonnavigatorBloc()
      : super(const BottonnavigatorLoaded(index: 0, name: 'vacío')) {
    on<TabChangeEvent>((event, emit) {
      return emit(BottonnavigatorLoaded(index: event.newIndex, name: 'null'));
    });

    on<TabChangeEventS>((event, emit) {
      return emit(
        BottonnavigatorLoaded(index: event.newIndex, name: event.name),
      );
    });
  }
}
