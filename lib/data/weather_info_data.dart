import 'package:flutter/material.dart';
import 'package:weatherapp/main.dart';
import 'package:weatherapp/model/weather_model.dart';

class WeatherInfoData extends StatelessWidget {
  const WeatherInfoData({Key? key, required this.weatherModel})
      : super(key: key);
  final WeatherModel weatherModel;
  @override
  Widget build(BuildContext context) {
    // var weatherModel=  BlocProvider.of<GetWeatherCubit>(context).weatherModel;  //importance
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
        colors: [
          getMaterialColor(weatherModel.weatherCondition),
          getMaterialColor(weatherModel.weatherCondition)[100]!,
          getMaterialColor(weatherModel.weatherCondition)[50]!,
        ],
      )),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              weatherModel.cityName,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
            Text(
              'updated at ${weatherModel.date.hour}:${weatherModel.date.minute}',
              style: const TextStyle(
                fontSize: 24,
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.network(
                  'https:${weatherModel.image}',
                ),
                Text(
                  weatherModel.temp.toString(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
                ),
                Column(
                  children: [
                    Text(
                      'Maxtemp: ${weatherModel.maxtemp.round()}',
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'Mintemp: ${weatherModel.mintemp.round()}',
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 32,
            ),
            Text(
              weatherModel.weatherCondition,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// DateTime stringToDateTime(String value) {
//   return DateTime.parse(value);
// }
