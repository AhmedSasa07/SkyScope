class WeatherModel {
  final String cityName;
  final String timestamp;
  final double currentTemp;
  final double feelTemp;
  final double maxTemp;
  final double minTemp;
  final String weatherCondition;
  final String image;
  final double windSpeed;
  final double hummiditiy;
  final double day1Temp;
  final double day2Temp;
  final double day3Temp;
  final double day4Temp;
  final double day5Temp;
  final double day6Temp;

  WeatherModel(
      {required this.cityName,
        required this.timestamp,
      required this.currentTemp,
        required this.feelTemp,
      required this.maxTemp,
      required this.minTemp,
      required this.weatherCondition,
      required this.image,
      required this.windSpeed,
      required this.hummiditiy,
      required this.day1Temp,
      required this.day2Temp,
      required this.day3Temp,
      required this.day4Temp,
      required this.day5Temp,
      required this.day6Temp});
  factory WeatherModel.fromJson (json){
    return WeatherModel(
        cityName: json['address'],
        currentTemp: json['days'][0]['temp'],
        feelTemp: json['currentConditions']['feelslike'],
        maxTemp: json['days'][0]['tempmax'],
        minTemp: json['days'][0]['tempmin'],
        weatherCondition:json['days'][0]['conditions'],
        image:json['days'][0]['icon'] ,
        windSpeed: json['days'][0]['windspeed'],
        hummiditiy: json['currentConditions']['humidity'],
        day1Temp:  json['days'][1]['temp'],
        day2Temp:  json['days'][2]['temp'],
        day3Temp:  json['days'][3]['temp'],
        day4Temp:  json['days'][4]['temp'],
        day5Temp:  json['days'][5]['temp'],
        day6Temp:  json['days'][6]['temp'],
      timestamp: json['currentConditions']['datetime'],
    );
  }
}
