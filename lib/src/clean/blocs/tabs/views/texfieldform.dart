import 'package:flutter/material.dart';

class TextForm extends StatelessWidget {
  const TextForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Container(
                  decoration: BoxDecoration(
                      color: Colors.purpleAccent,
                      borderRadius: BorderRadius.circular(20.0)),
                  margin: const EdgeInsets.all(16.0),
                  child: const TextField(
                    decoration: InputDecoration(
                        labelText: 'Escribe el correo',
                        border: InputBorder.none),
                  )),
              Container(
                  decoration: BoxDecoration(
                      color: Colors.purpleAccent,
                      borderRadius: BorderRadius.circular(20.0)),
                  margin: const EdgeInsets.all(16.0),
                  child: const TextField(
                    decoration: InputDecoration(
                        labelText: 'Escribe el correo',
                        border: InputBorder.none),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
