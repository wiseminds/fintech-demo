library error_model;

import 'dart:convert';

 
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'serializers.dart';

part 'error_model.g.dart';

abstract class ErrorModel implements Built<ErrorModel, ErrorModelBuilder> {
  ErrorModel._();

  factory ErrorModel([updates(ErrorModelBuilder b)]) = _$ErrorModel;

  @BuiltValueField(wireName: 'code')
  String? get code;
  @BuiltValueField(wireName: 'message')
  String get message;
  @BuiltValueField(wireName: 'status')
  String? get status;
  String toJson() {
    return json.encode(serializers.serializeWith(ErrorModel.serializer, this));
  }

  static ErrorModel? fromJson(String jsonString) {
    return serializers.deserializeWith(
        ErrorModel.serializer, json.decode(jsonString));
  }

  static Serializer<ErrorModel> get serializer => _$errorModelSerializer;
}
