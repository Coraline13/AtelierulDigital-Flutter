// GENERATED CODE - DO NOT MODIFY BY HAND

part of app_state;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AppState extends AppState {
  @override
  final BuiltList<Photo> photos;
  @override
  final int nextPage;
  @override
  final bool isLoading;
  @override
  final String selectedPhoto;
  @override
  final String color;

  factory _$AppState([void Function(AppStateBuilder) updates]) => (new AppStateBuilder()..update(updates)).build();

  _$AppState._({this.photos, this.nextPage, this.isLoading, this.selectedPhoto, this.color}) : super._() {
    if (photos == null) {
      throw new BuiltValueNullFieldError('AppState', 'photos');
    }
    if (nextPage == null) {
      throw new BuiltValueNullFieldError('AppState', 'nextPage');
    }
    if (isLoading == null) {
      throw new BuiltValueNullFieldError('AppState', 'isLoading');
    }
  }

  @override
  AppState rebuild(void Function(AppStateBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  AppStateBuilder toBuilder() => new AppStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AppState &&
        photos == other.photos &&
        nextPage == other.nextPage &&
        isLoading == other.isLoading &&
        selectedPhoto == other.selectedPhoto &&
        color == other.color;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc($jc(0, photos.hashCode), nextPage.hashCode), isLoading.hashCode), selectedPhoto.hashCode),
        color.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AppState')
          ..add('photos', photos)
          ..add('nextPage', nextPage)
          ..add('isLoading', isLoading)
          ..add('selectedPhoto', selectedPhoto)
          ..add('color', color))
        .toString();
  }
}

class AppStateBuilder implements Builder<AppState, AppStateBuilder> {
  _$AppState _$v;

  ListBuilder<Photo> _photos;

  ListBuilder<Photo> get photos => _$this._photos ??= new ListBuilder<Photo>();

  set photos(ListBuilder<Photo> photos) => _$this._photos = photos;

  int _nextPage;

  int get nextPage => _$this._nextPage;

  set nextPage(int nextPage) => _$this._nextPage = nextPage;

  bool _isLoading;

  bool get isLoading => _$this._isLoading;

  set isLoading(bool isLoading) => _$this._isLoading = isLoading;

  String _selectedPhoto;

  String get selectedPhoto => _$this._selectedPhoto;

  set selectedPhoto(String selectedPhoto) => _$this._selectedPhoto = selectedPhoto;

  String _color;

  String get color => _$this._color;

  set color(String color) => _$this._color = color;

  AppStateBuilder();

  AppStateBuilder get _$this {
    if (_$v != null) {
      _photos = _$v.photos?.toBuilder();
      _nextPage = _$v.nextPage;
      _isLoading = _$v.isLoading;
      _selectedPhoto = _$v.selectedPhoto;
      _color = _$v.color;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AppState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$AppState;
  }

  @override
  void update(void Function(AppStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AppState build() {
    _$AppState _$result;
    try {
      _$result = _$v ??
          new _$AppState._(
              photos: photos.build(),
              nextPage: nextPage,
              isLoading: isLoading,
              selectedPhoto: selectedPhoto,
              color: color);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'photos';
        photos.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError('AppState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
