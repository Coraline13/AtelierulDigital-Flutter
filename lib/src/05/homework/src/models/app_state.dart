library app_state;

import 'package:atelieruldigital_flutter/src/05/homework/src/models/movie.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';

part 'app_state.g.dart';

abstract class AppState implements Built<AppState, AppStateBuilder> {
  factory AppState([void Function(AppStateBuilder) updates]) = _$AppState;

  factory AppState.initialState() {
    final AppStateBuilder builder = AppStateBuilder();
    builder.page = 1;
    builder.isLoading = true;
    return builder.build();
  }

  AppState._();

  BuiltList<Movie> get movies;

  @nullable
  String get genre;

  int get page;

  bool get isLoading;
}
