import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:multibloc_provider/bloc/internet_cubit.dart';
import 'package:multibloc_provider/constants/enums.dart';

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
        increment();
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
