import 'package:dio/dio.dart';

import 'dart:developer' as developer;

class ApiInterceptors extends Interceptor {
  // Visual alignment constants
  static const String _topBorder    = "┌──────────────────────────────────────────────────────────────────┐";
  static const String _middleBorder = "├──────────────────────────────────────────────────────────────────┤";
  static const String _bottomBorder = "└──────────────────────────────────────────────────────────────────┘";
  static const String _side         = "│ ";

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    developer.log(_topBorder, name: 'NETWORK-REQ');
    developer.log('$_side🚀 REQUEST [${options.method}]', name: 'NETWORK-REQ');
    developer.log('$_side🔗 URL: ${options.uri}', name: 'NETWORK-REQ');

    if (options.headers.isNotEmpty) {
      developer.log('$_side📋 HEADERS: ${options.headers}', name: 'NETWORK-REQ');
    }
    if (options.data != null) {
      developer.log('$_side📦 DATA: ${options.data}', name: 'NETWORK-REQ');
    }

    developer.log(_bottomBorder, name: 'NETWORK-REQ');

    // Continue the request cycle
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response<dynamic> response, ResponseInterceptorHandler handler) {
    developer.log(_topBorder, name: 'NETWORK-RES');
    developer.log('$_side✅ RESPONSE [${response.statusCode} - ${response.statusMessage}]', name: 'NETWORK-RES');
    developer.log('$_side🔗 URL: ${response.requestOptions.uri}', name: 'NETWORK-RES');
    developer.log(_middleBorder, name: 'NETWORK-RES');

    // Formats the response body clearly
    developer.log('$_side📄 PAYLOAD:', name: 'NETWORK-RES');
    developer.log('$_side${response.data}', name: 'NETWORK-RES');

    developer.log(_bottomBorder, name: 'NETWORK-RES');

    // Continue the response cycle
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    developer.log(_topBorder, name: 'NETWORK-ERR');
    developer.log('$_side❌ ERROR [${err.response?.statusCode ?? 'NO CODE'} - ${err.type}]', name: 'NETWORK-ERR');
    developer.log('$_side🔗 FAILED URL: ${err.requestOptions.uri}', name: 'NETWORK-ERR');
    developer.log(_middleBorder, name: 'NETWORK-ERR');

    developer.log('$_side⚠️ MESSAGE: ${err.message}', name: 'NETWORK-ERR');
    if (err.response?.data != null) {
      developer.log('$_side📄 ERROR RESPONSE: ${err.response?.data}', name: 'NETWORK-ERR');
    }

    developer.log(_bottomBorder, name: 'NETWORK-ERR');

    // Continue the error cycle
    super.onError(err, handler);
  }
}