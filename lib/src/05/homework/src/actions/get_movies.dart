import 'package:atelieruldigital_flutter/src/05/homework/src/models/movie.dart';

class GetMovies {
  const GetMovies({this.genre, this.page});

  final String genre;

  final int page;
}

class GetMoviesSuccessful {
  const GetMoviesSuccessful(this.movies);

  final List<Movie> movies;
}

class GetMoviesError {
  const GetMoviesError(this.error);

  final dynamic error;
}
