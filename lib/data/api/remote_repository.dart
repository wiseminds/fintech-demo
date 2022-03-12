import 'dart:async';

import 'package:example/constants/strings.dart';
import 'package:example/core/utils/exception_formater.dart';
import 'package:example/models/error_model.dart';
import 'package:flutter/foundation.dart';

import 'api_request.dart';
import 'api_response.dart';
import 'data_repository.dart';

///  for Remote Repository
class RemoteRepository with ExceptionFormater {
  /// makes a network request
  Future<ApiResponse<ResultType, Item>> handleRequest<ResultType, Item>(
      NetworkCall<ApiResponse<ResultType, Item>> networkCall,
      {int timeout = 50,
      bool retry = false}) async {
    ApiResponse<ResultType, Item> response;
    try {
      response = await networkCall().timeout(Duration(seconds: timeout),
          onTimeout: () {
        throw (TimeoutException('Connection timed out'));
      });
    } catch (e) {
      if (kDebugMode) print(' error in request ');
      if (kDebugMode) print(e.toString());
      response = ApiResponse<ResultType, Item>(
          bodyString: null,
          request: ApiRequest.dummy(),
          error: (e is ErrorModel) ? e : formatErrorMessage(e),
          headers: {},
          statusCode: 200);
    }
    return response;
  }

  ApiResponse<ResultType, Item> handleError<ResultType, Item>(
      ApiResponse<ResultType, Item> response) {
    ErrorModel? error;
    if (response.error is ErrorModel) {
      error = (response.error as ErrorModel);
    } else {
      error = formatErrorMessage(response.error);
    }

    error = error; // ??
    // ErrorModel((b) => b
    //   ..statusCode = response.statusCode ?? 400
    //   ..message = Strings.DEFAULT_ERROR_MESSAGE);
    if ((response.statusCode ?? 600) > 490) {
      error = ErrorModel((b) => b
        ..code = response.statusCode.toString()
        ..message = Strings.defaultErrorMessage);
    }
    return response.copyWith(error: error);
  }
}
