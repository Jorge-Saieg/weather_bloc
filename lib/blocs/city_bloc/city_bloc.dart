import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_bloc/api/weather_repository.dart';
import 'package:weather_bloc/models/city.dart';

part 'city_event.dart';
part 'city_state.dart';

class CityBloc extends Bloc<CityEvent, CityState> {
  final WeatherRepository weatherRepository;
  CityBloc(this.weatherRepository) : super(CityInitial());

  @override
  Stream<CityState> mapEventToState(event) async* {
    if (event is GetCities) {
      yield LoadingCitiesState();
      final cities = await weatherRepository.getCity(event.query);
      yield LoadedCitiesState(cities);
    }
  }
}
