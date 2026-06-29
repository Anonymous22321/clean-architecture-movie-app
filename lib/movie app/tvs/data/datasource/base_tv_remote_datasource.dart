import 'package:clean_architecture_and_solid_principles/movie%20app/core/api/api_consumer.dart';

import '../../../core/utilizes/constance.dart';
import '../../../movies/domain/usecases/base.dart';
import '../../domain/usecases/base_tv.dart';
import '../models/recommendation_model.dart';
import '../models/tv_details_model.dart';
import '../models/tv_model.dart';

abstract class BaseTvRemoteDatasource
    implements
        GetOnTheAir,
        GetPopular,
        GetTopRated,
        GetTvDetails,
        GetTvRecommendations {}

class TvRemoteDatasource implements BaseTvRemoteDatasource {
  final ApiConsumer _api;

  TvRemoteDatasource({required ApiConsumer api}) : _api = api;

  @override
  Future<List<TvModel>> getOnTheAir() async {
    final response = await _api.get(
      tvBaseURL + TvEndPoints.onTheAir,
      queryParameters: {"api_key": apiKey},
    );
    return List<TvModel>.from(
      (response[results] as List).map((e) => TvModel.fromJson(e)),
    );
  }

  @override
  Future<List<TvModel>> getPopular() async {
    final response = await _api.get(
      tvBaseURL + TvEndPoints.popular,
      queryParameters: {"api_key": apiKey},
    );
    return List<TvModel>.from(
      (response[results] as List).map((e) => TvModel.fromJson(e)),
    );
  }

  @override
  Future<List<TvModel>> getTopRated() async {
    final response = await _api.get(
      tvBaseURL + TvEndPoints.topRated,
      queryParameters: {"api_key": apiKey},
    );
    return List<TvModel>.from(
      (response[results] as List).map((e) => TvModel.fromJson(e)),
    );
  }

  @override
  Future<TvDetailsModel> getTvDetails(TvDetailsParameters parameters) async {
    final response = await _api.get(
      "$tvBaseURL/${parameters.tvId}",
      queryParameters: {"api_key": apiKey},
    );
    return TvDetailsModel.fromJson(response);
  }

  @override
  Future<List<TvRecommendationsModel>> getTvRecommendations(
    RecommendationParameters parameters,
  ) async {
    final response = await _api.get(
      "$tvBaseURL/${parameters.id}/recommendations",
      queryParameters: {"api_key": apiKey},
    );
    return List<TvRecommendationsModel>.from(
      (response[results] as List).map(
        (e) => TvRecommendationsModel.fromJson(e),
      ),
    );
  }
}

/// TV Remote Datasource Methods
abstract class GetOnTheAir {
  Future<List<TvModel>> getOnTheAir();
}

abstract class GetPopular {
  Future<List<TvModel>> getPopular();
}

abstract class GetTopRated {
  Future<List<TvModel>> getTopRated();
}

abstract class GetTvDetails {
  Future<TvDetailsModel> getTvDetails(TvDetailsParameters parameters);
}

abstract class GetTvRecommendations {
  Future<List<TvRecommendationsModel>> getTvRecommendations(
    RecommendationParameters parameters,
  );
}
