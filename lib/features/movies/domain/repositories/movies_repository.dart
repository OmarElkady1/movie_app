import 'package:dartz/dartz.dart';
import 'package:movie_app/core/errors/failure.dart';
import 'package:movie_app/features/movies/domain/entities/movie.dart';
import 'package:movie_app/features/movies/domain/entities/movie_details.dart';
import 'package:movie_app/features/movies/domain/entities/recomendation.dart';
import 'package:movie_app/features/movies/domain/usecases/get_movie_details.dart';
import 'package:movie_app/features/movies/domain/usecases/get_recommendation_usecase.dart';

abstract class MoviesRepository {
  Future<Either<Failure, List<Movie>>> getNowPlaying();
  Future<Either<Failure, List<Movie>>> getTopRatedMovies();
  Future<Either<Failure, List<Movie>>> getPopularMovies();
  Future<Either<Failure, MovieDetails>> getMoviesDetails(
      MovieDetailsParametar movieDetailsParametar);

  Future<Either<Failure, List<Recommendation>>> getRecomendationMovies(
      MovieRecommendationParametar parametar);
}
