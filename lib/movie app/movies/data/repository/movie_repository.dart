import 'package:clean_architecture_and_solid_principles/movie%20app/movies/data/datasource/movie_remote_data_source.dart';
import 'package:clean_architecture_and_solid_principles/movie%20app/movies/domain/entities/movie.dart';
import 'package:clean_architecture_and_solid_principles/movie%20app/movies/domain/entities/recommendation.dart';
import 'package:clean_architecture_and_solid_principles/movie%20app/movies/domain/repository/base_movies_repository.dart';
import 'package:clean_architecture_and_solid_principles/movie%20app/movies/domain/usecases/base.dart';
import 'package:dartz/dartz.dart';

import '../../../core/errors/exceptions.dart';
import '../../../core/errors/failure.dart';
import '../../domain/entities/movie_details.dart';

class MovieRepository implements BaseMoviesRepository {
  final BaseMovieRemoteDataSource baseMovieRemoteDataSource;

  MovieRepository(this.baseMovieRemoteDataSource);

  @override
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies() async {
    try {
      final result = await baseMovieRemoteDataSource.getNowPlayingMovies();
      return Right(result);
    } on ServerExceptions catch (failure) {
      return Left(ServerFailure(failure.errorModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies() async {
    try {
      final result = await baseMovieRemoteDataSource.getPopularMovies();
      return Right(result);
    } on ServerExceptions catch (failure) {
      return Left(ServerFailure(failure.errorModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRatedMovies() async {
    try {
      final result = await baseMovieRemoteDataSource.getTopRatedMovies();
      return Right(result);
    } on ServerExceptions catch (failure) {
      return Left(ServerFailure(failure.errorModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, MovieDetail>> getMovieDetails(
    MovieDetailsParameters parameters,
  ) async {
    try {
      final result = await baseMovieRemoteDataSource.getMovieDetails(
        parameters,
      );
      return Right(result);
    } on ServerExceptions catch (failure) {
      return Left(ServerFailure(failure.errorModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Recommendation>>> getRecommendation(
    RecommendationParameters parameters,
  ) async {
    try {
      final result = await baseMovieRemoteDataSource.getRecommendation(
        parameters,
      );
      return Right(result);
    } on ServerExceptions catch (failure) {
      return Left(ServerFailure(failure.errorModel.statusMessage));
    }
  }
}
