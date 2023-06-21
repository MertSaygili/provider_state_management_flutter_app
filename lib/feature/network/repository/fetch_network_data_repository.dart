import '../../models/product_model.dart';

abstract class FetchNetworkDataRepository {
  Future<List<ProductModel>> fetchAllProducts();

  Future<ProductModel> fetchProductById(int id);
}
