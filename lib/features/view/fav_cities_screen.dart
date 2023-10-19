import 'package:flutter/material.dart';
import 'package:you_weather/features/widgets/app_bar_fav_page_container.dart';
import 'package:you_weather/features/widgets/fav_cities_list.dart';
import 'package:you_weather/repositories/models/models.dart';
import 'package:you_weather/repositories/weather_repo.dart';

class FavCitiesScreen extends StatefulWidget {
  const FavCitiesScreen({super.key});

  @override
  State<FavCitiesScreen> createState() => _FavCitiesScreenState();
}

class _FavCitiesScreenState extends State<FavCitiesScreen> {
  List<City>? _citiesList;

  @override
  void initState() {
    _loadCitiesWeather();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppBarFavPageContainer(),
      ),
      body: (_citiesList == null) 
        ? const Center(child: CircularProgressIndicator())
        : FavCitiesList(cityList: _citiesList),
      floatingActionButton: FloatingActionButton(
        onPressed: _leadToUserWeather,
        tooltip: 'Your Weather',
        child: const Icon(Icons.gps_fixed),
      ), 
    );
  }

  Future<void> _loadCitiesWeather() async {
    _citiesList = await WeatherRepo().getCitiesList();
    setState(() {});
  }

  void _leadToUserWeather() {
    Navigator.of(context).pushNamed('/userWeather');
  }

}
