import 'package:clean_architecture_and_solid_principles/weather%20app/data/data%20source/remote_datasource.dart';
import 'package:clean_architecture_and_solid_principles/weather%20app/domain/repository/contract_weather_repository.dart';

import '../../domain/entities/weather.dart';

class WeatherRepository implements ContractWeatherRepository{
  final ApiServices datasource;
  final String url;

  WeatherRepository(this.datasource, {required this.url});

  @override
  Future<Weather> getWeatherByCity(String cityName)async {
   return( await datasource.get(url,cityName))!;
  }
}