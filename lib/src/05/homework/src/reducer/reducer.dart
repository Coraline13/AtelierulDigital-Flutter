import 'package:atelieruldigital_flutter/src/05/homework/src/actions/get_movies.dart';
import 'package:atelieruldigital_flutter/src/05/homework/src/models/app_state.dart';

AppState reducer(AppState state, dynamic action) {
  print('action: $action');
  final AppStateBuilder builder = state.toBuilder();

  if (action is GetMovies) {
    builder.isLoading = true;
  } else if (action is GetMoviesSuccessful) {
    builder.movies.clear();
    builder.movies.addAll(action.movies);
    builder.isLoading = false;
  } else if (action is GetMoviesError) {
    builder.isLoading = false;
  }

  return builder.build();
}
