import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'constants.dart';

class ApiClient {
  late Dio _dio;

  ApiClient() {
    // auth headers
    final box = Hive.box(Constants.authStorageKey);
    final token = box.get('token');

    var options = BaseOptions(
        baseUrl: Constants.apiUrl,
        connectTimeout: const Duration(minutes: 3),
        receiveTimeout: const Duration(seconds: 30),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        });

    _dio = Dio(options);
  }

  Dio get instance => _dio;
}
