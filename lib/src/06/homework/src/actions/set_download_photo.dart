library set_download_photo;

import 'package:freezed_annotation/freezed_annotation.dart';

part 'set_download_photo.freezed.dart';

@freezed
abstract class SetDownloadPhoto with _$SetDownloadPhoto {
  const factory SetDownloadPhoto(String photoId) = SetDownloadPhoto$;
}
