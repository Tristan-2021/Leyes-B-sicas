import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../clean/cubits/cubitpage/cubit/cubtiexample_cubit.dart';
import '../../clean/model/exmappleentity.dart';

class Pagecubit extends StatelessWidget {
  const Pagecubit({Key? key}) : super(key: key);

  static Route<void> route() {
    return MaterialPageRoute(
        fullscreenDialog: true, builder: (context) => const Pagecubit());
  }

  @override
  Widget build(BuildContext context) {
    List<String> indexString = [
      '1',
      '2',
      '3',
      '4',
      '5',
    ];
    int entero = 0;
    Key key = Key('valor_container');
    Key keyTap = Key('tap_onmpres');

    // ignore: avoid_print
    return Scaffold(
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            key: keyTap,
            onPressed: () async {
              var k = BlocProvider.of<CubtiexampleCubit>(context)..name;

              //k.name = k.valor.toString();
              // indexString[k.valor];
              context.read<CubtiexampleCubit>().getDataBack(
                  //const StatesCubit(
                  // statess: Status.laoded,
                  //name: ExmappleEntity(name: '2', entero: 1))
                  );
            },
            icon: const Icon(Icons.add),
          ),
          IconButton(
            key: key,
            onPressed: () {
              print('imprimir desde la llamada de tester');
              // var k = BlocProvider.of<CubtiexampleCubit>(context)..name;

              //k.name = k.valor.toString();
              // indexString[k.valor];
              context.read<CubtiexampleCubit>().getDataBack(
                  //const StatesCubit(
                  // statess: Status.laoded, name: ExmappleEntity(name: '1') )
                  );
            },
            icon: const Icon(Icons.reset_tv),
          )
        ],
      ),
      appBar: AppBar(),
      drawer: Container(
        width: 200,
        height: double.infinity,
        color: Colors.redAccent,
        child: const Text('vacio'),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              child: Text('letras'),
              height: 100,
            ),
            Expanded(
              child: BlocBuilder<CubtiexampleCubit, StatesCubit>(
                builder: (context, state) {
                  // if (state is StatesCubit) {
                  //   return Center(
                  //     child: Text(state.error),
                  //   );
                  // } else if (state is CubtiexampleInitial) {
                  //   return const Center(
                  //     child: CircularProgressIndicator(),
                  //   );
                  // } else if (state is CubtiexampleLoaded) {
                  //   return Center(
                  //     child: Container(
                  //         height: 100.0,
                  //         color: Colors.blue.withOpacity(0.8),
                  //         child: FittedBox(child: Text(state.name.name!))),
                  //   );
                  // }
                  switch (state.statess) {
                    case Status.initial:
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    case Status.laoded:
                      print('casaaaaaa');
                      return Center(
                        key: key,
                        child: Container(
                            height: 100.0,
                            color: Colors.blue.withOpacity(0.8),
                            child: FittedBox(child: Text(state.name.name!))),
                      );
                    case Status.failure:
                      print('failure');

                      return const Text('error');

                    default:
                  }

                  return const Text('VAcio');
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
