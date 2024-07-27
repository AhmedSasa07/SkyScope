import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_2/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app_2/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app_2/views/home_view.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: const CustomMaterialApp(),
    );
  }
}

class CustomMaterialApp extends StatelessWidget {
  const CustomMaterialApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetWeatherCubit, WeatherStates>(
      builder: (context, state) {
        MaterialColor themeColor = Colors.blue; // Default color

        if (state is SuccessfulWeatherState) {
          themeColor = getThemeColor(state.weatherModel.weatherCondition);
        }

        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: themeColor,
          ),
          home: HomeView(themeColor: themeColor,
          ),
        );
      },
    );
  }
}

MaterialColor getThemeColor(String? condition) {
  condition = condition?.toLowerCase();
  if (condition == null) {
    return Colors.blue;
  }

  // Sunny / Clear conditions
  if (condition.contains('clear') || condition.contains('sunny')) {
    return Colors.amber;
  }



  // Rainy conditions
  else if (condition.contains('rain') || condition.contains('drizzle') ||
      condition.contains('showers') || condition.contains('precip')) {
    return Colors.indigo;
  }

  // Stormy conditions
  else if (condition.contains('storm') || condition.contains('thunder') ||
      condition.contains('lightning')) {
    return Colors.deepPurple;
  }

  // Snowy conditions
  else if (condition.contains('snow') || condition.contains('blizzard') ||
      condition.contains('ice') || condition.contains('freezing')) {
    return Colors.lightBlue;
  }

  // Foggy / Misty conditions
  else if (condition.contains('fog') || condition.contains('mist') ||
      condition.contains('haze')) {
    return Colors.grey;
  }

  // Windy conditions
  else if (condition.contains('wind') || condition.contains('gust') ||
      condition.contains('breez')) {
    return Colors.teal;
  }

  // Hot conditions
  else if (condition.contains('hot') || condition.contains('heat')) {
    return Colors.deepOrange;
  }

  // Cold conditions
  else if (condition.contains('cold') || condition.contains('chill')) {
    return Colors.cyan;
  }

  // Dusty / Smoky conditions
  else if (condition.contains('dust') || condition.contains('sand') ||
      condition.contains('smoke')) {
    return Colors.brown;
  }


  // Partially cloudy
  else if (condition.contains('partly') || condition.contains('variable')) {
    return Colors.lightBlue;
  }

  // Cloudy conditions
  else if (condition.contains('cloud') || condition.contains('overcast')) {
    return Colors.blueGrey;
  }

  // Default color if the condition is not recognized
  else {
    return Colors.blue;
  }
}
