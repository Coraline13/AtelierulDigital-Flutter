library photo;

import 'package:atelieruldigital_flutter/src/06/homework/src/models/serializers.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'photo.g.dart';

abstract class Photo implements Built<Photo, PhotoBuilder> {
  factory Photo([void Function(PhotoBuilder) updates]) = _$Photo;

  factory Photo.fromJson(dynamic json) {
    return serializers.deserializeWith(serializer, json);
  }

  Photo._();

  int get id;

  int get width;

  int get height;

  String get description;

  @BuiltValueField(wireName: 'alt_description')
  String get altDescription;

  Map<String, String> get urls;

  static Serializer<Photo> get serializer => _$photoSerializer;
}
