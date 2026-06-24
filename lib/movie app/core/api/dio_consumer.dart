import 'package:dio/dio.dart';

import '../errors/exceptions.dart';
import 'api_consumer.dart';

class DioConsumer extends ApiConsumer {
  final Dio dio = Dio();

  DioConsumer() {
    // dio.options.baseUrl = ApiEndpoints.baseUrl;
    // dio.interceptors.add(ApiInterceptors());
    // dio.interceptors.add(LogInterceptor(error: true, requestBody: true));
    // dio.interceptors.add(
    //   PrettyDioLogger(
    //     requestHeader: true,
    //     request: true,
    //     requestBody: true,
    //     responseBody: true,
    //     responseHeader: false,
    //     error: true,
    //     compact: true, // Keeps it tight and readable
    //     maxWidth: 90,  // Adjusts the width of the box boundaries
    //   ),
    // );
  }

  // @override
  // Future delete(
  //   String path, {
  //   Object? data,
  //   Map<String, dynamic>? queryParameters,
  // }) async {
  //   try {
  //     final response = await dio.delete(
  //       path,
  //       data: data,
  //       queryParameters: queryParameters,
  //     );
  //     return response.data;
  //   } on DioException catch (e) {
  //     handleDioExceptions(e);
  //   }
  // }

  @override
  Future get(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await dio.get(
        path,
        data: data,
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }

  //
  // @override
  // Future patch(
  //   String path, {
  //   Object? data,
  //   Map<String, dynamic>? queryParameters,
  // }) async {
  //   try {
  //     final response = await dio.patch(
  //       path,
  //       data: data,
  //       queryParameters: queryParameters,
  //     );
  //     return response.data;
  //   } on DioException catch (e) {
  //     handleDioExceptions(e);
  //   }
  // }
  //
  // @override
  // Future post(
  //   String path, {
  //   dynamic data,
  //   Map<String, String>? headers,
  //   Map<String, dynamic>? queryParameters,
  // }) async {
  //   try {
  //     final response = await dio.post(
  //       path,
  //       data: data,
  //       options: Options(
  //         headers: headers
  //       ),
  //       queryParameters: queryParameters,
  //     );
  //     return response.data;
  //   } on DioException catch (e) {
  //     handleDioExceptions(e);
  //   }
  // }
}
