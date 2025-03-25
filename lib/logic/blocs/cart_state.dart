part of 'cart_bloc.dart';

abstract class CartState extends Equatable {
  final Map<Product, int> cartItems; // Track product quantity

  CartState({this.cartItems = const {}});

  @override
  List<Object> get props => [cartItems];
}

class CartInitial extends CartState {}

class CartUpdated extends CartState {
  CartUpdated({required Map<Product, int> cartItems})
      : super(cartItems: cartItems);
}
