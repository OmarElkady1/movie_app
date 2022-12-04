import 'package:movie_app/features/movies/domain/entities/recomendation.dart';

class RecommendationModel extends Recommendation {
  const RecommendationModel({super.backdropPath, required super.id});

  factory RecommendationModel.fromJson(Map<String, dynamic> json) =>
      RecommendationModel(
          backdropPath:
              json["backdrop_path"] ?? "/cRdA9xjHBbobw4LJFsQ3j1CgpVq.jpg",
          id: json["id"]);
}
