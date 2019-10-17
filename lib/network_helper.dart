import 'dart:convert';

import 'package:http/http.dart';

class NetworkHelper {
  double latitude;
  double longitude;
  String cityName;
  String url;

  NetworkHelper({this.latitude, this.longitude, this.cityName}) {
    if (this.cityName == null || this.cityName == '') {
      this.url =
          'https://api.openweathermap.org/data/2.5/weather?lat=${this.latitude}&lon=${this.longitude}&appid=4f7b32dc58f4ac156caec77d106358f8';
    } else
      this.url =
          'https://api.openweathermap.org/data/2.5/weather?q=${this.cityName}&appid=4f7b32dc58f4ac156caec77d106358f8';
  }

  Future<Map> fetchWeatherInfo() async {
    Response response = await get(this.url);
    print(response.statusCode);
    print(response.body);
    Map weatherMap = jsonDecode(response.body);

    return weatherMap;
  }
}
