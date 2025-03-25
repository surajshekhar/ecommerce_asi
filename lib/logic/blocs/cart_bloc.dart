import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../data/models/product_model.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartUpdated(cartItems: {})) {
    on<AddToCart>((event, emit) {
      final updatedCart = Map<Product, int>.from(state.cartItems);

      if (updatedCart.containsKey(event.product)) {
        updatedCart[event.product] =
            updatedCart[event.product]! + 1; // Increase quantity
      } else {
        updatedCart[event.product] = 1; // Add first instance
      }

      emit(CartUpdated(cartItems: updatedCart));
    });

    on<RemoveFromCart>((event, emit) {
      final updatedCart = Map<Product, int>.from(state.cartItems);

      if (updatedCart.containsKey(event.product)) {
        if (updatedCart[event.product]! > 1) {
          updatedCart[event.product] =
              updatedCart[event.product]! - 1; // Decrease quantity
        } else {
          updatedCart.remove(event.product); // Remove if quantity reaches 0
        }
      }

      emit(CartUpdated(cartItems: updatedCart));
    });
  }
}
