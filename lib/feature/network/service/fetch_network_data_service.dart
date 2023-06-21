import 'package:dio/dio.dart';
import '../../models/product_model.dart';
import '../dio_manager.dart';

import '../repository/fetch_network_data_repository.dart';

class FetchNetworkDataService extends FetchNetworkDataRepository {
  final Dio _dio = DioManager().dio;

  @override
  Future<List<ProductModel>> fetchNetworkData() async {
    List<ProductModel> _products = [];
    await _dio.get('/products').then((response) {
      final data = response.data;
      final List<dynamic> results = data['products'];
      for (final result in results) {
        _products.add(ProductModel.fromJson(result));
      }
      return _products;
    }).catchError((error) {
      print(error);
      return _products;
    });
    return _products;
  }
}
