// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of download_photo;

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$DownloadPhotoTearOff {
  const _$DownloadPhotoTearOff();

// ignore: unused_element
  DownloadPhotoStart call() {
    return const DownloadPhotoStart();
  }

// ignore: unused_element
  DownloadPhotoSuccessful successful(String downloadUrl) {
    return DownloadPhotoSuccessful(
      downloadUrl,
    );
  }

// ignore: unused_element
  DownloadPhotoError error(dynamic error) {
    return DownloadPhotoError(
      error,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $DownloadPhoto = _$DownloadPhotoTearOff();

/// @nodoc
mixin _$DownloadPhoto {
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(), {
    @required Result successful(String downloadUrl),
    @required Result error(dynamic error),
  });

  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(), {
    Result successful(String downloadUrl),
    Result error(dynamic error),
    @required Result orElse(),
  });

  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(DownloadPhotoStart value), {
    @required Result successful(DownloadPhotoSuccessful value),
    @required Result error(DownloadPhotoError value),
  });

  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(DownloadPhotoStart value), {
    Result successful(DownloadPhotoSuccessful value),
    Result error(DownloadPhotoError value),
    @required Result orElse(),
  });
}

/// @nodoc
abstract class $DownloadPhotoCopyWith<$Res> {
  factory $DownloadPhotoCopyWith(DownloadPhoto value, $Res Function(DownloadPhoto) then) =
      _$DownloadPhotoCopyWithImpl<$Res>;
}

/// @nodoc
class _$DownloadPhotoCopyWithImpl<$Res> implements $DownloadPhotoCopyWith<$Res> {
  _$DownloadPhotoCopyWithImpl(this._value, this._then);

  final DownloadPhoto _value;

  // ignore: unused_field
  final $Res Function(DownloadPhoto) _then;
}

/// @nodoc
abstract class $DownloadPhotoStartCopyWith<$Res> {
  factory $DownloadPhotoStartCopyWith(DownloadPhotoStart value, $Res Function(DownloadPhotoStart) then) =
      _$DownloadPhotoStartCopyWithImpl<$Res>;
}

/// @nodoc
class _$DownloadPhotoStartCopyWithImpl<$Res> extends _$DownloadPhotoCopyWithImpl<$Res>
    implements $DownloadPhotoStartCopyWith<$Res> {
  _$DownloadPhotoStartCopyWithImpl(DownloadPhotoStart _value, $Res Function(DownloadPhotoStart) _then)
      : super(_value, (v) => _then(v as DownloadPhotoStart));

  @override
  DownloadPhotoStart get _value => super._value as DownloadPhotoStart;
}

/// @nodoc
class _$DownloadPhotoStart implements DownloadPhotoStart {
  const _$DownloadPhotoStart();

