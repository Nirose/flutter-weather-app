import 'package:weather/weather_forecast/model/geo.dart';
import 'package:weather/weather_forecast/model/weather_model.dart';
import 'package:weather/weather_forecast/util/forecast_util.dart';
import 'package:http/http.dart';
import 'dart:convert';

class BadData implements Exception {
  String error() => 'Something is wront with the data';
}

class Network {
  Future<WeatherModel> getWeatherForecast(
      {required double lat, required double lon}) async {
    var finalUrl = 'https://api.openweathermap.org/data/2.5/onecall?lat=' +
        lat.toString() +
        '&lon=' +
        lon.toString() +
        '&exclude=minutely,hourly&units=metric&appid=' +
        Util.appId;

    //debugPrint(finalUrl);

    final response = await get(Uri.parse(finalUrl));

    if (response.statusCode == 200) {
      //print(response.body);
      return WeatherModel.fromJson(json.decode(response.body));
    } else {
      throw Exception("Error getting data");
    }
  }

  Future<GeoModel> getGeoDetails(String query) async {
    var geoUrl = 'https://api.openweathermap.org/geo/1.0/direct?q=' +
        query +
        '&limit=1&appid=' +
        Util.appId;
    //debugPrint(geoUrl);
    final response = await get(Uri.parse(geoUrl));
    if (response.statusCode == 200 && response.body != '[]') {
      //print(response.body);
      return GeoModel.fromJson(json.decode(response.body)[0]);
    } else {
      throw BadData();
    }
  }
}
