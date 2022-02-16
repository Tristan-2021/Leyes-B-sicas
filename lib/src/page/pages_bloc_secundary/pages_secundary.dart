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
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text('ERror'),
      ),
    );
  }
}

class ListScroll extends StatelessWidget {
  final List<String> indexString;
  const ListScroll({Key? key, required this.indexString}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ListView.builder(
            itemCount: indexString.length,
            itemBuilder: (_, index) => Container(
                  height: 150,
                  key: Key('key $index'),
                  margin: const EdgeInsets.all(10),
                  color: Colors.purpleAccent,
                  child: ListTile(
                    leading: const Icon(Icons.more),
                    onTap: () {
                      print('onmpres $index');
                    },
                    title: Text(indexString[index]),
                  ),
                )),
      ),
    );
  }
}
