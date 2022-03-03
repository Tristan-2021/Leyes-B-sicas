part of 'bottonnavigator_bloc.dart';

abstract class BottonnavigatorEvent extends Equatable {
  const BottonnavigatorEvent();

  @override
  List<Object> get props => [];
}

class TabChangeEvent extends BottonnavigatorEvent {
  final int newIndex;
  const TabChangeEvent(this.newIndex);

  @override
  List<Object> get props => [newIndex];
}

class TabChangeEventS extends BottonnavigatorEvent {
  final int newIndex;
  final String name;

  const TabChangeEventS(this.newIndex, this.name);

  @override
  List<Object> get props => [newIndex, name];
}
