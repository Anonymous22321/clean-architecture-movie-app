
import 'package:clean_architecture_and_solid_principles/weather%20app/data/model/weather_model.dart';
import 'package:dio/dio.dart';

import '../../core/utilizes/weather_app_constance.dart';

abstract class ApiServices{
 Future  get(String url,String query);
}
class RemoteDatasource implements ApiServices{
  final Dio _dio = Dio();
  @override
  Future<WeatherModel?> get(String url,String query) async{
    try{
     final  response = await _dio.get("$url?key=$apiKey&q=$query&aqi=no");
     print(response.statusCode);
     return WeatherModel.fromJson(response.data);
    }catch(e){
      print(e);
      /// making it nullable is the worst case scenario.
      /// but while it is just example we can use it.
      return null;
    }
  }

}