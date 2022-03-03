part of 'bottonnavigator_bloc.dart';

abstract class BottonnavigatorState extends Equatable {
  const BottonnavigatorState();

  @override
  List<Object> get props => [];
}

class BottonnavigatorLoaded extends BottonnavigatorState {
  final String name;
  final int index;

  const BottonnavigatorLoaded({required this.name, required this.index});
  @override
  List<Object> get props => [name, index];
}
