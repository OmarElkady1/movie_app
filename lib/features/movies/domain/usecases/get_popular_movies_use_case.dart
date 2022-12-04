import 'package:dartz/dartz.dart';
import 'package:movie_app/core/errors/failure.dart';
import 'package:movie_app/core/utils/use_case.dart';
import 'package:movie_app/features/movies/domain/entities/movie.dart';
import 'package:movie_app/features/movies/domain/repositories/movies_repository.dart';

class GetPopularMoviesUseCase implements BaseUSecase<List<Movie> ,NoParametar> {
  final MoviesRepository moviesRepository;

  GetPopularMoviesUseCase({required this.moviesRepository});

  @override
  Future<Either<Failure, List<Movie>>> call(NoParametar noParametar) {
    return moviesRepository.getPopularMovies();
  }
}
