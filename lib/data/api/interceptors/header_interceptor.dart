import 'package:example/data/api/api_request.dart';
import 'package:flutter/foundation.dart';

import 'api_interceptor.dart';

/// an interceptor to add headers to a request before initiating it
class HeaderInterceptor extends ApiInterceptor {
  final Map<String, String> headers;

  HeaderInterceptor(this.headers);
  @override
  ApiRequest<ResponseType, InnerType> onRequest<ResponseType, InnerType>(
      ApiRequest<ResponseType, InnerType> request) {
    var header = <String, String>{};
    header.addAll(headers);
    header.addAll(request.headers);

    return request.copyWith(headers: header);
  }
}
