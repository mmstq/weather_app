class Weather {
  final String description;
  final double temperature;
  final int humidity;
  final double windSpeed;

  Weather({
    required this.description,
    required this.temperature,
    required this.humidity,
    required this.windSpeed,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      description: json['weather'][0]['description'],
      temperature: json['main']['temp'],
      humidity: json['main']['humidity'],
      windSpeed: json['wind']['speed'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'weather': [{'description': description}],
      'main': {'temp': temperature, 'humidity': humidity},
      'wind': {'speed': windSpeed},
    };
  }
}
