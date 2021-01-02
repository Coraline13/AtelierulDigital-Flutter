// File created by
// Lung Razvan <long1eu>
// on 15/12/2020

part of actions;

@freezed
abstract class GetMovies with _$GetMovies {
  const factory GetMovies() = GetMoviesStart;

  const factory GetMovies.successful(List<Movie> movies) = GetMoviesSuccessful;

  const factory GetMovies.error(dynamic error) = GetMoviesError;
}
