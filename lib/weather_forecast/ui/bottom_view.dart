import 'package:weather/weather_forecast/model/weather_model.dart';
import 'package:flutter/material.dart';
import 'package:weather/weather_forecast/util/forecast_util.dart';

Widget bottomView(BuildContext context, AsyncSnapshot<WeatherModel> snapshot) {
  var forecast = snapshot.data!.daily;
  return SizedBox(
    height: 150,
    width: MediaQuery.of(context).size.width,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: forecast.length,
      itemBuilder: (context, index) => ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(Util.getFormattedDay(DateTime.fromMillisecondsSinceEpoch(
                forecast[index].dt * 1000))),
            Image(
                image: NetworkImage('http://openweathermap.org/img/wn/' +
                    forecast[index].weather[0].icon +
                    '@2x.png')),
            Text(forecast[index].weather[0].main),
            Expanded(child: Text('${forecast[index].humidity.toString()}%'))
          ],
        ),
      ),
    ),
  );
}
