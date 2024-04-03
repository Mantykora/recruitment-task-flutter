import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@singleton
class DioClient {
  final Dio dio = Dio();

  DioClient() {
    dio.options.baseUrl = 'https://financialmodelingprep.com/api/v3';
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) async {
          options.queryParameters.addAll({'apikey': ''});
          return handler.next(options); // continue
        },
      ),
    );
    dio.interceptors.add(
      LogInterceptor(
        logPrint: (o) => debugPrint(o.toString()),
      ),
    );
  }
}
