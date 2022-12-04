import 'package:movie_app/features/movies/domain/entities/movie.dart';

class MovieModel extends Movie {
  const MovieModel({
    required super.id,
    required super.releaseDate,
    required super.voteAverage,
    required super.backdropPath,
    required super.overview,
    required super.title,
    required super.genreIds,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json["id"],
      title: json["title"],
      overview: json["overview"],
      backdropPath: json["backdrop_path"] ?? "/cRdA9xjHBbobw4LJFsQ3j1CgpVq.jpg",
      releaseDate: json["release_date"],
      genreIds: List<int>.from(json["genre_ids"].map((e) => e)),
      voteAverage: json["vote_average"].toDouble(),
    );
  }
}
