// File created by
// Lung Razvan <long1eu>
// on 22/12/2020

import 'package:atelieruldigital_flutter/src/07/course/src/containers/movie_container.dart';
import 'package:atelieruldigital_flutter/src/07/course/src/models/index.dart';
import 'package:flutter/material.dart';

class MovieDetail extends StatelessWidget {
  const MovieDetail({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MovieContainer(
      builder: (BuildContext context, Movie movie) {
        return Scaffold(
          appBar: AppBar(
            title: Text(movie.title),
          ),
          body: Image.network(movie.largeCoverImage),
        );
      },
    );
  }
}
