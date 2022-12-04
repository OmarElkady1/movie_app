import 'package:dio/dio.dart';
import 'package:movie_app/core/errors/exceptions.dart';
import 'package:movie_app/core/network/error_message_model.dart';
import 'package:movie_app/core/utils/constance.dart';
import 'package:movie_app/features/movies/data/models/movie_details_model.dart';
import 'package:movie_app/features/movies/data/models/movie_model.dart';
import 'package:movie_app/features/movies/data/models/recommendataion_mode.dart';
import 'package:movie_app/features/movies/domain/entities/movie_details.dart';
import 'package:movie_app/features/movies/domain/usecases/get_movie_details.dart';
import 'package:movie_app/features/movies/domain/usecases/get_recommendation_usecase.dart';

abstract class MovieRemoteDataSource {
  Future<List<MovieModel>> getNowPlaying();
  Future<List<MovieModel>> getPopulareMovies();
  Future<List<MovieModel>> getTopRatedMovies();
  Future<MovieDetails> getMoviesDetails(
      MovieDetailsParametar movieDetailsParametar);

  Future<List<RecommendationModel>> getRecommendationMovies(
      MovieRecommendationParametar parametar);
}

class MovieRemoteDataSourceImpl extends MovieRemoteDataSource {
  @override
  Future<List<MovieModel>> getNowPlaying() async {
    final response = await Dio().get(AppConstans.test);

    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data["results"] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerExceptin(
          errorModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> getPopulareMovies() async {
    final response = await Dio().get(AppConstans.test2);

    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data['results'] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerExceptin(
          errorModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    final response = await Dio().get(AppConstans.test3);

    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data['results'] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerExceptin(
          errorModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<MovieDetailsModel> getMoviesDetails(
      MovieDetailsParametar movieDetailsParametar) async {
    final response = await Dio().get(AppConstans.test4);

    if (response.statusCode == 200) {
      return MovieDetailsModel.fromJson(response.data);
    } else {
      throw ServerExceptin(
          errorModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<RecommendationModel>> getRecommendationMovies(
      MovieRecommendationParametar parametar) async {
    final respose = await Dio().get(AppConstans.test4);

    if (respose.statusCode == 200) {
      return List<RecommendationModel>.from((respose.data['results'] as List)
          .map((e) => RecommendationModel.fromJson(e)));
    } else {
      throw ServerExceptin(
          errorModel: ErrorMessageModel.fromJson(respose.data));
    }
  }
}
