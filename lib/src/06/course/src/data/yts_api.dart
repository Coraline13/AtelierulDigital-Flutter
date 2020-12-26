// File created by
// Lung Razvan <long1eu>
// on 15/12/2020

import 'dart:convert';

import 'package:atelieruldigital_flutter/src/06/course/src/models/movie.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';

class YtsApi {
  const YtsApi({@required Client client})
      : assert(client != null),
        _client = client;

  final Client _client;

  Future<List<Movie>> getMovies(
    int page,
    String quality,
    String genre,
    String orderBy,
  ) async {
    final Uri url = Uri(
      scheme: 'https',
      host: 'yts.mx',
      pathSegments: <String>['api', 'v2', 'list_movies.json'],
      queryParameters: <String, String>{
        'limit': '3',
        'page': '$page',
        if (quality != null) 'quality': quality,
        if (genre != null) 'genre': genre,
        'order_by': orderBy,
      },
    );

    final Response response = await _client.get(url);
    final String body = response.body;
    final List<dynamic> list = jsonDecode(body)['data']['movies'];
    return list //
        .map((dynamic json) => Movie.fromJson(json))
        .toList();
  }
}
