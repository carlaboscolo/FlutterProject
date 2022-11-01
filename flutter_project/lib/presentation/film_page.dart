import 'package:flutter/material.dart';
import 'package:flutter_project/presentation/components/card.dart';
import 'package:flutter_project/presentation/style/colors.dart';

class FilmPage extends StatefulWidget {
  const FilmPage({super.key});

  @override
  State<FilmPage> createState() => _FilmPageState();
}

class _FilmPageState extends State<FilmPage> {
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
