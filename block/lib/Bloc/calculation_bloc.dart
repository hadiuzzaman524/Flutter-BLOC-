import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:block/cart_item.dart';
import 'package:block/dummy_product_list.dart';
import 'package:meta/meta.dart';

part 'calculation_event.dart';

part 'calculation_state.dart';

class CalculationBloc extends Bloc<CalculationEvent, CalculationState> {
  List<CartItem> _cartItem = List.unmodifiable([]);

  CalculationBloc() : super(CalculationInitial());

  @override
  Stream<CalculationState> mapEventToState(
    CalculationEvent event,
  ) async* {
    if (event is AddItemToCart) {
      yield Waiting();
      Future.delayed(Duration(seconds: 3));
      List<CartItem> temp = List<CartItem>.from(_cartItem);

      int index = 0;
      bool flag = false;

      for (int i = 0; i < _cartItem.length; i++) {
        if (_cartItem[i].product.name == event.product.name) {
          flag = true;
          index = i;
          break;
        }
      }

      if (flag) {
        temp[index] = CartItem(
          product: temp[index].product,
          quantity: temp[index].quantity + 1,
        );
      } else {
        temp.add(CartItem(product: event.product, quantity: 1));
      }
      _cartItem = List.unmodifiable(temp);

      yield Success(cartElement: _cartItem);
    } else if (event is RemoveFromCart) {
      List<CartItem> temp = List<CartItem>.from(_cartItem);
      int index = 0;
      bool flag = false;

      for (int i = 0; i < _cartItem.length; i++) {
        if (temp[i].product.name == event.product.name) {
          flag = true;
          index = i;
          break;
        }
      }
      if (flag) {
        if (temp[index].quantity == 1) {
          temp.removeAt(index);
        } else if (temp[index].quantity == 0) {
          print("No item");
        } else {
          temp[index] = CartItem(
              product: temp[index].product, quantity: temp[index].quantity - 1);
        }

        _cartItem=List.unmodifiable(temp);
        yield Success(cartElement: _cartItem);
      }
    }
  }
}
