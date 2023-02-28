import 'package:flutter/material.dart';
import 'package:weather_application/screens/homepage.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_application/services/weather.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    Weather weather = Weather();
    var weatherData = await weather.getLocationWeather();

    if (weatherData == null) {
      // display error message if location data is null
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('City not found'),
        ),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return Homepage(
              locationWeather: weatherData,
            );
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SpinKitFadingCube(color: Colors.blue, size: 100.0),
        ],
      ),
    );
  }
}
