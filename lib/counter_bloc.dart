import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_web/counter_event.dart';
import 'package:flutter_web/counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState(value: 0));

  @override
  Stream<CounterState> mapEventToState(CounterEvent event) async* {
    if (event is IncrementEvent) {
      yield CounterState(value: state.value + 1);
    } else if (event is DecrementEvent) {
      yield CounterState(value: state.value - 1);
    }
  }
}
