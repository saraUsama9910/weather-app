import 'package:weatherapp/weather_model/weather_model.dart';

class WeatherState {}

class WeatherLoadingState extends WeatherState {}

class WeatherLoadedState extends WeatherState {
  final WeatherModel weatherModel;
  WeatherLoadedState({required this.weatherModel});
}

class WeatherFailureState extends WeatherState {
  final String errormessage;
  WeatherFailureState({required this.errormessage});
}