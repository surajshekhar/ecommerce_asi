import 'package:flutter/material.dart';
import '../presentation/screens/catalogue_screen.dart';
import '../presentation/screens/cart_screen.dart';
import '../presentation/screens/cart_screen.dart';

class AppRoutes {
  static const String catalogue = '/';
  static const String cart = '/cart';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case catalogue:
        return MaterialPageRoute(builder: (_) => CatalogueScreen());
      case cart:
        return MaterialPageRoute(builder: (_) => CartScreen());
      default:
        return MaterialPageRoute(builder: (_) => CatalogueScreen());
    }
  }
}
