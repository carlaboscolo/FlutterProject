import 'package:flutter/material.dart';

class MovieItem extends StatelessWidget {
  final int id;
  final String imageUrl;
  final String title;
  final String releaseDate;
  final num vote;

  MovieItem(
    this.id,
    this.imageUrl,
    this.title,
    this.releaseDate,
    this.vote,
  );

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            // height: 500,
            padding: const EdgeInsets.all(10),
            child: InkWell(
              onTap: () {
                /*  Navigator.of(context)
                    .pushNamed(MovieDetailScreen.routeName, arguments: id);
                    */
              },
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
                        height: 280,
                        width: 400,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          ),
                          child: FittedBox(
                            fit: BoxFit.cover,
                            child: Image.network(
                              "https://image.tmdb.org/t/p/w500/$imageUrl",
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        alignment: Alignment.topLeft,
                        child: Text(title,
                            style: const TextStyle(
                                fontSize: 28, fontWeight: FontWeight.bold)),
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 15),
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Data di uscita : ' + releaseDate,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 15, bottom: 10),
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Voto : ' + vote.toString(),
                          style: const TextStyle(fontSize: 14),
                        ),
                      ),
                    ],
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
