import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weatherapp/cubits/get_weather_cubit/get_weather_state.dart';
import 'package:weatherapp/data/no_weather_data.dart';
import 'package:weatherapp/data/weather_info_data.dart';
import 'package:weatherapp/views/search_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: const Text(
            'Weather App',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          actions: [
            IconButton(
              color: Colors.black,
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const SearchView();
                }));
              },
              icon: const Icon(Icons.search),
            )
          ],
        ),
        body: BlocBuilder<GetWeatherCubit, WeatherState>(
            builder: (context, state) {
          if (state is WeatherInitialState) {
            return const NoWeatherData();
          } else if (state is WeatherLoadedState) {
            // ignore: prefer_const_constructors
            return WeatherInfoData(
              weatherModel: state.weatherModel,
            );
          } else {
            return const Padding(
              padding: EdgeInsets.all(30),
              child: Center(
                child: Text(
                  '😔 Oops There Is An Error Please,Try Again Later!',
                  style: TextStyle(
                    fontSize: 20,
                    textBaseline: TextBaseline.alphabetic,
                  ),
                ),
              ),
            );
          }
        }));
  }
}
