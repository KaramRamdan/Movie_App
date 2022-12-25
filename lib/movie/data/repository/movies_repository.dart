import 'package:dartz/dartz.dart';
import 'package:movie_app/core/error/exceptions.dart';
import 'package:movie_app/core/error/failure.dart';
import 'package:movie_app/movie/data/datasource/movie_remote_data_source.dart';
import 'package:movie_app/movie/domain/entities/movie.dart';
import 'package:movie_app/movie/domain/entities/movie_details.dart';
import 'package:movie_app/movie/domain/entities/recommendation.dart';
import 'package:movie_app/movie/domain/repository/base_movie_repository.dart';
import 'package:movie_app/movie/domain/usecases/get_movie_details_usecase.dart';
import 'package:movie_app/movie/domain/usecases/get_recommendation_usecase.dart';

class MovieRepository extends BaseMovieRepository {
  final BaseMovieRemoteDataSource baseMovieRemoteDataSource;

  MovieRepository(this.baseMovieRemoteDataSource);
  @override
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies() async {
    final result = await baseMovieRemoteDataSource.getNowPlayingMovies();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies() async {
    final result = await baseMovieRemoteDataSource.getPopularMovies();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRatedMovies() async {
    final result = await baseMovieRemoteDataSource.getTopRatedMovies();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, MovieDetails>> getMovieDetails(
      MovieDetailsParameters parameters) async {
    final result = await baseMovieRemoteDataSource.getMovieDetails(parameters);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Recommendation>>> getRecommendation(
      RecommendationParameters parameters) async{
    final result = await baseMovieRemoteDataSource.getRecommendation(parameters);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }
}
