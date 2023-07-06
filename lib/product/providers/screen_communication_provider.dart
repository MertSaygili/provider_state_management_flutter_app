import 'package:flutter/material.dart';

class ScreenCommunicationProvider extends ChangeNotifier {
  String _comingDataFromScreenOne = '';
  get comingDataFromScreenOne => _comingDataFromScreenOne;

  void setComingDataFromScreenOne(String data) {
    _comingDataFromScreenOne = data;
    notifyListeners();
  }

  String comingDataFromScreenTwoToOne = '';
  get comingDataFromScreenTwo => comingDataFromScreenTwoToOne;

  void setComingDataFromScreenTwo(String data) {
    comingDataFromScreenTwoToOne = data;
    notifyListeners();
  }
}
