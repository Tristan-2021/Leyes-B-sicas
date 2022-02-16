import 'package:flutter/material.dart';
import 'package:testflutter/src/clean/helpers/validator/validator.dart';

class TextForm extends StatefulWidget {
  const TextForm({Key? key}) : super(key: key);

  @override
  State<TextForm> createState() => _TextFormState();
}

class _TextFormState extends State<TextForm> {
  String _valorName = '';
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Container(
                    decoration: BoxDecoration(
                        color: Colors.purpleAccent,
                        borderRadius: BorderRadius.circular(20.0)),
                    margin: const EdgeInsets.all(16.0),
                    child: TextFormField(
                      validator: (value) => validatenombre(value),
                      onSaved: (value) {
                        _valorName = value ?? '';
                        print('sadVAe $value');
                      },
                      decoration: const InputDecoration(
                          labelText: 'Escribe el correo',
                          border: InputBorder.none),
                    )),
                Container(
                    decoration: BoxDecoration(
                        color: Colors.purpleAccent,
                        borderRadius: BorderRadius.circular(20.0)),
                    margin: const EdgeInsets.all(16.0),
                    child: TextFormField(
                      onChanged: (String value) {},
                      decoration: const InputDecoration(
                          labelText: 'Escribe el correo',
                          border: InputBorder.none),
                    )),
                TextButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        validator(context, formKey);
                      }
                    },
                    child: const Icon(Icons.save))
              ],
            ),
          ),
        ),
      ),
    );
  }

  validator(context, GlobalKey<FormState> formKey) {
    final form = formKey.currentState;

    if (form != null && form.validate()) {
      form.save();
      FocusScope.of(context).unfocus();
      print('valro que deeb msotrarse   $_valorName');
    }
  }
}
