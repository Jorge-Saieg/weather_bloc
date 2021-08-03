import 'package:equatable/equatable.dart';

abstract class WeatherState extends Equatable {}

class InitalWeatherState extends WeatherState {
  @override
  List<Object?> get props => [];
}

class LoadingWeatherState extends WeatherState {
  @override
  List<Object?> get props => [];
}

class LoadedWeatherState extends WeatherState {
  LoadedWeatherState(this.city, this.temp);

  final String city;
  final double temp;

  @override
  List<Object?> get props => [city, temp];
}

class ErrorWeatherState extends WeatherState {
  final String ciudad = 'Error';

  @override
  List<Object?> get props => [ciudad];
}
