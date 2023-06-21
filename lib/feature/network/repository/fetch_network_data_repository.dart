import '../../models/product_model.dart';

abstract class FetchNetworkDataRepository {
  Future<List<ProductModel>> fetchNetworkData();
}
