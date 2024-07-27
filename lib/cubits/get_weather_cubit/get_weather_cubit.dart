import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_2/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app_2/models/weather_model.dart';
import 'package:weather_app_2/services/weather_service.dart';

class GetWeatherCubit extends Cubit<WeatherStates> {
   GetWeatherCubit() : super(intialWeatherState());
  WeatherModel? weatherModel;
  getWeather({required String cityName}) async {
    try {
      weatherModel = await WeatherService(dio: Dio(),).getCurrentWeather(cityName: cityName,);
      log(weatherModel!.cityName);
      emit(SuccessfulWeatherState(weatherModel!));
    } on Exception catch (e) {
      // TODO
      emit(FailedWeatherState() );
    }
  }
}