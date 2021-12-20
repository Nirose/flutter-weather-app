import 'package:weather/weather_forecast/model/geo.dart';
import 'package:weather/weather_forecast/ui/bottom_view.dart';
import 'package:weather/weather_forecast/ui/mid_view.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
//import 'dart:developer';

import 'model/weather_model.dart';
import 'network/network.dart';

class WeatherForecast extends StatefulWidget {
  const WeatherForecast({Key? key}) : super(key: key);

  @override
  _WeatherForecastState createState() => _WeatherForecastState();
}

class _WeatherForecastState extends State<WeatherForecast> {
  Future<WeatherModel>? weatherObject;

  late Future<GeoModel> geoData;

  double _lat = 0;
  double _lon = 0;
  String _city = 'banepa';
  String _country = '';

  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
    getWeather(_city);
    //inspect(weatherObject);
    //for Debug
    //weatherObject.then((weather) => {print(weather.timezone)});
  }

  getWeather(String city) {
    geoData = Network().getGeoDetails(city);
    //inspect(geoData);

    geoData
        .then((geo) => {
              debugPrint(geo.lon.toString()),
              debugPrint(geo.lat.toString()),
              _lat = geo.lat,
              _lon = geo.lon,
              _city = geo.name,
              _country = geo.country,
              setState(() => {
                    weatherObject =
                        Network().getWeatherForecast(lat: _lat, lon: _lon)
                  })
            })
        .catchError((onError) => {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  backgroundColor: Colors.red,
                  content: Text("Check the city name or internet connection"),
                  duration: Duration(seconds: 3),
                ),
              )
            });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: const Text("Weather"),
        //   centerTitle: true,
        // ),
        body: ListView(
      children: <Widget>[
        textFieldView(),
        Container(
          alignment: Alignment.center,
          child: FutureBuilder<WeatherModel>(
            future: weatherObject,
            builder: (context, AsyncSnapshot<WeatherModel> snapshot) {
              //late final obj = snapshot.data!;
              if (snapshot.hasData) {
                return Column(children: [
                  Text(
                    "$_city, $_country",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                  midView(context, snapshot),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: bottomView(context, snapshot),
                  )
                  // midView(snapshot),
                ]);
              } else if (snapshot.hasError) {
                throw Exception("Error: Check data or internet!");
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ],
    ));
  }

  Widget textFieldView() {
    return Container(
      margin: const EdgeInsets.all(10),
      child: TextField(
        decoration: InputDecoration(
          hintText: "Enter City Name",
          suffixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          contentPadding: const EdgeInsets.all(10),
        ),
        onSubmitted: (value) => {
          if (value.isNotEmpty)
            {
              setState(() {
                getWeather(value);
              })
            }
          else
            {
              setState(() {
                _city = 'Banepa';
                getWeather(_city);
              })
            }
        },
      ),
    );
  }
}
