import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:provider_state_management_flutter_app/feature/enums/service_enums.dart';
import '../../exceptions/custom_service_exceptions.dart';
import '../../log/log_manager.dart';
import '../../models/product_model.dart';
import '../dio_manager.dart';

import '../repository/fetch_network_data_repository.dart';

class FetchNetworkDataService extends FetchNetworkDataRepository {
  final Dio _dio = DioManager().dio;

  @override
  Future<Either<List<ProductModel>, CustomServiceException>> fetchAllProducts() async {
    List<ProductModel> products = [];

    try {
      await _dio.get(ServicePathes.products.rawValue).then((response) {
        final List<dynamic> results = response.data['products'];
        products = results.map((result) => ProductModel.fromJson(result)).toList();

        return products;
      });
    } catch (error) {
      // shows error log message in console
      LogManager.logger.e(error);

      return Right(CustomServiceException(message: CustomServiceExtensionTexts.somethingWentWrongListModel, statusCode: 1));
    }

    if (products.isNotEmpty) {
      return Left(products);
    } else {
      return Right(CustomServiceException(message: CustomServiceExtensionTexts.somethingWentWrongListModel, statusCode: 1));
    }
  }

  @override
  Future<Either<ProductModel, CustomServiceException>> fetchProductById(int id) async {
    ProductModel? product;
    try {
      await _dio.get('${ServicePathes.product.rawValue}$id').then((response) {
        product = ProductModel.fromJson(response.data);
        return product;
      });
    } catch (error) {
      // shows error log message in console
      LogManager.logger.e(error);

      return Right(CustomServiceException(message: CustomServiceExtensionTexts.somethingWentWrongModel, statusCode: 1));
    }

    if (product != null) {
      return Left(product!);
    } else {
      return Right(CustomServiceException(message: CustomServiceExtensionTexts.somethingWentWrongModel, statusCode: 1));
    }
  }
}
