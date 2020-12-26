// File created by
// Lung Razvan <long1eu>
// on 15/12/2020

import 'package:atelieruldigital_flutter/src/06/course/src/actions/get_movies.dart';
import 'package:atelieruldigital_flutter/src/06/course/src/actions/set_selected_movie.dart';
import 'package:atelieruldigital_flutter/src/06/course/src/actions/update_genre.dart';
import 'package:atelieruldigital_flutter/src/06/course/src/actions/update_order_by.dart';
import 'package:atelieruldigital_flutter/src/06/course/src/actions/update_quality.dart';
import 'package:atelieruldigital_flutter/src/06/course/src/models/app_state.dart';

AppState reducer(AppState state, dynamic action) {
  print('action: $action');
  final AppStateBuilder builder = state.toBuilder();

  if (action is GetMoviesStart) {
    builder.isLoading = true;
  } else if (action is GetMoviesSuccessful) {
    builder
      ..movies.addAll(action.movies)
      ..isLoading = false
      ..nextPage = builder.nextPage + 1;
  } else if (action is GetMoviesError) {
    builder.isLoading = false;
  } else if (action is UpdateQuality) {
    builder
      ..movies.clear()
      ..nextPage = 1
      ..quality = action.quality;
  } else if (action is UpdateGenre) {
    builder
      ..movies.clear()
      ..nextPage = 1
      ..genre = action.genre;
  } else if (action is UpdateOrderBy) {
    builder
      ..movies.clear()
      ..nextPage = 1
      ..orderBy = action.orderBy;
  } else if (action is SetSelectedMovie) {
    builder.selectedMovie = action.movieId;
  }

  return builder.build();
}
