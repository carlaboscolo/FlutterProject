import 'package:flutter/material.dart';

//screen
import 'package:flutter_project/presentation/serie_detail_screens.dart';
import 'package:flutter_project/presentation/serie_page.dart';

//screen

void main() {
  runApp(const SerieRoot());
}

class SerieRoot extends StatelessWidget {
  const SerieRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //home: const SeriePage(),
      debugShowCheckedModeBanner:
          false, //toglie la scritta debug in alto a destra
      //theme imposta il colore dell'app
      theme: ThemeData(brightness: Brightness.dark),
      routes: {
        SeriePage.routeName: (context) => SeriePage(),
        SerieDetailScreen.routeName: (context) => SerieDetailScreen(),
      },
      initialRoute: SeriePage.routeName,
    );
  }
}
