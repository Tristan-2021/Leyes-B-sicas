import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'randomcat_event.dart';
part 'randomcat_state.dart';

class RandomcatBloc extends Bloc<RandomcatEvent, int> {
  RandomcatBloc() : super(0) {
    on<RandomcatEvent>((event, emit) {});
  }
}
