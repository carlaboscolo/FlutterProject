import 'package:flutter/material.dart';
import 'package:flutter_project/presentation/style/colors.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

//widget
import 'package:flutter_project/widgets/movie_item.dart';

//entity
import 'package:flutter_project/models/movie.dart';

class MoviePage extends StatefulWidget {
  const MoviePage({super.key});

  @override
  State<MoviePage> createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  List<Movie> _movies = [];
  int _page = 1;

  @override
  void initState() {
    super.initState();
    popularMovies(_page);
  }

  Future<List<Movie>> _fetchMovies(int page) async {
    const apiKey = "a7c4848fcfb89f8bef0757f282d0a463";

    final response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/movie/popular?api_key=$apiKey&language=en-US&page=$page'));

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      Iterable list = result['results'];
      return list.map((e) => Movie.fromJson(e)).toList();
    } else {
      throw Exception('failed');
    }
  }

  void popularMovies(int page) async {
    final myMovies = await _fetchMovies(page);
    setState(() {
      _movies.addAll(myMovies);
    });
    _page += 1;
    //print(_movies[1].title);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Film'),
        backgroundColor: backgroundTopColor,
      ),
      body: _movies.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: _movies.length,
              itemBuilder: (context, index) => MovieItem(
                  _movies[index].id,
                  _movies[index].image,
                  _movies[index].title,
                  _movies[index].releaseDate,
                  _movies[index].vote),
              padding: const EdgeInsets.all(10),
            ),
    );
  }
}
