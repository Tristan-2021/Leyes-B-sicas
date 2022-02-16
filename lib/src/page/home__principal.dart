import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testflutter/src/clean/cubits/cubitpage/cubit/cubtiexample_cubit.dart';
import 'package:testflutter/src/clean/service/service_example.dart';
import '../clean/cubits/cubit/cubitprincipal/home_cubit.dart';
import '../clean/blocs/page2/bloc/page2_bloc.dart';
import '../clean/blocs/tabs/bloc/bottonnavigator_bloc.dart';
import '../clean/reposity/reposity.dart';
import '../clean/service/service.dart';

import 'pages_bloc_principal/homepage.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
            create: (context) => CatReposiy(catService: CatService())),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => BottonnavigatorBloc(),
          ),
          BlocProvider(
              create: (context) => Page2Bloc(
                    reposervice: context.read<CatReposiy>(),
                  )..add(PageData())),
          BlocProvider(create: (_) => HomeCubit()),
          BlocProvider(
              create: (_) => CubtiexampleCubit(
                  serviceExmple: const ServiceExmple(name: 'vacioossssssss'))
                ..getDataBack(
                    //const StatesCubit(
                    //statess: Status.initial, name: ExmappleEntity())
                    )),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const HomeView(),
          // routes: <String, WidgetBuilder>{
          //   '/': (BuildContext context) => const HomeView(),
          //   'Valors': (BuildContext context) => const ViewPage2(),
          //   'pagecubit': (BuildContext context) => const Pagecubit(),
          // },
        ),
      ),
    );
  }
}
