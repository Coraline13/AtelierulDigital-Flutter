import 'dart:convert';

import 'package:http/http.dart';
import 'package:meta/meta.dart';

// VAR 1
// void main() {
//   get('https://yts.mx/api/v2/list_movies.json').then((Response response) {
//     Map<String, dynamic> map = jsonDecode(response.body);
//
//     print(map['data']['movies'][0]['title']);
//   });
// }

// VAR 2
// Future<void> main() async {
//   final Response response = await get('https://yts.mx/api/v2/list_movies.json');
//   Map<String, dynamic> map = jsonDecode(response.body);
//   print(map['data']['movies'][0]['title']);
// }

// VAR 3
// Future<void> main() async {
//   const String url = 'https://yts.mx/api/v2/list_movies.json';
//   final Response response = await get(url);
//   final Map<String, dynamic> jsonResponse = jsonDecode(response.body);
//   final List<dynamic> movieList = jsonResponse['data']['movies'];
//   for (int i = 0; i < movieList.length; i++) {
//     print(movieList[i]['title']);
//   }
// }

// VAR 1
// Future<void> main() async {
//   final Response response = await get('https://yts.mx/api/v2/list_movies.json');
//
//   final Map<String, dynamic> map = jsonDecode(response.body);
//   final Map<String, dynamic> data = map['data'];
//   final List<dynamic> movies = data['movies'];
//
//   final List<Movie> result = movies
//       .map((dynamic item) => Movie(
//             title: item['title'],
//             year: item['year'],
//             summary: item['summary'],
//             genres: item['genres'],
//           ))
//       .toList();
// }
//
// class Movie {
//   const Movie({
//     @required this.title,
//     @required this.year,
//     @required this.summary,
//     @required this.genres,
//   });
//
//   final String title;
//   final int year;
//   final String summary;
//   final List<String> genres;
//
//   @override
//   String toString() {
//     return 'Movie{title: $title, year: $year, summary: $summary, genres: $genres}';
//   }
// }

// VAR 2
Future<void> main() async {
  final Response response = await get('https://yts.mx/api/v2/list_movies.json');

  final Map<String, dynamic> map = jsonDecode(response.body);
  final Map<String, dynamic> data = map['data'];
  final List<dynamic> movies = data['movies'];

  final List<Movie> result = movies.map((dynamic item) => Movie.fromJson(item)).toList();

  print(result);
}

class Movie {
  const Movie({
    @required this.title,
    @required this.year,
    @required this.summary,
    @required this.genres,
  });

  Movie.fromJson(dynamic item)
      : title = item['title'],
        year = item['year'],
        summary = item['summary'],
        genres = List<String>.from(item['genres']);

  final String title;
  final int year;
  final String summary;
  final List<String> genres;

  @override
  String toString() {
    return 'Movie{title: $title, year: $year, summary: $summary, genres: $genres}';
  }
}
