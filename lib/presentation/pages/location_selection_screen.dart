import 'package:flutter/material.dart';
class LocationSelectionScreen extends StatelessWidget {
  final TextEditingController locationController = TextEditingController();
  LocationSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Location'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: locationController,
              decoration: const InputDecoration(labelText: 'Enter Location'),
            ),
            ElevatedButton(
              onPressed: () {
                // Pass the selected location back to the home screen
                Navigator.pop(context, locationController.text);
              },
              child: const Text('Select'),
            ),
          ],
        ),
      ),
    );
  }
}