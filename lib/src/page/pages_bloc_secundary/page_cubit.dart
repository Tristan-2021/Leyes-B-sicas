import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../clean/cubits/cubitpage/cubit/cubtiexample_cubit.dart';

class Pagecubit extends StatelessWidget {
  final List<String> indexString;
  const Pagecubit({Key? key, required this.indexString}) : super(key: key);

  static Route<void> route() {
    List<String> indexString = [
      '0 Dato',
      '1 Dato',
      '2 Dato',
      '3 Dato',
      '4 Dato',
      '5 Dato',
    ];
    return MaterialPageRoute(
        fullscreenDialog: true,
        builder: (context) => const Pagecubit(
              indexString: [],
            ));
  }

  @override
  Widget build(BuildContext context) {
    int entero = 0;
    Key key = Key('valor_container');
    Key keyTap = Key('tap_onmpres');

    // ignore: avoid_print
    return Scaffold(
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
            SizedBox(
              child: PageView.builder(
                  onPageChanged: (index) {
                    // var l = BlocProvider.of<CubtiexampleCubit>(context);
                    // l.name = index.toString();
                    // // context.read<CubtiexampleCubit>().getDataBack();
                    // print('datos $index');
                  },
                  controller: PageController(
                      //initialPage: 1,
                      viewportFraction: 0.60),
                  itemCount: indexString.length,
                  itemBuilder: (_, index) => GestureDetector(
                        key: Key('key $index'),
                        onTap: () {
                          print('valor del index $index');
                          //context.read<CubtiexampleCubit>().getDataBack();
                        },
                        child: Container(
                          margin: const EdgeInsets.all(5.0),
                          padding: const EdgeInsets.all(5.0),
                          color: Colors.blueAccent,
                          child: Text(indexString[index]),
                        ),
                      )),
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
