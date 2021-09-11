import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connection_between_two_block/constant/enums.dart';
import 'package:connection_between_two_block/cubit/internet_cubit.dart';
import 'package:meta/meta.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  final InternetCubit internetCubit;
  late StreamSubscription streamSubscription;

  CounterCubit({required this.internetCubit})
      : super(CounterState(counter: 0)) {
    streamSubscription = internetCubit.stream.listen((event) {
      if (event is InternetConnected &&
          event.connectionType == ConnectionType.Mobile) {
        increment();
      }
      if (event is InternetConnected &&
          event.connectionType == ConnectionType.Wifi) {
        decrement();
      }
    });
  }

  @override
  Future<void> close() {
    streamSubscription.cancel();
    return super.close();
  }

  void increment() => emit(CounterState(counter: state.counter + 1));

  void decrement() => emit(CounterState(counter: state.counter - 1));
}
