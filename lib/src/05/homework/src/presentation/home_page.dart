import 'package:atelieruldigital_flutter/src/05/homework/src/containers/is_loading_container.dart';
import 'package:atelieruldigital_flutter/src/05/homework/src/containers/movies_container.dart';
import 'package:atelieruldigital_flutter/src/05/homework/src/models/movie.dart';
import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  List<DropdownMenuItem<String>> _buildDropdownMenuItems() {
    final List<String> genres = <String>[
      'ALL',
      'Action',
      'Adventure',
      'Animation',
      'Biography',
      'Comedy',
      'Crime',
      'Documentary',
      'Drama',
      'Family',
      'Fantasy',
      'History',
      'Horror',
      'Music',
      'Musical',
      'Mystery',
      'Romance',
      'Sci-Fi',
      'Sport',
      'Superhero',
      'Thriller',
      'War',
      'Western',
    ];
    final List<DropdownMenuItem<String>> items = <DropdownMenuItem<String>>[];

    for (final String genre in genres) {
      items.add(DropdownMenuItem<String>(
        child: Text(genre),
        value: genre,
      ));
    }

    return items;
  }

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
              return Column(
                children: <Widget>[
                  DropdownButton<String>(
                    value: 'ALL',
                    icon: const Icon(Icons.filter_list),
                    items: _buildDropdownMenuItems(),
                    onChanged: (String value) {
                      print('muie');

                    },
                  ),
                  Expanded(
                    child: MoviesContainer(
                      builder: (BuildContext context, BuiltList<Movie> movies) {
                        return GridView.builder(
                          padding: const EdgeInsets.symmetric(
                            vertical: 16.0,
                            horizontal: 0.0,
                          ),
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisSpacing: 16.0,
                            crossAxisSpacing: 0.0,
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
                    ),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
