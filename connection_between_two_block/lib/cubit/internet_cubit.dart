import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:connection_between_two_block/constant/enums.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:meta/meta.dart';
import '../constant/enums.dart';

part 'internet_state.dart';

class InternetCubit extends Cubit<InternetState> {
  final Connectivity connectivity;
  late StreamSubscription connectivityStreamSubscription;

  InternetCubit({required this.connectivity}) : super(InternetLoading()) {
    connectivityStreamSubscription =
        connectivity.onConnectivityChanged.listen((event) {

      if (event == ConnectivityResult.wifi) {
        emitInternetConnected(ConnectionType.Wifi);
      }
      if (event == ConnectivityResult.mobile) {
        emitInternetConnected(ConnectionType.Mobile);
      }
      if (event == ConnectivityResult.none) {
        emitInternetDisConnected();
      }

    });
  }

  void emitInternetConnected(ConnectionType connectionType) {
    return emit(InternetConnected(connectionType: connectionType));
  }
  void emitInternetDisConnected() {
    return emit(InternetDisconnected());
  }

  @override
  Future<void> close() {
    connectivityStreamSubscription.cancel();
    return super.close();
  }
}
