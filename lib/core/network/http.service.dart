import 'package:dio/dio.dart';

import '../exceptions/exceptions.dart';

class HttpService {
  late Dio dio;

  HttpService() {
    this.dio = Dio(this._options);
  }

  Future<dynamic> get(String path, {Map<String, dynamic>? queryParams}) async {
    if (queryParams != null && queryParams.isNotEmpty) {
      this.dio.options.queryParameters.addAll(queryParams);
    }

    try {
      return this.dio.get(path, queryParameters: queryParams);
    } on DioError catch (e) {
      this._handleException(e);
    }
  }

  Future<dynamic> post(String path, dynamic body, {Map<String, dynamic>? queryParams}) async {
    if (queryParams != null && queryParams.isNotEmpty) {
      this.dio.options.queryParameters.addAll(queryParams);
    }

    try {
      return this.dio.post(path, queryParameters: queryParams, data: body);
    } on DioError catch (e) {
      this._handleException(e);
    }
  }

  Future<dynamic> put(String path, dynamic body, {Map<String, dynamic>? queryParams}) async {
    if (queryParams != null && queryParams.isNotEmpty) {
      this.dio.options.queryParameters.addAll(queryParams);
    }

    try {
      return this.dio.put(path, queryParameters: queryParams, data: body);
    } on DioError catch (e) {
      this._handleException(e);
    }
  }

  Future<dynamic> delete(String path, {Map<String, dynamic>? queryParams}) async {
    if (queryParams != null && queryParams.isNotEmpty) {
      this.dio.options.queryParameters.addAll(queryParams);
    }

    try {
      return this.dio.delete(path, queryParameters: queryParams);
    } on DioError catch (e) {
      this._handleException(e);
    }
  }

  void _handleException(DioError error) {
    if (error.type == DioErrorType.response) {
      switch (error.response!.statusCode) {
        case 400:
          throw BadRequestException();
        case 401:
          throw UnAuthorizedException();
        case 403:
          throw ForbiddenException();
        case 500:
          throw InternalServerException();
      }
    } else if (error.type == DioErrorType.other) {
      throw NoInternetException();
    }
  }

  BaseOptions get _options => BaseOptions(
        baseUrl: 'https://www.omdbapi.com/',
        contentType: Headers.jsonContentType,
        queryParameters: {'apikey': '45af497c'},
      );
}
