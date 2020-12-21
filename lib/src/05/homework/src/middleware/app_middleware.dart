import 'package:atelieruldigital_flutter/src/05/homework/src/actions/get_movies.dart';
import 'package:atelieruldigital_flutter/src/05/homework/src/models/app_state.dart';
import 'package:atelieruldigital_flutter/src/05/homework/src/data/yts_api.dart';
import 'package:atelieruldigital_flutter/src/05/homework/src/models/movie.dart';

import 'package:redux/redux.dart';
import 'package:meta/meta.dart';

class AppMiddleware {
  const AppMiddleware({@required YtsApi ytsApi})
      : assert(ytsApi != null),
        _ytsApi = ytsApi;

  final YtsApi _ytsApi;

  List<Middleware<AppState>> get middleware {
    return <Middleware<AppState>>[
      _getMovies,
    ];
  }

  Future<void> _getMovies(Store<AppState> store, dynamic action, NextDispatcher next) async {
    next(action);
    if (action is GetMovies) {
      try {
        final List<Movie> movies = await _ytsApi.getMovies(action.genre);
        final GetMoviesSuccessful successful = GetMoviesSuccessful(movies);
        store.dispatch(successful);
      } catch (e) {
        final GetMoviesError error = GetMoviesError(e);
        store.dispatch(error);
      }
    }
  }
}
