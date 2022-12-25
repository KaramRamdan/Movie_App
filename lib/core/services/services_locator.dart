import 'package:get_it/get_it.dart';
import 'package:movie_app/movie/data/datasource/movie_remote_data_source.dart';
import 'package:movie_app/movie/data/repository/movies_repository.dart';
import 'package:movie_app/movie/domain/repository/base_movie_repository.dart';
import 'package:movie_app/movie/domain/usecases/get_movie_details_usecase.dart';
import 'package:movie_app/movie/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:movie_app/movie/domain/usecases/get_popular_movies_usecase.dart';
import 'package:movie_app/movie/domain/usecases/get_recommendation_usecase.dart';
import 'package:movie_app/movie/domain/usecases/get_top_rated_movies_usecase.dart';
import 'package:movie_app/movie/presentation/controller/movie_details_bloc.dart';
import 'package:movie_app/movie/presentation/controller/movies_bloc.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    ///BLoc

    sl.registerFactory(() => MovieBloc(sl(), sl(), sl()));

    sl.registerFactory(() => MovieDetailsBloc(sl(),sl()));

    /// REPOSITORY

    sl.registerLazySingleton<BaseMovieRepository>(() => MovieRepository(sl()));

    ///DATA SOURCE

    sl.registerLazySingleton<BaseMovieRemoteDataSource>(
        () => MovieRemoteDataSource());

    ///USE CASES

    sl.registerLazySingleton(() => GetNowPlayingMoviesUseCase(sl()));

    sl.registerLazySingleton(() => GetPopularMoviesUseCase(sl()));

    sl.registerLazySingleton(() => GetTopRatedMoviesUseCase(sl()));

    sl.registerLazySingleton(() => GetMovieDetailsUseCase(sl()));

    sl.registerLazySingleton(() => GetRecommendationUseCase(sl()));
  }
}
