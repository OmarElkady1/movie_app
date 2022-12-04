import 'package:equatable/equatable.dart';
import 'package:movie_app/core/utils/enums.dart';
import 'package:movie_app/features/movies/domain/entities/movie.dart';

class MoviesState extends Equatable {
  final List<Movie> nowPlayingMovies;
  final String message;
  final RequestState nowPlayingState;

  final List<Movie> popularMovies;
  final String popularMoviesMessage;
  final RequestState popularMoviesState;

  final List<Movie> topRatedMovies;
  final String topRatedMoviesMessage;
  final RequestState topRatedMoviesState;

  const MoviesState(
      {this.message = '',
      this.nowPlayingMovies = const [],
      this.nowPlayingState = RequestState.loading,
      this.popularMoviesMessage = '',
      this.popularMovies = const [],
      this.popularMoviesState = RequestState.loading,
      this.topRatedMoviesMessage = '',
      this.topRatedMovies = const [],
      this.topRatedMoviesState = RequestState.loading});

  MoviesState copyWith({
    List<Movie>? nowPlayingMovies,
    String? message,
    RequestState? nowPlayingState,
    List<Movie>? popularMovies,
    String? popularMoviesMessage,
    RequestState? popularMoviesState,
    List<Movie>? topRatedMovies,
    String? topRatedMoviesMessage,
    RequestState? topRatedMoviesState,
  }) {
    return MoviesState(
      message: message ?? this.message,
      nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies,
      nowPlayingState: nowPlayingState ?? this.nowPlayingState,
      popularMovies: popularMovies ?? this.popularMovies,
      popularMoviesMessage: popularMoviesMessage ?? this.popularMoviesMessage,
      popularMoviesState: popularMoviesState ?? this.popularMoviesState,
      topRatedMovies: topRatedMovies ?? this.topRatedMovies,
      topRatedMoviesMessage:
          topRatedMoviesMessage ?? this.topRatedMoviesMessage,
      topRatedMoviesState: topRatedMoviesState ?? this.topRatedMoviesState,
    );
  }

  @override
  List<Object> get props => [
        message,
        nowPlayingMovies,
        nowPlayingState,
        topRatedMovies,
        topRatedMoviesMessage,
        topRatedMoviesState,
        popularMovies,
        popularMoviesMessage,
        popularMoviesState,
      ];
}
