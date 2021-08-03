class Weather {
  const Weather(this.city, this.weather);

  final String city;
  final double weather;

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      json["title"],
      json['consolidated_weather'][0]['the_temp'],
    );
  }
}
