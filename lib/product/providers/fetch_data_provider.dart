// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:provider_state_management_flutter_app/feature/log/log_manager.dart';

import '../../feature/models/product_model.dart';
import '../../feature/network/service/fetch_network_data_service.dart';

class FetchDataProvider with ChangeNotifier {
  final FetchNetworkDataService _fetchNetworkDataService = FetchNetworkDataService();
  List<ProductModel> _products = [];
  ProductModel _singleProduct = ProductModel();
  bool _isLoading = false;
  bool _errorAvailable = false;

  List<ProductModel> get products => _products;
  List<ProductModel> get singleProduct => _products;
  bool get isLoading => _isLoading;
  bool get errorAvailable => _errorAvailable;

  void changeLoading() {
    _isLoading = !_isLoading;
    notifyListeners();
  }

  Future<void> fetchAllProducts() async {
    changeLoading();
    final result = (await _fetchNetworkDataService.fetchAllProducts());
    result.fold((products) {
      _products = products;
      _errorAvailable = false;
    }, (error) {
      _errorAvailable = true;
      LogManager.logger.e(error.message);
    });
    changeLoading();
  }

  Future<void> fetchProductById(int id) async {
    changeLoading();
    final result = (await _fetchNetworkDataService.fetchProductById(id));
    result.fold((product) {
      _singleProduct = product;
      _errorAvailable = false;
    }, (error) {
      _errorAvailable = true;
      LogManager.logger.e(error.message);
    });
    changeLoading();
  }
}
