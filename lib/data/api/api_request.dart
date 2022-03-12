import 'package:flutter/foundation.dart';

import 'api_methods.dart';
import 'interceptors/api_interceptor.dart';

class ApiRequest<ResponseType, InnerType> {
  final String? method;
  final String path;
  final int timeout;
  final String dataKey;
  final String? nestedKey;
  final String baseUrl;
  final bool hasPagination;
  final Map<String, dynamic>? body;
  final Map<String, String> headers;
  final Map<String, dynamic> query;
  final List<ApiInterceptor> interceptors;
  final List<Extra>? extra;
  final ErrorDescription? error;
  final bool isMultipart;

  ApiRequest(
      {this.hasPagination = false,
      this.isMultipart = false,
      this.extra,
      this.headers = const {},
      this.query = const {},
      this.error,
      this.method = ApiMethods.get,
      this.dataKey = '',
      this.interceptors = const [],
      this.path = '',
      this.nestedKey,
      required this.baseUrl,
      this.timeout = 50,
      this.body});

  factory ApiRequest.dummy() => ApiRequest<ResponseType, InnerType>(
      hasPagination: false,
      headers: {},
      query: {},
      method: ApiMethods.get,
      dataKey: '',
      isMultipart: false,
      path: '',
      baseUrl: '');

  ApiRequest<ResponseType, InnerType> copyWith(
          {String? method,
          String? path,
          String? dataKey,
          String? baseUrl,
          bool? hasPagination,
          String? nestedKey,
          List<Extra>? extra,
          int? timeout,
          bool? isMultipart,
          Map<String, dynamic>? body,
          Map<String, String>? headers,
          List<ApiInterceptor>? interceptors,
          ErrorDescription? error,
          Map<String, dynamic>? query}) =>
      ApiRequest<ResponseType, InnerType>(
          hasPagination: hasPagination ?? this.hasPagination,
          headers: headers ?? this.headers,
          query: query ?? this.query,
          method: method ?? this.method,
          dataKey: dataKey ?? this.dataKey,
          isMultipart: isMultipart ?? this.isMultipart,
          path: path ?? this.path,
          nestedKey: nestedKey ?? this.nestedKey,
          extra: extra ?? this.extra,
          error: error ?? this.error,
          timeout: timeout ?? this.timeout,
          baseUrl: baseUrl ?? this.baseUrl,
          interceptors: [...?interceptors, ...this.interceptors],
          body: body ?? this.body);

  ApiRequest<ResponseType, InnerType> get build {
    if (kDebugMode) {
      print('Building request: $isMultipart, url: $path');
    }
    var request = this;
    for (var e in request.interceptors) {
      request = e.onRequest(request);
    }
    return request;
  }

  String get buildQuery {
    String q = '';
    query.forEach((key, value) {
      if (value != null) q += '$key=$value&';
    });
    // print('Building query $q, $query');
    return q;
  }
}

class ErrorDescription {
  final String key;

  ErrorDescription({this.key = ''});
}

class Extra<T> {
  final String key;

  Extra(this.key);
}
