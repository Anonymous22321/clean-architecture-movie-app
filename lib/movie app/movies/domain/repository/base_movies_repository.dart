import 'package:clean_architecture_and_solid_principles/movie%20app/movies/domain/entities/movie.dart';
import 'package:clean_architecture_and_solid_principles/movie%20app/movies/domain/entities/movie_details.dart';
import 'package:clean_architecture_and_solid_principles/movie%20app/movies/domain/entities/recommendation.dart';
import 'package:clean_architecture_and_solid_principles/movie%20app/movies/domain/usecases/base.dart';
import 'package:dartz/dartz.dart';

import '../../../core/errors/failure.dart';

abstract class BaseMoviesRepository {
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies();
  Future<Either<Failure, List<Movie>>> getPopularMovies();
  Future<Either<Failure, List<Movie>>> getTopRatedMovies();
  Future<Either<Failure, MovieDetail>> getMovieDetails(MovieDetailsParameters parameters);
  Future<Either<Failure, List<Recommendation>>> getRecommendation(RecommendationParameters parameters);

}