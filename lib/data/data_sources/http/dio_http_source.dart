import 'package:charter_flutter/data/data_sources/http/http_source.dart';
import 'package:charter_flutter/data/exceptions/http_exception.dart';
import 'package:dio/dio.dart';

import '../../../configs.dart';
import '../../interceptors/dio_logs_interceptor.dart';

class DioHttpService implements HttpSource {
  late final Dio dio;

  DioHttpService({
    Dio? dioOverride,
    bool enableCaching = true,
  }) {
    dio = dioOverride ?? Dio(baseOptions);
    dio.interceptors.add(LogsInterceptor());
  }

  @override
  String get baseUrl => Configs.apiBaseUrl;

  @override
  Map<String, String> headers = {
    'accept': 'application/json',
    'content-type': 'application/json'
  };

  BaseOptions get baseOptions => BaseOptions(
        baseUrl: baseUrl,
        headers: headers,
      );

  Future<void> handleExceptions(Function function) async {
    try {
      return await function();
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectTimeout) {
        throw HttpException(
          title: "Connection Timeout Exception",
          message: "Connection has been timeout",
          statusCode: e.response?.statusCode,
        );
      }

      if (e.type == DioErrorType.response) {
        String errorMessage = "Something went wrong";
        final responseData = (e.response?.data as Map?);

        if (responseData?.containsKey("token") ?? false) {
          if (responseData!["token"] == "Invalid User") {
            errorMessage = "Please login again";
          }
        }

        if ((responseData?.containsKey("error_flag") ?? false)) {
          if (responseData!["error_flag"] != "SUCCESS") {
            errorMessage = responseData["error_flag"];
          }
        }

        throw HttpException(
          title: "Http Error!",
          message: errorMessage,
          statusCode: e.response?.statusCode,
        );
      }
    } catch (e) {
      throw HttpException(
          title: "Http Error!", message: "Something went wrong");
    }
  }

  @override
  Future<dynamic> get(String endpoint,
      {Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headers,
      CancelToken? cancelToken}) {
    return handleExceptions(() async {
      final response = await dio.get(
        endpoint,
        queryParameters: queryParameters,
        options: Options(headers: headers),
        cancelToken: cancelToken,
      );
      if (response.data == null || response.statusCode != 200) {
        throw HttpException(
          title: 'Http Error!',
          statusCode: response.statusCode,
          message: response.statusMessage,
        );
      }

      return response.data;
    });
  }

  @override
  Future<dynamic> post(String endpoint,
      {Map<String, dynamic>? queryParameters,
      dynamic data,
      Map<String, dynamic>? headers}) async {
    return handleExceptions(() async {
      Response response = await dio.post(
        endpoint,
        queryParameters: queryParameters,
        data: data,
        options: Options(headers: headers),
      );
      if (response.data == null || response.statusCode != 200) {
        throw HttpException(
          title: 'Http Error!',
          statusCode: response.statusCode,
          message: response.statusMessage,
        );
      }
      return response.data;
    });
  }

  @override
  Future delete() {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future put() {
    // TODO: implement put
    throw UnimplementedError();
  }
}
