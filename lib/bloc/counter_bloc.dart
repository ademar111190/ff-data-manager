import 'package:datamanager/bloc/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Cubit<CounterState> {
  CounterBloc() : super(CounterState.initial());

  void increment() => emit(state.copyWith(
        count: state.count + 1,
      ));
}
