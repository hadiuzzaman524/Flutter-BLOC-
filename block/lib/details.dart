import 'package:block/Bloc/calculation_bloc.dart';
import 'package:block/Bloc/calculation_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Details extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Details"),
        centerTitle: true,
      ),
      body: Container(
        child: BlocBuilder<CalculationBloc, CalculationState>(
          bloc: BlocProvider.of<CalculationBloc>(context),
          builder: (context, state) {
            if (state is Success && state.cartElement.length > 0) {
              return ListView.builder(shrinkWrap: true,itemBuilder: (ctx, index) {
                return ListTile(
                  title: Text("${state.cartElement[index].product.name}"),
                  leading: Text(
                      "${state.cartElement[index].quantity} x ${state.cartElement[index].product.price}"),
                );
              },itemCount: state.cartElement.length,);
            }
            return Center(
              child: Text("NO Item Added"),
            );
          },
        ),
      ),
    );
  }
}
