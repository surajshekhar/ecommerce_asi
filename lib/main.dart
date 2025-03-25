import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/core/api_service.dart';
import '/data/repository/product_repository.dart';
import '/logic/blocs/product_bloc.dart';
import '/logic/blocs/cart_bloc.dart';
import '/config/app_routes.dart';

void main() {
  final productRepository = ProductRepository(apiService: ApiService());

  runApp(MyApp(productRepository: productRepository));
}

class MyApp extends StatelessWidget {
  final ProductRepository productRepository;

  const MyApp({Key? key, required this.productRepository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) =>
                ProductBloc(productRepository: productRepository)
                  ..add(LoadProducts(page: 0))),
        BlocProvider(create: (context) => CartBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Shopping Cart',
        initialRoute: AppRoutes.catalogue,
        onGenerateRoute: AppRoutes.generateRoute,
      ),
    );
  }
}
