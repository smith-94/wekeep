import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';

class DioService {
  final Dio _dio;

  DioService({
    int timeOut = 5,
  }) : _dio = Dio(
          BaseOptions(
            baseUrl: '',
            headers: {'Content-Type': 'application/json'},
            responseType: ResponseType.json,
            connectTimeout: Duration(seconds: timeOut),
            receiveTimeout: Duration(seconds: timeOut),
            receiveDataWhenStatusError: true,
          ),
        ) {
  }

  Future<Response> get(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    return await _dio.get(path, queryParameters: queryParameters);
  }

  Future<Response> post(
    String path, {
    Object? data,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
  }) async {
    if (headers != null) {
      _dio.options.headers.addAll(headers);
    }
    return await _dio.post(
      path,
      data: data,
      queryParameters: queryParameters,
    );
  }

  Future<Response> put(String path, dynamic data) async {
    return await _dio.put(path, data: data);
  }

  Future<Response> patch(String path, {Object? data}) async {
    return await _dio.patch(path, data: data);
  }

  Future<Response> delete(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    return await _dio.delete(path, queryParameters: queryParameters);
  }
}
