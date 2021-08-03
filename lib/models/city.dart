class City {
  City(this.city, this.id);

  final String city;
  final int id;

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      json["title"],
      json['woeid'],
    );
  }
}
