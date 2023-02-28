import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_application/services/weather.dart';
import 'package:weather_application/screens/search.dart';

import 'homepage.dart';
import 'loading_screen.dart';

class SearchLoading extends StatefulWidget {
  SearchLoading({this.city});
  String city;

  @override
  _SearchLoadingState createState() => _SearchLoadingState();
}

class _SearchLoadingState extends State<SearchLoading> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    searchData(widget.city);
  }

  void searchData(String city) async {
    Weather weather = Weather();
    var searchData = await weather.getSearchWeather(city);

    if (searchData == null) {
      // display error message if location data is null
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('City not found!'),
        ),
      );
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return LoadingScreen();
      }));
    } else {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return Search(
          locationWeather: searchData,
        );
      }));
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
