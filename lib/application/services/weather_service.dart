import 'package:dio/dio.dart';
import 'package:weather_app/domain/entities/weather.dart';

class WeatherService {
  final Dio _dio = Dio();

  Future<Weather> fetchWeather(String location) async {
    final response = await _dio.get('https://api.openweathermap.org/data/2.5/weather', queryParameters: {
      'q': location,
      'appid': 'YOUR_API_KEY',
    });

    return Weather.fromJson(response.data);
  }
}