  @override
  String toString() {
    return 'DownloadPhoto()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is DownloadPhotoStart);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(), {
    @required Result successful(String downloadUrl),
    @required Result error(dynamic error),
  }) {
    assert($default != null);
    assert(successful != null);
    assert(error != null);
    return $default();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(), {
    Result successful(String downloadUrl),
    Result error(dynamic error),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if ($default != null) {
      return $default();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(DownloadPhotoStart value), {
    @required Result successful(DownloadPhotoSuccessful value),
    @required Result error(DownloadPhotoError value),
  }) {
    assert($default != null);
    assert(successful != null);
    assert(error != null);
    return $default(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(DownloadPhotoStart value), {
    Result successful(DownloadPhotoSuccessful value),
    Result error(DownloadPhotoError value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class DownloadPhotoStart implements DownloadPhoto {
  const factory DownloadPhotoStart() = _$DownloadPhotoStart;
}

/// @nodoc
abstract class $DownloadPhotoSuccessfulCopyWith<$Res> {
  factory $DownloadPhotoSuccessfulCopyWith(DownloadPhotoSuccessful value, $Res Function(DownloadPhotoSuccessful) then) =
      _$DownloadPhotoSuccessfulCopyWithImpl<$Res>;

  $Res call({String downloadUrl});
}

/// @nodoc
class _$DownloadPhotoSuccessfulCopyWithImpl<$Res> extends _$DownloadPhotoCopyWithImpl<$Res>
    implements $DownloadPhotoSuccessfulCopyWith<$Res> {
  _$DownloadPhotoSuccessfulCopyWithImpl(DownloadPhotoSuccessful _value, $Res Function(DownloadPhotoSuccessful) _then)
      : super(_value, (v) => _then(v as DownloadPhotoSuccessful));

  @override
  DownloadPhotoSuccessful get _value => super._value as DownloadPhotoSuccessful;

  @override
  $Res call({
    Object downloadUrl = freezed,
  }) {
    return _then(DownloadPhotoSuccessful(
      downloadUrl == freezed ? _value.downloadUrl : downloadUrl as String,
    ));
  }
}

/// @nodoc
class _$DownloadPhotoSuccessful implements DownloadPhotoSuccessful {
  const _$DownloadPhotoSuccessful(this.downloadUrl) : assert(downloadUrl != null);

  @override
  final String downloadUrl;

  @override
  String toString() {
    return 'DownloadPhoto.successful(downloadUrl: $downloadUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is DownloadPhotoSuccessful &&
            (identical(other.downloadUrl, downloadUrl) ||
                const DeepCollectionEquality().equals(other.downloadUrl, downloadUrl)));
  }

  @override
  int get hashCode => runtimeType.hashCode ^ const DeepCollectionEquality().hash(downloadUrl);

  @override
  $DownloadPhotoSuccessfulCopyWith<DownloadPhotoSuccessful> get copyWith =>
      _$DownloadPhotoSuccessfulCopyWithImpl<DownloadPhotoSuccessful>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(), {
    @required Result successful(String downloadUrl),
    @required Result error(dynamic error),
  }) {
    assert($default != null);
    assert(successful != null);
    assert(error != null);
    return successful(downloadUrl);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(), {
    Result successful(String downloadUrl),
    Result error(dynamic error),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (successful != null) {
      return successful(downloadUrl);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(DownloadPhotoStart value), {
    @required Result successful(DownloadPhotoSuccessful value),
    @required Result error(DownloadPhotoError value),
  }) {
    assert($default != null);
    assert(successful != null);
    assert(error != null);
    return successful(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(DownloadPhotoStart value), {
    Result successful(DownloadPhotoSuccessful value),
    Result error(DownloadPhotoError value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (successful != null) {
      return successful(this);
    }
    return orElse();
  }
}

abstract class DownloadPhotoSuccessful implements DownloadPhoto {
  const factory DownloadPhotoSuccessful(String downloadUrl) = _$DownloadPhotoSuccessful;

  String get downloadUrl;

  $DownloadPhotoSuccessfulCopyWith<DownloadPhotoSuccessful> get copyWith;
}

/// @nodoc
abstract class $DownloadPhotoErrorCopyWith<$Res> {
  factory $DownloadPhotoErrorCopyWith(DownloadPhotoError value, $Res Function(DownloadPhotoError) then) =
      _$DownloadPhotoErrorCopyWithImpl<$Res>;

  $Res call({dynamic error});
}

/// @nodoc
class _$DownloadPhotoErrorCopyWithImpl<$Res> extends _$DownloadPhotoCopyWithImpl<$Res>
    implements $DownloadPhotoErrorCopyWith<$Res> {
  _$DownloadPhotoErrorCopyWithImpl(DownloadPhotoError _value, $Res Function(DownloadPhotoError) _then)
      : super(_value, (v) => _then(v as DownloadPhotoError));

  @override
  DownloadPhotoError get _value => super._value as DownloadPhotoError;

  @override
  $Res call({
    Object error = freezed,
  }) {
    return _then(DownloadPhotoError(
      error == freezed ? _value.error : error as dynamic,
    ));
  }
}

/// @nodoc
class _$DownloadPhotoError implements DownloadPhotoError {
  const _$DownloadPhotoError(this.error) : assert(error != null);

  @override
  final dynamic error;

  @override
  String toString() {
    return 'DownloadPhoto.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is DownloadPhotoError &&
            (identical(other.error, error) || const DeepCollectionEquality().equals(other.error, error)));
  }

  @override
  int get hashCode => runtimeType.hashCode ^ const DeepCollectionEquality().hash(error);

  @override
  $DownloadPhotoErrorCopyWith<DownloadPhotoError> get copyWith =>
      _$DownloadPhotoErrorCopyWithImpl<DownloadPhotoError>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(), {
    @required Result successful(String downloadUrl),
    @required Result error(dynamic error),
  }) {
    assert($default != null);
    assert(successful != null);
    assert(error != null);
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(), {
    Result successful(String downloadUrl),
    Result error(dynamic error),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(DownloadPhotoStart value), {
    @required Result successful(DownloadPhotoSuccessful value),
    @required Result error(DownloadPhotoError value),
  }) {
    assert($default != null);
    assert(successful != null);
    assert(error != null);
    return error(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(DownloadPhotoStart value), {
    Result successful(DownloadPhotoSuccessful value),
    Result error(DownloadPhotoError value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class DownloadPhotoError implements DownloadPhoto {
  const factory DownloadPhotoError(dynamic error) = _$DownloadPhotoError;

  dynamic get error;

  $DownloadPhotoErrorCopyWith<DownloadPhotoError> get copyWith;
}
