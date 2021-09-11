import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:meta/meta.dart';
import 'package:multibloc_provider/constants/enums.dart';

part 'internet_state.dart';

class InternetCubit extends Cubit<InternetState> {
  final Connectivity connectivity;
  late StreamSubscription streamSubscription;

  InternetCubit({required this.connectivity}) : super(InternetLoading()) {
    streamSubscription = connectivity.onConnectivityChanged.listen((event) {
      if (event == ConnectivityResult.wifi) {
        emit(InternetConnected(connectionType: ConnectionType.Wifi));
      }
      if (event == ConnectivityResult.mobile) {
        emit(InternetConnected(connectionType: ConnectionType.Mobile));
      }
      if (event == ConnectivityResult.none) {
        emit(InternetDisconnected());
      }
    });
  }

  @override
  Future<void> close() {
    streamSubscription.cancel();
    return super.close();
  }
}
