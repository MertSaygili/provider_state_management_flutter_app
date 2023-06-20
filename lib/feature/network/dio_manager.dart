import 'package:dio/dio.dart';
import 'package:provider_state_management_flutter_app/feature/constants/strings.dart';

class DioManager {
  late final Dio dio;

  DioManager() {
    final BaseOptions baseOptions = BaseOptions(baseUrl: Strings.baseUrl);
    dio = Dio(baseOptions);
  }
}
