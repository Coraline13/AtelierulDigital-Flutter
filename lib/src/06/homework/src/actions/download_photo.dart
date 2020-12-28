library download_photo;

import 'package:freezed_annotation/freezed_annotation.dart';

part 'download_photo.freezed.dart';

@freezed
abstract class DownloadPhoto with _$DownloadPhoto {
  const factory DownloadPhoto() = DownloadPhotoStart;

  const factory DownloadPhoto.successful(String downloadUrl) = DownloadPhotoSuccessful;

  const factory DownloadPhoto.error(dynamic error) = DownloadPhotoError;
}
