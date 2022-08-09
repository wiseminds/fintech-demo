import 'dart:async';
import 'dart:io';

import 'package:example/constants/strings.dart';
import 'package:example/models/error_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ExceptionFormater {
  ErrorModel formatErrorMessage(dynamic error) {
    String? message;
    int? code;
    // if (kDebugMode) print(error is ErrorModel);
    if (kDebugMode) print(error?.runtimeType);
    switch (error.runtimeType) {
      case ErrorModel:
        message = (error as ErrorModel).message;
        // code = error.statusCode as int?;
        break;
      case SocketException:
      case HttpException:
      // case ClientException:
      case RedirectException:
      case WebSocketException:
        message =
            'Could not connect to the server please check your internet connection';
        code = 7000;
        break;
      case FormatException:
        message = 'Improperly formatted value';
        code = 7001;
        break;
      case MissingPluginException:
        message = 'Plugin not found';
        code = 7002;
        break;
      case NetworkImageLoadException:
        message = 'Could not load the image image';
        code = 7003;
        break;
      case HandshakeException:
        message = 'Could not establish secure connection with the server';
        code = 7004;
        break;
      case CertificateException:
        message = 'An error ocurred could not verify server certificate';
        code = 7005;
        break;
      case FileSystemException:
        message = 'A filesystem exception has occurred';
        code = 7006;
        break;
      case TlsException:
        message = 'SSL error occurred ${error?.message ?? ''}';
        code = 7007;
        break;
      case WebSocketException:
        message =
            'Could not connect to the server please check your internet connection';
        code = 7008;
        break;
      case TimeoutException:
        message = 'Connection Timed out please check your internet connection';
        code = 7009;
        break;
      default:
        if (error is ErrorModel) {
          message = error.message;
          // code = error.statusCode as int?;
        } else {
          message = Strings.defaultErrorMessage;
          code = 7011;
        }
    }
    // print(message);
    return ErrorModel((b) => b
      ..message = message
      ..build());
  }
}
