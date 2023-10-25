import 'package:flutter/material.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Weather App",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {
            print("refresh")
          }, icon: const Icon(Icons.refresh)),
        ],
      ),
      body: Column(children: [
        const Placeholder(
          fallbackHeight: 250,
        ),
        const Placeholder(
          fallbackHeight: 150,
        )
      ]),
    );
  }
}
