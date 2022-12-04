import 'package:equatable/equatable.dart';
import 'package:movie_app/features/movies/domain/entities/genres.dart';

class MovieDetails extends Equatable {
  final String? backdropPath;
  final int id;
  final List<Genres> genres;
  final String overview;
  final String releaseDate;
  final String title;
  final double voteAverage;
  final int runtime;

  const MovieDetails(
      {this.backdropPath,
      required this.id,
      required this.genres,
      required this.overview,
      required this.releaseDate,
      required this.title,
      required this.voteAverage,
      required this.runtime});

  @override
  List<Object?> get props => [
        backdropPath,
        id,
        overview,
        releaseDate,
        title,
        voteAverage,
        runtime,
        genres
      ];
}
