import 'package:flutter/material.dart';

class ViewPage2 extends StatelessWidget {
  const ViewPage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        backgroundColor: Colors.blue,
        body: const Center(child: Text('vacío'))
        //     Center(
        //   child: BlocConsumer<Page2Bloc, Page2States>(
        //     listener: (context, state) {
        //       if (state.state.isEmptyName) {
        //         print('debe estar quí en el listeber');
        //         context.read<Page2Bloc>().add(PageData());
        //         ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        //           content: Text('datasssssssssssssssssssssssss'),
        //         ));
        //       }
        //     },
        //     builder: (context, state) {
        //       if (state.state.isfailure) {
        //         return const Center(child: Text('Error'));
        //       } else if (state.state.isInitial) {
        //         return Text('iniciando ${state.state.isLoading}');
        //       } else if (state.state.isLoading) {
        //         return const Text(' color: Colors.red,');
        //       } else if (state.state.isSucces) {
        //         return const Text('ëxitosssssssssssssssssssss');
        //       }
        //       return const Text('no hay anda ');
        //     },
        //   ),
        // ),
        );
  }
}

class Error extends StatelessWidget {
  const Error({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Error '),
      ),
    );
  }
}
