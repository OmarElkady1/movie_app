import 'package:dartz/dartz.dart';
import 'package:movie_app/core/errors/exceptions.dart';
import 'package:movie_app/core/errors/failure.dart';
import 'package:movie_app/features/movies/data/datasources/movie_remote_data_source.dart';
import 'package:movie_app/features/movies/domain/entities/movie.dart';
import 'package:movie_app/features/movies/domain/entities/movie_details.dart';
import 'package:movie_app/features/movies/domain/entities/recomendation.dart';
import 'package:movie_app/features/movies/domain/repositories/movies_repository.dart';
import 'package:movie_app/features/movies/domain/usecases/get_movie_details.dart';
import 'package:movie_app/features/movies/domain/usecases/get_recommendation_usecase.dart';

class MovieRepositoryImpl extends MoviesRepository {
  final MovieRemoteDataSource movieRemoteDataSource;

  MovieRepositoryImpl(this.movieRemoteDataSource);
  @override
  Future<Either<Failure, List<Movie>>> getNowPlaying() async {
    final result = await movieRemoteDataSource.getNowPlaying();
    try {
      return Right(result);
    } on ServerExceptin catch (failure) {
      return Left(ServerFailure(failure.errorModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies() async {
    final result = await movieRemoteDataSource.getPopulareMovies();
    try {
      return Right(result);
    } on ServerExceptin catch (failure) {
      return Left(ServerFailure(failure.errorModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRatedMovies() async {
    final result = await movieRemoteDataSource.getTopRatedMovies();
    try {
      return Right(result);
    } on ServerExceptin catch (failure) {
      return Left(ServerFailure(failure.errorModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, MovieDetails>> getMoviesDetails(
      MovieDetailsParametar movieDetailsParametar) async {
    final result =
        await movieRemoteDataSource.getMoviesDetails(movieDetailsParametar);
    try {
      return Right(result);
    } on ServerExceptin catch (failure) {
      return Left(ServerFailure(failure.errorModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Recommendation>>> getRecomendationMovies(
      MovieRecommendationParametar parametar) async {
    final result =
        await movieRemoteDataSource.getRecommendationMovies(parametar);
    try {
      return Right(result);
    } on ServerExceptin catch (failure) {
      return Left(ServerFailure(failure.errorModel.statusMessage));
    }
  }
}
