import 'package:clean_architecture_and_solid_principles/weather%20app/domain/repository/contract_weather_repository.dart';

import '../entities/weather.dart';

class GetWeatherByCity {
  /// Cause this class is just a contract I can't take an object of this class
  /// So , just taking a reference of the repository.
  final ContractWeatherRepository weatherRepository;

  GetWeatherByCity(this.weatherRepository);


 Future<Weather> execute(String cityName)async{
    return await weatherRepository.getWeatherByCity(cityName);
  }
}