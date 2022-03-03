import 'package:flutter/material.dart';

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
