import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testflutter/src/page/pages_bloc_principal/pageview/view0.dart';
import 'package:testflutter/src/page/pages_bloc_principal/pageview/view1.dart';
import '../../clean/blocs/tabs/views/texfieldform.dart';
import '../../clean/cubits/cubit/cubitprincipal/home_cubit.dart';
import '../../clean/blocs/tabs/bloc/bottonnavigator_bloc.dart';
import '../pages_bloc_secundary/pages_secundary.dart';
import '../../views/botton_navigator.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selectedTab = context.select((HomeCubit cubit) => cubit.state.tab);
    return Scaffold(
      body: IndexedStack(
        index: selectedTab.index,
        children: const [
          ViewPage0(),
          ViewPage1(
            index: 0,
            name: 'vacio',
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        key: const Key('homeView_addTodo_floatingActionButton'),
        onPressed: () => Navigator.of(context).push(MaterialPageRoute<void>(
          builder: (BuildContext context) => const ViewPage2(),
        )),
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _HomeTabButton(
              groupValue: selectedTab,
              value: Hometab.todos,
              icon: const Icon(Icons.list_rounded),
            ),
            _HomeTabButton(
              groupValue: selectedTab,
              value: Hometab.state,
              icon: const Icon(Icons.show_chart_rounded),
            ),
          ],
        ),
      ),
    );
  }
}

class _HomeTabButton extends StatelessWidget {
  const _HomeTabButton({
    Key? key,
    required this.groupValue,
    required this.value,
    required this.icon,
  }) : super(key: key);

  final Hometab groupValue;
  final Hometab value;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => context.read<HomeCubit>().sedEmitState(value),
      iconSize: 32,
      color:
          groupValue != value ? null : Theme.of(context).colorScheme.secondary,
      icon: icon,
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({
    Key? key,
  }) : super(key: key);

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