import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app_2/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app_2/main.dart';
import 'package:weather_app_2/models/weather_model.dart';

import 'weathe_info_body_3.dart';
class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({Key? key, required this.weather, required MaterialColor themeColor}) : super(key: key);
  final WeatherModel weather;
  @override
  Widget build(BuildContext context) {
    dynamic currentTime = DateFormat.jm().format(DateTime.now());
    WeatherModel weatherModel =  BlocProvider.of<GetWeatherCubit>(context).weatherModel!;
    return Container(
      decoration: BoxDecoration(
        gradient: RadialGradient(
            colors: [
              getThemeColor(weatherModel.weatherCondition)[50]!,
              getThemeColor(weatherModel.weatherCondition)[300]!,
              getThemeColor(weatherModel.weatherCondition),


            ],
          center:Alignment.center ,
          // focalRadius: double.infinity,
          radius: 1,

        )

      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
             Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Text(
                  'Updated at ',
                  style: TextStyle(
                    fontFamily: "Oswald",
                    fontSize: 24,
                  ),
                           ),
                 Text(
                  '${currentTime}',
                  style: TextStyle(
                    fontFamily: "Oswald",
                    fontSize: 24,
                  ),
                           ),
               ],
             ),
            Spacer(),

            // Image.asset(
            //     getWeatherPic(weatherModel.weatherCondition).assetPath,
            // ),
            Lottie.asset(getWeatherCondition(weatherModel.weatherCondition)),
            Text(

              "${weatherModel.feelTemp.round()}°C",
              style: TextStyle(
                fontFamily: "Oswald",
                fontWeight: FontWeight.bold,
                fontSize: 120,
              ),
            ),

            Column(
              children: [
                Text(
                  "Max Temp. : ${weatherModel.maxTemp.round()}°C",
                  style: TextStyle(
                    fontFamily: "Oswald",
                    fontWeight: FontWeight.w900,
                    fontSize: 22,
                  ),
                ),
                Text(
                  "Min Temp. : ${weatherModel.minTemp.round()}°C",
                  style: TextStyle(
                    fontFamily: "Oswald",
                    fontWeight: FontWeight.w300,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            Spacer(),
             Text(
               weatherModel.weatherCondition,
              style: TextStyle(
                fontFamily: "Oswald",
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
            Spacer(flex: 2,),
          ],
        ),
      ),
    );
  }
}
DateTime StringToTime(String value) {
 return DateTime.parse(value);
}

class WeatherPic {
  final String assetPath;

  WeatherPic(this.assetPath);
}

WeatherPic getWeatherPic(String? condition) {
  condition = condition?.toLowerCase();
  if (condition == null) {
    return WeatherPic('assets/images/clear.png');
  }

  // Sunny / Clear conditions
  if (condition.contains('clear') || condition.contains('sunny')) {
    return WeatherPic('assets/images/clear.png');
  }

  // Cloudy conditions
  else if (condition.contains('cloud') || condition.contains('overcast')) {
    return WeatherPic('assets/images/cloudy.png');
  }

  // Rainy conditions
  else if (condition.contains('rain') || condition.contains('drizzle') ||
      condition.contains('showers') || condition.contains('precip')) {
    return WeatherPic('assets/images/rainy.png');
  }

  // Stormy conditions
  else if (condition.contains('storm') || condition.contains('thunder') ||
      condition.contains('lightning')) {
    return WeatherPic('assets/images/thunderstorm.png');
  }

  // Snowy conditions
  else if (condition.contains('snow') || condition.contains('blizzard') ||
      condition.contains('ice') || condition.contains('freezing')) {
    return WeatherPic('assets/images/snow.png');
  }

  // Default
  else {
    return WeatherPic('assets/images/clear.png');
  }
}