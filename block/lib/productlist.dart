import 'package:block/Bloc/calculation_bloc.dart';
import 'package:block/details.dart';
import 'package:block/dummy_product_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Products"),
        actions: [
          Stack(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (ctx) => Details(), maintainState: true),
                  );
                },
                icon: Icon(Icons.add_shopping_cart_outlined),
              ),
              Positioned(
                child: CircleAvatar(
                  radius: 10,
                  child: BlocBuilder<CalculationBloc, CalculationState>(
                    bloc: BlocProvider.of<CalculationBloc>(context),
                    builder: (context, state) {
                      if (state is Success && state.cartElement.length > 0) {
                        return Text("${state.cartElement.length}");
                      }
                      return Text("0");
                    },
                  ),
                ),
              ),
            ],
          )
        ],
      ),
      body: Container(
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title:
                        Text(DummyProductList.products[index].name.toString()),
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.teal,
                    ),
                    trailing: Container(
                      width: 110,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                              onPressed: () {
                                BlocProvider.of<CalculationBloc>(context).add(
                                    AddItemToCart(
                                        product: Product(
                                            price: DummyProductList
                                                .products[index].price,
                                            name: DummyProductList
                                                .products[index].name
                                                .toString(),
                                            image: '')));
                              },
                              icon: Icon(Icons.add)),
                          IconButton(
                              onPressed: () {
                                BlocProvider.of<CalculationBloc>(context).add(
                                    RemoveFromCart(
                                        product: Product(
                                            price: DummyProductList
                                                .products[index].price,
                                            name: DummyProductList
                                                .products[index].name
                                                .toString(),
                                            image: '')));
                              },
                              icon: Icon(Icons.minimize)),
                        ],
                      ),
                    ),
                  ),
                ),
                Divider(),
              ],
            );
          },
          itemCount: DummyProductList.products.length,
        ),
      ),
    );
  }
}
