import 'package:datamanager/bloc/bundle/bundle_state.dart';
import 'package:datamanager/data/bundle.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BundleBloc extends Cubit<BundleState> {
  BundleBloc() : super(BundleState.initial());

  bool nameInUse(String name) => state.bundles.any((e) => e.name == name);

  Future<void> createBundle(String name) async {
    emit(state.copyWith(
      bundles: [
        ...state.bundles,
        Bundle(name),
      ],
    ));
  }
}
