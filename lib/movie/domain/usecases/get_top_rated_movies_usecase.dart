import 'package:dartz/dartz.dart';
import 'package:movie_app/core/error/failure.dart';
import 'package:movie_app/core/usecases/base_usecase.dart';
import 'package:movie_app/movie/domain/entities/movie.dart';
import 'package:movie_app/movie/domain/repository/base_movie_repository.dart';


class GetTopRatedMoviesUseCase extends BaseUseCase<List<Movie>,NoParameters>{
  final BaseMovieRepository baseMovieRepository;

  GetTopRatedMoviesUseCase(this.baseMovieRepository);

  @override
  Future<Either<Failure,List<Movie>>> call(NoParameters parameters)async{
    return await baseMovieRepository.getTopRatedMovies();
  }
}