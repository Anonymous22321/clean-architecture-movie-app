import 'package:clean_architecture_and_solid_principles/movie%20app/core/api/api_consumer.dart';

import '../../../core/utilizes/constance.dart';
import '../models/tv_model.dart';

abstract class BaseTvRemoteDatasource implements GetOnTheAir, GetPopular {}

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
  Future<List<TvModel>> getPopular() async{
    final response = await _api.get(
      tvBaseURL + TvEndPoints.popular,
      queryParameters: {"api_key": apiKey},
    );
    return List<TvModel>.from(
      (response[results] as List).map((e) => TvModel.fromJson(e)),
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
