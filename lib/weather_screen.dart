import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:weather_info_app/additional_info_item.dart';
import 'package:weather_info_app/secrets.dart';

import 'hourly_forecast_item.dart';
import 'package:http/http.dart' as http;

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  @override
  void initState() {
    super.initState();
    getCurrentWeather();
  }

  Future getCurrentWeather() async {
    try {
      String cityName = 'London';
      final res = await http.get(
        Uri.parse(
          "https://api.openweathermap.org/data/2.5/forecast?q=$cityName,uk&APPID=$openWeatherApiKey",
        ),
      );
      final data = jsonDecode(res.body);

      if (data['cod'] != '200') {
        throw 'An expected error occured';
      }

      return data;
      //data['list'][0]['main']['temps'];
    } catch (e) {
      throw e.toString();
    }
  }

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
          IconButton(onPressed: () {}, icon: const Icon(Icons.refresh)),
        ],
      ),
      body: FutureBuilder(
        future: getCurrentWeather(),
        builder: (context, snapshot) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Card(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              Text(
                                '200 k',
                                style: const TextStyle(
                                    fontSize: 32, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 16.0,
                              ),
                              const Icon(
                                Icons.cloud,
                                size: 64,
                              ),
                              const SizedBox(
                                height: 16.0,
                              ),
                              const Text(
                                'Rain',
                                style: TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                const Text(
                  "Weather Forecast",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16.0),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: const [
                      HourlyForecastItem(
                          time: "09:26",
                          icon: Icons.cloud,
                          temperature: "302.56"),
                      HourlyForecastItem(
                          time: "03:31",
                          icon: Icons.sunny,
                          temperature: "322.26"),
                      HourlyForecastItem(
                          time: "04:26",
                          icon: Icons.sunny,
                          temperature: "302.12"),
                      HourlyForecastItem(
                          time: "06:30",
                          icon: Icons.cloud,
                          temperature: "250.86"),
                      HourlyForecastItem(
                          time: "07:00",
                          icon: Icons.cloud,
                          temperature: "244.12"),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                const Text(
                  "Weather Forecast",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    AdditionalInfoItem(
                      icon: Icons.water_drop,
                      label: "Humidity",
                      value: "91",
                    ),
                    AdditionalInfoItem(
                      icon: Icons.air,
                      label: "Wind Speed",
                      value: "7.5",
                    ),
                    AdditionalInfoItem(
                      icon: Icons.beach_access,
                      label: "Pressure",
                      value: "1000",
                    ),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
