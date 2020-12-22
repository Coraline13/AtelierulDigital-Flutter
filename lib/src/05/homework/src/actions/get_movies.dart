import 'package:atelieruldigital_flutter/src/05/homework/src/models/movie.dart';

class GetMovies {
  const GetMovies({this.genre});

  final String genre;
}

class GetMoviesSuccessful {
  const GetMoviesSuccessful(this.movies);

  final List<Movie> movies;
}

class GetMoviesError {
  const GetMoviesError(this.error);

  final dynamic error;
}
