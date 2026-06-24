import 'package:clean_architecture_and_solid_principles/weather%20app/domain/entities/weather.dart';

import '../../core/utilizes/weather_app_constance.dart';

class WeatherModel extends Weather {
  WeatherModel(
    super.cityName,
    super.condition,
    super.pressureIn,
    super.humidity,
    super.cloud,
  );
  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      json[location][cityName],
      json[current][condition],
      json[pressureIn],
      json[humidity],
      json[cloud],
    );
  }

  /// in our case not used cause we are not sending data to server.
  /// we just getting data from server.
  /// it is just an example.
  // Map<String, dynamic> toJson() {
  //   return {
  //     WeatherAppConstance.location: {
  //       WeatherAppConstance.cityName: cityName,
  //     },
  //     WeatherAppConstance.current: {
  //       WeatherAppConstance.condition: condition,
  //     },
  //     WeatherAppConstance.pressureIn: pressureIn,
  //     WeatherAppConstance.humidity: humidity,
  //     WeatherAppConstance.cloud: cloud,
  //   };
  // }


}
