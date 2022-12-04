import 'package:equatable/equatable.dart';
import 'package:movie_app/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:movie_app/core/utils/use_case.dart';
import 'package:movie_app/features/movies/domain/entities/recomendation.dart';
import 'package:movie_app/features/movies/domain/repositories/movies_repository.dart';

class GetRecommendatioUsecase
    extends BaseUSecase<List<Recommendation>, MovieRecommendationParametar> {
  final MoviesRepository moviesRepository;

  GetRecommendatioUsecase({required this.moviesRepository});

  @override
  Future<Either<Failure, List<Recommendation>>> call(
      MovieRecommendationParametar parametar) async {
    return await moviesRepository.getRecomendationMovies(parametar);
  }
}

class MovieRecommendationParametar extends Equatable {
  final int id;

  const MovieRecommendationParametar(this.id);
  @override
  List<Object?> get props => [id];
}
