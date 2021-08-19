import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState(count: 0));

  void increment()=> emit(CounterState(count:state.count+1, isPlush: true));
  void decrement()=>emit(CounterState(count: state.count-1, isPlush: false));

}
