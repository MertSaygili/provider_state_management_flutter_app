// ignore_for_file: unused_field

import 'package:flutter/material.dart';

import '../../feature/models/product_model.dart';
import '../../feature/network/service/fetch_network_data_service.dart';

class FetchDataProvider with ChangeNotifier {
  final FetchNetworkDataService _fetchNetworkDataService = FetchNetworkDataService();
  List<ProductModel> _products = [];
  ProductModel _singleProduct = ProductModel();
  bool _isLoading = false;

  List<ProductModel> get products => _products;
  List<ProductModel> get singleProduct => _products;
  bool get isLoading => _isLoading;

  void changeLoading() {
    _isLoading = !_isLoading;
    notifyListeners();
  }

  Future<void> fetchAllProducts() async {
    changeLoading();
    _products = await _fetchNetworkDataService.fetchAllProducts();
    changeLoading();
  }

  Future<void> fetchProductById(int id) async {
    changeLoading();
    _singleProduct = await _fetchNetworkDataService.fetchProductById(id);
    changeLoading();
  }

  void fetchMoreData() {
    _products.addAll(_products);
    notifyListeners();
  }
}
