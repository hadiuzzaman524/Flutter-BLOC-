part of 'calculation_bloc.dart';

@immutable
abstract class CalculationState {}

class CalculationInitial extends CalculationState {}

class Waiting extends CalculationState{}

class Success extends CalculationState{
  final List<CartItem> cartElement;
  Success({required this.cartElement});
}
