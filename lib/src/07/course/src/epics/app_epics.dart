// File created by
// Lung Razvan <long1eu>
// on 15/12/2020

import 'package:atelieruldigital_flutter/src/07/course/src/actions/index.dart';
import 'package:atelieruldigital_flutter/src/07/course/src/data/yts_api.dart';
import 'package:atelieruldigital_flutter/src/07/course/src/models/index.dart';
import 'package:meta/meta.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:rxdart/rxdart.dart';

class AppEpics {
  const AppEpics({@required YtsApi ytsApi})
      : assert(ytsApi != null),
        _ytsApi = ytsApi;

  final YtsApi _ytsApi;

  Epic<AppState> get epics {
    return combineEpics<AppState>(<Epic<AppState>>[
      TypedEpic<AppState, GetMoviesStart>(_getMoviesStart),
    ]);
  }

  Stream<dynamic> _getMoviesStart(Stream<GetMoviesStart> actions, EpicStore<AppState> store) {
    return actions
        .asyncMap((GetMoviesStart event) => _ytsApi.getMovies(
              store.state.nextPage,
              store.state.quality,
              store.state.genre,
              store.state.orderBy,
            ))
        .map((List<Movie> event) => GetMovies.successful(event))
        .onErrorReturnWith((dynamic error) => GetMovies.error(error));
  }
}
