import 'package:movie_app/movie/domain/entities/recommendation.dart';

class RecommendationModel extends Recommendation {
  const RecommendationModel({
    super.backdropPath,
    super.title,
    required super.id,
  });
  factory RecommendationModel.fromJson(Map<String, dynamic> json) =>
      RecommendationModel(
          backdropPath: json['backdrop_path'] ?? ' ',
          id: json['id'],
          title: json['title']);
}
