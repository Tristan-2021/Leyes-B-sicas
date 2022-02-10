part of 'randomcat_bloc.dart';

abstract class RandomcatState extends Equatable {
  const RandomcatState();
  
  @override
  List<Object> get props => [];
}

class RandomcatInitial extends RandomcatState {}
