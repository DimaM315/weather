import 'package:flutter/material.dart';
import 'package:you_weather/features/widgets/city_weather_widget.dart';
import 'package:you_weather/repositories/models/models.dart';


class CityScreen extends StatelessWidget {
  const CityScreen({super.key, });

  @override
  Widget build(BuildContext context) {
    City city = ModalRoute.of(context)!.settings.arguments as City;
    CityWeather currentCityWeather = city.cityWeatherList[0];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Some city page'),
      ),
      body: CityWeatherWidget(cityWeather: currentCityWeather),
    );
  }
}


