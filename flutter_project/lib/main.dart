import 'package:flutter/material.dart';

//presentation
import 'package:flutter_project/navigation/serie_root.dart';
import 'package:flutter_project/navigation/movie_root.dart';
import 'package:flutter_project/presentation/user_page.dart';

void main() {
  runApp(const MovieApp());
}

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const RootPage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark),
    );
  }
}

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int currentPage = 0;

  List<Widget> pages = const [
    SerieRoot(),
    MovieRoot(),
    UserPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentPage],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentPage,
        selectedItemColor: Color(0xFFCA82FA),
        unselectedItemColor: Color.fromARGB(255, 206, 206, 206),
        onTap: (int index) {
          setState(() {
            currentPage = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            label: 'Serie',
            icon: Icon(Icons.tv),
          ),
          BottomNavigationBarItem(
            label: 'Film',
            icon: Icon(Icons.movie),
          ),
          BottomNavigationBarItem(
            label: 'User',
            icon: Icon(Icons.person),
          ),
        ],
      ),
    );
  }
}
