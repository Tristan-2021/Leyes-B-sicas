import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:testflutter/src/clean/cubits/cubit/cubitprincipal/home_cubit.dart';

import '../mocks/mocks.dart';

extension PumpApp on WidgetTester {
  Future<void> pumpApp(Widget widget, {HomeCubit? cubit}) async {
    return pumpWidget(BlocProvider<HomeCubit>(
      lazy: false,
      create: (_) => cubit ?? FakeIndexCubit(),
      child: MaterialApp(
        home: widget,
      ),
    ));
  }
}
