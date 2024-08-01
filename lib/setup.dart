import 'package:get_it/get_it.dart';
import 'application/services/auth_service.dart';
import 'application/services/weather_service.dart';
import 'application/services/location_service.dart';
import 'infrastructure/data_sources/weather_local_data_source.dart';
import 'application/bloc/weather_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final GetIt getIt = GetIt.instance;

void setup() {
  // Services
  getIt.registerLazySingleton<AuthService>(() => AuthService());
  getIt.registerLazySingleton<WeatherService>(() => WeatherService());
  getIt.registerLazySingleton<LocationService>(() => LocationService());
  getIt.registerLazySingleton<WeatherLocalDataSource>(() => WeatherLocalDataSource());

  // BLoC
  getIt.registerFactory<WeatherBloc>(() => WeatherBloc(getIt<WeatherService>()));
}