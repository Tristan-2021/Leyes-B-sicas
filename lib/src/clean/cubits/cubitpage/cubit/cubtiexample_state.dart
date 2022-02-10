part of 'cubtiexample_cubit.dart';

// abstract class CubtiexampleState extends Equatable {
//   const CubtiexampleState();

//   @override
//   List<Object> get props => [];
// }

// class CubtiexampleInitial extends CubtiexampleState {}

// class CubtiexampleLoaded extends CubtiexampleState {
//   final ExmappleEntity name;
//   const CubtiexampleLoaded({required this.name});
//   @override
//   List<Object> get props => [name];
// }

// class CubtiexampleError extends CubtiexampleState {
//   final String error;
//   const CubtiexampleError({required this.error});

//   @override
//   List<Object> get props => [error];
// }

enum Status { initial, loading, laoded, data, failure }

extension CubitExtions on Status {
  bool get isInitial => this == Status.initial;
  bool get isLoading => this == Status.loading;
  bool get isLoaded => this == Status.laoded;

  bool get isData => this == Status.data;
  bool get isFailure => this == Status.failure;
}

class StatesCubit extends Equatable {
  final Status statess;
  final ExmappleEntity name;

  const StatesCubit({ExmappleEntity? name, this.statess = Status.loading})
      : name = name ?? const ExmappleEntity(entero: 1, name: '');

  @override
  List<Object?> get props => [statess, name];

  StatesCubit copyWith({Status? status, ExmappleEntity? name}) =>
      StatesCubit(statess: status ?? statess, name: name ?? this.name);
}
