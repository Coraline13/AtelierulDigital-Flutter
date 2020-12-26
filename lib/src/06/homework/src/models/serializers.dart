library serializers;

import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:atelieruldigital_flutter/src/06/homework/src/models/photo.dart';

part 'serializers.g.dart';

@SerializersFor(<Type>[
  Photo,
])
Serializers serializers = (_$serializers.toBuilder() //
      ..addPlugin(StandardJsonPlugin()))
    .build();
