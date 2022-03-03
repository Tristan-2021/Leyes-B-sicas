import 'package:bloc/bloc.dart';

class SinpleBlocObserver extends BlocObserver {
  @override
  // ignore: avoid_renaming_method_parameters
  void onError(BlocBase bloc, Object error, StackTrace stacktrace) =>
      super.onError(bloc, error, stacktrace);

  @override
  // ignore: unnecessary_overrides
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    // ignore: avoid_print
    //  print('error :$bloc cahnge :$change');
  }

  @override
  // ignore: unnecessary_overrides
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);

    // ignore: avoid_print
    //  print('error :$bloc transition :$transition');
  }
}
