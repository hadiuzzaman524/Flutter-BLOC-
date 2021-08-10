import 'package:block/Bloc/calculation_bloc.dart';
import 'package:block/productlist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CalculationBloc>(
      create: (context) => CalculationBloc(),
      child: MaterialApp(
        theme: ThemeData(primaryColor: Colors.purple),
        debugShowCheckedModeBanner: false,
        home: ProductList(),
      ),
    );
  }
}
