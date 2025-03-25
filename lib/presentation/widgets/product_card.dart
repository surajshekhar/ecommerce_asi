import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logic/blocs/cart_bloc.dart';
import '../../data/models/product_model.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.network(product.imageUrl,
              width: 100, height: 100, fit: BoxFit.cover),
          Text(product.title,
              style: const TextStyle(fontWeight: FontWeight.bold)),
          Text('₹${product.price.toStringAsFixed(2)}'),
          ElevatedButton(
            onPressed: () {
              context.read<CartBloc>().add(AddToCart(product: product));
            },
            child: const Text("Add to Cart"),
          ),
        ],
      ),
    );
  }
}
