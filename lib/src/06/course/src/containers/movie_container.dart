// File created by
// Lung Razvan <long1eu>
// on 15/12/2020

import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:atelieruldigital_flutter/src/06/course/src/models/app_state.dart';
import 'package:atelieruldigital_flutter/src/06/course/src/models/movie.dart';
import 'package:meta/meta.dart';
import 'package:redux/redux.dart';

class MovieContainer extends StatelessWidget {
  const MovieContainer({Key key, @required this.builder}) : super(key: key);

  final ViewModelBuilder<Movie> builder;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, Movie>(
      converter: (Store<AppState> store) {
        return store.state.movies.firstWhere((Movie movie) => movie.id == store.state.selectedMovie);
      },
      builder: builder,
    );
  }
}
