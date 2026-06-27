import 'package:clean_architecture_and_solid_principles/movie%20app/movies/domain/entities/movie_details.dart';
import 'package:clean_architecture_and_solid_principles/movie%20app/movies/domain/usecases/base.dart';
import 'package:dartz/dartz.dart';

import '../../../core/errors/failure.dart';
import '../repository/base_movies_repository.dart';

class GetMovieDetailsUseCase implements BaseMovieUseCase<MovieDetail,MovieDetailsParameters> {
  final BaseMoviesRepository moviesRepository;


  GetMovieDetailsUseCase(this.moviesRepository);


  @override
  Future<Either<Failure, MovieDetail>> call(MovieDetailsParameters parameters) async{
    return await moviesRepository.getMovieDetails(parameters);
  }
}