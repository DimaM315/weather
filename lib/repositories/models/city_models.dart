import 'city_weather_models.dart';

class City {
  String name;
  double lat;
  double lon;

  City({
    required this.name,
    required this.lat,
    required this.lon,
  });

  // Объекты CityWeather для текущего города $name. Индекс 0 - погода за сегодня. 1: завтра. и т.д
  // Длинна 7. 
  List<CityWeather> cityWeatherList = [];

  void addCityWeather(CityWeather cityWeather) {
    cityWeatherList.add(cityWeather);
  }
  void setCityWeatherList(List<CityWeather> newCityWeatherList) {
    cityWeatherList = newCityWeatherList;
  }
}