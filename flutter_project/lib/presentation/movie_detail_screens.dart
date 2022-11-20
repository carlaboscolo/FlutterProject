import 'dart:convert';
import 'package:flutter_project/data/models/movie.dart';
import 'package:html/parser.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MovieDetailScreen extends StatelessWidget {
  static const routeName = 'movie_detail_screen';

  var _id;
  var _title;
  var _description;
  var _start;
  var _status;
  var _imageUrl;
  var _rating;
  var _htmlDescription;
  var _genres;

  Future _fetchDetail(String id) async {
    const apiKey = "a7c4848fcfb89f8bef0757f282d0a463";

    final response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/movie/$id?api_key=$apiKey&language=it'));

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      _htmlDescription = result["overview"];
      final document = parse(_htmlDescription);
      _description = parse(document.body!.text).documentElement!.text;
      _id = result["id"];
      _title = result["original_title"];
      _start = result["release_date"];
      _status = result["status"];
      _imageUrl = result["poster_path"];
      _rating = result["vote_average"];
      _genres = result["genres"];
    } else {
      throw Exception('failed');
    }
  }

  @override
  Widget build(BuildContext context) {
    final _movieId = ModalRoute.of(context)!.settings.arguments.toString();
    //print(_movieId);

    return FutureBuilder(
      future: _fetchDetail(_movieId),
      builder: (context, data) {
        while (_id == null) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Scaffold(
          appBar: AppBar(
            title: Text(_title),
          ),
          body: SingleChildScrollView(
              child: Column(
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.only(
                      left: 10,
                      top: 10,
                    ),
                    width: 200,
                    child: Hero(
                      tag:
                          'location-img-${"https://image.tmdb.org/t/p/w500/$_imageUrl"}',
                      child: Image.network(
                          "https://image.tmdb.org/t/p/w500/$_imageUrl",
                          fit: BoxFit.contain,
                          errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: Colors.white,
                          child: LayoutBuilder(
                            builder: (context, constraint) {
                              return Icon(
                                Icons.error_outline_sharp,
                                color: Colors.red,
                                size: constraint.biggest.width,
                              );
                            },
                          ),
                        );
                      }),
                    ),
                  ),
                  const SizedBox(width: 40),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      CircleAvatar(
                        backgroundColor: _rating >= 6
                            ? Color.fromRGBO(0, 255, 68, 1)
                            : Color.fromRGBO(230, 8, 8, 1),
                        child: Text(
                          double.parse(_rating.toString()).toStringAsFixed(1),
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Data di uscita : ',
                        style: TextStyle(fontSize: 18, color: Colors.blue),
                      ),
                      const SizedBox(height: 10),
                      Text(_start.toString()),
                      const SizedBox(height: 10),
                      const Text(
                        'Stato : ',
                        style: TextStyle(fontSize: 18, color: Colors.blue),
                      ),
                      const SizedBox(height: 10),
                      Text(_status.toString()),
                      const SizedBox(height: 10),
                      const Text(
                        'Genere : ',
                        style: TextStyle(fontSize: 18, color: Colors.blue),
                      ),
                      const SizedBox(height: 10),
                      for (var i in _genres)
                        Column(
                          children: [
                            Text(i["name"].toString()),
                          ],
                        ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: Text(
                  _description,
                  style: const TextStyle(
                    fontSize: 18,
                    height: 1.5,
                    wordSpacing: 1.5,
                  ),
                ),
              ),
            ],
          )),
        );
      },
    );
  }
}
