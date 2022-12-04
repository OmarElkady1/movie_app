import 'package:movie_app/features/movies/data/models/genres_model.dart';
import 'package:movie_app/features/movies/domain/entities/movie_details.dart';

class MovieDetailsModel extends MovieDetails {
  const MovieDetailsModel(
      {required super.backdropPath,
      required super.id,
      required super.genres,
      required super.overview,
      required super.releaseDate,
      required super.title,
      required super.voteAverage,
      required super.runtime});
  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) =>
      MovieDetailsModel(
          backdropPath:
              json['backdrop_path'] ?? "/cRdA9xjHBbobw4LJFsQ3j1CgpVq.jpg",
          id: json['id'],
          genres: List<GenresModel>.from(
              json['genres'].map((x) => GenresModel.fromJson(x))),
          overview: json['overview'],
          releaseDate: json['release_date'],
          title: json['title'],
          voteAverage: json['vote_average'].toDouble(),
          runtime: json['runtime']);
}
