part of 'city_bloc.dart';

abstract class CityState extends Equatable {
  @override
  List<Object> get props => [];
}

class CityInitial extends CityState {}

class LoadingCitiesState extends CityState {}

class LoadedCitiesState extends CityState {
  LoadedCitiesState(this.cities);

  final List<City> cities;

  @override
  List<Object> get props => [cities];
}

class ErrorCityState extends CityState {
  final String ciudad = 'Error';
}
