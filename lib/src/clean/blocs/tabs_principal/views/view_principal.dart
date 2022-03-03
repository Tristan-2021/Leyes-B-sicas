// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testflutter/src/clean/blocs/tabs_principal/bloc/bottonnavigator_bloc.dart';
import 'package:testflutter/src/clean/blocs/tabs_principal/views/botton_navigator.dart';
import 'package:testflutter/src/clean/blocs/tabs_principal/views/tabs_secundary_pages/list_scroll.dart';
import 'package:testflutter/src/clean/blocs/tabs_principal/views/tabs_secundary_pages/otro_cosa.dart';
import 'package:testflutter/src/clean/blocs/tabs_principal/views/tabs_secundary_pages/texfieldform.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    Key? key,
  }) : super(key: key);

  static Route<void> route() {
    return MaterialPageRoute(
        fullscreenDialog: true, builder: (context) => const HomeView());
  }

  @override
  Widget build(BuildContext context) {
    List<String> indexString = [
      '1 Dato',
      '2 Dato',
      '3 Dato',
      '4 Dato',
      '5 Dato',
    ];
    return Scaffold(
      body: BlocBuilder<BottonnavigatorBloc, BottonnavigatorState>(
        builder: (context, state) {
          if (state is BottonnavigatorLoaded) {
            switch (state.index) {
              case 0:
                return const TextForm();

              case 1:
                return ViewPage1(
                  index: state.index,
                  name: state.name,
                );

              case 2:
                return ListScroll(
                  indexString: indexString,
                );

              default:
                return const Error();
            }
          } else {
            return const SizedBox();
          }
        },
      ),
      bottomNavigationBar: const CustonNavigatrBart(),
    );
  }
}

class Error extends StatelessWidget {
  const Error({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text('ERror'),
      ),
    );
  }
}





//  if (state is Page2Initial) {
//             context.read<Page2Bloc>().add(const PageData('index'));

//             return const Center(
//                 child: Text(
//               'cargando.......',
//               style: TextStyle(fontSize: 20.0),
//             ));
//           } else if (state is Page2Loaded) {
//             if (state.name == 'Aplasatrd de Nuevo otra vez') {
//               return const Center(child: Text('VAcíoooooooooo'));
//             }
//             return Center(
//                 child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text('Página 2 ${state.name}'),
//                 Container(
//                   color: Colors.amberAccent,
//                   child: TextButton(
//                       onPressed: () {
//                         context.read<Page2Bloc>().add(const PageData1(
//                             'Aplasatrd de Nuevo otra vez', true));
//                       },
//                       child: const Text('Aplasta')),
//                 )
//               ],
//             ));
//           } else if (state is Page2Error) {
//             return Text(state.error);
//           }
//           return const Text('state.error');