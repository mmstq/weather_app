import 'package:hive/hive.dart';
import 'package:weather_app/domain/entities/weather.dart';

class WeatherLocalDataSource {
  Future<void> saveWeatherInfo(Weather weather) async {
    var box = await Hive.openBox('weatherBox');
    box.put('lastWeatherInfo', weather.toJson());
  }

  Future<Weather?> getLastWeatherInfo() async {
    var box = await Hive.openBox('weatherBox');
    var weatherData = box.get('lastWeatherInfo');
    if (weatherData != null) {
      return Weather.fromJson(weatherData);
    }
    return null;
  }
}
