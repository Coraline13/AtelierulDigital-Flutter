import 'dart:convert';

import 'package:atelieruldigital_flutter/src/06/homework/src/models/photo.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';

class UnsplashApi {
  const UnsplashApi({@required Client client})
      : assert(client != null),
        _client = client;

  final Client _client;

  Future<List<Photo>> getPhotos(
    int page,
  ) async {
    final Uri url = Uri(
      scheme: 'https',
      host: 'api.unsplash.com',
      pathSegments: <String>['photos'],
      queryParameters: <String, String>{
        'client_id': 'lIjDLBNmGFVSi-sd2_G9k2yB21sRIeQ7r5oPzazgApY',
        'page': '$page',
        'per_page': '20',
        'order_by': 'latest',
      },
    );

    final Response response = await _client.get(url);
    final String body = response.body;
    final List<dynamic> list = jsonDecode(body);
    return list //
        .map((dynamic json) => Photo.fromJson(json))
        .toList();
  }

  Future<String> downloadPhoto(String photoId) async {
    final Uri url = Uri(
      scheme: 'https',
      host: 'api.unsplash.com',
      pathSegments: <String>['photos', photoId, 'download'],
      queryParameters: <String, String>{
        'client_id': 'lIjDLBNmGFVSi-sd2_G9k2yB21sRIeQ7r5oPzazgApY',
      },
    );

    final Response response = await _client.get(url);
    final String body = response.body;
    return jsonDecode(body);
  }
}
