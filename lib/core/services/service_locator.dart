import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app/features/auth/data/datasources/auth_datasource.dart';
import 'package:movie_app/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:movie_app/features/auth/domain/repositories/login_repository.dart';
import 'package:movie_app/features/auth/domain/usecases/login_user.dart';
import 'package:movie_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:movie_app/features/movies/data/datasources/movie_remote_data_source.dart';
import 'package:movie_app/features/movies/data/repositories/movie_repository_impl.dart';
import 'package:movie_app/features/movies/domain/repositories/movies_repository.dart';
import 'package:movie_app/features/movies/domain/usecases/get_movie_details.dart';
import 'package:movie_app/features/movies/domain/usecases/get_now_playing_use_case.dart';
import 'package:movie_app/features/movies/domain/usecases/get_popular_movies_use_case.dart';
import 'package:movie_app/features/movies/domain/usecases/get_recommendation_usecase.dart';
import 'package:movie_app/features/movies/domain/usecases/get_top_rated_movies_use_case.dart';
import 'package:movie_app/features/movies/presentation/bloc/details_bloc.dart';
import 'package:movie_app/features/movies/presentation/cubit/movies_bloc.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    sl.registerLazySingleton<MovieRemoteDataSource>(
        () => MovieRemoteDataSourceImpl());

    sl.registerLazySingleton<LoginRemoteDataSource>(
        () => LoginRemoteDataSourceImpl());

    sl.registerLazySingleton<MoviesRepository>(() => MovieRepositoryImpl(sl()));
    sl.registerLazySingleton<LoginRepository>(
        () => LoginRepositoryImpl(remoteDataSource: sl()));

    sl.registerLazySingleton(
        () => GetNowPlayingMoviesUseCase(moviesRepository: sl()));

    sl.registerLazySingleton(
        () => GetPopularMoviesUseCase(moviesRepository: sl()));

    sl.registerLazySingleton(
        () => GetTopRatedMoviesUseCase(moviesRepository: sl()));
    sl.registerLazySingleton(() => MovieDetailsUsecase(moviesRepository: sl()));

    sl.registerLazySingleton(
        () => GetRecommendatioUsecase(moviesRepository: sl()));
    sl.registerLazySingleton(() => LoginUser(repository: sl()));

    sl.registerFactory(() => MoviesBloc(sl(), sl(), sl()));
    sl.registerFactory(() => DetailsBloc(sl(), sl()));
    sl.registerFactory(() => AuthBloc(loginUser: sl()));
    sl.registerLazySingleton<Dio>(() => Dio());
  }
}
