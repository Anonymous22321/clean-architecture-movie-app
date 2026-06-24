import 'package:clean_architecture_and_solid_principles/movie%20app/core/api/api_consumer.dart';
import 'package:clean_architecture_and_solid_principles/movie%20app/core/api/dio_consumer.dart';
import 'package:clean_architecture_and_solid_principles/movie%20app/movies/data/datasource/movie_remote_data_source.dart';
import 'package:clean_architecture_and_solid_principles/movie%20app/movies/domain/repository/base_movies_repository.dart';
import 'package:clean_architecture_and_solid_principles/movie%20app/movies/domain/usecases/get_movie_details.dart';
import 'package:clean_architecture_and_solid_principles/movie%20app/movies/domain/usecases/get_now_playing_movies.dart';
import 'package:clean_architecture_and_solid_principles/movie%20app/movies/domain/usecases/get_recommendation.dart';
import 'package:clean_architecture_and_solid_principles/movie%20app/movies/presentation/controller/movie_controller.dart';
import 'package:get_it/get_it.dart';

import '../../movies/data/repository/movie_repository.dart';
import '../../movies/domain/usecases/get_popular_movies.dart';
import '../../movies/domain/usecases/get_top_rated_movies.dart';

final GetIt getIt = GetIt.instance;

void setupServiceLocator() {
  /// Use Cases
  getIt.registerLazySingleton(
    () => GetNowPlayingMoviesUseCase(getIt<BaseMoviesRepository>()),
  );
  getIt.registerLazySingleton(
    () => GetPopularMoviesUseCase(getIt<BaseMoviesRepository>()),
  );
  getIt.registerLazySingleton(
    () => GetTopRatedMoviesUseCase(getIt<BaseMoviesRepository>()),
  );

  getIt.registerLazySingleton(
    () => GetMovieDetailsUseCase(getIt<BaseMoviesRepository>()),
  );
  getIt.registerLazySingleton(
    () => GetRecommendationUseCase(
      baseMoviesRepository: getIt<BaseMoviesRepository>(),
    ),
  );

  /// Repository
  getIt.registerLazySingleton<BaseMoviesRepository>(
    () => MovieRepository(getIt<BaseMovieRemoteDataSource>()),
  );

  /// Data Source
  getIt.registerLazySingleton<BaseMovieRemoteDataSource>(
    () => MovieRemoteDataSource(api: getIt<ApiConsumer>()),
  );

  /// Api Consumer
  getIt.registerLazySingleton<ApiConsumer>(() => DioConsumer());

  /// Controller
  getIt.registerFactory<MovieController>(
    () => MovieController(
      getIt<GetNowPlayingMoviesUseCase>(),
      getIt<GetPopularMoviesUseCase>(),
      getIt<GetTopRatedMoviesUseCase>(),
      getIt<GetMovieDetailsUseCase>(),
      getIt<GetRecommendationUseCase>(),
    ),
  );
}
