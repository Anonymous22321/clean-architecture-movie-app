abstract class Weather {
  final String cityName;
  final Map<String, dynamic> condition;
  final double pressureIn;
  final int humidity, cloud;

  Weather(
    this.cityName,
    this.condition,
    this.pressureIn,
    this.humidity,
    this.cloud,
  );
}
