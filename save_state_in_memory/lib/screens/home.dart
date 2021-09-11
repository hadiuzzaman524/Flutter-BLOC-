import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:save_state_in_memory/cubits/counter_cubit.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Save State in Memory"),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.green,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<CounterCubit, CounterState>(
              builder: (context, state) {
                return Text(
                  "${state.count}",
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                  ),
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).increment();
                  },
                  heroTag: "button1",
                  child: Icon(Icons.add),
                ),
                FloatingActionButton(
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).decrement();
                  },
                  heroTag: "button2",
                  child: Icon(Icons.minimize),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
