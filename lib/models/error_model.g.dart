// GENERATED CODE - DO NOT MODIFY BY HAND

part of error_model;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ErrorModel> _$errorModelSerializer = new _$ErrorModelSerializer();

class _$ErrorModelSerializer implements StructuredSerializer<ErrorModel> {
  @override
  final Iterable<Type> types = const [ErrorModel, _$ErrorModel];
  @override
  final String wireName = 'ErrorModel';

  @override
  Iterable<Object?> serialize(Serializers serializers, ErrorModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'message',
      serializers.serialize(object.message,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.code;
    if (value != null) {
      result
        ..add('code')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.status;
    if (value != null) {
      result
        ..add('status')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  ErrorModel deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ErrorModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'code':
          result.code = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'message':
          result.message = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$ErrorModel extends ErrorModel {
  @override
  final String? code;
  @override
  final String message;
  @override
  final String? status;

  factory _$ErrorModel([void Function(ErrorModelBuilder)? updates]) =>
      (new ErrorModelBuilder()..update(updates)).build();

  _$ErrorModel._({this.code, required this.message, this.status}) : super._() {
    BuiltValueNullFieldError.checkNotNull(message, 'ErrorModel', 'message');
  }

  @override
  ErrorModel rebuild(void Function(ErrorModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ErrorModelBuilder toBuilder() => new ErrorModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ErrorModel &&
        code == other.code &&
        message == other.message &&
        status == other.status;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, code.hashCode), message.hashCode), status.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ErrorModel')
          ..add('code', code)
          ..add('message', message)
          ..add('status', status))
        .toString();
  }
}

class ErrorModelBuilder implements Builder<ErrorModel, ErrorModelBuilder> {
  _$ErrorModel? _$v;

  String? _code;
  String? get code => _$this._code;
  set code(String? code) => _$this._code = code;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  String? _status;
  String? get status => _$this._status;
  set status(String? status) => _$this._status = status;

  ErrorModelBuilder();

  ErrorModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _code = $v.code;
      _message = $v.message;
      _status = $v.status;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ErrorModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ErrorModel;
  }

  @override
  void update(void Function(ErrorModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ErrorModel build() {
    final _$result = _$v ??
        new _$ErrorModel._(
            code: code,
            message: BuiltValueNullFieldError.checkNotNull(
                message, 'ErrorModel', 'message'),
            status: status);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
