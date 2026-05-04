import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class ApiClient {
  late final Dio dio;

  ApiClient() {
    dio = Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
      ),
    );

    if (kDebugMode) {
      dio.interceptors.add(
        LogInterceptor(requestBody: true, responseBody: true),
      );
    }
  }

  Future<Response?> get(String url) async {
    try {
      return await dio.get(url);
    } on DioException catch (e) {
      debugPrint("Dio Error: ${e.message}");
      return null;
    } catch (e) {
      debugPrint("Unknown Error: $e");
      return null;
    }
  }
}