class Movie {
  final int id;
  final String image;
  final String title;
  final String releaseDate;
  final num vote;
  final String description;
  final String? status;
  final String? genres;

  Movie({
    required this.id,
    required this.image,
    required this.title,
    required this.releaseDate,
    required this.vote,
    required this.description,
    this.status,
    this.genres,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'],
      image: json['poster_path'],
      title: json['original_title'],
      releaseDate: json['release_date'],
      vote: json['vote_average'],
      description: json['overview'],
      status: json['status'],
      genres: json['genres'],
    );
  }
}
