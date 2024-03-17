import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weatherapp/cubits/get_weather_cubit/get_weather_state.dart';
import 'package:weatherapp/views/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder: (context) => BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                  primarySwatch: getMaterialColor(
                BlocProvider.of<GetWeatherCubit>(context)
                    .weatherModel
                    ?.weatherCondition,
              )),
              home: const HomeView(),
            );
          },
        ),
      ),
    );
  }
}

MaterialColor getMaterialColor(String? condition) {
  if (condition == null) {
    return Colors.blue;
  }

  switch (condition) {
    case 'Sunny':
      return Colors.orange;
    case 'Partly cloudy':
      return Colors.yellow;
    case 'Cloudy':
    case 'Overcast':
      return Colors.grey;
    case 'Mist':
    case 'Fog':
    case 'Freezing fog':
      return Colors.grey;
    case 'Patchy rain possible':
    case 'Patchy light drizzle':
    case 'Patchy light rain':
      return Colors.lightBlue;
    case 'Light drizzle':
    case 'Light rain':
      return Colors.lightBlue;
    case 'Moderate rain at times':
    case 'Moderate rain':
      return Colors.blue;
    case 'Heavy rain at times':
    case 'Heavy rain':
      return Colors.indigo;
    case 'Light freezing rain':
    case 'Moderate or heavy freezing rain':
      return Colors.lightBlue; // Light blue for freezing rain
    case 'Patchy sleet possible':
    case 'Patchy light sleet':
    case 'Light sleet':
      return Colors.blueGrey; // Light blue-grey for sleet
    case 'Moderate or heavy sleet':
      return Colors.blueGrey; // Medium blue-grey for moderate or heavy sleet
    case 'Patchy snow possible':
    case 'Patchy light snow':
    case 'Light snow':
      return Colors.lightBlue; // Light blue for light snow
    case 'Patchy moderate snow':
    case 'Moderate snow':
      return Colors.lightBlue; // Medium blue for moderate snow
    case 'Patchy heavy snow':
    case 'Heavy snow':
      return Colors.lightBlue; // Dark blue for heavy snow
    case 'Ice pellets':
      return Colors.blueGrey; // Blue-grey for ice pellets
    case 'Light rain shower':
      return Colors.lightBlue; // Light blue for light rain shower
    case 'Moderate or heavy rain shower':
    case 'Torrential rain shower':
      return Colors
          .indigo; // Dark blue for moderate or heavy rain shower, torrential rain shower
    case 'Light sleet showers':
      return Colors.blueGrey; // Light blue-grey for light sleet showers
    case 'Moderate or heavy sleet showers':
      return Colors
          .blueGrey; // Medium blue-grey for moderate or heavy sleet showers
    case 'Light snow showers':
      return Colors.lightBlue; // Light blue for light snow showers
    case 'Moderate or heavy snow showers':
      return Colors.lightBlue; // Medium blue for moderate or heavy snow showers
    case 'Light showers of ice pellets':
      return Colors.blueGrey; // Blue-grey for light showers of ice pellets
    case 'Moderate or heavy showers of ice pellets':
      return Colors
          .blueGrey; // Dark blue-grey for moderate or heavy showers of ice pellets
    case 'Patchy light rain with thunder':
    case 'Moderate or heavy rain with thunder':
      return Colors.deepPurple; // Deep purple for rain with thunder
    case 'Patchy light snow with thunder':
    case 'Moderate or heavy snow with thunder':
      return Colors.deepPurple; // Deep purple accent for snow with thunder
    default:
      return Colors.grey; // Default color for unknown conditions
  }
}
