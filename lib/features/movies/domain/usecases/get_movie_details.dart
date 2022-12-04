import 'package:equatable/equatable.dart';
import 'package:movie_app/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:movie_app/core/utils/use_case.dart';
import 'package:movie_app/features/movies/domain/entities/movie_details.dart';
import 'package:movie_app/features/movies/domain/repositories/movies_repository.dart';

class MovieDetailsUsecase
    extends BaseUSecase<MovieDetails?, MovieDetailsParametar> {
  final MoviesRepository moviesRepository;

  MovieDetailsUsecase({required this.moviesRepository});

  @override
  Future<Either<Failure, MovieDetails>> call(
      MovieDetailsParametar parametar) async {
    return await moviesRepository.getMoviesDetails(parametar);
  }
}

class MovieDetailsParametar extends Equatable {
  final int id;

  const MovieDetailsParametar(this.id);
  @override
  List<Object?> get props => [id];
}
