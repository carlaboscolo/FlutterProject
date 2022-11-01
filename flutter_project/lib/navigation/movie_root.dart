import 'package:flutter/material.dart';

//screen
import 'package:flutter_project/presentation/movie_page.dart';
import 'package:flutter_project/presentation/movie_detail_screens.dart';

void main() {
  runApp(const MovieRoot());
}

class MovieRoot extends StatelessWidget {
  const MovieRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MoviePage(),
      debugShowCheckedModeBanner:
          false, //toglie la scritta debug in alto a destra
      //theme imposta il colore dell'app
      theme: ThemeData(brightness: Brightness.dark),
      routes: {
        MovieDetailScreen.routeName: (context) => MovieDetailScreen(),
      },
    );
  }
}
