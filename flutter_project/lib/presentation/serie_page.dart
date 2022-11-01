import 'package:flutter/material.dart';
import 'package:flutter_project/presentation/style/colors.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

//widget
import 'package:flutter_project/widgets/serie_item.dart';

//entity
import 'package:flutter_project/models/serie.dart';

class SeriePage extends StatefulWidget {
  const SeriePage({super.key});

  @override
  State<SeriePage> createState() => _SeriePageState();
}

class _SeriePageState extends State<SeriePage> {
  List<Serie> _serie = [];
  int _page = 1;

  @override
  void initState() {
    super.initState();
    popularSerie(_page);
  }

  Future<List<Serie>> _fetchSerie(int page) async {
    const apiKey = "a7c4848fcfb89f8bef0757f282d0a463";

    final response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/tv/popular?api_key=$apiKey&language=en-US&page=$page'));

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      Iterable list = result['results'];
      return list.map((e) => Serie.fromJson(e)).toList();
    } else {
      throw Exception('failed');
    }
  }

  void popularSerie(int page) async {
    final myMovies = await _fetchSerie(page);
    setState(() {
      _serie.addAll(myMovies);
    });
    _page += 1;
    // print(_serie[1].title);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Serie'),
        backgroundColor: backgroundTopColor,
      ),
      body: _serie.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: _serie.length,
              itemBuilder: (context, index) => SerieItem(
                  _serie[index].id,
                  _serie[index].image,
                  _serie[index].title,
                  _serie[index].releaseDate,
                  _serie[index].vote),
              padding: const EdgeInsets.all(10),
            ),
    );
  }
}
