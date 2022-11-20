import 'package:flutter/material.dart';

//screens
import 'package:flutter_project/presentation/serie_detail_screens.dart';

class SerieItem extends StatelessWidget {
  final int id;
  final String imageUrl;
  final String title;
  final String releaseDate;
  final num vote;
  final String description;

  SerieItem(
    this.id,
    this.imageUrl,
    this.title,
    this.releaseDate,
    this.vote,
    this.description,
  );

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            // height: 500,
            padding: const EdgeInsets.all(2),
            child: InkWell(
              child: Card(
                elevation: 10,
                color: Color.fromRGBO(46, 46, 46, 1),
                shadowColor: Colors.blue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: Column(
                  children: [
                    Container(
                      height: 380,
                      width: 400,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                        child: FittedBox(
                          fit: BoxFit.cover,
                          child: Hero(
                            tag:
                                'location-img-${"https://image.tmdb.org/t/p/w500/$imageUrl"}',
                            child: Image.network(
                              "https://image.tmdb.org/t/p/w500/$imageUrl",
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 5, bottom: 2),
                      alignment: Alignment.center,
                      child: Text(
                        'Uscita : ' +
                            releaseDate +
                            '    |    Voto : ' +
                            vote.toString(),
                        style: const TextStyle(fontSize: 13),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      alignment: Alignment.center,
                      child: Text(title,
                          style: const TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFCA82FA))),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 25, right: 15),
                      alignment: Alignment.topLeft,
                      child: Text(
                        description,
                        style: const TextStyle(fontSize: 15),
                        maxLines: 2,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                          left: 25, right: 15, bottom: 20),
                      alignment: Alignment.topLeft,
                      child: const Text(
                        "...",
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ),
              onTap: () {
                Navigator.of(context)
                    .pushNamed(SerieDetailScreen.routeName, arguments: id);
              },
            ),
          ),
        ],
      ),
    );
  }
}
