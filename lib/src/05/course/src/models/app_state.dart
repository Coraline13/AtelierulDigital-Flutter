// File created by
// Lung Razvan <long1eu>
// on 15/12/2020

library app_state;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:atelieruldigital_flutter/src/05/course/src/models/movie.dart';

part 'app_state.g.dart';

abstract class AppState implements Built<AppState, AppStateBuilder> {
  factory AppState([void Function(AppStateBuilder) updates]) = _$AppState;

  factory AppState.initialState() {
    final AppStateBuilder builder = AppStateBuilder();
    builder.isLoading = true;
    return builder.build();
  }

  AppState._();

  BuiltList<Movie> get movies;

  bool get isLoading;
}
