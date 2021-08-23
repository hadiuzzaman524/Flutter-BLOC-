import 'package:bloc_with_multi_screen/business_logic/cubit/counter_cubit.dart';
import 'package:bloc_with_multi_screen/presentation/screens/first_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterCubit>(
      create: (context) => CounterCubit(),
      child: MaterialApp(
        home: HomePage(),
      ),
    );
  }
}


