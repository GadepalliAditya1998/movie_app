import 'package:dio/dio.dart';

import '../exceptions/exceptions.dart';

class HttpService {
  late Dio dio;

  HttpService() {
    this.dio = Dio(this._options);
    this.dio.interceptors.add(QueuedInterceptorsWrapper(
      onResponse: (response, handler) {
        if (response.data is List) {
          response.data = List.from(response.data).map((e) => Map.from(e)).toList();
        }

        handler.next(response);
      },
    ));
  }

  Future<dynamic> get(String path, {Map<String, dynamic>? queryParams}) async {
    if (queryParams != null && queryParams.isNotEmpty) {
      this.dio.options.queryParameters.addAll(queryParams);
    }

    try {
      var response = await this.dio.get(path, queryParameters: queryParams);
      return response.data;
    } on DioError catch (e) {
      this._handleException(e);
    }
  }

  Future<dynamic> post(String path, dynamic body, {Map<String, dynamic>? queryParams}) async {
    if (queryParams != null && queryParams.isNotEmpty) {
      this.dio.options.queryParameters.addAll(queryParams);
    }

    try {
      var response = await this.dio.post(path, queryParameters: queryParams, data: body);
      return response.data;
    } on DioError catch (e) {
      this._handleException(e);
    }
  }

  Future<dynamic> put(String path, dynamic body, {Map<String, dynamic>? queryParams}) async {
    if (queryParams != null && queryParams.isNotEmpty) {
      this.dio.options.queryParameters.addAll(queryParams);
    }

    try {
      var response = await this.dio.put(path, queryParameters: queryParams, data: body);
      return response.data;
    } on DioError catch (e) {
      this._handleException(e);
    }
  }

  Future<dynamic> delete(String path, {Map<String, dynamic>? queryParams}) async {
    if (queryParams != null && queryParams.isNotEmpty) {
      this.dio.options.queryParameters.addAll(queryParams);
    }

    try {
      var response = await this.dio.delete(path, queryParameters: queryParams);
      return response.data;
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
        baseUrl: 'https://api-nodejs-todolist.herokuapp.com/',
        contentType: Headers.jsonContentType,
        headers: {
          'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2MWY1MDEwZDAwOGZkMjAwMTczMGFkYWIiLCJpYXQiOjE2NDUxMjQ1Mjd9.BVxC1nsgZBhxL0FOTXT-nkZilkXw2ue-YGM9FjSCA0A',
        },
      );
}
