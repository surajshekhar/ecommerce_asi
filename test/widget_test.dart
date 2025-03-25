import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:assignment_ecom/core/api_service.dart';
import 'package:assignment_ecom/data/repository/product_repository.dart';
import 'package:assignment_ecom/logic/blocs/product_bloc.dart';
import 'package:assignment_ecom/logic/blocs/cart_bloc.dart';
import 'package:assignment_ecom/main.dart';

void main() {
  testWidgets('MyApp loads successfully', (WidgetTester tester) async {
    // Set up dependencies
    final apiService = ApiService();
    final productRepository = ProductRepository(apiService: apiService);

    await tester.pumpWidget(
      MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                ProductBloc(productRepository: productRepository)
                  ..add(LoadProducts(page: 0)),
          ),
          BlocProvider(create: (context) => CartBloc()),
        ],
        child: MyApp(productRepository: productRepository), // ✅ Fixed
      ),
    );

    // Verify that the Catalogue Screen is displayed
    expect(find.byType(MaterialApp), findsOneWidget);
    expect(find.text('Products'), findsOneWidget);
  });
}
