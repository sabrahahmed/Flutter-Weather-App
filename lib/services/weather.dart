import 'package:flutter/cupertino.dart';
import 'package:weather_application/services/location.dart';
import 'package:weather_application/services/connection.dart';
import 'package:flutter_weather_icons/flutter_weather_icons.dart';
import 'package:flutter_weather_bg/flutter_weather_bg.dart';

const apiKey = 'dbea4ea971dae66957a42a2a445760be';

class Weather {
  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();

    Connection connection = Connection(
        'https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');

    var weatherData = await connection.getWeatherData();
    return weatherData;
  }

  Future<dynamic> getSearchWeather(String city) async {
    Location location = Location();
    await location.getCurrentLocation();

    Connection searchLocation = Connection(
        'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric');

    var weatherData = await searchLocation.getWeatherData();
    return weatherData;
  }

  String getWeatherBackground(int condition) {
    // if (condition < 300) {
    //   return 'images/thunder.jpg'; //thunder
    // } else if (condition < 600) {
    //   return 'images/rain.jpg'; // rain
    // } else if (condition < 700) {
    //   return 'images/snow.jpg'; //snowing
    // } else if (condition < 800) {
    //   return 'images/fog.jpg'; //foggy
    // } else if (condition == 800) {
    //   return 'images/sunny.jpg'; //sunny
    // } else if (condition <= 804) {
    //   return 'images/cloudy.jpg'; //cloudy
    // } else {
    return 'images/idk.jpg'; //blue background
    // }
  }

  IconData getWeatherIcon(int condition) {
    if (condition < 300) {
      return WeatherIcons.wiThunderstorm; //thunder
    } else if (condition < 600) {
      return WeatherIcons.wiRain; // rain
    } else if (condition < 700) {
      return WeatherIcons.wiSnow; //snowing
    } else if (condition < 800) {
      return WeatherIcons.wiFog; //foggy
    } else if (condition == 800) {
      return WeatherIcons.wiDaySunny; //sunny
    } else if (condition <= 804) {
      return WeatherIcons.wiCloudy; //cloudy
    } else {
      return WeatherIcons.wiDaySunny; //blue background
    }
  }
}
