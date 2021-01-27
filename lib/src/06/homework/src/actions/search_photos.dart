library search_photos;

import 'package:atelieruldigital_flutter/src/06/homework/src/models/photo.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_photos.freezed.dart';

@freezed
abstract class SearchPhotos with _$SearchPhotos {
  const factory SearchPhotos(String query) = SearchPhotosStart;

  const factory SearchPhotos.successful(List<Photo> photos) = SearchPhotosSuccessful;

  const factory SearchPhotos.error(dynamic error) = SearchPhotosError;
}
