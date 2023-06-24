import 'package:dartz/dartz.dart';
import 'package:provider_state_management_flutter_app/feature/exceptions/custom_service_exceptions.dart';

import '../../models/product_model.dart';

abstract class FetchNetworkDataRepository {
  Future<Either<List<ProductModel>, CustomServiceException>> fetchAllProducts();

  Future<Either<ProductModel, CustomServiceException>> fetchProductById(int id);
}
