import 'package:clean_architecture_and_solid_principles/weather%20app/domain/entities/weather.dart';

/// middle man between client(Use cases) and data source(WeatherRepository)
/// WeatherRepository In domain layer is an interface (Contract)
abstract class ContractWeatherRepository {
  Future<Weather> getWeatherByCity(String city);
}