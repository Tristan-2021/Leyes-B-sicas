part of 'page2_bloc.dart';

// abstract class Page2Event extends Equatable {
//   const Page2Event();

//   @override
//   List<Object> get props => [];
// }

class Page2Event extends Equatable {
  const Page2Event();

  @override
  List<Object?> get props => [];
}

// class PageData extends Page2Event {
//   final String data;
//   final bool v;

//   const PageData(this.data, this.v);

//   @override
//   List<Object> get props => [data];
// }

class PageData extends Page2Event {
  @override
  List<Object?> get props => [];
}

class PageData2 extends Page2Event {
  final String data;
  final bool v;
  const PageData2(this.data, this.v);

  @override
  List<Object> get props => [data];
}
