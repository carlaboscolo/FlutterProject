import 'package:flutter/material.dart';
import 'package:flutter_project/presentation/style/colors.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

//component
import 'package:flutter_project/presentation/components/card.dart';

//entity
import 'package:flutter_project/models/movie.dart';

class FilmPage extends StatefulWidget {
  const FilmPage({super.key});

  @override
  State<FilmPage> createState() => _FilmPageState();
}

class _FilmPageState extends State<FilmPage> {
  List<Movie> _movies = [];
  int _page = 1;

  @override
  void initState() {
    super.initState();
    populateMovies(_page);
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

  void populateMovies(int page) async {
    final myMovies = await _fetchMovies(page);
    setState(() {
      _movies.addAll(myMovies);
    });
    _page += 1;
    // print("populating " + page.toString());
    print(_movies[1].title);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Film'),
        backgroundColor: backgroundTopColor,
      ),
      body: CardComponent(),
    );
  }
}
