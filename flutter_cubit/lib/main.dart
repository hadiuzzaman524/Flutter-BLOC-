import 'dart:developer';

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit/counter_cubit/counter_cubit.dart';

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
        home: Scaffold(
          appBar: AppBar(
            title: Text("Cubit example"),
          ),
          body: BlocListener<CounterCubit, CounterState>(
            listener: (context, state) {

              if(state.isPlush){
                // ignore: deprecated_member_use
                Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text("Increment"),
                ));
              }else{
                // ignore: deprecated_member_use
                Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text("Decrement"),
                ));
              }
            },
            child: Home(),
          ),
        ),
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Expanded(
            child: Container(
              child: Center(
                child: Container(
                  child: BlocBuilder<CounterCubit, CounterState>(
                    builder: (context, state) {
                      return Text(
                        "${state.count}",
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FloatingActionButton(
                    onPressed: () {
                      BlocProvider.of<CounterCubit>(context).increment();

                    },
                    child: Icon(Icons.plus_one),
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      BlocProvider.of<CounterCubit>(context).decrement();
                    },
                    child: Icon(Icons.exposure_minus_1),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
