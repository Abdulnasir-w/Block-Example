import 'package:bloc/bloc.dart';
import 'package:bloc_example/Counter/block/counter_event.dart';
import 'package:bloc_example/Counter/block/counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState()) {
    on<IncremnetCounter>(_increment);
    on<DecrementCounter>(_decrement);
  }

  void _increment(IncremnetCounter event, Emitter<CounterState> emit) {
    emit(state.copyWith(counter: state.counter + 1));
  }

  void _decrement(DecrementCounter event, Emitter<CounterState> emit) {
    emit(state.copyWith(counter: state.counter - 1));
  }
}
