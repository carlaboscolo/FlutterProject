import 'package:flutter/material.dart';
import 'package:flutter_project/presentation/style/colors.dart';

//widget
import 'package:flutter_project/widgets/serie_item.dart';

//entity
import 'package:flutter_project/models/serie.dart';

//api
import 'package:flutter_project/api/api_serie.dart';

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

  void popularSerie(int page) async {
    final myMovies = await ApiSerie().fetchSerie(page);
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
                _serie[index].vote,
                _serie[index].description,
              ),
              padding: const EdgeInsets.all(10),
            ),
    );
  }
}
