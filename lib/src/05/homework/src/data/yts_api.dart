import 'dart:convert';

import 'package:atelieruldigital_flutter/src/05/homework/src/models/movie.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';

class YtsApi {
  const YtsApi({@required Client client})
      : assert(client != null),
        _client = client;

  final Client _client;

  String getUrl(String genre) {
    const String baseUrl = 'https://yts.mx/api/v2/list_movies.json?limit=48';
    if (genre != null) {
      return '$baseUrl&genre=$genre';
    } else {
      return baseUrl;
    }
  }

  Future<List<Movie>> getMovies([String genre]) async {
    final String url = getUrl(genre);
    final Response response = await _client.get(url);
    final String body = response.body;
    final List<dynamic> list = jsonDecode(body)['data']['movies'];
    return list //
        .map((dynamic json) => Movie.fromJson(json))
        .toList();
  }
}
