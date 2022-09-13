import 'dart:async';

import 'package:dio/dio.dart';
import 'package:get/state_manager.dart';
import 'package:weather_app/infrastructure/core/rest_api/index.dart';

typedef _DoRequestAction<T> = Future<Response>? Function();

abstract class RestAPIClient extends GetxService {
  late Dio _dio;

  @override
  void onInit() {
    final options = BaseOptions(baseUrl: BASE_URL);
    _dio = Dio(options);
    _init();
    super.onInit();
  }

  void _init() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          return handler.next(options);
        },
        onError: (error, handler) {
          return handler.next(error);
        },
      ),
    );
  }

  Future<Options> _getOptions({ResponseType responseType});

  Future<T?> download<T>({
    required String urlPath,
    dynamic savePath,
  }) =>
      _doRequest<T>(() async {
        return _dio.download(
          urlPath,
          savePath,
          options: await _getOptions(),
        );
      });

  Future<T?> load<T>({
    required String resource,
    Map<String, dynamic>? queryParameters,
    Function(int, int)? onReceiveProgress,
  }) =>
      _doRequest<T>(() async {
        return _dio.get<T>(
          '${_dio.options.baseUrl}/$resource',
          options: await _getOptions(),
          queryParameters: queryParameters,
          onReceiveProgress: onReceiveProgress,
        );
      });

  Future<ResponseBody?> load2({
    required String resource,
    Map<String, dynamic>? queryParameters,
    Function(int, int)? onReceiveProgress,
    Options? options,
  }) =>
      _doRequest<ResponseBody>(() async {
        return _dio.get<ResponseBody>(
          '${_dio.options.baseUrl}/$resource',
          options: await _getOptions(responseType: ResponseType.stream),
          queryParameters: queryParameters,
          onReceiveProgress: onReceiveProgress,
        );
      });

  Future<T?> create<T>({
    required String resource,
    dynamic data,
  }) =>
      _doRequest(
        () async => _dio.post<T>('${_dio.options.baseUrl}/$resource',
            data: data, options: await _getOptions()),
      );
  Future<Map<String, dynamic>?> replace({
    required String resource,
    dynamic data,
  }) =>
      _doRequest(
        () async => _dio.put<Map<String, dynamic>>(
          '${_dio.options.baseUrl}/$resource',
          data: data,
          options: await _getOptions(),
        ),
      );

  Future<Map<String, dynamic>?> update({
    required String resource,
    dynamic data,
  }) =>
      _doRequest(
        () async => _dio.patch<Map<String, dynamic>>(
          '${_dio.options.baseUrl}/$resource',
          data: data,
          options: await _getOptions(),
        ),
      );

  Future<void> delete({
    required String resource,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? data,
  }) async {
    await _doRequest(
      () async => _dio.delete(
        '${_dio.options.baseUrl}/$resource',
        data: data,
        queryParameters: queryParameters,
        options: await _getOptions(),
      ),
    );
  }

  Future<T?> _doRequest<T>(_DoRequestAction request) async {
    final response = await request();
    final statusCode = response!.statusCode ?? 0;
    if (statusCode >= 200 && statusCode < 300) {
      // Success response
      return response.data as T?;
    } else {
      return null;
    }
  }
}

class PublicAccessRestClient extends RestAPIClient {
  @override
  Future<Options> _getOptions({ResponseType? responseType}) async {
    return Options(
      contentType: "application/json; charset=UTF-8",
      responseType: responseType,
    );
  }
}


