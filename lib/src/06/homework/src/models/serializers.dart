library serializers;

import 'package:atelieruldigital_flutter/src/06/homework/src/models/photo.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/standard_json_plugin.dart';
// import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';

part 'serializers.g.dart';

@SerializersFor(<Type>[
  Photo,
])
Serializers serializers = (_$serializers.toBuilder() //
      ..addPlugin(StandardJsonPlugin()))
    .build();
