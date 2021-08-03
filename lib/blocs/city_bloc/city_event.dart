part of 'city_bloc.dart';

abstract class CityEvent extends Equatable {
  const CityEvent(this.query);

  final String query;

  @override
  List<Object> get props => [];
}

class GetCities extends CityEvent {
  GetCities(this.query) : super('');

  final String query;
}
