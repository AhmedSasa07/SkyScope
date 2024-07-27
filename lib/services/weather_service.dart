import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app_2/models/weather_model.dart';
class WeatherService {
  final Dio dio;
  final String baseUrl = "https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline" ;
  final String apiKey = "BFG5DWN9E3SK5QN7B67AVL2AT" ;
  WeatherService( {required this.dio});
  Future<WeatherModel> getCurrentWeather ({required String cityName}) async {
    try {
      final encodedCityName = Uri.encodeComponent(cityName);
      Response response = await dio.get(
          "$baseUrl/$encodedCityName/next7days?unitGroup=metric&elements=datetime%2CdatetimeEpoch%2Cname%2Caddress%2CresolvedAddress%2Ctempmax%2Ctempmin%2Ctemp%2Cfeelslike%2Chumidity%2Cwindspeed%2Cuvindex%2Csunrise%2Csunset%2Cmoonphase%2Cconditions%2Cdescription%2Cicon&include=statsfcst%2Cstats%2Cobs%2Cremote%2Cfcst%2Cdays%2Ccurrent&key=$apiKey&contentType=json");
         WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      // TODO
      final String errorMessage =  e.response?.data['error']['message'] ??
          "Oops there was an error X_X, Try again Later";
      throw Exception(errorMessage);
    }  catch (e){
      log(e.toString());
      throw Exception("Oops there was an error X_X, Try again Later");
    }
  }
}