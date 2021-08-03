abstract class WeatherEvent {}

class SelectedCity extends WeatherEvent {
  SelectedCity(this.id);

  final int id;
}
