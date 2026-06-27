import 'package:clean_architecture_and_solid_principles/movie%20app/core/errors/failure.dart';
import 'package:clean_architecture_and_solid_principles/movie%20app/movies/domain/entities/recommendation.dart';
import 'package:clean_architecture_and_solid_principles/movie%20app/movies/domain/repository/base_movies_repository.dart';
import 'package:clean_architecture_and_solid_principles/movie%20app/movies/domain/usecases/base.dart';
import 'package:dartz/dartz.dart';

class GetRecommendationUseCase
    extends BaseMovieUseCase<List<Recommendation>, RecommendationParameters> {
   GetRecommendationUseCase({required this.baseMoviesRepository});

  final BaseMoviesRepository baseMoviesRepository;

  @override
  Future<Either<Failure, List<Recommendation>>> call(
    RecommendationParameters parameters,
  ) async{
    return await baseMoviesRepository.getRecommendation(parameters);
  }
}
