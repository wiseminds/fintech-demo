import 'package:example/constants/api_urls.dart';
import 'package:example/core/env.dart';
import 'package:get_it/get_it.dart';
import 'api_request.dart';
import 'interceptors/header_interceptor.dart';

class ApiClient {
  static var env = GetIt.I.get<Env>();
  static ApiRequest<ResponseType, InnerType>
      baseRequest<ResponseType, InnerType>() =>
          ApiRequest<ResponseType, InnerType>(
            baseUrl: env.baseUrl,
            dataKey: 'data',
            interceptors: [
              HeaderInterceptor({
                'Authorization': 'Bearer ${env.token}',
                'Sourceappid': env.sourceappid,
                "Content-Type": "application/json",
                "Accept": "application/json",
              }),
              // AuthInterceptor(),
            ],
          );

  static ApiRequest<ResponseType, InnerType>
      testRequest<ResponseType, InnerType>() =>
          ApiRequest<ResponseType, InnerType>(
            baseUrl: '',
            dataKey: 'data',
            interceptors: [
              HeaderInterceptor({
                'Authorization': ' ',
                "Content-Type": "application/json",
                "Accept": "application/json",
              }),
              // AuthInterceptor(),
            ],
          );
}
