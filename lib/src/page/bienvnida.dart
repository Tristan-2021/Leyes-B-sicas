import 'package:flutter/material.dart';

import '../clean/blocs/tabs_principal/views/View_principal.dart';
import '../clean/cubits/home_cubit/view/homepage.dart';

class Bienvenida extends StatelessWidget {
  const Bienvenida({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                onPressed: () => Navigator.of(context).push(HomeView.route()),
                child: Text('Example Bloc')),
            TextButton(
                onPressed: () => Navigator.of(context).push(HomePage.route()),
                child: Text('Example Cubit')),
          ],
        ),
      ),
    );
  }
}
