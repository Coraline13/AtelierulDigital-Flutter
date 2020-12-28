// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of set_download_photo;

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$SetDownloadPhotoTearOff {
  const _$SetDownloadPhotoTearOff();

// ignore: unused_element
  SetDownloadPhoto$ call(String photoId) {
    return SetDownloadPhoto$(
      photoId,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $SetDownloadPhoto = _$SetDownloadPhotoTearOff();

/// @nodoc
mixin _$SetDownloadPhoto {
  String get photoId;

  $SetDownloadPhotoCopyWith<SetDownloadPhoto> get copyWith;
}

/// @nodoc
abstract class $SetDownloadPhotoCopyWith<$Res> {
  factory $SetDownloadPhotoCopyWith(SetDownloadPhoto value, $Res Function(SetDownloadPhoto) then) =
      _$SetDownloadPhotoCopyWithImpl<$Res>;

  $Res call({String photoId});
}

/// @nodoc
class _$SetDownloadPhotoCopyWithImpl<$Res> implements $SetDownloadPhotoCopyWith<$Res> {
  _$SetDownloadPhotoCopyWithImpl(this._value, this._then);

  final SetDownloadPhoto _value;

  // ignore: unused_field
  final $Res Function(SetDownloadPhoto) _then;

  @override
  $Res call({
    Object photoId = freezed,
  }) {
    return _then(_value.copyWith(
      photoId: photoId == freezed ? _value.photoId : photoId as String,
    ));
  }
}

/// @nodoc
abstract class $SetDownloadPhoto$CopyWith<$Res> implements $SetDownloadPhotoCopyWith<$Res> {
  factory $SetDownloadPhoto$CopyWith(SetDownloadPhoto$ value, $Res Function(SetDownloadPhoto$) then) =
      _$SetDownloadPhoto$CopyWithImpl<$Res>;

  @override
  $Res call({String photoId});
}

/// @nodoc
class _$SetDownloadPhoto$CopyWithImpl<$Res> extends _$SetDownloadPhotoCopyWithImpl<$Res>
    implements $SetDownloadPhoto$CopyWith<$Res> {
  _$SetDownloadPhoto$CopyWithImpl(SetDownloadPhoto$ _value, $Res Function(SetDownloadPhoto$) _then)
      : super(_value, (v) => _then(v as SetDownloadPhoto$));

  @override
  SetDownloadPhoto$ get _value => super._value as SetDownloadPhoto$;

  @override
  $Res call({
    Object photoId = freezed,
  }) {
    return _then(SetDownloadPhoto$(
      photoId == freezed ? _value.photoId : photoId as String,
    ));
  }
}

/// @nodoc
class _$SetDownloadPhoto$ implements SetDownloadPhoto$ {
  const _$SetDownloadPhoto$(this.photoId) : assert(photoId != null);

  @override
  final String photoId;

  @override
  String toString() {
    return 'SetDownloadPhoto(photoId: $photoId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SetDownloadPhoto$ &&
            (identical(other.photoId, photoId) || const DeepCollectionEquality().equals(other.photoId, photoId)));
  }

  @override
  int get hashCode => runtimeType.hashCode ^ const DeepCollectionEquality().hash(photoId);

  @override
  $SetDownloadPhoto$CopyWith<SetDownloadPhoto$> get copyWith =>
      _$SetDownloadPhoto$CopyWithImpl<SetDownloadPhoto$>(this, _$identity);
}

abstract class SetDownloadPhoto$ implements SetDownloadPhoto {
  const factory SetDownloadPhoto$(String photoId) = _$SetDownloadPhoto$;

  @override
  String get photoId;

  @override
  $SetDownloadPhoto$CopyWith<SetDownloadPhoto$> get copyWith;
}
