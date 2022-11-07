import 'package:flutter/material.dart';
import 'package:flutter_project/presentation/style/colors.dart';

//widget
import 'package:flutter_project/widgets/movie_item.dart';

//entity
import 'package:flutter_project/models/movie.dart';

//api
import 'package:flutter_project/api/api_movie.dart';

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

  void popularMovies(int page) async {
    final myMovies = await ApiMovie().fetchMovies(page);
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
                _movies[index].vote,
                _movies[index].description,
              ),
              padding: const EdgeInsets.all(10),
            ),
    );
  }
}
