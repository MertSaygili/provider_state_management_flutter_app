import 'package:flutter/material.dart';
import 'package:provider_state_management_flutter_app/feature/models/product_model.dart';
import 'package:provider_state_management_flutter_app/feature/network/service/fetch_network_data_service.dart';

class FetchDataProvider with ChangeNotifier {
  final FetchNetworkDataService _fetchNetworkDataService = FetchNetworkDataService();
  List<ProductModel> _products = [];
  bool _isLoading = false;

  List<ProductModel> get products => _products;
  bool get isLoading => _isLoading;

  void changeLoading() {
    _isLoading = !_isLoading;
    notifyListeners();
  }

  Future<void> fetchData() async {
    changeLoading();
    _products = await _fetchNetworkDataService.fetchNetworkData();
    changeLoading();
  }

  void fetchMoreData() {
    _products.addAll(_products);
    notifyListeners();
  }
}
