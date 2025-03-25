import 'package:dio/dio.dart';
import '../data/models/product_model.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<List<Product>> fetchProducts(int page) async {
    try {
      final response = await _dio.get(
        'https://dummyjson.com/products?limit=10&skip=${page * 10}',
      );
      if (response.statusCode == 200) {
        return (response.data['products'] as List)
            .map((json) => Product.fromJson(json))
            .toList();
      }
    } catch (e) {
      print('Error fetching products: $e');
    }
    return [];
  }
}
