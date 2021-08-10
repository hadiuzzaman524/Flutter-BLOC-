part of 'calculation_bloc.dart';

@immutable
abstract class CalculationEvent {}

class AddItemToCart extends CalculationEvent {
  final Product product;

  AddItemToCart({required this.product});
}

class RemoveFromCart extends CalculationEvent {
  final Product product;

  RemoveFromCart({required this.product});
}
