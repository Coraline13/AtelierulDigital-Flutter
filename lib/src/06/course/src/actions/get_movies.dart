// File created by
// Lung Razvan <long1eu>
// on 15/12/2020

library get_movies;

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:atelieruldigital_flutter/src/06/course/src/models/movie.dart';

part 'get_movies.freezed.dart';

@freezed
abstract class GetMovies with _$GetMovies {
  const factory GetMovies() = GetMoviesStart;

  const factory GetMovies.successful(List<Movie> movies) = GetMoviesSuccessful;

  const factory GetMovies.error(dynamic error) = GetMoviesError;
}
