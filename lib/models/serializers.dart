library serializers;

import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';

import 'error_model.dart';
import 'transaction.dart';

part 'serializers.g.dart';

@SerializersFor([
  ErrorModel,
  Transaction,
])
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
