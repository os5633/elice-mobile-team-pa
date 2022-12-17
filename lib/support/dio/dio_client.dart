import 'package:dio/dio.dart';
import 'package:elice_mobile_team_pa/support/support.dart';
import 'package:flutter/foundation.dart';

const _defaultConnectTimeout = Duration.millisecondsPerMinute;
const _defaultReceiveTimeout = Duration.millisecondsPerMinute;

class DioClient {
  final Dio client = Dio();
  final String baseUrl = environment['baseUrl']!;
  final List<Interceptor>? interceptors;

  DioClient({this.interceptors}) {
    client
      ..options.baseUrl = baseUrl
      ..options.connectTimeout = _defaultConnectTimeout
      ..options.receiveTimeout = _defaultReceiveTimeout
      ..httpClientAdapter
      ..options.headers = {
        'Content-Type': 'application/json; charset=UTF-8',
      };

    client.interceptors.add(CustomInterceptors());

    if (kDebugMode) {
      client.interceptors.add(LogInterceptor(
        responseBody: true,
        error: true,
        requestHeader: true,
        responseHeader: true,
        request: true,
        requestBody: true,
      ));
    }
  }
}
