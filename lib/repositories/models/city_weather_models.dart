import 'package:flutter/foundation.dart';

class CityWeather {
  // Объект класса описывает погоду в городе $cityName в момент времени $timeMoment
  CityWeather({
    required this.cityName,
    required this.weatherDescription,
    required this.temperature,
    required this.climatIconTitle,
    this.pressure,
    this.UV,
    this.windSpeed,
    this.visibility,
    this.humidity,
    this.feelsLike,
    this.timeMoment,
 });
  
  String cityName;
  String weatherDescription;
  String temperature;
  String climatIconTitle;

  String? pressure;
  String? UV;
  String? windSpeed;
  String? visibility;
  String? humidity;
  String? feelsLike; 
  String? timeMoment;
  

  String getClimateIconUrl() {
    return "assets/climate_icons/$climatIconTitle.svg";
  }

  String getUVStatus() {
    if (UV == null) return "No data";
    try {
      int intUV = int.parse(UV!);
      return intUV < 3 ? "Lowest" : intUV > 6 ? "Normal" : "High";
    } catch (e) {
      debugPrint("getUVStatus() $e UV: $UV");
      return "No data";
    }
  }
}