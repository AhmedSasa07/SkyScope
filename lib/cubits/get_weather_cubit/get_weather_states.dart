import '../../models/weather_model.dart';

class WeatherStates{}

class intialWeatherState extends WeatherStates {}

class SuccessfulWeatherState extends WeatherStates {
  final WeatherModel weatherModel;

  SuccessfulWeatherState(this.weatherModel);
}

class FailedWeatherState extends WeatherStates {}
