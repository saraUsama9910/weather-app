import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/services/weather_service.dart';
import 'package:weatherapp/weather_model/weather_model.dart';
import 'package:weatherapp/cubits/get_weather_cubit/get_weather_state.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(WeatherInitialState());
  WeatherModel? weatherModel;
  getWeather({required String cityName}) async {
    try {
      WeatherModel weatherModel = await WeatherService(dio: Dio())
          .getCurrentWeather(cityName: cityName);
      emit(WeatherLoadedState(weatherModel: weatherModel));
    } catch (e) {
      emit(WeatherFailureState(
          errormessage: '😔 there was an error please,try again later!'));
    }
  }
}