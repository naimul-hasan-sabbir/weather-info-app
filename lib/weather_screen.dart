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
        Card(child: Column(
          children: [
            Text('300°F')
          ],
        ),),
        const SizedBox(height: 20.0,),
        const Placeholder(
          fallbackHeight: 150,
        ),
        const SizedBox(height: 20.0,),
        const Placeholder(fallbackHeight: 150,)
      ]),
    );
  }
}
