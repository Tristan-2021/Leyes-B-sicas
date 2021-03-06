import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/bottonnavigator_bloc.dart';

class CustonNavigatrBart extends StatelessWidget {
  const CustonNavigatrBart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottonnavigatorBloc, BottonnavigatorState>(
      builder: (context, state) {
        if (state is BottonnavigatorLoaded) {
          return BottomNavigationBar(
            currentIndex: state.index,
            elevation: 0,
            onTap: (index) {
              context.read<BottonnavigatorBloc>().add(TabChangeEvent(index));
            },
            items: const [
              BottomNavigationBarItem(
                  label: 'Alarma', icon: Icon(Icons.access_alarm_rounded)),
              BottomNavigationBarItem(
                  label: 'Otra cosa', icon: Icon(Icons.ac_unit)),
              BottomNavigationBarItem(
                  label: 'Readme', icon: Icon(Icons.read_more))
            ],
          );
        }
        return const SizedBox();
      },
    );
  }
}
