import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/utils/enums.dart';
import 'package:movie_app/features/movies/domain/entities/movie_details.dart';
import 'package:movie_app/features/movies/domain/entities/recomendation.dart';
import 'package:movie_app/features/movies/domain/usecases/get_movie_details.dart';
import 'package:movie_app/features/movies/domain/usecases/get_recommendation_usecase.dart';

part 'details_event.dart';
part 'details_state.dart';

class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  MovieDetailsUsecase movieDetailsUsecase;
  GetRecommendatioUsecase getRecommendatioUsecase;
  DetailsBloc(
    this.getRecommendatioUsecase,
    this.movieDetailsUsecase,
  ) : super(const DetailsState()) {
    on<GetMovieDetailsEvent>(getMovieDetailsEvent);
    on<GetMovieDetailsEvent>(getRecommendationEvent);
  }

  FutureOr<void> getMovieDetailsEvent(event, emit) async {
    final result = await movieDetailsUsecase(MovieDetailsParametar(event.id));
    result.fold(
        (l) => emit(state.copyWith(
            requestState: RequestState.erorr, detailsMessage: l.message)),
        (r) => emit(state.copyWith(
            requestState: RequestState.loaded, movieDetails: r)));
  }

  FutureOr<void> getRecommendationEvent(event, emit) async {
    final result =
        await getRecommendatioUsecase(MovieRecommendationParametar(event.id));
    result.fold(
        (l) => emit(state.copyWith(
            recommRequestState: RequestState.erorr,
            recommendationMessage: l.message)),
        (r) => emit(state.copyWith(
            recommRequestState: RequestState.loaded, recommendation: r)));
  }
}
