import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/presentation/pages/location_selection_screen.dart';
import 'package:weather_app/setup.dart';

import 'presentation/pages/auth_screen.dart';
import 'presentation/pages/home_screen.dart';
import 'presentation/pages/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setup();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/auth': (context) => AuthScreen(),
        '/home': (context) => const HomeScreen(),
        '/location': (context) => LocationSelectionScreen(),
      },
    );
  }
}
