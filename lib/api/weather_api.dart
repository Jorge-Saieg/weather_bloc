import 'package:dio/dio.dart';

import 'package:weather_bloc/api/weather_repository.dart';
import 'package:weather_bloc/models/city.dart';
import 'package:weather_bloc/models/weather.dart';

const String path = 'https://www.metaweather.com/api/';

class WeatherApi implements WeatherRepository {
  final Dio dio = Dio();

  @override
  Future<Weather> getWeather(int id) async {
    final response = await dio.get(path + 'location/$id/');
    Weather weather = Weather.fromJson(response.data);
    return weather;
  }

  @override
  Future<List<City>> getCity(String query) async {
    final response = await dio.get(path + 'location/search/?query=$query');
    final cities = response.data.map<City>((e) => City.fromJson(e)).toList();
    return cities;
  }
}
