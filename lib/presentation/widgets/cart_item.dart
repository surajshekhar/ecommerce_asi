import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/product_model.dart';
import '../../logic/blocs/cart_bloc.dart';

class CartItem extends StatelessWidget {
  final Product product;

  const CartItem({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.network(product.imageUrl, width: 50),
        title: Text(product.title),
        subtitle: Text('₹${product.discountedPrice.toStringAsFixed(2)}'),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(Icons.remove),
              onPressed: () {
                context.read<CartBloc>().add(RemoveFromCart(product: product));
              },
            ),
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                context.read<CartBloc>().add(AddToCart(product: product));
              },
            ),
          ],
        ),
      ),
    );
  }
}
