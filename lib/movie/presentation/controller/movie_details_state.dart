
part of 'movie_details_bloc.dart';

class MovieDetailsState extends Equatable {
  const MovieDetailsState({
    this.movieDetails,
    this.movieDetailsState = RequestState.loading,
    this.movieDetailsMessage = '',
    this.recommendation = const[],
    this.recommendationState = RequestState.loading,
    this.recommendationMessage = '',
  });
  final MovieDetails? movieDetails;
  final RequestState movieDetailsState;
  final String movieDetailsMessage;
  final List<Recommendation> recommendation;
  final RequestState recommendationState;
  final String recommendationMessage;



  MovieDetailsState copyWith({
    MovieDetails? movieDetails,
    RequestState? movieDetailsState,
    String? movieDetailsMessage,
    List<Recommendation>? recommendation,
    RequestState? recommendationState,
    String?recommendationMessage,
  }) {
    return MovieDetailsState(
      movieDetails: movieDetails ?? this.movieDetails,
      movieDetailsMessage: movieDetailsMessage ?? this.movieDetailsMessage,
      movieDetailsState: movieDetailsState ?? this.movieDetailsState,
      recommendation: recommendation ?? this.recommendation,
      recommendationMessage: recommendationMessage ??
          this.recommendationMessage,
      recommendationState: recommendationState ?? this.recommendationState,
    );
  }

  @override
  List<Object?> get props =>
      [
        movieDetails,
        movieDetailsState,
        movieDetailsMessage,
        recommendation,
        recommendationState,
        recommendationMessage,
      ];
}
