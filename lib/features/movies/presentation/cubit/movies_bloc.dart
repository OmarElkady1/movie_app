import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/utils/enums.dart';
import 'package:movie_app/core/utils/use_case.dart';
import 'package:movie_app/features/movies/domain/usecases/get_now_playing_use_case.dart';
import 'package:movie_app/features/movies/domain/usecases/get_popular_movies_use_case.dart';
import 'package:movie_app/features/movies/domain/usecases/get_top_rated_movies_use_case.dart';
import 'package:movie_app/features/movies/presentation/cubit/movie_event.dart';
import 'package:movie_app/features/movies/presentation/cubit/movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  final GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;

  MoviesBloc(this.getNowPlayingMoviesUseCase, this.getPopularMoviesUseCase,
      this.getTopRatedMoviesUseCase)
      : super(const MoviesState()) {
    on<GetNowPlayingMoviesEvent>((event, emit) async {
      final result = await getNowPlayingMoviesUseCase(const NoParametar());
      // emit(state.copyWith(nowPlayingState: RequestState.loaded));
      result.fold((l) {
        emit(state.copyWith(
            nowPlayingState: RequestState.erorr, message: l.message));
      }, (r) {
        emit(state.copyWith(
            nowPlayingMovies: r, nowPlayingState: RequestState.loaded));
      });
    });

    on<GetPopularMoviesEvent>((event, emit) async {
      final result = await getPopularMoviesUseCase(const NoParametar());
      // emit(state.copyWith(popularMoviesState: RequestState.loaded));
      result.fold((l) {
        emit(state.copyWith(
            popularMoviesState: RequestState.erorr,
            popularMoviesMessage: l.message));
      }, (r) {
        emit(state.copyWith(
            popularMovies: r, popularMoviesState: RequestState.loaded));
      });
    });

    on<GetTopRatedMoviesEvent>((event, emit) async {
      final result = await getTopRatedMoviesUseCase(const NoParametar());
      // emit(state.copyWith(popularMoviesState: RequestState.loaded));
      result.fold((l) {
        emit(state.copyWith(
            topRatedMoviesState: RequestState.erorr,
            topRatedMoviesMessage: l.message));
      }, (r) {
        emit(state.copyWith(
            topRatedMovies: r, topRatedMoviesState: RequestState.loaded));
      });
    });
  }
}
