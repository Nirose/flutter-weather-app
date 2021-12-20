import 'package:flutter/material.dart';
import 'package:weather/weather_forecast/model/weather_model.dart';
import 'package:weather/weather_forecast/util/forecast_util.dart';

Widget midView(BuildContext context, AsyncSnapshot<WeatherModel> snapshot) {
  var current = snapshot.data!.current;
  var imgUrl = 'http://openweathermap.org/img/wn/' +
      snapshot.data!.current.weather[0].icon +
      '@4x.png';
  // debugPrint('date: ${snapshot.data!.current.dt.toString()}');
  DateTime dtToDate = DateTime.fromMillisecondsSinceEpoch(
      snapshot.data!.current.dt * 1000,
      isUtc: false);
  // debugPrint(dtToDate.toString());
  SizedBox midView = SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(height: 10),
          Text(
            Util.getFormattedDate(dtToDate),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          SizedBox(
              height: MediaQuery.of(context).size.height / 4,
              child: Image(
                  image: NetworkImage(imgUrl), width: 250, fit: BoxFit.cover)),
          //const Icon(Icons.wb_sunny_sharp, size: 250),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('${current.temp.toStringAsFixed(1)}°C',
                    style: const TextStyle(
                        fontSize: 35, fontWeight: FontWeight.bold)),
                Text(current.weather[0].description.toUpperCase(),
                    style: const TextStyle(fontSize: 15)),
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 4,
                  child: Column(
                    children: [
                      Text('${current.humidity.toString()}%'),
                      const Icon(Icons.umbrella_sharp, size: 25)
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 4,
                  child: Column(
                    children: [
                      Text('${current.windSpeed.toStringAsFixed(0)} m/s'),
                      const Icon(Icons.water_outlined, size: 25)
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 4,
                  child: Column(
                    children: [
                      Text(
                        '${current.pressure.toStringAsFixed(0)} hPa',
                        overflow: TextOverflow.visible,
                        textAlign: TextAlign.center,
                      ),
                      const Icon(Icons.av_timer_rounded, size: 25)
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ));

  return midView;
}
