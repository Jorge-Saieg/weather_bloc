import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:weather_bloc/api/weather_repository.dart';
import 'package:weather_bloc/blocs/weather_bloc/weather_event.dart';
import 'package:weather_bloc/blocs/weather_bloc/weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository;

  WeatherBloc(this.weatherRepository) : super(InitalWeatherState());

  @override
  Stream<WeatherState> mapEventToState(event) async* {
    if (event is SelectedCity) {
      yield LoadingWeatherState();
      final response = await weatherRepository.getWeather(event.id);
      yield LoadedWeatherState(response.city, response.weather);
    }
  }
}
