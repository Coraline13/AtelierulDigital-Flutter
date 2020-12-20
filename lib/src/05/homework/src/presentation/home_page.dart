import 'package:atelieruldigital_flutter/src/05/homework/src/containers/is_loading_container.dart';
import 'package:atelieruldigital_flutter/src/05/homework/src/containers/movies_container.dart';
import 'package:atelieruldigital_flutter/src/05/homework/src/models/movie.dart';
import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  Future<void> _showMovieDetails(BuildContext context, String title, String genres) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(genres),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return IsLoadingContainer(
      builder: (BuildContext context, bool isLoading) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Movies'),
          ),
          body: Builder(
            builder: (BuildContext context) {
              if (isLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              return MoviesContainer(
                builder: (BuildContext context, BuiltList<Movie> movies) {
                  return GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 4.0,
                      crossAxisSpacing: 4.0,
                      crossAxisCount: 3,
                    ),
                    itemCount: movies.length,
                    itemBuilder: (BuildContext context, int index) {
                      final Movie movie = movies[index];
                      return GestureDetector(
                        onTap: () {
                          _showMovieDetails(context, movie.title, movie.genres.join(', '));
                        },
                        child: GridTile(
                          child: Image.network(movie.mediumCoverImage),
                        ),
                      );
                    },
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}
