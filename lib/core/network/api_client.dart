import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class ApiClient {
  late final Dio dio;

  ApiClient() {
    dio = Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 60),
        receiveTimeout: const Duration(seconds: 60),
        sendTimeout: const Duration(seconds: 60),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
        },
      ),
    );

    if (kDebugMode) {
      dio.interceptors.add(
        LogInterceptor(
          request: false,
          requestBody: false,
          responseBody: false,
          requestHeader: false,
          responseHeader: false,
        ),
      );
    }
  }

  Future<Response?> get(String url) async {
    int retryCount = 0;
    while (retryCount < 3) {
      try {
        final response = await dio.get(url);
        return response;
      } on DioException catch (e) {
        retryCount++;
        debugPrint("Retry $retryCount : ${e.message}");
        if (e.error is SocketException) {
          await Future.delayed(const Duration(seconds: 2));
          continue;
        }
        if (e.type == DioExceptionType.connectionTimeout ||
            e.type == DioExceptionType.receiveTimeout) {
          await Future.delayed(const Duration(seconds: 2));
          continue;
        }
        return null;
      } catch (e) {
        debugPrint("Unknown Error : $e");
        return null;
      }
    }
    return null;
  }
}
