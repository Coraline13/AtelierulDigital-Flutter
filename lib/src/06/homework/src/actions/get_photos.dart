library get_photos;

import 'package:atelieruldigital_flutter/src/06/homework/src/models/photo.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_photos.freezed.dart';

@freezed
abstract class GetPhotos with _$GetPhotos {
  const factory GetPhotos() = GetPhotosStart;

  const factory GetPhotos.successful(List<Photo> movies) = GetPhotosSuccessful;

  const factory GetPhotos.error(dynamic error) = GetPhotosError;
}