import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
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
    return 'Movie{title: $title, year: $year, summary: $summary, genres: $genres}\n';
  }
}

class _HomePageState extends State<HomePage> {
  List<Movie> _movies;
  final List<String> _genres = <String>[
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
  String _genre = 'ALL';
  bool _loading = true;

  List<DropdownMenuItem<String>> buildDropdownMenuItems() {
    final List<DropdownMenuItem<String>> items = <DropdownMenuItem<String>>[];

    for (final String genre in _genres) {
      items.add(DropdownMenuItem<String>(
        child: Text(genre),
        value: genre,
      ));
    }

    return items;
  }

  Future<void> getMovies() async {
    Response response;

    setState(() {
      _loading = true;
    });

    if (_genre == 'ALL') {
      response = await get('https://yts.mx/api/v2/list_movies.json');
    } else {
      response = await get('https://yts.mx/api/v2/list_movies.json?genre=$_genre');
    }

    final Map<String, dynamic> map = jsonDecode(response.body);
    final Map<String, dynamic> data = map['data'];
    final List<dynamic> moviesData = data['movies'];

    setState(() {
      _movies = moviesData.map((dynamic item) => Movie.fromJson(item)).toList();
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movies'),
      ),
      body: _loading
          ? const CircularProgressIndicator()
          : Column(
              children: <Widget>[
                DropdownButton<String>(
                  value: _genre,
                  icon: const Icon(Icons.filter_list),
                  items: buildDropdownMenuItems(),
                  onChanged: (String value) {
                    setState(() {
                      _genre = value;
                    });
                  },
                ),
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(16.0),
                    itemCount: 20,
                    itemBuilder: (BuildContext context, int i) {
                      getMovies();
                      return Card(
                        color: Colors.white70,
                        child: ListTile(
                          contentPadding: const EdgeInsets.all(16.0),
                          title: Text('${_movies[i].title} (${_movies[i].year})'),
                          subtitle: Text('${_movies[i].summary.substring(0, 90)}...\n${_movies[i].genres}'),
                          isThreeLine: true,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
