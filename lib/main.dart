import 'package:datamanager/app.dart';
import 'package:datamanager/bloc/bundle/bundle_bloc.dart';
import 'package:datamanager/bloc/world/world_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<BundleBloc>(
        create: (context) => BundleBloc(),
      ),
      BlocProvider<WorldBloc>(
        create: (context) => WorldBloc(),
      ),
    ],
    child: const DataManagerApp(),
  ));
}
