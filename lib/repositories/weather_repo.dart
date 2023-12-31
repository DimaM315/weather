import 'package:geolocator/geolocator.dart';
import 'package:you_weather/repositories/data_provider.dart';
import 'package:you_weather/repositories/models/city_models.dart';
import 'package:you_weather/repositories/models/city_weather_models.dart';

class WeatherRepo {
  WeatherRepo._internal();
  static final WeatherRepo _instance = WeatherRepo._internal();
  static WeatherRepo get instance => _instance;


  final DataProvider dataProvider = DataProvider();
  final List<City> favCitiesList = [
    City(name: "London", lat: 51.5074, lon: -0.1278),
    City(name: "Sant-Peterburg", lat:59.93863, lon: 30.31413),
    City(name: "Moscow", lat:55.75222, lon: 37.61556),
    City(name: "Berlin", lat:52.52437, lon: 13.41053),
    City(name: "Dubai", lat:25.0657, lon: 55.17128),
  ];

  Future<List<City>> getCitiesList() async {
    for (City city in favCitiesList) {
      final Map<String, dynamic> rawData = await dataProvider.getRawWeatherData(city.lat, city.lon);
      city.addCityWeather(_getCityWeatherFromRawData(rawData));
    }
    return favCitiesList;
  }

  Future<City> getCurrentUserCityWeather() async {
    final Position userPosition = await dataProvider.getCurrentUserPosition();
    final Map<String, dynamic> rawData = await dataProvider.getRawWeatherData(
      userPosition.latitude, 
      userPosition.longitude
    );
    final City city = City(
      name: rawData['timezone'].toString().split('/')[1], 
      lat: userPosition.latitude, 
      lon: userPosition.longitude,
    );
    city.addCityWeather(_getCityWeatherFromRawData(rawData));

    return city;
  }

  Future<List<CityWeather>> getFavCitiesWeatherList() async {
    final List<CityWeather> favCitiesWeatherList = [];
    for (var city in favCitiesList) {
      Map<String, dynamic> rawData = await dataProvider.getRawWeatherData(city.lat, city.lon);
      favCitiesWeatherList.add(_getCityWeatherFromRawData(rawData));
    }
    return favCitiesWeatherList;
  }

  CityWeather _getCityWeatherFromRawData(Map<String, dynamic> data) {
    return CityWeather(
      cityName: data['timezone'].toString().split('/')[1],
      weatherDescription: data['current']['weather'][0]['description'].toString(),
      temperature: data['current']['temp'].toString(),
      climatIconTitle: data['current']['weather'][0]['icon'].toString(),
      pressure: data['current']['pressure'].toString(),
      UV: data['current']['uvi'].toString(),
      windSpeed: data['current']['wind_speed'].toString(),
      visibility: data['current']['visibility'].toString(),
      humidity: data['current']['humidity'].toString(),
      feelsLike: data['current']['feels_like'].toString(),
      timeMoment: data['current']['1697641402'],
    );
  }

}