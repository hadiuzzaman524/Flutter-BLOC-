import 'package:bloc/bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:meta/meta.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> with HydratedMixin {
  CounterCubit() : super(CounterState(count: 0, isPlus: false));

  void increment() => emit(CounterState(count: state.count + 1, isPlus: true));

  void decrement() => emit(CounterState(count: state.count - 1, isPlus: false));

  @override
  CounterState? fromJson(Map<String, dynamic> json) {
    return CounterState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(CounterState state) {
    return state.toMap();
  }
}
