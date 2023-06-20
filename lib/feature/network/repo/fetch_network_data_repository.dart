import 'package:provider_state_management_flutter_app/feature/models/product_model.dart';

abstract class FetchNetworkDataRepository {
  Future<List<ProductModel>> fetchNetworkData();
}
