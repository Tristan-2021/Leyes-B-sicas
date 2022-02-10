part of 'home_cubit.dart';

enum Hometab { todos, state }

// abstract class HomeState extends Equatable {
//   const HomeState();

//   @override
//   List<Object> get props => [];
// }

// class HomeLoaded extends HomeState {}

class HomeState extends Equatable {
  final Hometab tab;

  const HomeState({this.tab = Hometab.todos});

  @override
  List<Object?> get props => [tab];
}
