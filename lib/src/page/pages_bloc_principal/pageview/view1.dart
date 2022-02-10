import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../clean/blocs/tabs/bloc/bottonnavigator_bloc.dart';
import '../../pages_bloc_secundary/page_cubit.dart';

class ViewPagePrincipal extends StatelessWidget {
  const ViewPagePrincipal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class ViewPage1 extends StatelessWidget {
  final String name;
  final int index;
  const ViewPage1({Key? key, required this.index, required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('ViePag1');

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        key: const Key('keyTap'),
        onPressed: () =>
            // Navigator.pushNamed(context, 'pagecubit');
            Navigator.of(context).push(Pagecubit.route()),
        child: const Icon(Icons.more),
      ),
      backgroundColor: Colors.purple,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              name,
              style: const TextStyle(color: Colors.white, fontSize: 25.0),
            ),
            Text(
              '$index',
              style: const TextStyle(color: Colors.white, fontSize: 25.0),
            ),
            Container(
              color: Colors.amberAccent,
              child: TextButton(
                  onPressed: () {
                    context.read<BottonnavigatorBloc>().add(
                        const TabChangeEventS(
                            1, 'Aplasatrd de Nuevo otra vez'));
                  },
                  child: const Text('Aplasta')),
            )
          ],
        ),
      ),
    );
  }
}
