import 'package:equatable/equatable.dart';

abstract class MoviesEvent extends Equatable {
  const MoviesEvent();
  @override
  List<Object> get props => [];
}

class GetNowPlayingMovieEvent extends MoviesEvent {}

class GetPopularMovieEvent extends MoviesEvent {}

class GetTopRatedMovieEvent extends MoviesEvent {}
