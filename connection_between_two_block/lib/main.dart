import 'package:connection_between_two_block/cubit/internet_cubit.dart';
import 'package:connection_between_two_block/homescreen.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/counter_cubit.dart';

void main() {
  runApp(MyApp(
    connectivity: Connectivity(),
  ));
}

class MyApp extends StatelessWidget {
  final Connectivity connectivity;

  const MyApp({Key? key, required this.connectivity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiBlocProvider(providers: [
        BlocProvider(
            create: (context) => InternetCubit(connectivity: connectivity)),
        BlocProvider(
            create: (context) => CounterCubit(
                internetCubit: BlocProvider.of<InternetCubit>(context))),
      ], child: HomePage()),
    );
  }
}
