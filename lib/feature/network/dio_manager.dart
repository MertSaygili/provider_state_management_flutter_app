import 'package:dio/dio.dart';

import '../constants/strings.dart';

class DioManager {
  late final Dio dio;

  DioManager() {
    final BaseOptions baseOptions = BaseOptions(baseUrl: Strings.baseUrl);
    dio = Dio(baseOptions);
  }
}
