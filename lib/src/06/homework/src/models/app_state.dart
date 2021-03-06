library app_state;

import 'package:atelieruldigital_flutter/src/06/homework/src/models/photo.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';

part 'app_state.g.dart';

abstract class AppState implements Built<AppState, AppStateBuilder> {
  factory AppState([void Function(AppStateBuilder b) updates]) = _$AppState;

  factory AppState.initialState() {
    final AppStateBuilder builder = AppStateBuilder();
    builder
      ..isLoading = true
      ..nextPage = 1;
    return builder.build();
  }

  AppState._();

  BuiltList<Photo> get photos;

  int get nextPage;

  bool get isLoading;

  @nullable
  String get selectedPhoto;

  @nullable
  String get color;
}
