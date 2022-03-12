import "dart:async";

import 'package:example/core/utils/exception_formater.dart';

import 'api_request.dart';
import 'api_response.dart';

abstract class ApiProvider with ExceptionFormater {
  Future<ApiResponse<ResponseType, InnerType>> send<ResponseType, InnerType>(
      ApiRequest<ResponseType, InnerType> request);
}
