import 'package:dio/dio.dart';
import 'package:provider_state_management_flutter_app/feature/log/log_manager.dart';
import '../../models/product_model.dart';
import '../dio_manager.dart';

import '../repository/fetch_network_data_repository.dart';

class FetchNetworkDataService extends FetchNetworkDataRepository {
  final Dio _dio = DioManager().dio;

  @override
  Future<List<ProductModel>> fetchAllProducts() async {
    List<ProductModel> products = [];
    await _dio.get('/products').then((response) {
      final data = response.data;
      final List<dynamic> results = data['products'];
      products = results.map((result) => ProductModel.fromJson(result)).toList();

      return products;
    }).catchError((error) {
      // shows error log message in console
      LogManager.logger.e(error);

      return products;
    });

    return products;
  }

  @override
  Future<ProductModel> fetchProductById(int id) async {
    await _dio.get('/products/$id').then((response) {
      final data = response.data;
      final ProductModel product = ProductModel.fromJson(data);

      return product;
    }).catchError((error) {
      // shows error log message in console
      LogManager.logger.e(error);

      return ProductModel();
    });

    return ProductModel();
  }
}
