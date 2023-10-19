import 'package:flutter/material.dart';
import 'package:you_weather/features/widgets/city_weather_widget.dart';
import 'package:you_weather/repositories/models/models.dart';
import 'package:you_weather/repositories/weather_repo.dart';

class CurrentUserWeatherScreen extends StatefulWidget {
  const CurrentUserWeatherScreen({super.key});

  @override
  State<CurrentUserWeatherScreen> createState() => _CurrentUserWeatherScreenState();
}


class _CurrentUserWeatherScreenState extends State<CurrentUserWeatherScreen> {
  City? _currentUserCity;
  bool _failOfGetUserPosition = false;

  @override
  void initState() {
    _loadCurrentUserCityWeather();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CurrentUserWeather page'),
      ),
      body: (_currentUserCity == null && !_failOfGetUserPosition) 
        ? const Center(child: CircularProgressIndicator())
        : _failOfGetUserPosition ? const Center( child: Text("Не удалось получить ваше местоположение!"))
        : CityWeatherWidget(cityWeather: _currentUserCity!.cityWeatherList[0]),
      floatingActionButton: FloatingActionButton(
        onPressed: _loadCurrentUserCityWeather,
        tooltip: 'update',
        child: const Icon(Icons.update),
      ), 
    );
  }

  Future<void> _loadCurrentUserCityWeather() async {
    try {
      _currentUserCity = await WeatherRepo().getCurrentUserCityWeather();
      _failOfGetUserPosition = false;
    } catch (e) {
      debugPrint("Не удалось получить местоположение пользователя! $e");
     _failOfGetUserPosition = true; 
    }
    setState(() {});
  }

}
