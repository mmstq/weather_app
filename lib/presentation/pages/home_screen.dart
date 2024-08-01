import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/application/bloc/weather_bloc.dart';
import 'package:weather_app/setup.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<WeatherBloc>(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Weather App'),
          actions: [
            IconButton(
              icon: const Icon(Icons.exit_to_app),
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.pushReplacementNamed(context, '/auth');
              },
            ),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('Weather Information:'),
              BlocBuilder<WeatherBloc, WeatherState>(
                builder: (context, state) {
                  if (state is WeatherInitial) {
                    return const Text('Enter a location to get weather');
                  } else if (state is WeatherLoading) {
                    return const CircularProgressIndicator();
                  } else if (state is WeatherLoaded) {
                    return Column(
                      children: [
                        Text('Description: ${state.weather.description}'),
                        Text('Temperature: ${state.weather.temperature}°C'),
                        Text('Humidity: ${state.weather.humidity}%'),
                        Text('Wind Speed: ${state.weather.windSpeed} m/s'),
                      ],
                    );
                  } else if (state is WeatherError) {
                    return Text('Error: ${state.message}');
                  }
                  return Container();
                },
              ),
              ElevatedButton(
                onPressed: () async {
                  final location = await Navigator.pushNamed(context, '/location');
                  if (location != null) {
                    BlocProvider.of<WeatherBloc>(context).add(FetchWeather(location as String));
                  }
                },
                child: const Text('Select Location'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}