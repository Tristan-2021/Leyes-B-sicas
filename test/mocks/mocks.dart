import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:testflutter/src/clean/blocs/page2/bloc/page2_bloc.dart';
import 'package:testflutter/src/clean/blocs/tabs/bloc/bottonnavigator_bloc.dart';
import 'package:testflutter/src/clean/cubits/cubit/cubitprincipal/home_cubit.dart';
import 'package:testflutter/src/clean/cubits/cubitpage/cubit/cubtiexample_cubit.dart';
import 'package:testflutter/src/clean/model/exmappleentity.dart';
import 'package:testflutter/src/clean/service/service_example.dart';

class MockPage2Bloc extends MockBloc<Page2Event, Page2States>
    implements Page2Bloc {}

class FakePage2Evetns extends Fake implements Page2Event {}

class Fakepage2state extends Fake implements Page2States {}

//Home PageView

class MockBottonBloc
    extends MockBloc<BottonnavigatorEvent, BottonnavigatorState>
    implements BottonnavigatorBloc {}

class FakeBottonEvents extends Fake implements BottonnavigatorEvent {}

class FakeBottonState extends Fake implements BottonnavigatorState {}

class FakeIndexCubit extends MockCubit<HomeState> implements HomeCubit {}

//pageCubit

// para las pruevas de CubtiExampel cambiar
// class FakecubitPage extends MockCubit<CubtiexampleState>
//     implements CubtiexampleCubit {}
class FakecubitPage extends MockCubit<StatesCubit>
    implements CubtiexampleCubit {}

class MockService extends Mock implements ServiceExmple {}

class MockEntity extends Mock implements ExmappleEntity {}
