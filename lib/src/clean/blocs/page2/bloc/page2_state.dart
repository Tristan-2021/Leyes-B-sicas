part of 'page2_bloc.dart';

enum Page2Status { initial, loading, succes, failure, empthyName }

extension Page2SattusExtension on Page2Status {
  bool get isInitial => this == Page2Status.initial;
  bool get isLoading => this == Page2Status.loading;
  bool get isSucces => this == Page2Status.succes;
  bool get isfailure => this == Page2Status.failure;
  bool get isEmptyName => this == Page2Status.empthyName;
}

class Page2States extends Equatable {
  final Cat cat;
  final bool v;
  final Page2Status state;

  const Page2States(
      {Cat? cat, this.v = false, this.state = Page2Status.initial})
      : cat = cat ?? Cat.empty;

  @override
  List<Object?> get props => [cat, v, state];

  Page2States copyWith({
    Cat? cat,
    bool? v,
    Page2Status? state,
  }) {
    return Page2States(
        cat: cat ?? this.cat, v: v ?? this.v, state: state ?? this.state);
  }
} 


// abstract class Page2State extends Equatable {
//   const Page2State();

//   @override
//   List<Object> get props => [];
// }

// class Page2Initial extends Page2State {}

// class Page2Loaded extends Page2State {
//   final String name;
//   final bool v;
//   const Page2Loaded(this.name, this.v);
//   @override
//   List<Object> get props => [name];
// }

// class Page2Error extends Page2State {
//   final String error;
//   const Page2Error(this.error);
//   @override
//   List<Object> get props => [error];
// }
