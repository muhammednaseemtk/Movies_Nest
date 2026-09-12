import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';

class ApiClient {
  static final ApiClient _instance = ApiClient._internal();
  factory ApiClient() => _instance;

  late final Dio dio;

  ApiClient._internal() {
    dio = Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 20),
        sendTimeout: const Duration(seconds: 10),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
          "User-Agent": "MovieNest/1.0 (Flutter; Android)",
        },
      ),
    );

    (dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () {
      final httpClient = HttpClient();
      httpClient.connectionTimeout = const Duration(seconds: 15);
      httpClient.maxConnectionsPerHost = 4;
      httpClient.badCertificateCallback = (cert, host, port) => false;
      return httpClient;
    };

    if (kDebugMode) {
      dio.interceptors.add(
        LogInterceptor(
          request: true,
          requestBody: false,
          responseBody: false,
          requestHeader: true,
          responseHeader: false,
          logPrint: (obj) => debugPrint('[Dio] $obj'),
        ),
      );
    }
  }

  Future<Response> get(String url, {CancelToken? cancelToken}) async {
    debugPrint('[API] GET $url');
    final response = await dio.get(url, cancelToken: cancelToken);
    debugPrint('[API] ${response.statusCode} $url');
    return response;
  }
}
