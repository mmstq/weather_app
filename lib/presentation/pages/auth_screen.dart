import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/application/services/auth_service.dart';
import 'package:weather_app/setup.dart';
class AuthScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            ElevatedButton(
              onPressed: () async {
                AuthService authService = getIt<AuthService>();
                User? user = await authService.signInWithEmail(
                  emailController.text,
                  passwordController.text,
                );
                if (user != null) {
                  Navigator.pushReplacementNamed(context, '/home');
                } else {
                  // Handle login error
                }
              },
              child: const Text('Sign In'),
            ),
          ],
        ),
      ),
    );
  }
}