import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/usecases/base_usecase.dart';
import 'package:movie_app/core/utils/enums.dart';
import 'package:movie_app/movie/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:movie_app/movie/domain/usecases/get_popular_movies_usecase.dart';
import 'package:movie_app/movie/domain/usecases/get_top_rated_movies_usecase.dart';
import 'package:movie_app/movie/presentation/controller/movies_events.dart';
import 'package:movie_app/movie/presentation/controller/movies_states.dart';

class MovieBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  final GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;

  MovieBloc(this.getNowPlayingMoviesUseCase, this.getPopularMoviesUseCase,
      this.getTopRatedMoviesUseCase)
      : super(const MoviesState()) {
    on<GetNowPlayingMovieEvent>(_getNowPlayingMovie);

    on<GetPopularMovieEvent>(_getPopularMovie);

    on<GetTopRatedMovieEvent>(_getTopRatedMovie);
  }

  FutureOr<void> _getNowPlayingMovie(
      GetNowPlayingMovieEvent event, Emitter<MoviesState> emit) async {
    final result = await getNowPlayingMoviesUseCase(const NoParameters());
    result.fold(
      (l) => emit(state.copyWith(
        nowPlayingState: RequestState.error,
        nowPlayingMessage: l.message,
      )),
      (r) => emit(state.copyWith(
        nowPlayingMovies: r,
        nowPlayingState: RequestState.loaded,
      )),
    );
  }

  FutureOr<void> _getPopularMovie(
      GetPopularMovieEvent event, Emitter<MoviesState> emit) async {
    final result = await getPopularMoviesUseCase(const NoParameters());
    result.fold(
      (l) => emit(state.copyWith(
        popularState: RequestState.error,
        popularMessage: l.message,
      )),
      (r) => emit(state.copyWith(
        popularMovies: r,
        popularState: RequestState.loaded,
      )),
    );
  }

  FutureOr<void> _getTopRatedMovie(
      GetTopRatedMovieEvent event, Emitter<MoviesState> emit) async {
    final result = await getTopRatedMoviesUseCase(const NoParameters());
    result.fold(
      (l) => emit(state.copyWith(
        topRatedState: RequestState.error,
        topRatedMessage: l.message,
      )),
      (r) => emit(state.copyWith(
        topRatedMovies: r,
        topRatedState: RequestState.loaded,
      )),
    );
  }
}
