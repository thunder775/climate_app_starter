import 'package:clima/location_screen.dart';
import 'package:clima/network_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'location.dart';

class LoadingScreen extends StatefulWidget {
  String cityName;

  LoadingScreen({this.cityName});

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    print('city name: ${widget.cityName}');
    print('init called');
    getCurrentLocation();
    super.initState();
  }

  void getCurrentLocation() async {
    Location location = new Location();
    await location.getLocation();
    getWeatherData(location.latitude, location.longitude);
  }

  void getWeatherData(double lat, double long) async {
    NetworkHelper networkHelper = new NetworkHelper(
        latitude: lat, longitude: long, cityName: widget.cityName);
    Map result = await networkHelper.fetchWeatherInfo();
    Navigator.pushReplacement(
        (context),
        MaterialPageRoute(
            builder: (context) => LocationScreen(
                  jsonMap: result,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SpinKitRotatingCircle(
        color: Colors.white,
        size: 50.0,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
