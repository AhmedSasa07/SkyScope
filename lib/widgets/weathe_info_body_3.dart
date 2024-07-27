import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app_2/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app_2/main.dart';
import 'package:weather_app_2/models/weather_model.dart';

class WeatherInfoBody3 extends StatelessWidget {
  const WeatherInfoBody3(
      {super.key,
      required WeatherModel weather,
      required MaterialColor themeColor});


  @override
  Widget build(BuildContext context) {
    WeatherModel weatherModel =
        BlocProvider.of<GetWeatherCubit>(context).weatherModel!;
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              getThemeColor(weatherModel.weatherCondition)[50]!,
              getThemeColor(weatherModel.weatherCondition)[300]!,
              getThemeColor(weatherModel.weatherCondition),
            ],
            begin:Alignment.bottomCenter ,
            end: Alignment.topCenter,
            )

      ),
      child: Center(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [

              Icon(
                Icons.location_on,
                size: 40,
              ),
              Text(
                capitalize(weatherModel.cityName),
                style: TextStyle(
                  fontFamily: "Oswald",
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                ),
              ),
              Spacer(),
              Lottie.asset(getWeatherCondition(weatherModel.weatherCondition)),
              Spacer(),
              Text(
                "${weatherModel.feelTemp.round()}°C",
                style: TextStyle(
                  fontFamily: "Oswald",
                  fontWeight: FontWeight.bold,
                  fontSize: 48,
                ),
              ),
              // Spacer(),
              Text(
                weatherModel.weatherCondition,
                style: TextStyle(
                  fontFamily: "Oswald",
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                ),
              ),
              Spacer(),
            ])),
      ),
    );
  }
}
String capitalize(String s) => s[0].toUpperCase() + s.substring(1).toLowerCase();

String getWeatherCondition(String? condition) {
  if (condition == null) {
    return 'assets/images/sunny.json';
  }

  String lowerCondition = condition.toLowerCase();

  if (lowerCondition.contains('clear') || lowerCondition.contains('sunny')) {
    return 'assets/images/sunny.json';
  }  else if (lowerCondition.contains('rain') || lowerCondition.contains('drizzle') ||
      lowerCondition.contains('showers') || lowerCondition.contains('precip')) {
    return 'assets/images/rain.json';
  } else if (lowerCondition.contains('storm') || lowerCondition.contains('thunder') ||
      lowerCondition.contains('lightning')) {
    return 'assets/images/thunder.json';
  } else if (lowerCondition.contains('snow') || lowerCondition.contains('blizzard') ||
      lowerCondition.contains('ice') || lowerCondition.contains('freezing')) {
    return 'assets/images/snow.json';
  } else if (lowerCondition.contains('cloud') || lowerCondition.contains('overcast')) {
    return 'assets/images/cloudy.json';
  } else {
    return 'assets/images/sunny.json';
  }
}

