import 'package:weather_bloc/api/weather_repository.dart';
import 'package:weather_bloc/models/city.dart';
import 'package:weather_bloc/models/weather.dart';

class WeatherDB implements WeatherRepository {
  @override
  Future<Weather> getWeather(int id) {
    return Future.value();
  }

  @override
  Future<List<City>> getCity(String query) {
    // TODO: implement getCity
    throw UnimplementedError();
  }
}
