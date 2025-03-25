import '../models/product_model.dart';
import '../../core/api_service.dart';

class ProductRepository {
  final ApiService apiService;

  ProductRepository({required this.apiService});

  Future<List<Product>> getProducts(int page) async {
    return await apiService.fetchProducts(page);
  }
}
