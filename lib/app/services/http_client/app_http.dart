// ignore_for_file: avoid_print, prefer_typing_uninitialized_variables

import 'dart:developer';

import 'package:bkopen/app/services/config_app.dart';
import 'package:dio/dio.dart';
import 'package:flutter_pretty_dio_logger/flutter_pretty_dio_logger.dart';
import 'package:get/get.dart';

import '../local_storage/local_storage.dart';

class AppHttp {
  var _dio;
  final storage = Get.find<LocalStorage>();

  AppHttp() {
    _dio = Dio();

    _dio.interceptors.add(
      PrettyDioLogger(
          requestHeader: true,
          queryParameters: true,
          requestBody: true,
          responseHeader: true,
          responseBody: true,
          error: true,
          showProcessingTime: true,
          showCUrl: true,
          canShowLog: true),
    );
  }
  AppHttp.withAuthentication() {
    _dio = Dio();
    _dio.interceptors.add(InterceptorsWrapper(
        onRequest: _onRequest, onResponse: _onResponse, onError: _onError));
    _dio.interceptors.add(
      PrettyDioLogger(
          requestHeader: true,
          queryParameters: true,
          requestBody: true,
          responseHeader: true,
          responseBody: true,
          error: true,
          showProcessingTime: true,
          showCUrl: true,
          canShowLog: true),
    );
  }
  Dio get instance => _dio;
  final kBaseUrl = ConfigApp.BASE_URL;

  _onRequest(RequestOptions request, RequestInterceptorHandler handler) async {
    var token = await storage.get('token');

    request.headers['application'] = 'bcc';
    request.headers['contentType'] = 'application/json';

    request.headers['locale'] = 'pt';
    if (token != null && token != '') {
      request.headers['Authorization'] = 'Token $token';
      request.headers['token'] = "Bearer $token";
      request.headers['Application'] = 'bbc';
      request.headers['locale'] = 'pt';
      request.baseUrl = kBaseUrl;
      request.receiveTimeout = const Duration(seconds: 500);
    }
    return handler.next(request);
  }

  _onResponse(response, ResponseInterceptorHandler handler) {
    print(response.data);
    return handler.next(response);
  }

  _onError(e, handler) async {
    // if (e.response?.statusCode == 401) {
    //   var refreshToken = await storage.get('refreshToken');
    //   try {
    //     await _dio
    //         .post("$kBaseUrlrefresh-token",
    //             data: jsonEncode({"refreshToken": refreshToken}))
    //         .then((value) async {
    //       if (value?.statusCode == 201) {
    //         e.requestOptions.headers["Authorization"] =
    //             "Bearer ${refreshToken!}";
    //         //create request with new access token
    //         final opts = Options(
    //             sendTimeout: const Duration(seconds: 10),
    //             receiveTimeout: const Duration(seconds: 10),
    //             method: e.requestOptions.method,
    //             headers: e.requestOptions.headers);
    //         final cloneReq = await _dio.request(e.requestOptions.path,
    //             options: opts,
    //             data: e.requestOptions.data,
    //             queryParameters: e.requestOptions.queryParameters);

    //         return handler.resolve(cloneReq);
    //       }
    //       return e;
    //     });
    //     return _dio;
    //   } catch (e, s) {
    return log(
      'Erro não esperado',
      error: e,
    );
  }
}
