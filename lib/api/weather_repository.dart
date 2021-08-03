import 'package:weather_bloc/models/city.dart';
import 'package:weather_bloc/models/weather.dart';

abstract class WeatherRepository {
  Future<List<City>> getCity(String query);
  Future<Weather> getWeather(int id);
}
