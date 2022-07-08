import 'package:datamanager/app.dart';
import 'package:datamanager/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<CounterBloc>(
        create: (context) => CounterBloc(),
      ),
    ],
    child: const DataManagerApp(),
  ));
}
