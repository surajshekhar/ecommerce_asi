import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logic/blocs/product_bloc.dart';
import '../../logic/blocs/cart_bloc.dart';
import '../widgets/product_card.dart';

class CatalogueScreen extends StatelessWidget {
  const CatalogueScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final crossAxisCount = screenWidth > 600 ? 3 : 2; // Responsive columns
    final aspectRatio = screenWidth > 600 ? 0.9 : 0.75; // Adjust ratio

    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Catalogue',
            style: TextStyle(color: Colors.black),
          ),
        ),
        backgroundColor: Colors.pink[50],
        actions: [
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_cart, color: Colors.black),
                onPressed: () {
                  Navigator.pushNamed(context, '/cart');
                },
              ),
              Positioned(
                right: 5,
                top: 5,
                child: BlocBuilder<CartBloc, CartState>(
                  builder: (context, state) {
                    if (state.cartItems.isNotEmpty) {
                      int totalCount = state.cartItems.values
                          .fold(0, (sum, quantity) => sum + quantity);
                      return CircleAvatar(
                        radius: 10,
                        backgroundColor: Colors.red,
                        child: Text(
                          totalCount.toString(),
                          style: const TextStyle(
                              fontSize: 10, color: Colors.white),
                        ),
                      );
                    }
                    return const SizedBox.shrink();
                  },
                ),
              ),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search products...',
                border: OutlineInputBorder(),
                prefixIcon: const Icon(Icons.search),
              ),
              onChanged: (query) {
                context.read<ProductBloc>().add(SearchProducts(query: query));
              },
            ),
          ),
          // Product List
          Flexible(
            child: BlocBuilder<ProductBloc, ProductState>(
              builder: (context, state) {
                if (state is ProductLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is ProductLoaded) {
                  return GridView.builder(
                    shrinkWrap: true, // Prevents unnecessary expansion
                    physics: const BouncingScrollPhysics(), // Smooth scrolling
                    padding: const EdgeInsets.all(8),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                      childAspectRatio: aspectRatio,
                    ),
                    itemCount: state.filteredProducts.length,
                    itemBuilder: (context, index) {
                      return ProductCard(
                          product: state.filteredProducts[index]);
                    },
                  );
                } else {
                  return const Center(child: Text('Failed to load products'));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
