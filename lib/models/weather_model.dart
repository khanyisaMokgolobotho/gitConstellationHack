class WeatherModel {
  String location;
  double temperature;
  String condition; // E.g., "Rainy", "Sunny"

  WeatherModel({required this.location, required this.temperature, required this.condition});

  // From JSON
  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      location: json['location'],
      temperature: json['temperature'],
      condition: json['condition'],
    );
  }

  // To JSON
  Map<String, dynamic> toJson() {
    return {
      'location': location,
      'temperature': temperature,
      'condition': condition,
    };
  }
}
