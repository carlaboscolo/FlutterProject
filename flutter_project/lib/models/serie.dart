class Serie {
  final int id;
  final String image;
  final String title;
  final String releaseDate;
  final num vote;

  Serie(
      {required this.id,
      required this.image,
      required this.title,
      required this.releaseDate,
      required this.vote});

  factory Serie.fromJson(Map<String, dynamic> json) {
    return Serie(
      id: json['id'],
      image: json['poster_path'],
      title: json['original_name'],
      releaseDate: json['first_air_date'],
      vote: json['vote_average'],
    );
  }
}
