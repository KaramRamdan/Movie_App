import 'package:dartz/dartz.dart';
import 'package:movie_app/core/error/failure.dart';
import 'package:movie_app/movie/domain/entities/movie.dart';
import 'package:movie_app/movie/domain/entities/movie_details.dart';
import 'package:movie_app/movie/domain/entities/recommendation.dart';
import 'package:movie_app/movie/domain/usecases/get_movie_details_usecase.dart';
import 'package:movie_app/movie/domain/usecases/get_recommendation_usecase.dart';

abstract class BaseMovieRepository {
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies();

  Future<Either<Failure, List<Movie>>> getPopularMovies();

  Future<Either<Failure, List<Movie>>> getTopRatedMovies();

  Future<Either<Failure, MovieDetails>> getMovieDetails(
      MovieDetailsParameters parameters);

  Future<Either<Failure, List<Recommendation>>> getRecommendation(
      RecommendationParameters parameters);
}
