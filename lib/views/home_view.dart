import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_2/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app_2/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app_2/views/search_view.dart';
import 'package:weather_app_2/widgets/no_weather_body.dart';
import 'package:weather_app_2/widgets/weathe_info_body_3.dart';
import 'package:weather_app_2/widgets/weather_info_body.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeView extends StatelessWidget {
  final MaterialColor themeColor;

  const HomeView({Key? key, required this.themeColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, child) {
        return Scaffold(
          appBar: AppBar(
            // elevation: 50,
            shadowColor: Colors.transparent,
            title: const Text('SkyScope',
            style: TextStyle(
            fontWeight: FontWeight.bold,
              fontFamily: "Oswald",
            fontSize: 32,),
            ),

            backgroundColor: themeColor, // Use the themeColor for AppBar
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SearchView(),
                    ),
                  );
                },
                icon: const Icon(Icons.search_sharp),
                iconSize: 35,
                color: Colors.black,
              ),
            ],
          ),
          body: BlocBuilder<GetWeatherCubit, WeatherStates>(
            builder: (context, state) {
              if (state is intialWeatherState) {
                return const NoWeatherBody();
              } else if (state is SuccessfulWeatherState) {
                return WeatherInfoBody(
                  weather: state.weatherModel,
                  themeColor: themeColor, // Pass themeColor to WeatherInfoBody
                );
              } else {
                return const Text("Oops, there was an error",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: "Oswald",
                    fontSize: 32,),);
              }
            },
          ),
        );
      },
    );
  }
}