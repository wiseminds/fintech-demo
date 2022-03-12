import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:example/constants/strings.dart';
import 'package:example/data/api/api_request.dart';
import 'package:example/data/api/api_response.dart';
import 'package:example/models/error_model.dart';
import 'package:example/models/serializers.dart';
import 'package:flutter/foundation.dart';

import 'api_interceptor.dart';

class JsonInterceptor<ErrorType> implements ApiInterceptor {
  static T? _deserialize<T>(dynamic value) {
    // print('pagination $value ${value.runtimeType}');
    if (value is T) return value;
    return serializers.deserializeWith<T>(
        serializers.serializerForType(T) as Serializer<T>, value);
  }

  static BuiltList<T> _deserializeListOf<T>(Iterable value) => BuiltList(
        value.map((value) => _deserialize<T>(value)).toList(growable: false),
      );

  static dynamic _decode<T>(entity) {
    // print('pagination ${entity.runtimeType}, $T $entity}');

    /// handle case when we want to access to Map<String, dynamic> directly
    /// getResource or getMapResource
    /// Avoid dynamic or unconverted value, this could lead to several issues
    // if (entity is T) return entity;
    try {
      if (entity is List) return _deserializeListOf<T>(entity);
      return _deserialize<T>(entity);
    } catch (e) {
      if (kDebugMode) print(e);
      return null;
    }
  }

  static dynamic _getBody(dynamic body, [String? key = '']) {
    if (kDebugMode) print('get body, $key, ${body.runtimeType}');
    try {
      if (key == '') return body;
      return body[key] ?? body;
    } catch (e) {
      return body;
    }
  }

  ///convert a  json string  to a builtvalue  with type [ResultType]
  static ResultType? convertFromJson<ResultType, Item>(dynamic data,
      [String? key]) {
    try {
      if (data is String) data = json.decode(data);
      if (data is String) data = json.decode(data);
    } catch (e) {}
    if (kDebugMode) {
      print('in convert fromjson $key, ${data?.runtimeType}, $data');
    }
    return _decode<Item>(_getBody(data, key));
  }

  ///convert a value to a json encoded string
  static dynamic convertToJson(dynamic data) {
    return json.encode(_encode(data));
  }

  static dynamic _serialize<T>(dynamic value) => serializers.serializeWith(
      serializers.serializerForType(value.runtimeType)!, value);

  static List<T> _serializeListOf<T>(BuiltList value) => List.castFrom(
        value.map((value) => _serialize<T>(value)).toList(growable: false),
      );

  static dynamic _encode<T>(entity) {
    /// handle case when we want to access to Map<String, dynamic> directly
    /// getResource or getMapResource
    /// Avoid dynamic or unconverted value, this could lead to several issues
    if (entity is String) return entity;

    try {
      if (entity is BuiltList) return _serializeListOf<T>(entity);
      return _serialize<T>(entity);
    } catch (e) {
      if (kDebugMode) print(e);
      return null;
    }
  }

  @override
  ApiResponse<ResponseType, InnerType> onResponse<ResponseType, InnerType>(
      ApiResponse<ResponseType, InnerType> response) {
    var jsn = _tryDecodeJson(response.bodyString);
    // if (jsn['status'] == false) return onError(response);
    if (response.request?.nestedKey != null &&
        (response.request?.nestedKey?.isNotEmpty ?? false)) {
      jsn = _getBody(jsn, response.request?.nestedKey);
    }
    if (kDebugMode) print('in convert response ${jsn.runtimeType}, $jsn');

    final body = _decode<InnerType>(_getBody(jsn, response.request?.dataKey));
    if (kDebugMode) print(body?.toString());

    return response.copyWith(body: body);
  }

  dynamic _tryDecodeJson(dynamic data) {
    if (data is Map<String, dynamic>) return data;
    if (kDebugMode) print(data.runtimeType);
    try {
      return jsonDecode(data.toString());
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return data;
    }
  }

  @override
  ApiResponse<ResponseType, InnerType> onError<ResponseType, InnerType>(
      ApiResponse<ResponseType, InnerType> response) {
    try {
      if (kDebugMode) {
        print(
            'in convert error ${response.bodyString}, ${response.error?.runtimeType}, ${response.error?.runtimeType is ErrorModel}');
      }

      if (response.error != null) {
        return response.copyWith(error: response.error);
      }

      var json = _tryDecodeJson(response.bodyString);

      json = _getBody(json, response.request?.error?.key);
      var body = _decode<ErrorType>(json) ??
          ErrorModel((b) => b..message = Strings.defaultErrorMessage);

      if (kDebugMode) print('in convert error $body, }');
      // var error = ErrorModel((b) => b..errors = body);
      return response.copyWith(error: body);
    } catch (e) {
      var body = _decode<ErrorType>(json) ??
          ErrorModel((b) => b..message = Strings.defaultErrorMessage);
      return response.copyWith(error: body);
    }
  }

  @override
  ApiRequest<ResponseType, InnerType> onRequest<ResponseType, InnerType>(
      ApiRequest<ResponseType, InnerType> request) {
    return request;
  }
}
