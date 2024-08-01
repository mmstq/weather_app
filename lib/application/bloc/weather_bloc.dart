import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/application/services/weather_service.dart';
import 'package:weather_app/domain/entities/weather.dart';

// Event
abstract class WeatherEvent {}

class FetchWeather extends WeatherEvent {
  final String location;
  FetchWeather(this.location);
}

// State
abstract class WeatherState {}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherLoaded extends WeatherState {
  final Weather weather;
  WeatherLoaded(this.weather);
}

class WeatherError extends WeatherState {
  final String message;
  WeatherError(this.message);
}

// Bloc
class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherService weatherService;

  WeatherBloc(this.weatherService) : super(WeatherInitial());

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
    if (event is FetchWeather) {
      yield WeatherLoading();
      try {
        final weather = await weatherService.fetchWeather(event.location);
        yield WeatherLoaded(weather);
      } catch (e) {
        yield WeatherError("Could not fetch weather");
      }
    }
  }
}
